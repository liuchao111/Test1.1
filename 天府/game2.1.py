import  random
def menu():
    menu_info = "------------猜拳游戏-------------\n1)开始游戏\n2)退出游戏\n---------------------------------"
    print(menu_info)
def main():
    while True:
        menu()
        print("请输入选项: ")
        try:
            m = int(input())
            if m == 1:
                try:
                    player = input('请输入猜拳代码 石头(1),剪刀(2),布(3): ')
                    player = int(player)
                    if 0 < player < 4:
                        computer_player = random.randint(1, 3)
                        print("computer_player出的是: ", end="")
                        if computer_player == 1:
                            print("石头(1)")
                        elif computer_player == 2:
                            print("剪刀(2)")
                        else:
                            print("布(3)")
                        print("玩家出的是: ", end="")
                        if player == 1:
                            print("石头")
                        elif player == 2:
                            print("剪刀")
                        else:
                            print("布")
                        print("所以游戏结果是: ")
                        if ((player == 1) and (computer_player == 2)) or ((player == 2) and (computer_player == 3)) or (
                                (player == 3) and (computer_player == 1)):
                            print("玩家赢得这次比赛")
                        elif player == computer_player:
                            print("平局")
                        else:
                            print("电脑赢得比赛")
                    else:
                        print("你输入的数字不在1-3之间，游戏重新开始: ")

                except Exception as e:
                    print("输入的数据类型有错误，游戏重新开始: ", e)

            elif m == 2:
                _min = input("确认是否退出yes/no: ")
                if _min == 'yes':
                    break
                elif _min == 'no':
                    continue
                else:
                    print("退出失败，请输入正确的yes/no")

            else:
                print("输入数字非1/2，游戏重新开始: ")
                continue
        except Exception as e:
            print("输入非数字，游戏重新开始:", e)
main()