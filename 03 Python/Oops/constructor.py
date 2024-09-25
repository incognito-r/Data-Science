class Student:
    college = "IITG" 

    # Constructor
    def __init__(self, fullname, marks) -> None:
        self.name = fullname
        self.marks = marks

    # Methods
    def getInfo(self):
        return (self.name, self.marks)


s1 = Student('Joe', 50)
print(s1.name, s1.marks)
print(s1.getInfo())

s2 = Student('Sara', 75)
print(s2.name, s2.marks)
s1.college



