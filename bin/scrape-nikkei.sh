#!/bin/sh

readonly TARGET_URL="https://indexes.nikkei.co.jp/nkave/historical/nikkei_stock_average_daily_jp.csv"
readonly ROOT_PATH="/Users/daiki/code/fresh/nikkei-scraping/"
readonly BIN_PATH="${ROOT_PATH}bin/"
readonly DATA_PATH="${ROOT_PATH}data/"

mkdir -p $DATA_PATH
# filename="${DATA_PATH}nkave-$(date '+%Y%m%d%H%M').csv"
filename="${DATA_PATH}nikkei_stock_average_daily_jp.csv"
echo "[DEBUG]save to $filename"

USER_AGENTS_NUM=`cat ${BIN_PATH}user-agent.txt | wc -l`
SELECTED_NUM=$(($RANDOM % ${USER_AGENTS_NUM} + 1))
SELECTED_USER_AGENT=`sed -n ${SELECTED_NUM}p ${BIN_PATH}user-agent.txt` 2>&1
echo "[DEBUG]agent selected: no.${SELECTED_NUM}"
echo "[DEBUG]selected agent name: ${SELECTED_USER_AGENT}"

curl -s -H "User-Agent: ${SELECTED_USER_AGENT}" -o $filename $TARGET_URL 2>&1