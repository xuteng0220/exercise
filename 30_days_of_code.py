# 30 Days of Code


**Day 8**
## Dictionaries and Maps
n = int(input())
phone_book = {}
for i in range(n):
	name, phone = input().split()
	phone_book[name] = phone


# happened with runtime error on hackerrank
while True:
	test_name = input()
	# unknown input lines, end the loop with Enter
	if test_name == '':
		break
	try:
		print('{}={}'.format(test_name, phone_book[test_name]))
	except KeyError:
		print('Not found')


# get method in dictionary
phone_book.get('ed', 'Not found')

# how to break with the keyboard not an input file with EOF???
while True:
	try:
		name = input()
		if name in phone_book:
			print('%s=%s' % (name, phone_book[name]))
		else:
			print('Not found')
	except:
		break



**Day 9**
## Recursion 3

def factorial(n):
	if n == 1:
		return 1
	else:
		return n * factorial(n-1)

n = int(input())
factorial(n)



**Day 10**
## Binary Numbers
n = int(input())

# binary(string) of an integer
bin_n = bin(n)

long1 = 0
con1 = 0
for i in bin_n[2:]:
    if i == '1':
        con1 += 1
        long1 = con1 if long1 < con1 else long1
    else:
        con1 = 0

long1

# # solution1
# n = int(input().strip())

# numbers = str(bin(n)[2:]).split('0')
# lenghts = [len(num) for num in numbers]
# print(max(lenghts))




**Day 11**
## 2D Arrays

if __name__ == '__main__':
    arr = []

# arr is a 2D list
for _ in range(6):
    arr.append(list(map(int, input().rstrip().split())))

hourglass = []

for i in range(4):
    for j in range(4):
        sum = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
        hourglass.append(sum)

print(max(hourglass))




**Day 12**
## Inheritance

class Person:
    def __init__(self, firstName, lastName, idNumber):
        self.firstName = firstName
        self.lastName = lastName
        self.idNumber = idNumber
    def printPerson(self):
        print("Name:", self.lastName + ",", self.firstName)
        print("ID:", self.idNumber)

class Student(Person):
    #   Class Constructor
    #   
    #   Parameters:
    #   firstName - A string denoting the Person's first name.
    #   lastName - A string denoting the Person's last name.
    #   id - An integer denoting the Person's ID number.
    #   scores - An array of integers denoting the Person's test scores.
    #
    # Write your constructor here
    def __init__(self, firstName, lastName, idNumber, scores):
        self.firstName = firstName
        self.lastName = lastName
        self.idNumber = idNumber
        self.scores = scores
    
# # solution1:
# def __init__(self,firstHame,lastName,idNumber,scores):
#     Person.__init__(self,firstHame,lastName,idNumber)
#     self.scores=scores



    #   Function Name: calculate
    #   Return: A character denoting the grade.
    #
    # Write your function here
    def calculate(self):
        score_sum = 0
        for i in self.scores:
            score_sum += i
        score_avg = score_sum / len(self.scores)
        if score_avg < 40:
            return 'T'
        elif score_avg < 55:
            return 'D'
        elif score_avg < 70:
            return 'P'
        elif score_avg < 80:
            return 'A'
        elif score_avg < 90:
            return 'E'
        else:
            return 'O'


line = input().split()
firstName = line[0]
lastName = line[1]
idNum = line[2]
numScores = int(input()) # not needed for Python
scores = list( map(int, input().split()) )
s = Student(firstName, lastName, idNum, scores)
s.printPerson()
print("Grade:", s.calculate())

# # test input
# Heraldo Memelli 8135627
# 2
# 100 80



**Day 13**
## Abstract Classes

from abc import ABCMeta, abstractmethod
class Book(object, metaclass=ABCMeta):
    def __init__(self,title,author):
        self.title=title
        self.author=author   
    @abstractmethod

    def display(self):
        pass
    # def display(self):
    #     print('Title: {}'.format(self.title))
    #     print('Author: {}'.format(self.author))


#Write MyBook class
class MyBook(Book):
    def __init__(self, title, author, price):
        Book.__init__(self, title, author)
        # #solution1 
        # super().__init__(title, author)
        self.price = price

# ？？？ABCMeta
    def display(self):
        print('Title: {}'.format(self.title))
        print('Author: {}'.format(self.author))
        print('Price: {}'.format(self.price))


title=input()
author=input()
price=int(input())
new_novel=MyBook(title,author,price)
new_novel.display()



**Day 14**
## Scope

class Difference:
    def __init__(self, a):
        # ?? __elements
        self.__elements = a
        self.__maximumDifference = computeDifference(self, a)

    def computeDifference(self, a):
        min = a[0]
        max = a[0]
        for i in a[1:]:
            if i < min:
                min = i
            if i > max:
                max = i
        return max - min

# End of Difference class

_ = input()
a = [int(e) for e in input().split(' ')]

d = Difference(a)
d.computeDifference()

print(d.maximumDifference)
