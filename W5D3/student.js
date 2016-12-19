class Course {
  constructor(name, dpt, credits, timeBlock) {
    this.name = name;
    this.dpt = dpt;
    this.credits = credits;
    this.timeBlock = timeBlock;
    this.students = [];
  }

  addStudent(student) {
    this.students.push(student);
  }

  conflictWith(course) {
    let flag = false;
    this.timeBlock.forEach(function(day) {
      if (course.timeBlock.indexOf(day) !== -1) {
        flag = true;
      }
    });
    return flag;
  }
}


class Student {
  constructor(fname, lname) {
    this.fname = fname;
    this.lname = lname;
    this.courses = [];
  }

  name() {
    return (`${this.fname} ${this.lname}`);
  }

  enroll(course) {
    //if tehrs at least 1 conflicting course
    let conflict = false;
    this.courses.forEach(function(ecourse) {
      if (ecourse.conflictWith(course)) {
        conflict = true;
      }
    });

    if (conflict === true) {
      console.log("theres a conflict!");
      return ;
    }



    // if (this.courses.forEach((eCourse) => {
    //   eCourse.conflictWith(course);
    // })) {
    //
    // }
    if (this.courses.indexOf(course) === -1) {
      this.courses.push(course);
      course.addStudent(this);
    }
  }
}

let bohdan = new Student("bohdan", "n");
let sleep = new Course("sleeping", "sleep", 5, ['mon']);
let work = new Course("work", "w", 5, ['mon']);



bohdan.enroll(sleep);
// console.log(bohdan.name());
// console.log(bohdan.courses);
// console.log(bohdan.courses[0].students);
console.log(sleep.conflictWith(work));
// console.log(bohdan.enroll);
bohdan.enroll(work);
