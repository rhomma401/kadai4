#!/bin/bash

# 最大公約数を計算する (ユークリッドの互除法)。
gcd() {
    local x=$1
    local y=$2

  if(($2==0));then
    echo "$x";
  else
    # 再帰
    echo $(gcd $y $(($x % $y)) );
  fi
}

# 引数をチェックする。
if [ $# -ne 2 ]; then
    echo "Error!!: 2つの引数を入力してください。" >&2
    exit 1
fi

# 自然数をチェックする。
if ! [[ $1 =~ ^[1-9][0-9]*$ ]] || ! [[ $2 =~ ^[1-9][0-9]*$ ]]; then
    echo "Error!!: 引数に自然数でない数字または文字が入力されています。" >&2
    exit 1
fi

# 引数を取得する。
num1=$1
num2=$2

# result(最大公約数を計算するメソッド)を実行し、結果を表示する。
result=$(gcd $num1 $num2)
echo $result
