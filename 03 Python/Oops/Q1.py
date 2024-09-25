# Create student class that takes name and marks of 3 students as arguments in constructor, 
# and a method to get average.


class Student():
    def __init__(self, name, subjects) -> None:
        self.name = name
        self.subjects = subjects

    def getAvg(self):
        return sum(self.subjects)/len(self.subjects)
    

obj = Student('Rahul', [1,2,3])
obj.getAvg()