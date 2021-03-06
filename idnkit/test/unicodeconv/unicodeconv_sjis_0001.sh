#! /bin/sh
# Do not edit this file!
# this file is generated by 'generate_test.pl'.

#
# local encoding conversion test (Shift_JIS to UTF-8).
# The input name is U+3042 U+3044 U+3046.
#
#             api: encodename
#  local_encoding: Shift_JIS
#            conf: 
#            from: あいう
#         actions: IDN_UNICODECONV IDN_IDNCONV
#          result: success
#              to: xn--l8jeg

################## setup ##################

unset LC_ALL
unset LC_CTYPE
unset LC_MESSAGES
unset LANG
unset IDN_LOCAL_CODESET
unset IDN_LOG_LEVEL

SRCDIR=`dirname $0`
SYSCONFDIR=${SYSCONFDIR-"/etc"}
IGNORE=false
export IDN_LOCAL_CODESET; IDN_LOCAL_CODESET=Shift_JIS

rm -f idn2.conf
touch idn2.conf
echo '' >> idn2.conf

rm -f localmap1
rm -f localmap2
rm -f localmap3
rm -f localmap4
rm -f localset
rm -f expect.txt
rm -f output.txt

################## test ##################

echo 'from: あいう' >> expect.txt
echo 'result: success' >> expect.txt
echo 'to: xn--l8jeg' >> expect.txt
../common/test_encodename -conffile=idn2.conf -localcheckfile=  -unicodeconv -idnconv -- 'あいう' > output.txt

################## teardown ##################

cmp expect.txt output.txt > /dev/null 2>&1
RESULT=$?
[ X$IGNORE = Xtrue ] && RESULT=77
if [ X$QUIET != Xtrue ]; then
    if [ $RESULT -eq 0 ]; then
        echo "PASS: $0"
    elif [ $RESULT -eq 77 ]; then
        echo "SKIP: $0"
    else
        echo "FAIL: $0"
    fi
fi
[ $RESULT -eq 0 -o $RESULT -eq 77 ] || exit $RESULT
rm -f idn2.conf
rm -f localmap1
rm -f localmap2
rm -f localmap3
rm -f localmap4
rm -f localset
rm -f expect.txt
rm -f output.txt
exit $RESULT
