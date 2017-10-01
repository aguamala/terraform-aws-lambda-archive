#! /usr/bin/env bash
set -ex

LAMBDA_NAME="$1"
LAMBDA_RUNTIME="$2"
LAMBDA_CWD="$3"
LAMBDA_PATH="$4"
LAMBDA_SCRIPT="$5"
LAMBDA_ARCHIVE_PATH="$6"

FUNC_PATH=${LAMBDA_CWD}/${LAMBDA_PATH}

if [ "${LAMBDA_ARCHIVE_PATH}" != '' ]; then
    mkdir -p ${LAMBDA_ARCHIVE_PATH}
    ARCHIVE_PATH=${LAMBDA_ARCHIVE_PATH}
else
    ARCHIVE_PATH=${LAMBDA_CWD}/
fi

pushd ${FUNC_PATH}
zip -r ${ARCHIVE_PATH}${LAMBDA_NAME}.zip ${LAMBDA_SCRIPT}
popd

if [ "${LAMBDA_RUNTIME}" = 'python3.6' ]; then
    rm -rf ${FUNC_PATH}.virtualenv
    /usr/bin/virtualenv-3.6 -p /usr/bin/python3.6 ${FUNC_PATH}.virtualenv
    . ${FUNC_PATH}.virtualenv/bin/activate
    pip install -r ${FUNC_PATH}requirements.txt
    pushd ${FUNC_PATH}.virtualenv/lib64/${LAMBDA_RUNTIME}/site-packages/
    zip -r ${ARCHIVE_PATH}${LAMBDA_NAME}.zip .
    popd
fi



