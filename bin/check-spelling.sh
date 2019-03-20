#!/bin/bash
# requires apt packages: aspell, aspell-en, aspell-fr
# https://blog.eleven-labs.com/en/how-to-check-the-spelling-of-your-docs-from-travis-ci/

MARKDOWN_FILES_CHANGED=`(git diff --name-only $TRAVIS_COMMIT_RANGE || true) | grep .md`

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

if [ -z "$MARKDOWN_FILES_CHANGED" ]
then
    echo -e "$GREEN>> No markdown file to check $NC"

    exit 0;
fi

echo -e "$BLUE>> Following markdown files were changed in this pull request (commit range: $TRAVIS_COMMIT_RANGE):$NC"
echo "$MARKDOWN_FILES_CHANGED"

USE_LANGUAGE='en'
echo -e "$BLUE>> Will use this language as main one:$NC"
echo "$USE_LANGUAGE"

# cat all markdown files that changed
TEXT_CONTENT_WITHOUT_METADATA=`cat $(echo "$MARKDOWN_FILES_CHANGED" | sed -E ':a;N;$!ba;s/\n/ /g')`
# remove code blocks
TEXT_CONTENT_WITHOUT_METADATA=`echo "$TEXT_CONTENT_WITHOUT_METADATA" | sed  -n '/^```/,/^```/ !p'`
TEXT_CONTENT_WITHOUT_METADATA=`echo "$TEXT_CONTENT_WITHOUT_METADATA" | sed  -n '/^`/,/^`/ !p'`
# remove links
TEXT_CONTENT_WITHOUT_METADATA=`echo "$TEXT_CONTENT_WITHOUT_METADATA" | sed -E 's/http(s)?:\/\/([^ ]+)//g'`

echo -e "$BLUE>> Text content that will be checked (without code block and links):$NC"
echo "$TEXT_CONTENT_WITHOUT_METADATA"

echo -e "$BLUE>> Checking in 'en' (many technical words are in English anyway)...$NC"
MISSPELLED=`echo "$TEXT_CONTENT_WITHOUT_METADATA" | aspell --lang=en --encoding=utf-8 --personal=./.aspell.en.pws list | sort -u`

NB_MISSPELLED=`echo "$MISSPELLED" | wc -l`

if [ "$NB_MISSPELLED" -gt 0 ]
then
    echo -e "$RED>> Words that might be misspelled, please check:$NC"
    MISSPELLED=`echo "$MISSPELLED" | sed -E ':a;N;$!ba;s/\n/, /g'`
    echo "$MISSPELLED"
    COMMENT="$NB_MISSPELLED words might be misspelled, please check them: $MISSPELLED"
else
    COMMENT="No spelling errors, congratulations!"
    echo -e "$GREEN>> $COMMENT $NC"
fi

echo -e "$BLUE>> Sending results in a comment on the Github pull request #$TRAVIS_PULL_REQUEST:$NC"
curl -i -H "Authorization: token $GITHUB_TOKEN" \
    -H "Content-Type: application/json" \
    -X POST -d "{\"body\":\"$COMMENT\"}" \
    https://api.github.com/repos/dingjy94/FrontEndInterviewPrepare/issues/$TRAVIS_PULL_REQUEST/comments

exit 0
