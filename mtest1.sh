#!/bin/bash
function myps {
    clear
    #ps命令列出所有进程
    ps -aux
}
function checkpid {
    clear
    #使用read命令读取并赋值给pid
    read -p "🌲Input_pid🌲: " pid
    #先检测内存中是否存在该进程
    ps -p $pid
    if [[ $? -eq 0 ]];
    then
	    #ps命令列出所有进程，awk打印第一行标题行或进程号为pid的进程，并输出到>文件output
            ps aux | awk -v n=$pid 'NR==1||$2==n{print}'>output.txt
            echo "✍️  已将$pid的详细状态信息写入output.txt，简要信息如上"
    else
	    echo "🙅‍♂️内存中无$pid进程"
    fi
}
function killpid {
    clear
    #使用read命令读取并赋值给pid
    read -p "🐱Input_pid🐱: " pid
    #kill命令kill相应进程
    kill -s 9 $pid
    if [[ $? -eq 0 ]];
    then
            echo "✅  已kill进程$pid"
    else
            echo "❌  操作不允许，kill失败"
    fi

}
#查看输出文件
function show {
    clear
    vim output.txt
}
#修改脚本
function prefer {
    clear
    vim mtest1.sh
    #重启以更新
}
#菜单设计
function menu {
    clear
    echo
    echo -e "\033[5m Copyright © 2020- by Wangchuwen. All rights reserved.\033[0m"
    echo -e "\033[45m ===================== MENU ====================== \033[0m"
    echo -e "
    \033[31m              0⃣️  退出程序👉 \033[0m
    \033[32m              1⃣️  显示当前进程👀 \033[0m
    \033[33m              2⃣️  查询进程信息 🤓\033[0m
    \033[34m              3⃣️   kill进程⚠️ \033[0m
    \033[35m              4⃣️  查看output文件✏️ \033[0m
    \033[35m              5⃣️  自定义⚙️ \033[0m
    "
    echo -e  "\033[45m ================================================= \033[0m"
    echo -en "\t 🌞 Enter option: "
    read -n 1 option
}
#选项设计
while [ 1 ]
do
    menu
    case $option in
        0)
        break ;;
        1)
        myps ;;
        2)
        checkpid ;;
        3)
        killpid ;;
        4)
	show ;;	
        5)
	prefer ;;	
        *)
        clear
        echo "🚫Sorry, wrong selection";;
    esac
     echo -en "\n\n\t\t\tHit any key to continue🌫"
    read -n 1 line
done
clear


