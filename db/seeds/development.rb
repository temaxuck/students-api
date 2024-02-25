require "faker"

Faker::Config.locale = "ru"

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

# Generate students for each course
Course.all.each do |course|
  30.times do |i|
    if i % 2
      first_name, surname, last_name = Faker::Name.male_first_name, Faker::Name.male_middle_name, Faker::Name.male_last_name 
    else
      first_name, surname, last_name = Faker::Name.female_first_name, Faker::Name.female_middle_name, Faker::Name.female_last_name 
    end
    course.students.create(
      first_name: first_name,
      surname: surname,
      last_name: last_name,
    )
  end
end

