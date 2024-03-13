//
//  PreviewHelper.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 23.02.24.
//

import SwiftData
import SwiftUI

public var traits: PreviewTrait<Preview.ViewTraits> {
    .fixedLayout(width: 1274, height: 982)
}

@MainActor
class PreviewHelper {
    static let content: (container: ModelContainer, appVM: AppVM) = {
        let container  = getContainer()
        let group = getGroup()

        _ = createSampleDate(context: container.mainContext, group: group)

        return (container, AppVM(group: group))
    }()

    static let data: (course: Course, student: Student, courses: [Course], students: [Student], group: CourseGroup) = {
        let container = getContainer()
        let group = getGroup()

        return createSampleDate(context: container.mainContext, group: group)
    }()

    static private func getContainer() -> ModelContainer {
        do {
            let schema = Schema([
                CourseGroup.self, Teacher.self, Course.self, Student.self, Registration.self
            ])
            let config = ModelConfiguration(isStoredInMemoryOnly: true)

            let container = try ModelContainer(for: schema, configurations: config)

            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }

    static private func getGroup() -> CourseGroup {
        return CourseGroup(name: "2024 Q1", number: 1)
    }

    // MARK: Sample data --------------------------------------------------------------------------

    static public func createSampleDate(context: ModelContext, group: CourseGroup) -> (course: Course, student: Student, courses: [Course], students: [Student], group: CourseGroup) {
        context.insert(group)

        // Teacher
        let teacher1 = Teacher(
            firstName: "Maria",
            lastName: "Gonzalez",
            email: "maria.gonzalez@example.com",
            phone: "987654321",
            address1: "123 Main Street",
            address2: "Apt 2B", 
            experience: "5 years of teaching experience",
            note: "Specializes in mathematics."
        )

        let teacher2 = Teacher(
            firstName: "Ahmed",
            lastName: "Khan",
            email: "ahmed.khan@example.com",
            phone: "123456789",
            address1: "456 Elm Street",
            address2: "", 
            experience: "10 years of teaching experience",
            note: "Fluent in English, French, and Arabic."
        )

        let teacher3 = Teacher(
            firstName: "Emily",
            lastName: "Chang",
            email: "emily.chang@example.com",
            phone: "555123456",
            address1: "789 Oak Avenue",
            address2: "Unit 3C", 
            experience: "3 years of teaching experience",
            note: "Passionate about integrating technology in education."
        )

        let teacher4 = Teacher(
            firstName: "David",
            lastName: "Smith",
            email: "david.smith@example.com",
            phone: "999888777",
            address1: "101 Pine Street",
            address2: "", 
            experience: "8 years of teaching experience",
            note: "Award-winning educator in literature."
        )

        insert([teacher1, teacher2, teacher3, teacher4], context: context)


        // Courses for Monday
        let courseMonday1 = Course(
            name: "Beginners",
            color: .orange,
            start: Calendar.dateTime(day: 15, month: 1, year: 2024, hour: 9, minute: 30),
            end: Calendar.dateTime(day: 4, month: 3, year: 2024, hour: 11, minute: 0),
            price: 100,
            kind: .regular, 
            level: nil,
            teacher: teacher1,
            group: group
        )

        let courseMonday2 = Course(
            name: "Intermediate",
            color: .red,
            start: Calendar.dateTime(day: 15, month: 1, year: 2024, hour: 11, minute: 15),
            end: Calendar.dateTime(day: 4, month: 3, year: 2024, hour: 12, minute: 30),
            price: 120,
            kind: .regular,
            level: nil,
            teacher: teacher2,
            group: group
        )

        let courseMonday3 = Course(
            name: "Advanced",
            color: .blue,
            start: Calendar.dateTime(day: 15, month: 1, year: 2024, hour: 17, minute: 30),
            end: Calendar.dateTime(day: 4, month: 3, year: 2024, hour: 19, minute: 00),
            price: 150,
            kind: .regular,
            level: nil,
            teacher: teacher2,
            group: group
        )

        let courseMonday4 = Course(
            name: "Kids",
            color: .purple,
            start: Calendar.dateTime(day: 15, month: 1, year: 2024, hour: 19, minute: 15),
            end: Calendar.dateTime(day: 4, month: 3, year: 2024, hour: 20, minute: 30),
            price: 200,
            kind: .regular,
            level: nil,
            teacher: teacher3,
            group: group
        )

        // Courses for Tuesday
        let courseTuesday1 = Course(
            name: "Beginners",
            color: .orange,
            start: Calendar.dateTime(day: 16, month: 1, year: 2024, hour: 9, minute: 0),
            end: Calendar.dateTime(day: 5, month: 3, year: 2024, hour: 10, minute: 15),
            price: 130,
            kind: .regular,
            level: nil,
            teacher: teacher1,
            group: group
        )

        let courseTuesday2 = Course(
            name: "Medium",
            color: .green,
            start: Calendar.dateTime(day: 16, month: 1, year: 2024, hour: 17, minute: 30),
            end: Calendar.dateTime(day: 5, month: 3, year: 2024, hour: 19, minute: 00),
            price: 140,
            kind: .regular,
            level: nil,
            teacher: teacher2,
            group: group
        )

        let courseTuesday3 = Course(
            name: "Medium",
            color: .green,
            start: Calendar.dateTime(day: 16, month: 1, year: 2024, hour: 19, minute: 15),
            end: Calendar.dateTime(day: 5, month: 3, year: 2024, hour: 20, minute: 30),
            price: 140,
            kind: .regular,
            level: nil,
            teacher: teacher2,
            group: group
        )

        // Courses for Wednesday
        let courseWednesday1 = Course(
            name: "Advanced",
            color: .blue,
            start: Calendar.dateTime(day: 17, month: 1, year: 2024, hour: 10, minute: 0),
            end: Calendar.dateTime(day: 6, month: 3, year: 2024, hour: 11, minute: 15),
            price: 110,
            kind: .regular,
            level: nil,
            teacher: teacher3,
            group: group
        )

        let courseWednesday2 = Course(
            name: "Kids",
            color: .purple,
            start: Calendar.dateTime(day: 17, month: 1, year: 2024, hour: 18, minute: 0),
            end: Calendar.dateTime(day: 6, month: 3, year: 2024, hour: 19, minute: 0),
            price: 180,
            kind: .regular,
            level: nil,
            teacher: teacher4,
            group: group
        )

        // Courses for Thursday
        let courseThursday1 = Course(
            name: "Pregnant",
            color: .indigo,
            start: Calendar.dateTime(day: 18, month: 1, year: 2024, hour: 10, minute: 0),
            end: Calendar.dateTime(day: 7, month: 3, year: 2024, hour: 11, minute: 0),
            price: 150,
            kind: .regular,
            level: nil,
            teacher: teacher1,
            group: group
        )

        let courseThursday2 = Course(
            name: "Beginners",
            color: .orange,
            start: Calendar.dateTime(day: 18, month: 1, year: 2024, hour: 11, minute: 15),
            end: Calendar.dateTime(day: 7, month: 3, year: 2024, hour: 12, minute: 45),
            price: 170,
            kind: .regular,
            level: nil,
            teacher: teacher1,
            group: group
        )

        let courseThursday3 = Course(
            name: "Beginners",
            color: .orange,
            start: Calendar.dateTime(day: 18, month: 1, year: 2024, hour: 17, minute: 00),
            end: Calendar.dateTime(day: 7, month: 3, year: 2024, hour: 18, minute: 30),
            price: 170,
            kind: .regular,
            level: nil,
            teacher: teacher1,
            group: group
        )

        let courseThursday4 = Course(
            name: "Beginners",
            color: .orange,
            start: Calendar.dateTime(day: 18, month: 1, year: 2024, hour: 18, minute: 45),
            end: Calendar.dateTime(day: 7, month: 3, year: 2024, hour: 20, minute: 15),
            price: 170,
            kind: .regular,
            level: nil,
            teacher: teacher1,
            group: group
        )

        // Courses for Friday
        let courseFriday1 = Course(
            name: "Medium",
            color: .green,
            start: Calendar.dateTime(day: 19, month: 1, year: 2024, hour: 11, minute: 0),
            end: Calendar.dateTime(day: 8, month: 3, year: 2024, hour: 12, minute: 30),
            price: 120,
            kind: .regular,
            level: nil,
            teacher: teacher2,
            group: group
        )

        let courseFriday2 = Course(
            name: "Intermediate",
            color: .red,
            start: Calendar.dateTime(day: 19, month: 1, year: 2024, hour: 17, minute: 15),
            end: Calendar.dateTime(day: 8, month: 3, year: 2024, hour: 15, minute: 30),
            price: 160,
            kind: .regular,
            level: nil,
            teacher: teacher3,
            group: group
        )

        let allCourses = [courseMonday1, courseMonday2, courseMonday3, courseMonday4, 
                          courseTuesday1, courseTuesday2, courseTuesday3,
                          courseWednesday1, courseWednesday2,
                          courseThursday1, courseThursday2, courseThursday3, courseThursday4,
                          courseFriday1, courseFriday2
        ]

        insert(allCourses, context: context)

        let student1 = Student(firstName: "Lola", lastName: "Bon", email: "Lo.bon@test.com", phone: "7490875", address1: "Sunriver-street 1", address2: "48203 Alabama", note: "")
        let student2 = Student(firstName: "John", lastName: "Doe", email: "john.doe@example.com", phone: "1234567890", address1: "123 Main St", address2: "Apt 101", note: "")
        let student3 = Student(firstName: "Emma", lastName: "Smith", email: "emma.smith@example.com", phone: "9876543210", address1: "456 Elm St", address2: "", note: "")
        let student4 = Student(firstName: "Sophia", lastName: "Johnson", email: "sophia.johnson@example.com", phone: "4567891230", address1: "789 Oak St", address2: "", note: "")
        let student5 = Student(firstName: "Noah", lastName: "Williams", email: "noah.williams@example.com", phone: "3216549870", address1: "101 Pine St", address2: "Apt 202", note: "")
        let student6 = Student(firstName: "Olivia", lastName: "Brown", email: "olivia.brown@example.com", phone: "7894561230", address1: "246 Maple St", address2: "", note: "")
        let student7 = Student(firstName: "Liam", lastName: "Jones", email: "liam.jones@example.com", phone: "6547893210", address1: "369 Cedar St", address2: "", note: "")
        let student8 = Student(firstName: "Ava", lastName: "Garcia", email: "ava.garcia@example.com", phone: "4561237890", address1: "753 Birch St", address2: "Apt 303", note: "")
        let student9 = Student(firstName: "William", lastName: "Martinez", email: "william.martinez@example.com", phone: "7893216540", address1: "852 Elm St", address2: "", note: "")
        let student10 = Student(firstName: "Isabella", lastName: "Lopez", email: "isabella.lopez@example.com", phone: "3219876540", address1: "963 Oak St", address2: "", note: "This student has a keen interest in mathematics.")

        let student11 = Student(firstName: "James", lastName: "Gonzalez", email: "james.gonzalez@example.com", phone: "6543217890", address1: "147 Pine St", address2: "", note: "")
        let student12 = Student(firstName: "Charlotte", lastName: "Rodriguez", email: "charlotte.rodriguez@example.com", phone: "9876541230", address1: "258 Cedar St", address2: "Suite 101", note: "")
        let student13 = Student(firstName: "Benjamin", lastName: "Hernandez", email: "benjamin.hernandez@example.com", phone: "3217894560", address1: "369 Maple St", address2: "", note: "")
        let student14 = Student(firstName: "Amelia", lastName: "Mitchell", email: "amelia.mitchell@example.com", phone: "6543219870", address1: "753 Elm St", address2: "", note: "")
        let student15 = Student(firstName: "Lucas", lastName: "Perez", email: "lucas.perez@example.com", phone: "9876543210", address1: "852 Oak St", address2: "", note: "")
        let student16 = Student(firstName: "Mia", lastName: "Roberts", email: "mia.roberts@example.com", phone: "4567893210", address1: "963 Cedar St", address2: "", note: "")
        let student17 = Student(firstName: "Henry", lastName: "Turner", email: "henry.turner@example.com", phone: "3216547890", address1: "147 Birch St", address2: "", note: "")
        let student18 = Student(firstName: "Evelyn", lastName: "Phillips", email: "evelyn.phillips@example.com", phone: "7891236540", address1: "258 Maple St", address2: "", note: "")
        let student19 = Student(firstName: "Alexander", lastName: "Campbell", email: "alexander.campbell@example.com", phone: "6549873210", address1: "369 Pine St", address2: "", note: "")

        let student20 = Student(firstName: "Abigail", lastName: "Parker", email: "abigail.parker@example.com", phone: "1234569870", address1: "753 Cedar St", address2: "", note: "")
        let student21 = Student(firstName: "Daniel", lastName: "Evans", email: "daniel.evans@example.com", phone: "7896543210", address1: "852 Birch St", address2: "", note: "")
        let student22 = Student(firstName: "Emily", lastName: "Edwards", email: "emily.edwards@example.com", phone: "4563217890", address1: "963 Elm St", address2: "", note: "")
        let student23 = Student(firstName: "Michael", lastName: "Collins", email: "michael.collins@example.com", phone: "3219874560", address1: "147 Oak St", address2: "", note: "")
        let student24 = Student(firstName: "Sofia", lastName: "Stewart", email: "sofia.stewart@example.com", phone: "7896541230", address1: "258 Cedar St", address2: "", note: "")
        let student25 = Student(firstName: "Matthew", lastName: "Sanchez", email: "matthew.sanchez@example.com", phone: "6541237890", address1: "369 Maple St", address2: "", note: "")
        let student26 = Student(firstName: "Madison", lastName: "Morales", email: "madison.morales@example.com", phone: "9874563210", address1: "753 Elm St", address2: "", note: "")
        let student27 = Student(firstName: "Joseph", lastName: "Nguyen", email: "joseph.nguyen@example.com", phone: "3217896540", address1: "852 Oak St", address2: "", note: "")
        let student28 = Student(firstName: "Chloe", lastName: "Gomez", email: "chloe.gomez@example.com", phone: "6543219870", address1: "963 Cedar St", address2: "", note: "")
        let student29 = Student(firstName: "David", lastName: "Castillo", email: "david.castillo@example.com", phone: "7896543210", address1: "147 Birch St", address2: "", note: "")
        let student30 = Student(firstName: "Avery", lastName: "Smith", email: "avery.smith@example.com", phone: "3214569870", address1: "258 Maple St", address2: "", note: "")

        let student31 = Student(firstName: "Ethan", lastName: "Lopez", email: "ethan.lopez@example.com", phone: "1239876540", address1: "369 Pine St", address2: "", note: "")
        let student32 = Student(firstName: "Harper", lastName: "Adams", email: "harper.adams@example.com", phone: "9871234560", address1: "753 Cedar St", address2: "", note: "")
        let student33 = Student(firstName: "Carter", lastName: "Cook", email: "carter.cook@example.com", phone: "4567890123", address1: "852 Birch St", address2: "", note: "")
        let student34 = Student(firstName: "Ella", lastName: "Hall", email: "ella.hall@example.com", phone: "3217890123", address1: "963 Elm St", address2: "", note: "")
        let student35 = Student(firstName: "Sebastian", lastName: "Rivera", email: "sebastian.rivera@example.com", phone: "7890123456", address1: "147 Oak St", address2: "", note: "")
        let student36 = Student(firstName: "Mila", lastName: "Turner", email: "mila.turner@example.com", phone: "6543210123", address1: "258 Cedar St", address2: "", note: "")
        let student37 = Student(firstName: "Mason", lastName: "White", email: "mason.white@example.com", phone: "0123456789", address1: "369 Maple St", address2: "", note: "")
        let student38 = Student(firstName: "Aria", lastName: "Harris", email: "aria.harris@example.com", phone: "7890123456", address1: "753 Elm St", address2: "", note: "")
        let student39 = Student(firstName: "Elijah", lastName: "Martin", email: "elijah.martin@example.com", phone: "2345678901", address1: "852 Oak St", address2: "", note: "")
        let student40 = Student(firstName: "Scarlett", lastName: "Thompson", email: "scarlett.thompson@example.com", phone: "5678901234", address1: "963 Cedar St", address2: "", note: "This student has a passion for music.")

        let student41 = Student(firstName: "Grayson", lastName: "Garcia", email: "grayson.garcia@example.com", phone: "0123456789", address1: "147 Birch St", address2: "", note: "")
        let student42 = Student(firstName: "Zoe", lastName: "Lewis", email: "zoe.lewis@example.com", phone: "8901234567", address1: "258 Maple St", address2: "", note: "")
        let student43 = Student(firstName: "Gabriel", lastName: "Roberts", email: "gabriel.roberts@example.com", phone: "4567890123", address1: "369 Pine St", address2: "", note: "")
        let student44 = Student(firstName: "Aurora", lastName: "King", email: "aurora.king@example.com", phone: "2345678901", address1: "753 Cedar St", address2: "", note: "")
        let student45 = Student(firstName: "Lincoln", lastName: "Adams", email: "lincoln.adams@example.com", phone: "6789012345", address1: "852 Birch St", address2: "", note: "")
        let student46 = Student(firstName: "Hazel", lastName: "Hall", email: "hazel.hall@example.com", phone: "9012345678", address1: "963 Elm St", address2: "", note: "")
        let student47 = Student(firstName: "Mateo", lastName: "Wright", email: "mateo.wright@example.com", phone: "3456789012", address1: "147 Oak St", address2: "", note: "")
        let student48 = Student(firstName: "Luna", lastName: "Clark", email: "luna.clark@example.com", phone: "7890123456", address1: "258 Cedar St", address2: "", note: "")
        let student49 = Student(firstName: "Jackson", lastName: "Baker", email: "jackson.baker@example.com", phone: "1234567890", address1: "369 Maple St", address2: "", note: "")
        let student50 = Student(firstName: "Penelope", lastName: "Walker", email: "penelope.walker@example.com", phone: "4567890123", address1: "753 Elm St", address2: "", note: "This student is interested in learning foreign languages.")

        let student51 = Student(firstName: "Ryan", lastName: "Lopez", email: "ryan.lopez@example.com", phone: "8901234567", address1: "852 Oak St", address2: "", note: "")
        let student52 = Student(firstName: "Nova", lastName: "Perez", email: "nova.perez@example.com", phone: "2345678901", address1: "963 Cedar St", address2: "", note: "")
        let student53 = Student(firstName: "Levi", lastName: "Evans", email: "levi.evans@example.com", phone: "6789012345", address1: "147 Birch St", address2: "", note: "")
        let student54 = Student(firstName: "Stella", lastName: "Morris", email: "stella.morris@example.com", phone: "9012345678", address1: "258 Maple St", address2: "", note: "")
        let student55 = Student(firstName: "Caleb", lastName: "Hill", email: "caleb.hill@example.com", phone: "3456789012", address1: "369 Pine St", address2: "", note: "")
        let student56 = Student(firstName: "Aubrey", lastName: "Gonzalez", email: "aubrey.gonzalez@example.com", phone: "7890123456", address1: "753 Cedar St", address2: "", note: "")
        let student57 = Student(firstName: "Xavier", lastName: "Edwards", email: "xavier.edwards@example.com", phone: "1234567890", address1: "852 Birch St", address2: "", note: "")
        let student58 = Student(firstName: "Bella", lastName: "Russell", email: "bella.russell@example.com", phone: "4567890123", address1: "963 Elm St", address2: "", note: "")
        let student59 = Student(firstName: "Asher", lastName: "Sanders", email: "asher.sanders@example.com", phone: "8901234567", address1: "147 Oak St", address2: "", note: "")
        let student60 = Student(firstName: "Everly", lastName: "Price", email: "everly.price@example.com", phone: "2345678901", address1: "258 Cedar St", address2: "", note: "This student is enthusiastic about sports.")

        let student61 = Student(firstName: "Leo", lastName: "Graham", email: "leo.graham@example.com", phone: "6789012345", address1: "369 Maple St", address2: "", note: "")
        let student62 = Student(firstName: "Violet", lastName: "Fisher", email: "violet.fisher@example.com", phone: "9012345678", address1: "753 Elm St", address2: "", note: "")
        let student63 = Student(firstName: "Nolan", lastName: "Butler", email: "nolan.butler@example.com", phone: "3456789012", address1: "852 Oak St", address2: "", note: "")
        let student64 = Student(firstName: "Lily", lastName: "Simmons", email: "lily.simmons@example.com", phone: "7890123456", address1: "963 Cedar St", address2: "", note: "")
        let student65 = Student(firstName: "Hudson", lastName: "Perry", email: "hudson.perry@example.com", phone: "2345678901", address1: "147 Birch St", address2: "", note: "")
        let student66 = Student(firstName: "Zoey", lastName: "Long", email: "zoey.long@example.com", phone: "4567890123", address1: "258 Maple St", address2: "", note: "")
        let student67 = Student(firstName: "Lincoln", lastName: "Hughes", email: "lincoln.hughes@example.com", phone: "8901234567", address1: "369 Pine St", address2: "", note: "")
        let student68 = Student(firstName: "Hannah", lastName: "Reed", email: "hannah.reed@example.com", phone: "1234567890", address1: "753 Cedar St", address2: "", note: "")
        let student69 = Student(firstName: "Eli", lastName: "Barnes", email: "eli.barnes@example.com", phone: "6789012345", address1: "852 Birch St", address2: "", note: "")
        let student70 = Student(firstName: "Aubrey", lastName: "Coleman", email: "aubrey.coleman@example.com", phone: "9012345678", address1: "963 Elm St", address2: "", note: "This student loves outdoor activities.")

        let student71 = Student(firstName: "Alice", lastName: "Cooper", email: "alice.cooper@example.com", phone: "3456789012", address1: "147 Oak St", address2: "", note: "")
        let student72 = Student(firstName: "Ezra", lastName: "Reyes", email: "ezra.reyes@example.com", phone: "7890123456", address1: "258 Cedar St", address2: "", note: "")
        let student73 = Student(firstName: "Ruby", lastName: "Ward", email: "ruby.ward@example.com", phone: "2345678901", address1: "369 Maple St", address2: "", note: "")
        let student74 = Student(firstName: "Jaxon", lastName: "Watson", email: "jaxon.watson@example.com", phone: "8901234567", address1: "753 Elm St", address2: "", note: "")
        let student75 = Student(firstName: "Clara", lastName: "Bryant", email: "clara.bryant@example.com", phone: "1234567890", address1: "852 Oak St", address2: "", note: "")
        let student76 = Student(firstName: "Silas", lastName: "Diaz", email: "silas.diaz@example.com", phone: "6789012345", address1: "963 Cedar St", address2: "", note: "")
        let student77 = Student(firstName: "Adeline", lastName: "Ferguson", email: "adeline.ferguson@example.com", phone: "9012345678", address1: "147 Birch St", address2: "", note: "")
        let student78 = Student(firstName: "Theodore", lastName: "Hart", email: "theodore.hart@example.com", phone: "3456789012", address1: "258 Maple St", address2: "", note: "")
        let student79 = Student(firstName: "Lydia", lastName: "Bishop", email: "lydia.bishop@example.com", phone: "8901234567", address1: "369 Pine St", address2: "", note: "")
        let student80 = Student(firstName: "Asher", lastName: "Harvey", email: "asher.harvey@example.com", phone: "1234567890", address1: "753 Cedar St", address2: "", note: "")

        let student81 = Student(firstName: "Leah", lastName: "Mcdonald", email: "leah.mcdonald@example.com", phone: "6789012345", address1: "852 Birch St", address2: "", note: "")
        let student82 = Student(firstName: "Jack", lastName: "Valdez", email: "jack.valdez@example.com", phone: "9012345678", address1: "963 Elm St", address2: "", note: "")
        let student83 = Student(firstName: "Audrey", lastName: "Hubbard", email: "audrey.hubbard@example.com", phone: "3456789012", address1: "147 Oak St", address2: "", note: "")
        let student84 = Student(firstName: "Santiago", lastName: "Salazar", email: "santiago.salazar@example.com", phone: "8901234567", address1: "258 Cedar St", address2: "", note: "")
        let student85 = Student(firstName: "Vivian", lastName: "Howell", email: "vivian.howell@example.com", phone: "1234567890", address1: "369 Maple St", address2: "", note: "")
        let student86 = Student(firstName: "Parker", lastName: "Morales", email: "parker.morales@example.com", phone: "6789012345", address1: "753 Elm St", address2: "", note: "")
        let student87 = Student(firstName: "Naomi", lastName: "Doyle", email: "naomi.doyle@example.com", phone: "9012345678", address1: "852 Oak St", address2: "", note: "")
        let student88 = Student(firstName: "Rowan", lastName: "Garza", email: "rowan.garza@example.com", phone: "3456789012", address1: "963 Cedar St", address2: "", note: "")
        let student89 = Student(firstName: "Ellie", lastName: "Young", email: "ellie.young@example.com", phone: "8901234567", address1: "147 Birch St", address2: "", note: "")
        let student90 = Student(firstName: "Bentley", lastName: "Soto", email: "bentley.soto@example.com", phone: "1234567890", address1: "258 Maple St", address2: "", note: "")

        let student91 = Student(firstName: "Nora", lastName: "Ray", email: "nora.ray@example.com", phone: "6789012345", address1: "369 Pine St", address2: "", note: "")
        let student92 = Student(firstName: "Sawyer", lastName: "Burgess", email: "sawyer.burgess@example.com", phone: "9012345678", address1: "753 Cedar St", address2: "", note: "")
        let student93 = Student(firstName: "Aaliyah", lastName: "Frost", email: "aaliyah.frost@example.com", phone: "3456789012", address1: "852 Birch St", address2: "", note: "")
        let student94 = Student(firstName: "Max", lastName: "Ortega", email: "max.ortega@example.com", phone: "8901234567", address1: "963 Elm St", address2: "", note: "")
        let student95 = Student(firstName: "Riley", lastName: "Patel", email: "riley.patel@example.com", phone: "2345678901", address1: "147 Oak St", address2: "", note: "")
        let student96 = Student(firstName: "Isabelle", lastName: "Dickson", email: "isabelle.dickson@example.com", phone: "4567890123", address1: "258 Cedar St", address2: "", note: "")
        let student97 = Student(firstName: "Tristan", lastName: "Archer", email: "tristan.archer@example.com", phone: "8901234567", address1: "369 Maple St", address2: "", note: "")
        let student98 = Student(firstName: "Valentina", lastName: "Oconnor", email: "valentina.oconnor@example.com", phone: "1234567890", address1: "753 Elm St", address2: "", note: "")
        let student99 = Student(firstName: "Miles", lastName: "Davidson", email: "miles.davidson@example.com", phone: "6789012345", address1: "852 Oak St", address2: "", note: "")
        let student100 = Student(firstName: "Athena", lastName: "Meyer", email: "athena.meyer@example.com", phone: "9012345678", address1: "963 Cedar St", address2: "", note: "This student excels in arts.")

        let student101 = Student(firstName: "Finn", lastName: "Pierce", email: "finn.pierce@example.com", phone: "3456789012", address1: "147 Birch St", address2: "", note: "")
        let student102 = Student(firstName: "Genevieve", lastName: "Mills", email: "genevieve.mills@example.com", phone: "8901234567", address1: "258 Maple St", address2: "", note: "")
        let student103 = Student(firstName: "Kai", lastName: "Holland", email: "kai.holland@example.com", phone: "1234567890", address1: "369 Pine St", address2: "", note: "")
        let student104 = Student(firstName: "Ivy", lastName: "Kramer", email: "ivy.kramer@example.com", phone: "6789012345", address1: "753 Cedar St", address2: "", note: "")
        let student105 = Student(firstName: "Emmett", lastName: "May", email: "emmett.may@example.com", phone: "9012345678", address1: "852 Birch St", address2: "", note: "")
        let student106 = Student(firstName: "Juliette", lastName: "Bartlett", email: "juliette.bartlett@example.com", phone: "3456789012", address1: "963 Elm St", address2: "", note: "")
        let student107 = Student(firstName: "Harrison", lastName: "Giles", email: "harrison.giles@example.com", phone: "8901234567", address1: "147 Oak St", address2: "", note: "")
        let student108 = Student(firstName: "Lucy", lastName: "Hobbs", email: "lucy.hobbs@example.com", phone: "1234567890", address1: "258 Cedar St", address2: "", note: "")
        let student109 = Student(firstName: "Weston", lastName: "Schneider", email: "weston.schneider@example.com", phone: "6789012345", address1: "369 Maple St", address2: "", note: "")
        let student110 = Student(firstName: "Elise", lastName: "Robbins", email: "elise.robbins@example.com", phone: "9012345678", address1: "753 Elm St", address2: "", note: "")

        let student111 = Student(firstName: "Roman", lastName: "Cowan", email: "roman.cowan@example.com", phone: "1234567890", address1: "147 Birch St", address2: "", note: "")
        let student112 = Student(firstName: "Lyla", lastName: "Baird", email: "lyla.baird@example.com", phone: "2345678901", address1: "258 Maple St", address2: "", note: "")
        let student113 = Student(firstName: "Kaden", lastName: "Hurst", email: "kaden.hurst@example.com", phone: "3456789012", address1: "369 Pine St", address2: "", note: "")
        let student114 = Student(firstName: "Adalyn", lastName: "Cherry", email: "adalyn.cherry@example.com", phone: "4567890123", address1: "753 Cedar St", address2: "", note: "")
        let student115 = Student(firstName: "Brody", lastName: "Faulkner", email: "brody.faulkner@example.com", phone: "5678901234", address1: "852 Birch St", address2: "", note: "")
        let student116 = Student(firstName: "Raegan", lastName: "Robles", email: "raegan.robles@example.com", phone: "6789012345", address1: "963 Elm St", address2: "", note: "")
        let student117 = Student(firstName: "Nicolas", lastName: "Archer", email: "nicolas.archer@example.com", phone: "7890123456", address1: "147 Oak St", address2: "", note: "")
        let student118 = Student(firstName: "Summer", lastName: "Hendricks", email: "summer.hendricks@example.com", phone: "8901234567", address1: "258 Cedar St", address2: "", note: "")
        let student119 = Student(firstName: "Paxton", lastName: "Stein", email: "paxton.stein@example.com", phone: "9012345678", address1: "369 Maple St", address2: "", note: "")
        let student120 = Student(firstName: "Serenity", lastName: "Dickinson", email: "serenity.dickinson@example.com", phone: "0123456789", address1: "753 Elm St", address2: "", note: "")

        let student121 = Student(firstName: "Jase", lastName: "Decker", email: "jase.decker@example.com", phone: "1234567890", address1: "852 Oak St", address2: "", note: "")
        let student122 = Student(firstName: "Mckenna", lastName: "Holloway", email: "mckenna.holloway@example.com", phone: "2345678901", address1: "963 Cedar St", address2: "", note: "")
        let student123 = Student(firstName: "Emerson", lastName: "Branch", email: "emerson.branch@example.com", phone: "3456789012", address1: "147 Birch St", address2: "", note: "")
        let student124 = Student(firstName: "Hayden", lastName: "Buckner", email: "hayden.buckner@example.com", phone: "4567890123", address1: "258 Maple St", address2: "", note: "")
        let student125 = Student(firstName: "Georgia", lastName: "Herman", email: "georgia.herman@example.com", phone: "5678901234", address1: "369 Pine St", address2: "", note: "")
        let student126 = Student(firstName: "Rhys", lastName: "Madden", email: "rhys.madden@example.com", phone: "6789012345", address1: "753 Cedar St", address2: "", note: "")
        let student127 = Student(firstName: "Harlow", lastName: "Wyatt", email: "harlow.wyatt@example.com", phone: "7890123456", address1: "852 Birch St", address2: "", note: "")
        let student128 = Student(firstName: "Dallas", lastName: "Mcdowell", email: "dallas.mcdowell@example.com", phone: "8901234567", address1: "963 Elm St", address2: "", note: "")
        let student129 = Student(firstName: "Leighton", lastName: "Reese", email: "leighton.reese@example.com", phone: "9012345678", address1: "147 Oak St", address2: "", note: "")
        let student130 = Student(firstName: "Josie", lastName: "Parrish", email: "josie.parrish@example.com", phone: "0123456789", address1: "258 Cedar St", address2: "", note: "")

        let student131 = Student(firstName: "Maximus", lastName: "Chavez", email: "maximus.chavez@example.com", phone: "1234567890", address1: "369 Maple St", address2: "", note: "")
        let student132 = Student(firstName: "Alessandra", lastName: "Mccullough", email: "alessandra.mccullough@example.com", phone: "2345678901", address1: "753 Elm St", address2: "", note: "")
        let student133 = Student(firstName: "Rhett", lastName: "Rush", email: "rhett.rush@example.com", phone: "3456789012", address1: "852 Birch St", address2: "", note: "")
        let student134 = Student(firstName: "Amanda", lastName: "Odom", email: "amanda.odom@example.com", phone: "4567890123", address1: "963 Cedar St", address2: "", note: "")
        let student135 = Student(firstName: "Dax", lastName: "Andrade", email: "dax.andrade@example.com", phone: "5678901234", address1: "147 Oak St", address2: "", note: "")
        let student136 = Student(firstName: "Juniper", lastName: "Lugo", email: "juniper.lugo@example.com", phone: "6789012345", address1: "258 Cedar St", address2: "", note: "")
        let student137 = Student(firstName: "Knox", lastName: "Larsen", email: "knox.larsen@example.com", phone: "7890123456", address1: "369 Pine St", address2: "", note: "")
        let student138 = Student(firstName: "Fiona", lastName: "Salas", email: "fiona.salas@example.com", phone: "8901234567", address1: "753 Cedar St", address2: "", note: "")
        let student139 = Student(firstName: "Beckett", lastName: "Pollard", email: "beckett.pollard@example.com", phone: "9012345678", address1: "852 Birch St", address2: "", note: "")
        let student140 = Student(firstName: "Lorelei", lastName: "Randall", email: "lorelei.randall@example.com", phone: "0123456789", address1: "147 Oak St, add", address2: "", note: "")

        let student141 = Student(firstName: "Morgan", lastName: "Herring", email: "morgan.herring@example.com", phone: "1234567890", address1: "369 Maple St", address2: "", note: "")
        let student142 = Student(firstName: "Kingston", lastName: "Carver", email: "kingston.carver@example.com", phone: "2345678901", address1: "753 Elm St", address2: "", note: "")
        let student143 = Student(firstName: "Camilla", lastName: "Barnett", email: "camilla.barnett@example.com", phone: "3456789012", address1: "852 Birch St", address2: "", note: "")
        let student144 = Student(firstName: "Knox", lastName: "Hickman", email: "knox.hickman@example.com", phone: "4567890123", address1: "963 Cedar St", address2: "", note: "")
        let student145 = Student(firstName: "Hattie", lastName: "Lloyd", email: "hattie.lloyd@example.com", phone: "5678901234", address1: "147 Oak St", address2: "", note: "")
        let student146 = Student(firstName: "Jensen", lastName: "Munoz", email: "jensen.munoz@example.com", phone: "6789012345", address1: "258 Cedar St", address2: "", note: "")
        let student147 = Student(firstName: "Emilia", lastName: "Fleming", email: "emilia.fleming@example.com", phone: "7890123456", address1: "369 Pine St", address2: "", note: "")
        let student148 = Student(firstName: "Zachariah", lastName: "Barrera", email: "zachariah.barrera@example.com", phone: "8901234567", address1: "753 Cedar St", address2: "", note: "")
        let student149 = Student(firstName: "Alison", lastName: "Haley", email: "alison.haley@example.com", phone: "9012345678", address1: "852 Birch St", address2: "", note: "")
        let student150 = Student(firstName: "Frankie", lastName: "Beasley", email: "frankie.beasley@example.com", phone: "0123456789", address1: "963 Elm St", address2: "", note: "")

        let student151 = Student(firstName: "Jasper", lastName: "Hull", email: "jasper.hull@example.com", phone: "1234567890", address1: "147 Oak St", address2: "", note: "")
        let student152 = Student(firstName: "Nyla", lastName: "Branch", email: "nyla.branch@example.com", phone: "2345678901", address1: "258 Cedar St", address2: "", note: "")
        let student153 = Student(firstName: "Brycen", lastName: "Villanueva", email: "brycen.villanueva@example.com", phone: "3456789012", address1: "369 Pine St", address2: "", note: "")
        let student154 = Student(firstName: "Kenzie", lastName: "Estes", email: "kenzie.estes@example.com", phone: "4567890123", address1: "753 Cedar St", address2: "", note: "")
        let student155 = Student(firstName: "Harvey", lastName: "Lancaster", email: "harvey.lancaster@example.com", phone: "5678901234", address1: "852 Birch St", address2: "", note: "")
        let student156 = Student(firstName: "Gemma", lastName: "Barajas", email: "gemma.barajas@example.com", phone: "6789012345", address1: "963 Elm St", address2: "", note: "")
        let student157 = Student(firstName: "Enzo", lastName: "Lam", email: "enzo.lam@example.com", phone: "7890123456", address1: "147 Oak St", address2: "", note: "")
        let student158 = Student(firstName: "Sylvie", lastName: "Hays", email: "sylvie.hays@example.com", phone: "8901234567", address1: "258 Cedar St", address2: "", note: "")
        let student159 = Student(firstName: "Kaison", lastName: "Winters", email: "kaison.winters@example.com", phone: "9012345678", address1: "369 Pine St", address2: "", note: "")
        let student160 = Student(firstName: "Elaina", lastName: "Browning", email: "elaina.browning@example.com", phone: "0123456789", address1: "753 Cedar St", address2: "", note: "")

        let student161 = Student(firstName: "Albert", lastName: "Prince", email: "albert.prince@example.com", phone: "1234567890", address1: "852 Birch St", address2: "", note: "")
        let student162 = Student(firstName: "Janiyah", lastName: "Greene", email: "janiyah.greene@example.com", phone: "2345678901", address1: "963 Elm St", address2: "", note: "")
        let student163 = Student(firstName: "Kian", lastName: "Buck", email: "kian.buck@example.com", phone: "3456789012", address1: "147 Oak St", address2: "", note: "")
        let student164 = Student(firstName: "Elisa", lastName: "Orozco", email: "elisa.orozco@example.com", phone: "4567890123", address1: "258 Cedar St", address2: "", note: "")
        let student165 = Student(firstName: "Brylee", lastName: "Brennan", email: "brylee.brennan@example.com", phone: "5678901234", address1: "369 Pine St", address2: "", note: "")
        let student166 = Student(firstName: "Samir", lastName: "Blair", email: "samir.blair@example.com", phone: "6789012345", address1: "753 Cedar St", address2: "", note: "")
        let student167 = Student(firstName: "Adele", lastName: "Rosales", email: "adele.rosales@example.com", phone: "7890123456", address1: "852 Birch St", address2: "", note: "")
        let student168 = Student(firstName: "Jamar", lastName: "Suarez", email: "jamar.suarez@example.com", phone: "8901234567", address1: "963 Elm St", address2: "", note: "")
        let student169 = Student(firstName: "Kaitlyn", lastName: "Cline", email: "kaitlyn.cline@example.com", phone: "9012345678", address1: "147 Oak St", address2: "", note: "")
        let student170 = Student(firstName: "Evelyn", lastName: "Nguyen", email: "evelyn.nguyen@example.com", phone: "1234567890", address1: "170 Elm Street", address2: "Apt 3B", note: "Enjoys reading and writing poetry.")

        let allStudents = [
            student1, student2, student3, student4, student5, student6, student7, student8, student9, student10,
            student11, student12, student13, student14, student15, student16, student17, student18, student19, student20,
            student21, student22, student23, student24, student25, student26, student27, student28, student29, student30,
            student31, student32, student33, student34, student35, student36, student37, student38, student39, student40,
            student41, student42, student43, student44, student45, student46, student47, student48, student49, student50,
            student51, student52, student53, student54, student55, student56, student57, student58, student59, student60,
            student61, student62, student63, student64, student65, student66, student67, student68, student69, student70,
            student71, student72, student73, student74, student75, student76, student77, student78, student79, student80,
            student81, student82, student83, student84, student85, student86, student87, student88, student89, student90,
            student91, student92, student93, student94, student95, student96, student97, student98, student99, student100,
            student101, student102, student103, student104, student105, student106, student107, student108, student109, student110,
            student111, student112, student113, student114, student115, student116, student117, student118, student119, student120,
            student121, student122, student123, student124, student125, student126, student127, student128, student129, student130,
            student131, student132, student133, student134, student135, student136, student137, student138, student139, student140,
            student141, student142, student143, student144, student145, student146, student147, student148, student149, student150,
            student151, student152, student153, student154, student155, student156, student157, student158, student159, student160,
            student161, student162, student163, student164, student165, student166, student167, student168, student169, student170
        ]

        insert(allStudents, context: context)

        createRegistrations(courses: allCourses, students: allStudents, context: context)

        return (courseMonday1, student1, allCourses, allStudents, group)
    }

    static private func insert<T: PersistentModel>(_ objects: [T], context: ModelContext) {
        for object in objects {
            context.insert(object)
        }
    }

    static private func createRegistrations(courses: [Course], students: [Student], context: ModelContext) {
        for student in students {
            guard let course = courses.filter( { $0.registrations?.count ?? 0 < 15 }).randomElement() else { return }

            let isPaid = Double.random(in: 0 ..< 1) < 0.75
            let registration = Registration(note: "", student: student, course: course, paid: isPaid)
            context.insert(registration)
        }
    }
}
