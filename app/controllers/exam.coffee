# Controller for Exams
app = null
db  = null

module.exports = Exam = (_app) ->
  app = _app
  Exam

Exam.create = (req, res) ->
  db        = app.server.set 'db' if not db
  params    = req.body
  exam      = {}
  res.send 400 if not params?

  if params?
    buildQuestion = params.questions

    # Build a query for questions
    for q,i in buildQuestion
      buildQuestion[i] = {'questions.title': q.title}

    a = null
    # Find all questions that match
    db.topics.find {$or: buildQuestion}, 'questions', (err, _questions) ->
      if _questions?
        q = _questions
        exam = 
          name: params.name
          questions: q
 
        db.exams.create exam, (err, _exam) ->
          console.log err if err
          # Now lets add the exam to all the students
          db.students.update {}, {$push: {exams: name:_exam.name, score: ""}}, (err, students) ->
            console.log err if err
            res.send _exam

Exam.getAllExams = (req, res) ->
  db = app.server.set 'db' if not db
  
  db.students.find {'exams.score': ''}, 'exams', (err, studentExam) ->
    console.log err if err
    res.send 400 if err

    buildExam = studentExam

    res.send studentExam
    # for e,i in studentExam
    #   buildExam[i] = {'exams.name': e.exams.name}
    # console.log buildExam
    # res.send buildExam
    # db.exams.find {$or: buildExam}, (err, exam) ->
    #   console.log exam
    #   res.send 400 if err
    #   res.send exam
