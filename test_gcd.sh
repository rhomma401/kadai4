#!/bin/bash

#テスト概要
echo  "５つのテストを順番に実施する。"
echo -e "テストの結果より失敗と判定された場合は次のテストを実施せず終了する。"

# テストケース1: 正常なケース
echo -e "\n--- テストケース1: 正常なケース 開始---"
echo "./gcd.sh 2 4 を実行する。"
output=$(./gcd.sh 2 4)
if [ "$output" == "2" ]; then
    echo "テストケース1の結果：成功(実行結果: $output)"
else
    echo -e "テストケース1の結果：失敗(実行結果: $output)\n"
    exit 1
fi
echo  "--- テストケース1: 正常なケース 終了---"

# テストケース2: 引数が1つのケース
echo -e "\n--- テストケース2: 引数が1つのケース 開始---"
echo "./gcd.sh 3 を実行する。"
output=$(./gcd.sh 3 2>&1)
if [[ "$output" == *"Error!!: 2つの引数を入力してください。"* ]]; then
    echo "テストケース2の結果：成功(実行結果: $output)"
else
    echo -e "テストケース2の結果：失敗(実行結果: $output)\n"
    exit 1
fi
echo  "--- テストケース2: 引数が1つのケース 終了---"

# テストケース3: 引数が文字のケース
echo -e "\n--- テストケース3: 引数が文字つのケース 開始---"
echo "./gcd.sh f g を実行する。"
output=$(./gcd.sh f g 2>&1)
if [[ "$output" == *"Error!!: 引数に自然数でない数字または文字が入力されています。"* ]]; then
    echo "テストケース3の結果：成功(実行結果: $output)"
else
    echo -e "テストケース3の結果：失敗(実行結果: $output)\n"
    exit 1
fi
echo "--- テストケース3: 引数が文字のケース 終了---"

# テストケース4: 引数が負の数のケース
echo -e "\n--- テストケース4: 引数が負の数のケース 開始---"
echo "./gcd.sh -2 4 を実行する。"
output=$(./gcd.sh -2 4 2>&1)
if [[ "$output" == *"Error!!: 引数に自然数でない数字または文字が入力されています。"* ]]; then
    echo "テストケース4の結果：成功(実行結果: $output)"
else
    echo -e "テストケース4の結果：失敗(実行結果: $output)\n"
    exit 1
fi
echo "--- テストケース4: 引数が負の数のケース 終了---"

# 引数がゼロの場合
echo -e "\n--- テストケース5: 引数がゼロのケース 開始---"
echo "./gcd.sh 0 4 を実行する。"
output=$(./gcd.sh 0 4 2>&1)
if [[ "$output" == *"Error!!: 引数に自然数でない数字または文字が入力されています。"* ]]; then
    echo "テストケース5の結果：成功(実行結果: $output)"
else

    echo -e "テストケース5の結果：失敗(実行結果: $output)\n"
    exit 1
fi
echo  "--- テストケース5: 引数がゼロのケース 終了---"

echo -e "\nすべてのテストが成功しました！！\n"


