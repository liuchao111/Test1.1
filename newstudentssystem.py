# 这是一个简单的学生信息管理系统，主要功能是对学生信息进行
# 1，增删改查 2，保存到文件 3，从文件中读取信息
# 制作人刘超


def gongneng():
    print("---------------学生信息管理系统---------------\n"
          "1，添加学生信息\n"
          "2，删除学生信息\n"
          "3，修改学生信息\n"
          "4，显示所有学生信息\n"
          "5，将学生信息保存到文件(xueshengxinxi.txt)\n"
          "6，读取文档学生信息(xueshengxinxi.txt)\n"
          "7，退出\n"
          "---------------------------------------------\n")


def add_stu_info():
    mm = []
    while True:
        name = input("请输入学生姓名:  ")
        try:
            age = int(input("请输入年龄:  "))
            yu = int(input("请输入语文成绩:  "))
            shu = int(input("请输入数学成绩:  "))
            ying = int(input("请输入英语成绩:  "))
        except Exception as e:
            print(e+"是非数字，请重新输入")
            continue
        info = {"name": name, "age": age, "yu_wen": yu, "shu_xue": shu, "yin_yu": ying}
        mm.append(info)
        print("该学生信息已成功录入")
        try:
            nn = int(input("按1继续录入，按非1的数字返回主页面: "))
            if nn == 1:
                True
            else:
                break
        except Exception as e:
            print(e+"不是非数字，请重新输入: ")
    return mm


def del_stu_info(stu_info, name11=''):
        if not name11:
            name11 = input("请输入要删除学生的名字:")
        for information in stu_info:
            if name11 == information.get("name"):
                print("该学生已被成功删除！")
                return information

        raise IndexError("该学生不在列表里" % name11)


def mod_stu_info(stu_info):
    modname = input("请输入要修改的学生名字:")
    for imitation in stu_info:
        if modname == imitation.get("name"):
            age = int(input("输入年龄:"))
            yu = int(input("输入语文成绩: "))
            shu = int(input("输入数学成绩: "))
            yang = int(input("输入英语成绩: "))
            imitation = {"name": modname, "age": age, "yu_wen": yu, "shu_xue": shu, "yin_yu": yang}
            return imitation

    raise IndexError("该学生信息未被找到!!!!!")


def show_all_stu(stu_info):
    print("---------------所有学生信息如下---------------")
    if not stu_info:
        print("没有学生信息，请先录入!")
        return
    print("姓名".center(6), "年龄".center(6), "语文".center(6), "数学".center(6), "英语".center(6))
    for inform in stu_info:
        print(inform.get("name").center(7), str(inform.get("age")).center(8), str(inform.get("yu_wen")).center(8),
              str(inform.get("shu_xue")).center(8), str(inform.get("yin_yu")).center(8))
    print("---------------------------------------------")


def save_stu_info(stu_info):
    try:
        students_txt = open(r"C:\Users\我\PycharmProjects\python产生txt存放地\xueshengxinxi.txt", 'w')
    except Exception as e:
        students_txt = open(r"C:\Users\我\PycharmProjects\python产生txt存放地xueshengxinxi.txt", "x")
    for information in stu_info:
        students_txt.write(str(information) + "\n")
    students_txt.close()
    print("学生信息已经成功保存到xueshengxinxi.txt文档中！")


def read_stu_info():
    old_infor = []
    try:
        students_txt = open(r'C:\Users\我\PycharmProjects\python产生txt存放地\xueshengxinxi.txt')
    except FileNotFoundError:
        print("文件打开失败，文件不存在")
        return
    while True:
        xii = students_txt.readline()
        if not xii:
            break
        xii = xii.rstrip()
        xii = xii[1:-1]
        student_dict = {}
        for mom in xii.split(","):
            key_value = []
            for k in mom.split(":"):
                k = k.strip()
                if k[0] == k[-1] and len(k) > 2:
                    key_value.append(k[1:-1])
                else:
                    key_value.append(int(k))
            student_dict[key_value[0]] = key_value[1]
        old_infor.append(student_dict)
    students_txt.close()
    return old_infor


def get_name(*l):
    for x in l:
        return x.get("name")


def get_age(*l):
    for x in l:
        return x.get("age")


def get_yu(*l):
    for x in l:
        return x.get("yu_wen")


def get_shu(*l):
    for x in l:
        return x.get("shu_xue")


def get_yin(*l):
    for x in l:
        return x.get("yin_yu")


def main():
    stu_info = []
    while True:
        gongneng()
        try:
            mn = int(input('请输入功能选项(1-7): '))
        except Exception as e:
            print(e+"非全数字，系统识别出错")
        if mn == 1:
            stu_info = add_stu_info()
        elif mn == 2:
            while True:
                try:
                    stu_info.remove(del_stu_info(stu_info))
                except Exception as e:
                    print(e)
                try:

                    mun = int(input("按1继续删除,按非1的数字返回主页面: "))
                    if mun == 1:
                        True
                    else:
                        break
                except Exception as e:
                    print(e+"是非数字")
        elif mn == 3:
            while True:
                try:
                    student = mod_stu_info(stu_info)
                except Exception as e:
                    print(e)
                else:
                    stu_info.remove(del_stu_info(stu_info, name11=student.get("name")))
                    print("该学生信息已被成功修改")
                    stu_info.append(student)
                qwq = input("按任意数继续修改，回车键返回主页面: ")
                if not qwq:
                    break
        elif mn == 4:
            show_all_stu(stu_info)
        elif mn == 5:
            save_stu_info(stu_info)
        elif mn == 6:
            stu_info = read_stu_info()
        elif mn == 7:
            break
        else:
            print("输入数字不在1-7之间，请重新输入")
            continue


main()
