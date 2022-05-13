import random
from time import sleep

class Student:
    def __init__(self, n):
        self.name = n
        self.gladness = 0
        self.progress = 0
        self.money = 100
        self.greeting()
    def greeting(self):
        print(f"I am {self.name}")
    def rest(self):
        self.gladness += random.randint(1, 3)
        self.progress -= random.randint(1, 3)
        self.money -= random.randint(1, 10)
        print(f"{self.name} | Rest | Gladness: {self.gladness} | Progress: {self.progress}")
    def study(self):
        self.gladness -= random.randint(1, 3)
        self.progress += random.randint(1, 3)
        print(f"{self.name} | Study | Gladness: {self.gladness} | Progress: {self.progress}")
    def work(self):
        self.money += 7


students = []
students.append(Student("Anton"))

gwinner = None
pwinner = None
day = 1
while True:
    print("Day: ", day)
    for student in students:
        actions = [student.rest, student.study, student.work]
        action = random.choice(actions)
        action()
        if student.gladness >= 100 and not gwinner:
            gwinner = student
        if student.progress >= 100 and not pwinner:
            pwinner = student
        if student.money <= -50:
            students.remove(student)
    day += 1
    if gwinner and pwinner:
        break

print(gwinner.name + " первый достиг максимальный уровень счастья")
print(pwinner.name + " первый достиг максимальный уровень прогресс")
