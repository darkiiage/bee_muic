namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "Kelly",
                         last_name: "Wang",
                         email: "kelly@wang.com",
                         password: "111111",
                         password_confirmation: "111111",
                         description: "I'm a bee! I love sharing!",
                         user_image: "defult_profile_image.png",
                         admin: true, 
                         active: true)

    kitty = User.create!(first_name: "Hello",
                         last_name: "Kitty",
                         email: "hello@kitty.com",
                         password: "111111",
                         password_confirmation: "111111",
                         description: "I'm a bee! I love sharing!",
                         admin: false, 
                         active: true)

    mickey = User.create!(first_name: "Mickey",
                         last_name: "Mouse",
                         email: "mickey@mouse.com",
                         password: "111111",
                         password_confirmation: "111111",
                         description: "I'm a bee! I love sharing!",
                         admin: false, 
                         active: true)

    snoopy = User.create!(first_name: "Snoopy",
                         last_name: "Doopy",
                         email: "snoopy@doopy.com",
                         password: "111111",
                         password_confirmation: "111111",
                         description: "I'm a bee! I love sharing!",
                         admin: false, 
                         active: true)

    sponge = User.create!(first_name: "Sponge",
                         last_name: "Bob",
                         email: "sponge@bob.com",
                         password: "111111",
                         password_confirmation: "111111",
                         description: "I'm a bee! I love sharing!",
                         admin: false, 
                         active: true)

#----------------------------------------------------------------------------------------
#-------------------------- FACULTY -----------------------------------------------------
#----------------------------------------------------------------------------------------

    kelly = User.find(1)
    mamamia = kelly.events.create!(event_name: "Mamamia Musical",
                         start_date: "2014-03-24 14:16:00 UTC",
                         end_date: "2014-03-24 14:16:00 UTC ",
                         event_cost: 0,
                         event_guest_type: "Public",
                         event_guest_limit: 0,
                         event_food: true,
                         event_preregist: false,
                         event_type: "Art & Music" )

    mamamia.has_locations.create!(
                         location: "Office of President",
                         floor_number: 4,
                         room: "Auditorium",
                         description: "Ask any students if you do not where Auditorium is" )

#----------------------------------------------------------------------------------------
#-------------------------- FACULTY -----------------------------------------------------
#----------------------------------------------------------------------------------------
    dt = Faculty.create!(faculty_short_name: "DT",
                         faculty_name: "Faculty of Dentistry",
                         faculty_type: "Faculties")

    eg = Faculty.create!(faculty_short_name: "EG",
                         faculty_name: "Faculty of Engineering",
                         faculty_type: "Faculties")

    en = Faculty.create!(faculty_short_name: "EN",
                         faculty_name: "Faculty of Environment and Resources Studies",
                         faculty_type: "Faculties")

    ict = Faculty.create!(faculty_short_name: "ICT",
                         faculty_name: "Faculty of Information and Communication Technology",
                         faculty_type: "Faculties")

    la = Faculty.create!(faculty_short_name: "LA",
                         faculty_name: "Faculty of Liberal Arts",
                         faculty_type: "Faculties")

    pt = Faculty.create!(faculty_short_name: "PT",
                         faculty_name: "Faculty of Physical Therapy",
                         faculty_type: "Faculties")

    ad = Faculty.create!(faculty_short_name: "AD",
                         faculty_name: "ASEAN Institute for Health Development",
                         faculty_type: "Institutes")

    il = Faculty.create!(faculty_short_name: "IL",
                         faculty_name: "Institute for Innovative Learning",
                         faculty_type: "Institutes")

    nu = Faculty.create!(faculty_short_name: "NU",
                         faculty_name: "Institute of Nutrition",
                         faculty_type: "Institutes")

    ihrp = Faculty.create!(faculty_short_name: "IHRP",
                         faculty_name: "Institute of Human Rights and Peace Studies",
                         faculty_type: "Institutes")

    cf = Faculty.create!(faculty_short_name: "CF",
                         faculty_name: "National Institute for Child and Family Development",
                         faculty_type: "Institutes")

    ms = Faculty.create!(faculty_short_name: "MS",
                         faculty_name: "College of Music",
                         faculty_type: "Colleges")

    cm = Faculty.create!(faculty_short_name: "CM",
                         faculty_name: "College of Management",
                         faculty_type: "Colleges")

    cr = Faculty.create!(faculty_short_name: "CR",
                         faculty_name: "College of Religious Studies",
                         faculty_type: "Colleges")

    ss = Faculty.create!(faculty_short_name: "SS",
                         faculty_name: "College of Sports Science and Technology",
                         faculty_type: "Colleges")

    gj = Faculty.create!(faculty_short_name: "GJ",
                         faculty_name: "Golden Jubilee Medical Center",
                         faculty_type: "Centers")

    li = Faculty.create!(faculty_short_name: "LI",
                         faculty_name: "Mahidol University Library and Knowledge Center",
                         faculty_type: "Centers")



#----------------------------------------------------------------------------------------
#-------------------------- LOCATION -----------------------------------------------------
#----------------------------------------------------------------------------------------
    l1 = Location.create!(map_number: 1,
                          location_name: "Office of the President")

    l2 = Location.create!(map_number: 2,
                          location_name: "Mahidol University Library and Knowledge Center")

    l3 = Location.create!(map_number: 3,
                          location_name: "Faculty of Information and Communication Technology")

    l4 = Location.create!(map_number: 4,
                          location_name: "Faculty of Engineering Building 1")

    l5 = Location.create!(map_number: 5,
                          location_name: "Institute of Nutrition")

    l6 = Location.create!(map_number: 6,
                          location_name: "Faculty of Environment and Resource Studies")

    l7 = Location.create!(map_number: 7,
                          location_name: "College of Sports Science and Technology")

    l8 = Location.create!(map_number: 8,
                          location_name: "Badhanatala Environment Building")

    l9 = Location.create!(map_number: 9,
                          location_name: "Mahidol Learning Center")

    l10 = Location.create!(map_number: 10,
                          location_name: "Chaofaa Garden")

    l11 = Location.create!(map_number: 11,
                          location_name: "Faculty of Graduate Studies")

    l12 = Location.create!(map_number: 12,
                          location_name: "Faculty of Science Building 3 - 4")


#----------------------------------------------------------------------------------------
#-------------------------- EVENT TYPE -----------------------------------------------------
#----------------------------------------------------------------------------------------
    et1 = EventType.create!(name: "Social",
                           image: "",
                           color: "")

    et2 = EventType.create!(name: "Volunteering",
                           image: "",
                           color: "")

    et3 = EventType.create!(name: "Guest Lecture",
                           image: "",
                           color: "")

    et4 = EventType.create!(name: "Review Session",
                           image: "",
                           color: "")

    et5 = EventType.create!(name: "Art & Music",
                           image: "",
                           color: "")


#----------------------------------------------------------------------------------------
#-------------------------- SOCIAL LINKS -----------------------------------------------------
#----------------------------------------------------------------------------------------
    sl1 = SocialLink.create!(social_name: "Facebook",
                             social_image: "")

    sl2 = SocialLink.create!(social_name: "Youtube",
                             social_image: "")

    sl3 = SocialLink.create!(social_name: "Instagrams",
                             social_image: "")




  end
end