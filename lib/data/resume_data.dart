// แก้ไขข้อมูลทุกอย่างในไฟล์นี้ได้เลย เพื่อให้ resume เป็นของคุณ

class ContactInfo {
  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    this.github,
    this.linkedin,
  });

  final String email;
  final String phone;
  final String location;
  final String? github;
  final String? linkedin;
}

class Education {
  const Education({
    required this.school,
    required this.degree,
    this.field = '',
    this.period = '',
    this.gpa,
    this.highlights = const [],
  });

  final String school;
  final String degree;
  final String field;
  final String period;
  final String? gpa;
  final List<String> highlights;
}

class Skill {
  const Skill({
    required this.name,
    required this.level,
    required this.category,
  });

  final String name;

  /// ระดับความชำนาญ 0-100
  final int level;
  final String category;
}

class Experience {
  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    this.responsibilities = const [],
    this.tech = const [],
  });

  final String company;
  final String role;
  final String period;
  final String location;
  final List<String> responsibilities;
  final List<String> tech;
}

class Certificate {
  const Certificate({required this.name, required this.description});

  final String name;
  final String description;
}

class Project {
  const Project({
    required this.name,
    required this.description,
    this.tech = const [],
  });

  final String name;
  final String description;
  final List<String> tech;
}

class ResumeData {
  const ResumeData({
    required this.name,
    required this.title,
    required this.tagline,
    required this.about,
    required this.contact,
    this.photo,
    this.education = const [],
    this.skills = const [],
    this.experience = const [],
    this.projects = const [],
    this.languages = const [],
    this.strengths = const [],
    this.certificates = const [],
    this.workEthics = const [],
  });

  final String name;
  final String title;
  final String tagline;
  final String about;
  final ContactInfo contact;
  final String? photo;
  final List<Education> education;
  final List<Skill> skills;
  final List<Experience> experience;
  final List<Project> projects;
  final List<Skill> languages;
  final List<String> strengths;
  final List<Certificate> certificates;
  final List<String> workEthics;
}

const resumeData = ResumeData(
  name: 'พรรษนันท์ เปี่ยมยานนท์',
  title: 'Computer Engineer · Graphic & Media Design',
  tagline: 'วิศวกรรมคอมพิวเตอร์ | Bangkok, Thailand',
  photo: 'assets/images/my.jpg',
  about:
      'กำลังศึกษาสาขาวิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ '
      'มหาวิทยาลัยเทคโนโลยีราชมงคลพระนคร (ศูนย์พระนครเหนือ) '
      'ผลการเรียน(GPAX 3.46) มีความรู้พื้นฐานแน่นด้านการพัฒนาโปรแกรม '
      '(Cyber security , C++), ระบบเครือข่าย Cisco และ Docker  '
      'รวมถึงมีความสามารถเสริมด้านงาน Graphic Design และ 3D Modeling '
      'เชี่ยวชาญด้าน Prompt AI เป็นคนเรียนรู้ไว มีวินัย '
      'และพร้อมเปิดรับเทคโนโลยีใหม่ ๆ อยู่เสมอ',
  contact: ContactInfo(
    email: 'phatasanunn-p@rmutp.ac.th',
    phone: '096-927-2021',
    location: 'Bangkok, Thailand',
  ),
  education: [
    Education(
      school: 'มหาวิทยาลัยเทคโนโลยีราชมงคลพระนคร',
      degree: 'วศ.บ. วิศวกรรมคอมพิวเตอร์ (B.Eng.)',
      field: 'หลักสูตรวิศวกรรมคอมพิวเตอร์: โครงสร้างข้อมูล, เครือข่าย, ซอฟต์แวร์',
    ),
    Education(
      school: 'วิทยาลัยเทคโนโลยีตั้งตรงจิตรบริหารธุรกิจ',
      degree: 'ประกาศนียบัตรวิชาชีพชั้นสูง (ปวส.)',
      field: 'สาขาวิชาคอมพิวเตอร์ธุรกิจ',
    ),
    Education(
      school: 'วิทยาลัยเทคโนโลยีตั้งตรงจิตรพาณิชยการ',
      degree: 'ประกาศนียบัตรวิชาชีพ (ปวช.)',
      field: 'สาขาวิชาคอมพิวเตอร์ธุรกิจ',
    ),
    Education(
      school: 'โรงเรียนอันนาลัย',
      degree: 'มัธยมศึกษา',
    ),
    Education(
      school: 'โรงเรียนอนุบาลสมุทรสาคร',
      degree: 'ประถมศึกษา',
    ),
  ],
  skills: [
    Skill(name: 'Cyber Security (Basics)', level: 60, category: 'Hard Skills'),
    Skill(name: 'C / C++', level: 70, category: 'Hard Skills'),
    Skill(name: 'VS Code', level: 75, category: 'Hard Skills'),
    Skill(name: 'Docker (Basics)', level: 55, category: 'Hard Skills'),
    Skill(name: 'Cisco Networking', level: 65, category: 'Hard Skills'),
    Skill(name: 'Microsoft Office', level: 85, category: 'Hard Skills'),
    Skill(name: '3D Modeling & Design', level: 80, category: 'Hard Skills'),
    Skill(name: 'Graphic Design', level: 85, category: 'Hard Skills'),
    Skill(
      name: 'Attention to Detail (ความละเอียดรอบคอบ)',
      level: 90,
      category: 'Soft Skills',
    ),
    Skill(
      name: 'Logical Problem Solving (การแก้ปัญหาเชิงตรรกะ)',
      level: 85,
      category: 'Soft Skills',
    ),
    Skill(
      name: 'Teamwork & Collaboration (การทำงานเป็นทีม)',
      level: 90,
      category: 'Soft Skills',
    ),
    Skill(
      name: 'Prompt AI',
      level: 70,
      category: 'Soft Skills',
    ),
  ],
  experience: [
    Experience(
      company: 'ASEFA PLC. | บริษัท อาซีฟา จำกัด (มหาชน)',
      role: 'Graphic Designer / Creative & Coordination',
      period: '3 เดือน',
      location: '',
      responsibilities: [
        'ออกแบบงานกราฟิกและองค์ประกอบโดยรวมของสื่อโฆษณาทั้งภาพนิ่งและภาพเคลื่อนไหว',
        'ประสานงานระหว่างแผนกต่าง ๆ ในองค์กร',
        'ช่วยจัดเตรียมสถานที่การประชุมและโครงการต่าง ๆ',
      ],
    ),
  ],
  projects: [
    Project(
      name: 'โครงงานวิศวกรรมคอมพิวเตอร์ มทร.พระนคร',
      description:
          'โครงงานด้านวิศวกรรมคอมพิวเตอร์ ใช้ความรู้ด้านความปลอดภัยทางไซเบอร์ขั้นพื้นฐาน การเขียนโปรแกรม C++ การจำลองระบบด้วย Docker และการบริหารจัดการเครือข่ายด้วย Cisco Networking',
      tech: [
        'Cyber Security (Basics)',
        'C++',
        'Docker',
        'Cisco Networking',
      ],
    ),
  ],
  languages: [
    Skill(name: 'ภาษาไทย (Thai)', level: 100, category: 'ภาษา'),
    Skill(name: 'ภาษาอังกฤษ (English)', level: 50, category: 'ภาษา'),
  ],
  strengths: [
    'ความละเอียดรอบคอบ: ตรวจสอบคุณภาพงานได้อย่างแม่นยำ',
    'การแก้ปัญหาเฉพาะหน้า: รับมืออย่างคล่องตัว มีเหตุผล',
    'ความรับผิดชอบสูง: ตรงต่อเวลาและมีวินัยในการทำงาน',
    'พร้อมเรียนรู้สิ่งใหม่: พัฒนาตนเองอย่างต่อเนื่อง',
  ],
  certificates: [
    Certificate(
      name: 'Computer Engineering Workshop (มทร.พระนคร)',
      description: 'การพัฒนาซอฟต์แวร์และฮาร์ดแวร์',
    ),
    Certificate(
      name: 'Cisco Networking Fundamentals',
      description: 'การออกแบบและการจัดการเครือข่าย Routing & Switching',
    ),
  ],
  workEthics: [
    'มีความมุ่งมั่น ละเอียดรอบคอบ และมีระเบียบวินัยในการทำงาน',
    'พร้อมเรียนรู้เทคโนโลยีใหม่และปฏิบัติตามคำแนะนำอย่างเคร่งครัด',
    'ปรับตัวเข้ากับวัฒนธรรมองค์กรและการทำงานเป็นทีมได้ดี',
    'มีทักษะการประสานงานและแก้ปัญหาเฉพาะหน้าอย่างมีเหตุผล',
    'พร้อมเริ่มงานได้ทันทีในเขตกรุงเทพและปริมณฑล สื่อสารภาษาอังกฤษเชิงเทคนิคได้',
  ],
);