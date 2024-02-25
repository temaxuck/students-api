COURSE_LETTER_POOL = ["А", "Б"]

# Generate schools
5.times do
  School.create()
end

# Generate courses for each school
School.all.each do |school|
  12.times do |course_number|
    COURSE_LETTER_POOL.each do |course_letter|
        school.courses.create(
          number: course_number,
          letter: course_letter,
        )
    end
  end
end

