# 把字符串转化为十进制
import base64


def menu():
    print("功能如下: \n"
          "1,字符串转化为10进制\n"
          "2,二进制转化为10进制\n"
          "3,凯撒密码加base64的\n"
          "4,ASCII码转化(有&#13;&#75这种)\n"
          "5........\n"
          "按任意键退出<回车>: \n")


def main():
    while True:
        menu()
        chioce = input("请输入你的选择: ")
        if chioce == 1:
            qwe = input("输入需要转化的的字符串: ")
            print("二进制对应的结果是: ")
            for i in qwe:
                imi = ord(i)
                print(imi, " ", end="")
            print('')
        elif chioce == 2:
            try:
                lil = input("要转化的二进制数组: ")
                lili = int(lil, base=2)
                print("十进制对应的结果是: ", lili)
            except Exception as e:
                print("转化失败", e, "请输入只含有0/1的一串数字!!!!")
        elif chioce == 3:
            kaisamima()
        elif chioce == 4:
            Ascii()
        else:
            break
        input("回车返回菜单界面")


def kaisamima():
    mima = input("请输入要转移的字符串: ")
    weishu = int(input("转移位数(默认向右移为正方向):"))
    ou = []
    for i in mima:
        lilil = ord(i)
        lilil = chr(lilil+weishu)
        ou.append(lilil)
        print(lilil, end="")
    print('')
    s = ''
    for l in ou:
        s += l
    print(base64.b64decode(s))


def Ascii():
    # &#75;&#69;&#89;&#123;&#74;&#50;&#115;&#97;&#52;&#50像这种的
    raw_string = input("输入要转化的字符串: ")
    string = raw_string.split(';')
    key = ''
    for i in string:
        key += chr(int(i[2:]))
    print(key)


main()
