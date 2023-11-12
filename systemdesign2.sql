-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 12:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `systemdesign`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `AdminType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminpl0`
--

CREATE TABLE `adminpl0` (
  `AdminID` int(11) NOT NULL,
  `priorityType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminpl1`
--

CREATE TABLE `adminpl1` (
  `AdminID` int(11) NOT NULL,
  `priorityType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `StudentID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `DOA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `StudentID` int(11) NOT NULL,
  `CRN` int(11) NOT NULL,
  `CourseID` varchar(25) DEFAULT NULL,
  `ClassDate` date NOT NULL,
  `Present` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `BuildingID` varchar(25) NOT NULL,
  `BuildingName` varchar(100) DEFAULT NULL,
  `BuildingType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`BuildingID`, `BuildingName`, `BuildingType`) VALUES
('1', 'Hawks Building', 'Instruction Building'),
('2', 'Might Building', 'Instruction Building'),
('3', 'Woods Center', 'Instruction Building'),
('4', 'Campus Center', 'Office Building'),
('5', 'Science Center', 'Lab Building');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `RoomID` varchar(25) NOT NULL,
  `NumOfSeats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`RoomID`, `NumOfSeats`) VALUES
('10H', 10),
('10M', 10),
('10W', 10),
('1H', 10),
('1M', 10),
('1W', 10),
('2H', 10),
('2M', 10),
('2W', 10),
('3H', 10),
('3M', 10),
('3W', 10),
('4H', 10),
('4M', 10),
('4W', 10),
('5H', 10),
('5M', 10),
('5W', 10),
('6H', 10),
('6M', 10),
('6W', 10),
('7H', 10),
('7M', 10),
('7W', 10),
('8H', 10),
('8M', 10),
('8W', 10),
('9H', 10),
('9M', 10),
('9W', 10);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` varchar(100) NOT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `DeptID` varchar(25) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `CourseType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `DeptID`, `Credits`, `Description`, `CourseType`) VALUES
('BS1000', 'Plants and Society', 'BIO', 4, 'A one semester lecture/laboratory course in general botany for non-science majors. The course covers the principles of plant anatomy and physiology, as well as the impact of plants and agriculture on society. Topics covered include the use and history of plants as food, medicines, and poisons.', 'Undergraduate'),
('BS2400', 'Basic Biology I', 'BIO', 3, 'Lecture first semester of freshman biology courses covering content areas including molecular and cellular biology, genetics, genomics and evolution.', 'Undergraduate'),
('BS2401', 'Basic Biology I Lab', 'BIO', 1, 'Laboratory first semester of freshman biology courses covering content areas including molecular and cellular biology, genetics, genomics and evolution.', 'Undergraduate'),
('BS2410', 'Basic Biology II', 'BIO', 3, 'Lecture second semester of freshman biology courses covering content areas including cell metabolism, comparative animal and plant anatomy and physiology and ecology.', 'Undergraduate'),
('BS2411', 'Basic Biology II Lab', 'BIO', 1, 'Laboratory second semester of freshman biology courses covering content areas including cell metabolism, comparative animal and plant anatomy and physiology and ecology.', 'Undergraduate'),
('BS2490', 'Enivronmental Science', 'BIO', 4, 'The focus of this lecture course is on the interactions of humans with their environment. Human impact on the world’s ecosystems is emphasized. The theme stressed throughout this course is that every system involving life is dependent upon maintaining balances between nutrient gains and losses, between energy inflows and outflows, and between births and deaths within populations. Against this background, various aspects of the human system, such as our use of soils, our disposal of wastes, our use of resources, land, and energy and our population, are shown to be out of balance. The consequences of these imbalances are discussed in relation to our political and economic system.', 'Undergraduate'),
('BS3400', 'Vertebrate Physiology', 'BIO', 4, 'A regulatory systems approach to the principles of animal physiology, developed through consideration of functioning of cells, tissues, and organ systems with an emphasis on humans. (With 3-hour laboratory)', 'Undergraduate'),
('BS3450', 'Plant Biology', 'BIO', 4, 'The study of plants as biological organisms. Topics include classification and evolution of the plant kingdom: plant anatomy, physiology and reproduction, with emphasis on the flowering plants. Consideration given to experimental methods used in studying plants and the importance of plants and plant studies. Students are expected to complete an experimental project or observational study. Lecture, discussion, laboratory and field trips, or audio tutorial integration of these are presented.', 'Undergraduate'),
('BS3810', 'Biological Aspects of Aging', 'BIO', 4, 'Lecture/workshop course designed for science students. Examines the aging process on the molecular, cellular, and organismic levels. Emphasizes alterations during the aging process in cells whose life span is identical to that of the entire organism. Examination of various pathological disorders in relationship to aging is also emphasized. Students are required to read original articles and be prepared to discuss current topics in workshop settings.', 'Undergraduate'),
('BS4400', 'Cell Biology', 'BIO', 4, 'Lecture/discussion/laboratory course whose content is directed to the study of the molecular basis of cell activities, cell ultra structure, and its integration with cellular function. Lectures survey the cell in its environment, energy transformation, mobility, replication of genetic material, growth, nucleocytoplasmic interactions. The laboratory explores techniques used in the study of the cell.', 'Undergraduate'),
('BS4420', 'Microbiology', 'BIO', 4, 'Lecture/laboratory course concerned with structure-function relationships in various types of microorganisms, with particular emphasis on bacteria. Nutrition, biosynthesis, energetics, growth, microbial interactions and symbiotic relationships, host-parasite relationships, and microbial genetics are among the topics discussed.', 'Undergraduate'),
('BS4460', 'Genetics', 'BIO', 4, 'Lecture/laboratory course presenting the fundamental principles of genetics, the molecular biology of the gene, and heredity in humans. Through lectures, readings, laboratories, and discussions, students examine the experimental evidence leading to currently accepted concepts, and critically analyze the implications of various findings in human genetics.', 'Undergraduate'),
('BS4461', 'Immunology', 'BIO', 4, 'Lecture/laboratory. This course will introduce students to the essential concepts of how the immune system works, what are the molecular and cellular mechanisms and pathways involved in the defense of an organism from infectious diseases or cancer, and it will describe in detail the cells and molecules of the mammalian immune system. The laboratory component is a research-based course where students participate in the development of new knowledge by generating a novel research question and performing their own experimental design.', 'Undergraduate'),
('BS4470', 'Ecology', 'BIO', 4, 'A general ecology course focused on the study of ecosystems. It fulfills the population content area course requirement for the BA and BS degrees in Biology. The course includes a lecture (3 hours/week) and a laboratory component (3 hours/week). Topics include ecosystem structure and function, population dynamics, community structure, food webs, energy flow, nutrient cycles, biogeography, associations, succession, adaptation and niche analysis, and interspecific interactions. The course is taught in a blended format with a significant online course component. The laboratory component includes extensive field work. Students working in groups must design and implement a research project involving data collection from a campus ecosystem. The project culminates in a group oral presentation. Students are also encouraged to present their results at a local or regional conference and/or submit their results for publication to a peer-reviewed undergraduate research journal', 'Undergraduate'),
('BS4560', 'Molecular Biology', 'BIO', 4, 'Lecture/Laboratory course to introduce students to both the theoretical and practical aspects of molecular biology. An understanding of molecular biology necessitates a synthesis of information from genetics, biochemistry, cell biology, physics and chemistry. The course will include microbial studies, cellular components, genes, regulation etc. The lab component will utilize techniques of genetic engineering.', 'Undergraduate'),
('BS5410', 'Seminar I: Reading in the Discipline', 'BIO', 4, 'Designed to increase ability to read in the discipline. Students will survey scientific literature, learn how to research topics, prepare abstracts, etc. Students will select a mentor and topic for Seminar II. Must be taken by students two semesters prior to graduation.', 'Undergraduate'),
('BS5420', 'Seminar II: Writing in the Discipline', 'BIO', 4, 'Designed to promote an in-depth consideration of special topics in current biological research. The course will include presentations by both external speakers and students. The student will, under the advisement of a faculty mentor, develop a topic either as a library or laboratory study and present the results both orally and as a written paper.', 'Undergraduate'),
('BS5590', 'Advanced Research', 'BIO', 4, 'Research project carried out under the supervision of a faculty member. Each project includes a survey of the appropriate original literature and investigation of a selected research topic by experimental or theoretical methods. Open to students of upper‑division standing, preferably seniors, on acceptance as a research student by a faculty member. Students may take this course twice for credit but may receive only 4 credits from this course toward the major. Grading will be CR/NC.', 'Undergraduate'),
('BS5591', 'Environmental Research', 'BIO', 3, 'Research project in environmental science carried out under supervision of a faculty member. Open to upper‑division students, preferably seniors on acceptance as a research student by a faculty member.', 'Undergraduate'),
('BS5592', 'Environmental Research Lab', 'BIO', 1, 'Research project in environmental science carried out under supervision of a faculty member. Open to upper‑division students, preferably seniors on acceptance as a research student by a faculty member.', 'Undergraduate'),
('BU1000', 'Entrepreneurship and Small Business Management', 'BUS', 4, 'Covers the fundamentals of starting and managing a small business, including business planning, marketing, finance, and operations.', 'Undergraduate'),
('BU1050', 'Marketing and Branding', 'BUS', 4, 'Focuses on marketing strategies, brand development, and customer engagement for effective product and service promotion.', 'Undergraduate'),
('BU1200', 'Entrepreneurial Finance', 'BUS', 4, 'Examines financing for startups and small businesses, including venture capital and crowdfunding.', 'Undergraduate'),
('BU1900', 'Supply Chain Logistics', 'BUS', 4, 'Studies supply chain logistics, including inventory control, transportation, and distribution management.', 'Undergraduate'),
('BU2000', 'Financial Management', 'BUS', 4, 'Teaches financial planning, budgeting, investment strategies, and financial analysis for informed business decisions.', 'Undergraduate'),
('BU2050', 'Human Resource Management', 'BUS', 4, 'Covers hiring, training, employee relations, and workforce management for building and managing a strong team.', 'Undergraduate'),
('BU2100', 'International Business and Globalization', 'BUS', 4, 'Discusses challenges and opportunities of global business, including international trade and cross-cultural management.', 'Undergraduate'),
('BU2150', 'Business Ethics and Corporate Social Responsibility', 'BUS', 4, 'Explores business ethics, sustainability, and corporate social responsibilities in the context of corporate operations.', 'Undergraduate'),
('BU2200', 'Operations and Supply Chain Management', 'BUS', 4, 'Studies business process optimization, supply chain management, and operational efficiency improvement.', 'Undergraduate'),
('BU2700', 'Financial Accounting', 'BUS', 4, 'Introduces financial reporting, accounting principles, and financial statement analysis for assessing financial health.', 'Undergraduate'),
('BU2800', 'Risk Management and Insurance', 'BUS', 4, 'Explores risk management principles, insurance options, and strategies to protect against risks and liabilities.', 'Undergraduate'),
('BU3000', 'E-Commerce and Digital Marketing', 'BUS', 4, 'Delves into online business, e-commerce platforms, digital marketing, and technological applications in business.', 'Undergraduate'),
('BU3450', 'Business Law and Ethics', 'BUS', 4, 'Provides an overview of business law, contracts, intellectual property, and the legal and ethical business framework.', 'Undergraduate'),
('BU3700', 'Sales and Negotiation Skills', 'BUS', 4, 'Develops sales and negotiation techniques and client relationship building for business development.', 'Undergraduate'),
('BU4000', 'Business Analytics and Data Science', 'BUS', 4, 'Explores data analytics and data science for business decision-making and process optimization.', 'Undergraduate'),
('BU4500', 'Innovation and Product Development', 'BUS', 4, 'Focuses on the innovation process, product development, and introducing innovative ideas to the market.', 'Undergraduate'),
('BU5300', 'Leadership and Organizational Behavior', 'BUS', 4, 'Explores leadership styles, motivation, and organizational behavior dynamics for effective management.', 'Undergraduate'),
('BU5500', 'Strategic Management', 'BUS', 4, 'Covers strategic planning, competitive analysis, and effective business strategy creation and execution for long-term success.', 'Undergraduate'),
('BU5910', 'Business Communication', 'BUS', 4, 'Focuses on effective business communication, including writing, presentations, and interpersonal skills.', 'Undergraduate'),
('BU5950', 'Business Negotiation and Conflict Resolution', 'BUS', 4, 'Develops negotiation and conflict resolution skills and strategies in business contexts.', 'Undergraduate'),
('CP2120', 'Principles of Chemistry I', 'CHE', 3, 'Introduction to modern chemistry principles, including atomic/molecular structure, stoichiometry, periodicity, bonding, and states of matter, with descriptive chemistry examples.', 'Undergraduate'),
('CP2121', 'Principles of Chemistry I Lab', 'CHE', 1, 'Lab course complementing Principles of Chemistry I, focusing on chemical concepts, quantitative skills, descriptive chemistry, and scientific writing. Three hours per week.', 'Undergraduate'),
('CP2130', 'Principles of Chemistry II', 'CHE', 3, 'Continues Principles of Chemistry I, covering acid/base and oxidation/reduction reactions, equilibrium, kinetics, and electrochemistry, with descriptive chemistry examples.', 'Undergraduate'),
('CP2131', 'Principles of Chemistry II Lab', 'CHE', 1, 'Continuation of CP2121 lab, with a focus on advanced chemical concepts, quantitative skills, descriptive chemistry, and scientific writing. Three hours per week.', 'Undergraduate'),
('CP3230', 'Mathematical Methods in the Physical Sciences', 'CHE', 4, 'Applies advanced mathematical principles to physical science problems. Topics include series, multivariable functions, matrix/vector algebra, Fourier analysis, and differential equations.', 'Undergraduate'),
('CP3300', 'Organic Chemistry I', 'CHE', 3, 'Introductory organic chemistry covering major compound classes, structure, reactions, synthesis, stereochemistry, and reaction mechanisms.', 'Undergraduate'),
('CP3302', 'Organic Chemistry I Lab', 'CHE', 1, 'Lab illustrating CP3300 topics, developing skills in synthesis, separation, purification of organic compounds, and report writing. Four hours per week.', 'Undergraduate'),
('CP3310', 'Organic Chemistry II', 'CHE', 3, 'Continuation of Organic Chemistry I, discussing additional classes of organic compounds and their chemistry.', 'Undergraduate'),
('CP3312', 'Organic Chemistry II Lab', 'CHE', 1, 'Lab complementing CP3310, focusing on advanced synthetic techniques, spectroscopy, qualitative analysis, and scientific writing. Four hours per week.', 'Undergraduate'),
('CP3400', 'Analytical Chemistry', 'CHE', 4, 'Covers chemical stoichiometry, equilibria, volumetric/gravimetric analysis, separation methods, spectrophotometry, data analysis, and record-keeping. Two lectures, one four-hour lab per week.', 'Undergraduate'),
('CP3450', 'Inorganic Chemistry', 'CHE', 4, 'In-depth study of inorganic chemistry using principles of thermodynamics, kinetics, and quantum mechanics. Topics include structure, bonding, coordination compounds, and group theory.', 'Undergraduate'),
('CP4320', 'Advanced Organic Chemistry', 'CHE', 4, 'Examines modern synthetic methods, molecular orbital theory, reaction mechanisms, and the impact of various effects on organic reactions.', 'Undergraduate'),
('CP4490', 'Biochemistry for Life Sciences', 'CHE', 4, 'Survey course covering foundational biochemistry topics such as pH, bioenergetics, nucleotides, proteins, enzymes, metabolism, and molecular biology.', 'Undergraduate'),
('CP4510', 'Biochemistry I', 'CHE', 4, 'Covers the chemistry and metabolism of biological compounds, enzyme kinetics, bioenergetics, and biosynthesis of biomolecules.', 'Undergraduate'),
('CP4515', 'Biochemistry II', 'CHE', 3, 'Continues Biochemistry I with a focus on biochemical process control, photosynthesis, genetic processes, and metabolism.', 'Undergraduate'),
('CP4520', 'Biochemistry Lab', 'CHE', 1, 'Lab course reinforcing biochemistry lecture topics with current biochemical techniques. Four laboratory hours per week.', 'Undergraduate'),
('CP4700', 'Physical Chemistry I', 'CHE', 4, 'Surveys physical chemistry principles like thermodynamics, state changes, solutions, phase equilibria, and kinetic theory.', 'Undergraduate'),
('CP4710', 'Physical Chemistry II', 'CHE', 3, 'Continues Physical Chemistry I, focusing on chemical kinetics, quantum mechanics, and atomic/molecular structure.', 'Undergraduate'),
('CP4720', 'Physical Chemistry Lab', 'CHE', 1, 'Laboratory experiments illustrating principles of thermodynamics, equilibria, kinetics, and spectroscopy. Includes vacuum techniques and data analysis, with a focus on scientific report writing.', 'Undergraduate'),
('CP5500', 'Advanced Topics in Chemistry', 'CHE', 4, 'Covers selected contemporary topics in chemistry such as spectroscopy, radiation chemistry, and new instrumental techniques.', 'Undergraduate'),
('CS2510', 'Computer Programming 1', 'CIS', 4, 'This introductory course covers the fundamentals of computer programming, teaching students the basics of a programming language, problem-solving, and algorithm development.', 'Undergraduate'),
('CS2511', 'Computer Programming 2', 'CIS', 4, 'Building on the foundation from Computer Programming 1, this course delves deeper into programming concepts, data structures, and problem-solving techniques, allowing students to develop more complex software applications.', 'Undergraduate'),
('CS2512', 'Computer Architecture ', 'CIS', 4, 'This course explores the inner workings of computer systems, focusing on the design and organization of computer hardware components such as the CPU, memory, and input/output devices.', 'Undergraduate'),
('CS2513', 'Data Structures and Algorithms ', 'CIS', 4, 'Students learn about various data structures (e.g., arrays, linked lists, trees) and algorithms for efficient data manipulation and problem-solving, a crucial topic in computer science and software development.', 'Undergraduate'),
('CS2514', 'Java and Object-Oriented Progamming', 'CIS', 4, 'This class teaches Java programming and the principles of object-oriented programming, emphasizing the creation of reusable and maintainable software using Java.', 'Undergraduate'),
('CS3211', 'Cybersecurity and Ethical Hacking', 'CIS', 4, 'This class is designed to equip students with the skills and knowledge needed to protect computer systems and networks from cyber threats. It covers topics such as network security, encryption, penetration testing, and ethical hacking. Students have the opportunity to simulate real-world cyberattacks and develop defense strategies to secure digital assets.', 'Undergraduate'),
('CS3420', 'Artificial Intelligence and Machine Learning:', 'CIS', 4, 'In this advanced course, students delve into the exciting world of artificial intelligence and machine learning. They learn about the theory and practical application of AI and ML algorithms, including neural networks, deep learning, natural language processing, and reinforcement learning. Students work on hands-on projects, creating AI-driven applications and gaining a deep understanding of AI\'s impact on various industries.', 'Undergraduate'),
('CS3611', 'Advanced C#', 'CIS', 4, 'Building on the basics of the C# programming language, this course explores advanced topics and techniques for C# software development.', 'Undergraduate'),
('CS3911', 'C++', 'CIS', 4, 'This course focuses on the C++ programming language, covering advanced C++ features, object-oriented programming, and software development with C++.', 'Undergraduate'),
('CS4501', 'Software Engineering ', 'CIS', 4, 'Students study the principles and practices of software development, including software design, project management, and quality assurance.', 'Undergraduate'),
('CS4550', 'Database Management Systems ', 'CIS', 4, 'This class covers the theory and implementation of database systems, including data modeling, SQL, and database management best practices.', 'Undergraduate'),
('CS5123', 'Natural Language Processing and Text Mining', 'CIS', 4, 'This course explores techniques for understanding and processing human language, covering topics like sentiment analysis, named entity recognition, and text summarization.', 'Graduate'),
('CS5198', 'Quantum Computing and Quantum Algorithms', 'CIS', 4, 'This course introduces quantum computing principles and quantum algorithms, exploring the potential of quantum computing in solving computationally challenging problems.', 'Graduate'),
('CS5226', 'Computer Graphics and 3D Game Development', 'CIS', 4, 'This course covers the principles of computer graphics, real-time rendering, and 3D game development, with a focus on creating interactive gaming experiences.', 'Graduate'),
('CS5329', 'Artificial Intelligence Ethics and Policy', 'CIS', 4, 'Students examine ethical and policy considerations in the field of artificial intelligence, addressing issues like bias, privacy, and responsible AI development.', 'Graduate'),
('CS5490', 'Parallel and Distributed Computing', 'CIS', 4, 'Students learn to design and implement parallel and distributed systems, including multi-core processors, clusters, and grid computing.', 'Graduate'),
('CS5498', 'Advanced Data Structures and Algorithms', 'CIS', 4, 'Building on fundamental concepts, this course covers advanced data structures and algorithms for optimizing resource usage and solving complex computational problems.', 'Graduate'),
('CS5577', 'Advanced Compiler Design and Optimization', 'CIS', 4, 'This course covers advanced compiler construction techniques, code optimization, and the transformation of high-level programming languages into efficient machine code.', 'Graduate'),
('CS5689', 'Advanced Machine Learning and Deep Neural Networks', 'CIS', 4, 'This course delves into advanced topics in machine learning, focusing on deep neural networks, reinforcement learning, and their applications in complex problem-solving.', 'Graduate'),
('CS5690', 'Software Development in Agile Environments', 'CIS', 4, 'This course focuses on agile methodologies for software development, emphasizing iterative, customer-focused development and collaboration within cross-functional teams.', 'Graduate'),
('CS5695', 'Big Data Analytics and Distributed Systems', 'CIS', 4, 'Students learn to process and analyze large-scale datasets using distributed computing frameworks, with a focus on data storage, processing, and real-time analytics.', 'Graduate'),
('CS5771', 'Distributed Databases and NoSQL Systems', 'CIS', 4, 'Students study distributed database management systems, including NoSQL databases, data replication, and sharding for scalable and fault-tolerant data storage.', 'Graduate'),
('CS5910', 'System Design & Implementation', 'CIS', 4, 'This course teaches the process of designing and implementing complex software systems, emphasizing problem analysis, design patterns, and project execution.', 'Undergraduate'),
('CS5987', 'Cloud Computing and Virtualization', 'CIS', 4, 'Students study cloud infrastructure, services, and virtualization technologies, gaining hands-on experience in deploying and managing cloud-based systems.', 'Graduate'),
('EL1000', 'English Composition I: Exposition', 'ENG', 4, 'Designed to develop and refine students’ ability to read, write and think critically. Selected essays will be read and studied as models of rhetorical style, enabling students to detect for themselves the effective use of language and to develop an appreciation for masterpieces of non fiction prose. Students will learn to develop the extended essay with particular attention to discovery and organization. Oral communication skills will be sharpened by directed discussion and by presentation and criticism of class papers. A grade of C or above is required to pass this course.', 'Undergraduate'),
('EL1010', 'Writing Workshop', 'ENG', 4, 'This course will provide students in English Composition with additional writing support. Students in this course will meet for an additional one hour and 30 minutes per week. During this time students will practice effective writing and reading strategies and engage in one-on-one tutoring sessions with their instructor.', 'Undergraduate'),
('EL2001', 'Public Speaking', 'ENG', 4, 'Designed to give the student the poise and confidence necessary to think and speak freely before an audience. This course proceeds from audience analysis through motivation, supporting materials, organization, and delivery.', 'Undergraduate'),
('EL2206', 'Science Fiction Literature', 'ENG', 4, 'Science fiction literature and film are often used to imagine utopian and dystopian worlds. At its best, the genre of science fiction raises questions about what makes a good society, the nature of being human, the role of the outsider, the challenges technological advances present, and gender and sexual norms. The course will examine fiction by authors such as George Orwell, Harlan Ellison, Samuel Delaney, Ursula LeGuin, Philip K. Dick, and Octavia Butler as well as films such as Blade Runner and The Matrix. Students will develop their ability to read and think critically and to write summaries, critical analyses and a research paper based on the course material. The course stresses training in quotation, citation, and research methods.', 'Undergraduate'),
('EL2310', 'Introduction to Literature', 'ENG', 4, 'This course is aimed at developing students’ personal responses to literature. The focus will be on specific literary genres such as poetry, drama, novel, short story, and non fiction prose. The readings will cover a variety of periods and cultures.', 'Undergraduate'),
('EL3100', 'Structure and Grammar of English', 'ENG', 4, 'This course places formal English grammar in the context of the structure and development of the language. Devoting significant attention to the evolution of English and its overall structure, the course also offers intensive study of standard grammar, aimed at both Literature and Teaching students. Students study parts of speech, parts of the sentence, verb and pronoun forms and agreement, and the uses of phrases and clauses within sentences, and they learn to identify these in their writing and the writings of others.', 'Undergraduate'),
('EL3500', 'Literature Across Cultures I: Analysis & Interpretation', 'ENG', 4, 'This course explores representative works of U.S. and international literature that find their roots in the world’s multiplicity of cultures. The course emphasizes multiple strands and traditions both within world literary culture and within the literary cultures of the United States and other nations. Readings and discussions focus on the dominant themes in fiction, poetry, drama, and essays by writers of distinct national and ethnic identities, genders, and sexual orientations. The course also includes studies of writings about multicultural contributions to literature.', 'Undergraduate'),
('EL3510', 'Literature Across Cultures II: Theory', 'ENG', 4, 'This course encourages diverse responses to important works of British-U.S. and World Literature. It fosters the skills of close reading and develops the confidence necessary for independent interpretation of literary texts. While studying each text, students read critical articles about them reflecting the approaches of “new criticism,” biographical and psychoanalytic criticism, new historicism, feminism, queer theory, and other current methodologies. Small group discussions of study questions, oral reports, and writing assignments encourage students to read the texts specifically and respond to them independently.', 'Undergraduate'),
('EL3560', 'Literatures of Europe Part I', 'ENG', 4, 'Covers the literary traditions of Europe from the Jewish-Christian Bible to the Renaissance. Works in these traditions have been foundational for most later writing in English, and for much modern World Literature. Selections vary by semester and have recently included works by Homer, Sophocles, Virgil, Dante, Milton, Shakespeare, and others.', 'Undergraduate'),
('EL3561', 'Literatures of Europe Part II', 'ENG', 4, 'Surveys the literary traditions of Europe and its diaspora from the 17th to the 21st centuries. Works in these traditions have inspired modern U.S. and British as well as World Literature. Selections vary by semester; recently the course has included works by Moliere, Voltaire, Dostoevsky, Ibsen, Kafka, Pirandello, Becket, Borges, Camus, and others.', 'Undergraduate'),
('EL3600', 'U.S. Literature I: Colonial to Civil War', 'ENG', 4, 'Poetry, fiction, essay, and memoir from the colonial period to the U.S. Civil War. Examines significant works representative of Puritanism, the Enlightenment, Romanticism, the “American Renaissance,” Transcendentalism, the voices of Native Americans and women, and the literature of Abolitionism as examples of a developing literary nationalism and as expressions of a multicultural society’s development and struggles. Authors may include William Bradford, Anne Bradstreet, Benjamin Franklin, Phillis Wheatley, James Fenimore Cooper, Richard Allen, Edgar Allen Poe, Nathaniel Hawthorne, Herman Melville, Ralph Waldo Emerson, Frances E. W. Harper, Frederick Douglass, John G. Whittier, Walt Whitman, William Wells Brown, and others.', 'Undergraduate'),
('EL3610', 'U.S. Literature II: Civil War to Present', 'ENG', 4, 'Poetry, fiction, drama, essay, and memoir from the U.S. Civil War to the present. Examines significant works representing realism, naturalism, modernism, and postmodernism in literary technique and responding to the evolution and tensions of a multicultural society, including the labor, immigration, civil rights, feminist, and lesbian-gay experiences. Authors may include Mark Twain, Emily Dickinson, Henry James, Charles Chesnutt, W.E.B. Du Bois, Sui Sin Far, Willa Cather, Edith Wharton, Langston Hughes, Zora Neale Hurston, Ernest Hemingway, William Faulkner, Richard Wright, Tennessee Williams, Ralph Ellison, Gary Soto, August Wilson, Oscar Hijuelos, Louise Erdrich, Toni Morrison, Audre Lorde, Thom Gunn, and others.', 'Undergraduate'),
('EL3865', 'Literature of Asia', 'ENG', 4, 'This course focuses on the reading and discussion of a number of literary masterpieces, both traditional and contemporary, drawn from the cultures of China, Japan, and India. The range of works presented will provide foundation for considering the influence of history and religion on literature, as well as the ways in which literature shapes culture.', 'Undergraduate'),
('EL4060', 'Literature of Class & Class Consciousness', 'ENG', 4, 'Class represents a largely unacknowledged “culture” coexisting and interacting with others such as ethnic cultures, women’s experience, and lesbian/gay culture. This course looks at fiction, poetry, and drama about class and class conflict, primarily by writers from working-class backgrounds. Examining class and class consciousness, and the interaction of class and race in the U.S., we will explore how literature has been a medium for members of oppressed groups to voice their experiences, world views, and demands, and also for members of more privileged groups to respond to social change.', 'Undergraduate'),
('EL4311', 'Greek Drama', 'ENG', 4, 'The art of drama is one of the legacies of Greece to Western culture. In this course, the development of Greek tragedy and comedy is discussed; plays by Aeschylus, Sophocles, Euripides, and Aristophanes are read as well as 20th century dramas based on these 5th century works. Some attention is also given to the criticism of Greek tragedy by Plato and Aristotle.', 'Undergraduate'),
('EL4325', 'Shakespeare: Selected Plays', 'ENG', 4, 'Selected plays by Shakespeare will be read and examined critically and analytically through discussion of these works and of the historical context of the Elizabethan theater and world view. The focus will also be on the richness and variety of Shakespearean language and thought. Study includes close reading of some well-known Shakespearean tragedies and comedies as well as viewing of plays on film.', 'Undergraduate'),
('EL4630', 'Latin American Literature', 'ENG', 4, 'Taught in English. This course is a survey of Latin American literature since the conquest. The class will first read and discuss descriptions of the Americas as seen by the first European conquerors as well as pre-Colombian texts written by native Americans. We will then read representative works of various literary periods from baroque poems to “magical-realist” novels. We will analyze such themes as the collision of cultures, “civilization and barbarity”, the African influence on Latin American letters and the making of a Latin American identity.', 'Undergraduate'),
('EL4800', 'Major Authors', 'ENG', 4, 'This course examines the development of one or more authors, tracing key themes, influences, shifts and continuities, and aesthetic development in the context of cultural and political forces. Authors are selected on the basis of having made landmark contributions to the continuing development of literature. Recent offerings have included James Baldwin, William Blake, Ralph Ellison, William Faulkner, F. Scott Fitzgerald, Toni Morrison, Mary Shelley, Mary Wollstonecraft, and Virginia Woolf, and others may be selected in the future.', 'Undergraduate'),
('EL5000', 'Senior Seminar- Research & Writing', 'ENG', 4, 'Autobiographical and biographical works focusing on intellectual development aid students in understanding issues of personal and career identity, the impact of literary study on the formation of self, and related topics. Classwork stresses research and documentation skills and participation in a seminar setting in which each student presents some independent research to the class. In preparation for the senior thesis, students compose their own intellectual autobiographies tracing their growth and development as English majors. Students must complete a senior thesis proposal to pass the course.', 'Undergraduate'),
('EL5010', 'Senior Seminar- Thesis', 'ENG', 4, 'Under supervision of seminar director, students complete the senior thesis from sequential, critiqued drafts to finished manuscript. Students work intensively with a Thesis Director. Seminar sessions continue development of research and writing skills stressing the integration of research within the student’s own analysis and presentation. Sessions include collaborative readings of work in progress, peer review, oral reports, and presentation of senior thesis.', 'Undergraduate'),
('HI1010', 'World Religions - West', 'PHI', 4, 'Introduction to Judaism, Christianity, and Islam, their history, beliefs, practices, and influence on Western civilization.', 'Undergraduate'),
('HI1020', 'World Religions - East', 'PHI', 4, 'Covers major Eastern and Southern Asian belief systems and practices, including Hinduism, Buddhism, and Taoism.', 'Undergraduate'),
('HI2155', 'Introduction to Comparative Religion', 'PHI', 4, 'Considers the nature and origin of religion, elements of religious practice and thought, and religion as a basis of community.', 'Undergraduate'),
('HI2200', 'Science in Western Civilization', 'HIS', 4, 'A broad, introductory survey of the development of scientific ideas in the West from ancient times to the 20th century, with an emphasis on the major figures and ideas, and key turning points. The course will present selective social and intellectual contexts of science as well as the role of science in shaping Western thought.', 'Undergraduate'),
('HI2681', 'Introduction to European History', 'HIS', 4, 'A systematic survey of European political, social, economic, cultural and intellectual history since the Renaissance. Topics include the age of discovery, nation building, despotism, romanticism, nationalism, science and technology, ideologies and revolutions.', 'Undergraduate'),
('HI2700', 'Introduction to Logic', 'PHI', 4, 'Designed to sharpen analytical abilities and reasoning, covering argument types, structure, and the basics of symbolic logic.', 'Undergraduate'),
('HI2720', 'Introduction to Philosophy', 'PHI', 4, 'Serves as an introduction to philosophy, examining its analytical and speculative functions in relation to contemporary issues.', 'Undergraduate'),
('HI2810', 'Geography, Earth, and People', 'HIS', 4, 'Geography sits at the interface between people and their physical world. This course explores this interface by looking at three key elements of the discipline: Mapping, Physical Geography and Socio-Cultural Geography. In the first half of the course, students learn basic concepts and methods to read and make maps and explore the forces making landforms and landscape. In the second half, students make use of these skills and concepts to explore the diversity of human interactions with the physical world. Using the concept of “region,” students are introduced to social and physical factors defining world regions as well as the connections that bind these regions together.', 'Undergraduate'),
('HI3002', 'Rise of Reason', 'HIS', 4, 'An introduction to the Greek and Roman origins of Western civilization. This course covers critical study of works by the greatest minds of Greece and Rome, reflecting on human experience, developing literary taste and skills in discussion and analysis.', 'Undergraduate'),
('HI3021', 'Europe in the Middle Ages', 'HIS', 4, 'Examines the medieval synthesis of Greek philosophy, Roman law, Hebrew/Christian religion, and Germanic folk culture. The course explores the cultural products of this synthesis and examines the roots of western attitudes toward race, class, nationalism, and war.', 'Undergraduate'),
('HI3030', 'From God to the Machine: Europe from the Sixteenth to the Eighteenth', 'HIS', 4, 'The course will conduct a broad-based examination of the development of the modern mechanistic world-view. Topics will include the Scientific Revolution and Enlightenment, the series of political revolutions that moved Europe from Divine-Right Monarchy to Constitutional Democracy, and the socioeconomic transformations wrought by the Industrial Revolution that moved the mass of Europeans from an animate natural environment to a mechanistic urban milieu, creating the conditions in which reason replaced faith as the common sense of the common man.', 'Undergraduate'),
('HI3040', 'Analysis of Culture', 'PHI', 4, 'Explores cultures role in shaping human action and experience, examining various explanatory approaches.', 'Undergraduate'),
('HI3080', 'Asian Cultures', 'HIS', 4, 'An introduction to the historical and cultural traditions of India, China and Japan. This course invites students to explore the major traditions, ideas, values and social systems that shaped the lives of the peoples of these three Asian countries in the past and that continue to do so today. Students are encouraged to explore their reactions to these unfamiliar ways of life while, at the same time, gaining the ability to view each civilization and culture from its own perspective.', 'Undergraduate'),
('HI3091', 'African Cultures', 'HIS', 4, 'An exploration of African civilization, concentrating on the systems of ideas, values, and institutions developed by Sub-Saharan peoples in the context of their historical experience with contemporary search for African self-determination.', 'Undergraduate'),
('HI3102', 'Hispanic Heritage', 'HIS', 4, 'Taught in English. The Moorish (Muslim) invasion of the Iberian Peninsula in 711 AD, together with the growing presence of Jewish culture and religion in the Iberian Peninsula (Spain and Portugal), transformed the history and culture of the region in ways that are still visible today. Spain’s world-view, religion, artistic and intellectual expression, architecture, and most importantly its language, are a result of that cross-cultural evolution that started more than twelve centuries ago. This course will explore the pivotal role played by Spain in modern European history and culture. Topics, such as the Counter Reformation, the Inquisition, the “Golden Age,” the “merging of cultures” as a result of Spain’s conquest of the New World, and modern Imperialism will be studied and analyzed as part of the Western tradition.', 'Undergraduate'),
('HI3103', 'Hispanic Heritage', 'HIS', 4, 'Taught in English. The Moorish (Muslim) invasion of the Iberian Peninsula in 711 AD, together with the growing presence of Jewish culture and religion in the Iberian Peninsula (Spain and Portugal), transformed the history and culture of the region in ways that are still visible today. Spain’s world-view, religion, artistic and intellectual expression, architecture, and most importantly its language, are a result of that cross-cultural evolution that started more than twelve centuries ago. This course will explore the pivotal role played by Spain in modern European history and culture. Topics, such as the Counter Reformation, the Inquisition, the “Golden Age,” the “merging of cultures” as a result of Spain’s conquest of the New World, and modern Imperialism will be studied and analyzed as part of the Western tradition.', 'Undergraduate'),
('HI3110', 'Latin American Culture', 'HIS', 4, 'This history of the Latin American countries is studied from its origins through today. Topics explored include the Amerindian cultures, European conquest and colonialism, African slavery, revolution and independence, “caudillismo” and dictatorships. These topics will be studied through the use of maps, films and literature.', 'Undergraduate'),
('HI3200', 'Contemporary Religious Experience', 'PHI', 4, 'Introduces major forms of religious worship and practice in the world today, with insights into distinctive features of various faiths.', 'Undergraduate'),
('HI3323', 'Buddhism', 'PHI', 4, 'An introduction to Buddhism’s historical, socio-cultural, and philosophical dimensions, from its origins to contemporary relevance.', 'Undergraduate'),
('HI3525', 'Ancient Greek Philosophy', 'PHI', 4, 'Historical introduction to the foundations of Western philosophy in Ancient Greece and Alexandria.', 'Undergraduate'),
('HI3558', 'Classical Greco-Roman History', 'HIS', 4, 'This course will develop an appreciation and understanding of the history of Classical Greek and Roman civilization. It will survey various aspects of society beginning with the early Minoan and Mycenaean civilization and ending with the fall of the Western Roman Empire. The course goals are for students to learn the historical and cultural framework of Greek and Roman civilizations; to understand the social, ethical and religious setting as well as the philosophical thought of the time; to comprehend geographical locations, the names of prominent people in history and their political and military contributions as these influenced both their times and today; to explore the relationship of Greco-Roman civilization to neighboring civilizations to the east and the peoples to the north; and to apply critical and creative thinking to the study of ancient leaders and extrapolate what can be learned from their life experiences.', 'Undergraduate'),
('HI3600', 'Global Geography', 'HIS', 4, 'This course develops a human geography approach to a diversity of political economic and cultural topics of global importance from an international, cross-cultural and historical perspective. It highlights the roots of contemporary global relationships among places as they influence political and economic trends. A wide and shifting range of topics are covered including, among others, the political economy of the world system, globalization and development, geopolitics, the geography of food and agriculture and urban geography. This course also introduces students to the critical thinking skills necessary for a geographical analysis and to sharpen their global awareness.', 'Undergraduate'),
('HI3640', 'African History', 'PHI', 4, 'Explores African history from ancient to modern times, with a focus on the continent’s civilizations and post-independence era.', 'Undergraduate'),
('HI3700', 'Historical Geography of Latin America', 'HIS', 4, 'An exploration of the construction of Latin America as a geographical region from colonial times to the present, focusing on the economic and cultural processes involved in producing the region. Attention is given to the division into sub-regions and countries, political economic forces, and cultural production of sub-regions, emphasizing the history of various racial groups.', 'Undergraduate'),
('HI3703', 'Modern Philosophy', 'PHI', 4, 'Examination of major philosophers from Descartes to Nietzsche and selected topics in 20th-century thought.', 'Undergraduate'),
('HI3704', 'African Religions and Philosophy', 'PHI', 4, 'Examines African cosmology, religion, and philosophy, their principles, and effects on society and politics.', 'Undergraduate'),
('HI3710', 'Contemporary Philosophical Issues', 'PHI', 4, 'Focused analysis of philosophical questions central to contemporary social and political debates.', 'Undergraduate'),
('HI3835', 'Islamic Cultures', 'HIS', 4, 'This course provides an introduction to the history of Muslim people and societies, and the belief system of Islam. Beginning with the socio-economic background of pre-Islamic Arabia, we will explore the radically transforming message of the Quran and the empire founded by Muhammad as spiritual and political leader. Students will gain insight into the spread of Islam, as it developed from a regional faith.', 'Undergraduate'),
('HI3840', 'Crescent and Cross: Islam and Christianity in History', 'PHI', 4, 'Introduction to the historical roles of Islam and Christianity, their interactions, and their impact on the modern world.', 'Undergraduate'),
('HI3950', 'Philosophy of Religion', 'PHI', 4, 'Examination of religion and religious discourse, exploring theologies, religious experiences, and philosophical challenges.', 'Undergraduate'),
('HI4001', 'Nineteenth Century', 'HIS', 4, 'The impact of European culture and imperialism on the peoples of India and Japan. Literary works of the period are used to highlight the changes reshaping Europe in the early nineteenth century, the encounters between Europeans and Asian peoples which accompanied the expansion of Europe and the attempts of Europeans and Asians to come to terms with these encounters. Readings include Dickens’ Hard Times, stories by Rudyard Kipling and Rabindranath Tagore, Botchan by Natsume Soseki.', 'Undergraduate'),
('HI4011', 'Twentieth Century', 'HIS', 4, 'The mutual impact of cultures throughout the world; the end of nineteenth century colonialism; revolutions and wars; the emergence of the “third world.” Study of the interrelationship of European with Asian and African cultures in the twentieth century. Readings include novels from several cultures.', 'Undergraduate'),
('HI4051', 'Logic and Scientific Reasoning', 'PHI', 4, 'Introduction to scientific reasoning, logic, theory testing, decision-making, and interpretation of scientific findings.', 'Undergraduate'),
('HI4395', 'Philosophy from the 20th to the 21st Century', 'PHI', 4, 'Covers philosophical developments from the 20th to the 21st century, including analytical philosophy and existentialism.', 'Undergraduate'),
('HI4557', 'Renaissance and Reformation in Europe', 'PHI', 4, 'Studies the Renaissance and Reformation movements and their influence on the socio-economic and political landscape of Europe.', 'Undergraduate'),
('HI4800', 'History of India', 'HIS', 4, 'Fat Maharajas atop bejeweled elephants, naked holy men sitting silently along the roadside, ragged children begging for scraps of food, maddened zealots attacking each other from caste hatred or religious fanaticism -these are the stark images that dominate American and Western ideas about India. But India’s 5,000-year history offers much.', 'Undergraduate'),
('HI4850', 'Domesticity 19th/20th centuries', 'HIS', 4, 'A trans-regional history course exploring the spread of European, middle-class ideas about home and family life-global domesticity-throughout the 19th century, with a focus on origins in England and impact on America, India, and Africa. It examines relationships within the family, childrearing, and household management through domestic manuals and personal narratives.', 'Undergraduate'),
('HI4905', 'Chinese Civilization', 'HIS', 4, 'An introduction to one of the oldest civilizations of the world. This course will provide students with general knowledge of 5,000 years of Chinese history and peoples, cultures and traditions, languages and literatures, music and arts, as well as philosophies and beliefs. It will also introduce students to the impact of cultures on the establishment and development of the Chinese social, political and economic systems.', 'Undergraduate'),
('HI5000', 'Social Studies Senior Seminar', 'HIS', 4, 'This course is the required capping course for History majors completing the Social Studies Track and for Adolescence Education Social Studies majors completing the B.A. in History (Social Studies Track). It focuses on the issue of global human rights. Students define, research, and write a major research paper on some aspect of human rights.', 'Undergraduate'),
('HI5910', 'Senior Research Project', 'PHI', 4, 'Required research project for Philosophy and Religion majors, with options for associated coursework or standalone research.', 'Undergraduate'),
('MA1010', 'Powertrack Math', 'MAT', 4, 'A preparatory course for College Algebra covering real number arithmetic and introductory algebra topics with an active learning approach.', 'Undergraduate'),
('MA1020', 'College Algebra', 'MAT', 4, 'Covers functions, polynomials, rational expressions, exponents, radicals, quadratic equations, inequalities, and logarithmic functions.', 'Undergraduate'),
('MA2000', 'Applied Statistics', 'MAT', 4, 'Develops statistical literacy through organizing and summarizing data, applying appropriate statistics, and interpreting statistical tests with real data.', 'Undergraduate'),
('MA2010', 'Foundations of Mathematics I', 'MAT', 4, 'Designed for elementary education majors, covering fundamental theory, number systems, arithmetic operations, estimation, set theory, and number theory.', 'Undergraduate');
INSERT INTO `course` (`CourseID`, `CourseName`, `DeptID`, `Credits`, `Description`, `CourseType`) VALUES
('MA2090', 'Precalculus', 'MAT', 4, 'Prepares students for calculus with a study of algebraic, logarithmic, exponential, and trigonometric functions and their graphs.', 'Undergraduate'),
('MA2310', 'Calculus and Analytic Geometry I', 'MAT', 4, 'Covers functions, limits, derivatives, integrals, and the fundamental theorem of calculus, with applications to polynomial, rational, exponential, logarithmic, and trigonometric functions.', 'Undergraduate'),
('MA2320', 'Calculus and Analytic Geometry II', 'MAT', 4, 'Continues Calculus I topics with a focus on integration techniques, infinite series, and analytic geometry.', 'Undergraduate'),
('MA2500', 'History of Mathematics', 'MAT', 4, 'A survey of the history of mathematics from ancient times to the 20th century, with an emphasis on cultural context and high school curriculum topics.', 'Undergraduate'),
('MA2701', 'Business Analytics', 'MAT', 4, 'Covers data analysis and data mining techniques for managerial decision-making, including prediction, classification, clustering, and data visualization.', 'Undergraduate'),
('MA2702', 'Marketing Analytics', 'MAT', 4, 'Teaches data analysis and data mining for marketing with modern techniques and tools, covering topics like Pricing, Forecasting, and Market Segmentation.', 'Undergraduate'),
('MA3020', 'Foundations of Mathematics II', 'MAT', 4, 'Continues Foundations I for elementary education majors, covering combinatorics, probability, statistics, geometry, and measurement.', 'Undergraduate'),
('MA3030', 'Discrete Mathematics', 'MAT', 4, 'An introduction to discrete mathematical structures, covering logic, set theory, methods of proof, number theory, and graphs and trees.', 'Undergraduate'),
('MA3160', 'Linear Algebra', 'MAT', 4, 'Introduces linear algebra including systems of equations, matrix algebra, vector spaces, linear transformations, eigenvalues, eigenvectors, and matrix diagonalization.', 'Undergraduate'),
('MA3180', 'Foundations of Secondary School Mathematics', 'MAT', 4, 'Prepares secondary school mathematics teachers, covering fundamental theory and logic of mathematics in line with NCTM Standards.', 'Undergraduate'),
('MA3210', 'Intro. To Probability & Statistics', 'MAT', 4, 'Provides a foundation in probability and statistical inference, with topics covering combinatorics, random variables, distributions, estimation, and hypothesis testing.', 'Undergraduate'),
('MA3330', 'Calculus and Analytic Geometry III', 'MAT', 4, 'Explores vector algebra and geometry, limits, partial differentiation, max-min theory, multiple integrals, and theorems of vector calculus.', 'Undergraduate'),
('MA3520', 'Transition to Advanced Mathematics', 'MAT', 4, 'Introduces concepts used in advanced mathematics with an emphasis on writing proofs, covering logic, set theory, functions, and cardinality.', 'Undergraduate'),
('MA4360', 'Differential Equations', 'MAT', 4, 'Covers ordinary differential equations, systems of equations, boundary value problems, and applications to various engineering systems.', 'Undergraduate'),
('MA5120', 'Abstract Algebra', 'MAT', 4, 'An introduction to algebraic structures such as groups, rings, integral domains, ideals, fields, and their homomorphisms.', 'Undergraduate'),
('MA5320', 'Advanced Calculus I', 'MAT', 4, 'Analytical study of calculus theory including the real number system, limits, continuity, uniform convergence, Taylor series, and the theory of integration.', 'Undergraduate'),
('MS1020', 'College Alegbra', 'MIS', 4, 'A foundational mathematics course, focusing on algebraic concepts and problem-solving skills that are valuable in various scientific and technical fields.', 'Undergraduate'),
('MS2000', 'Applied Statistics ', 'MIS', 4, 'This class introduces statistical concepts and techniques used in various fields, emphasizing practical applications in data analysis and decision-making.', 'Undergraduate'),
('MS3030', 'Discrete Mathematics ', 'MIS', 4, 'This class covers mathematical topics like combinatorics, graph theory, and logic that are essential for computer science and algorithm analysis.', 'Undergraduate'),
('MS3240', 'Operating System', 'MIS', 4, 'This course explores the theory and practical aspects of operating systems, including process management, memory management, and file systems.', 'Undergraduate'),
('MS4100', 'Technical Communications ', 'MIS', 4, 'This course focuses on improving communication skills relevant to the technology industry, including technical writing, presentation, and documentation.', 'Undergraduate'),
('MS4720', 'Internet and Web Technologies ', 'MIS', 4, 'Students explore web development concepts, including HTML, CSS, JavaScript, and web application design, along with internet-related technologies and protocols.', 'Undergraduate'),
('MS5098', 'Computer Vision and Image Processing', 'MIS', 4, 'This course explores image and video analysis, object detection, and computer vision applications, along with the mathematics and algorithms behind them.', 'Graduate'),
('MS5109', 'Blockchain Technology and Cryptocurrencies', 'MIS', 4, 'Students explore blockchain technology, its applications beyond cryptocurrencies, and the principles of building secure and decentralized systems.', 'Graduate'),
('MS5165', 'Advanced Topics in Human-Computer Interaction', 'MIS', 4, 'This course delves into advanced HCI concepts, covering usability testing, user experience design, and interface design for emerging technologies.', 'Graduate'),
('MS5332', 'Internet of Things (IoT) Security and Applications', 'MIS', 4, 'Students examine the security challenges and opportunities in the IoT ecosystem, learning how to design secure IoT devices and systems.', 'Graduate'),
('MS5398', 'Cybersecurity and Network Defense Strategies', 'MIS', 4, 'Students learn advanced cybersecurity concepts, including intrusion detection, network forensics, and the development of effective defense strategies.', 'Graduate'),
('MS5441', 'Secure Software Engineering and Vulnerability Analysis', 'MIS', 4, 'This course focuses on secure software development practices, vulnerability assessment, and mitigation strategies to create robust, resilient software systems.', 'Graduate'),
('MS5523', 'Bioinformatics and Computational Biology', 'MIS', 4, 'This course combines biology and computer science, teaching students how to analyze biological data, conduct genomics research, and develop computational tools for biology.', 'Graduate'),
('MS5551', 'MIS Topics', 'MIS', 4, 'Students learn about the role of information systems in business and management, focusing on topics like data analysis, decision support systems, and IT management.', 'Undergraduate'),
('MS5555', 'Machine Learning for Robotics', 'CIS', 4, 'This course covers machine learning principles and techniques applied to robotics.', 'Undergraduate'),
('MS5710', 'Computer Networks', 'MIS', 4, 'Students study the principles of computer networking, covering topics such as network protocols, data transmission, and network design.', 'Undergraduate'),
('PE2420', 'Principles of Microeconomics', 'ECO', 4, 'An introduction to neoclassical economic theory covering consumer and producer behaviors, price formation, market role in resource allocation, and social production coordination.', 'Undergraduate'),
('PE2430', 'Principles of Macroeconomics', 'ECO', 4, 'An introduction to conventional macroeconomic theory, including national income determination, fiscal policy, money and banking, unemployment, and inflation.', 'Undergraduate'),
('PE3201', 'Statistics', 'ECO', 4, 'Surveys modern statistics topics, including descriptive statistics, probability theory, probability distributions, hypothesis testing, and simple regression.', 'Undergraduate'),
('PE3400', 'Global South', 'ECO', 4, 'Analyzes the political, economic, and social problems of the Global South post-colonial political economy. Includes a history of colonialism and case studies.', 'Undergraduate'),
('PE3410', 'Contemporary U.S. Political Economy', 'ECO', 4, 'Analyzes the U.S. economys workings within a class and institutional context, focusing on economic history, competition, management/worker relations, and state involvement.', 'Undergraduate'),
('PE3425', 'Economic Analysis-Micro', 'ECO', 4, 'In-depth study of price theory, redefining neoclassical principles from Principles of Microeconomics and applying economic theory to public policy making.', 'Undergraduate'),
('PE3435', 'Economic Analysis-Macro', 'ECO', 4, 'Detailed analysis of income determination and growth theories, including classical, Keynesian, monetarist, and rational expectation approaches.', 'Undergraduate'),
('PE3440', 'International Economics', 'ECO', 4, 'Focuses on international trade theory and policy, and aspects of international monetary economics. Aims to provide skills for understanding global economic issues.', 'Undergraduate'),
('PE4100', 'International Organizations in the Global Economy', 'ECO', 4, 'Explores international organizations and their roles in world order, including the United Nations, Bretton Woods institutions, regional organizations, and the impact of NGOs.', 'Undergraduate'),
('PE4275', 'Applied Econometrics', 'ECO', 4, 'Builds on statistics knowledge with simple and multiple regression analysis for testing economic propositions and forecasting, including fluency in statistical software.', 'Undergraduate'),
('PE4290', 'Environmental Economics', 'ECO', 4, 'Surveys critical topics in environmental economics related to sustainable development, market failures, and the role of institutions in natural resource allocation.', 'Undergraduate'),
('PE4409', 'Urban Economics', 'ECO', 4, 'Examines the evolution of cities as production centers and their economic relationship with regional, national, and international economies.', 'Undergraduate'),
('PE4430', 'Health Economics', 'ECO', 4, 'Provides an overview of healthcare delivery and finance systems, exploring economic theory in healthcare reform, resource allocation, and market failures.', 'Undergraduate'),
('PE4455', 'Economic Development', 'ECO', 4, 'Compares economic development strategies and problems in Third World countries, considering institutional and political settings and the impact of debt repayment.', 'Undergraduate'),
('PE4460', 'International Finance', 'ECO', 4, 'Surveys international financial markets, open-economy macroeconomics, and international monetary systems and policy, covering various related economic theories and systems.', 'Undergraduate'),
('PE4470', 'History of Economic Thought', 'ECO', 4, 'Surveys central tenets and divergences among various economic thought schools, emphasizing the relationship between economic ideas and social contexts.', 'Undergraduate'),
('PE4590', 'Global Economy in the 20th Century', 'ECO', 4, 'Examines the global economy throughout the 20th century, covering significant economic developments and trends.', 'Undergraduate'),
('PE4615', 'Public Finance and Public Policy', 'ECO', 4, 'Analyzes public policys impact on resource allocation and income distribution, covering social security, health insurance, welfare programs, externalities, public goods, and taxation.', 'Undergraduate'),
('PH2220', 'Structure of Physics I', 'PHY', 3, 'Non-calculus introductory physics course covering mechanics, kinematics, energy, and rotational motion for life sciences students.', 'Undergraduate'),
('PH2221', 'Structure of Physics I Laboratory', 'PHY', 1, 'Lab course complementing Structure of Physics I, illustrating principles and laws of mechanics and kinematics.', 'Undergraduate'),
('PH2230', 'Structure of Physics II', 'PHY', 3, 'Continuation of Structure of Physics I, covering wave motion, sound, electricity, magnetism, and nuclear physics.', 'Undergraduate'),
('PH2231', 'Structure of Physics II Laboratory', 'PHY', 1, 'Lab course illustrating Structure of Physics II topics such as wave motion, electricity, and optics.', 'Undergraduate'),
('PH2240', 'General Physics I', 'PHY', 3, 'Calculus-based physics covering kinematics, energy, momentum, and rotational motion, primarily for chemistry and math majors.', 'Undergraduate'),
('PH2241', 'General Physics I Laboratory', 'PHY', 1, 'Laboratory course complementing General Physics I, illustrating topics such as kinematics and dynamics. ', 'Undergraduate'),
('PH2250', 'General Physics II', 'PHY', 3, 'Continues General Physics I, covering optics, electricity, wave motion, and magnetism in a calculus-based format.', 'Undergraduate'),
('PH2251', 'General Physics II Laboratory', 'PHY', 1, 'Laboratory course complementing General Physics II, focusing on optics, electricity, and magnetism.', 'Undergraduate'),
('PH2260', 'General Physics III', 'PHY', 3, 'Covers harmonic oscillations, waves, optics, fluid mechanics, special relativity, quantum mechanics, atomic, nuclear, and particle physics.', 'Undergraduate'),
('PH2261', 'General Physics III Laboratory', 'PHY', 1, 'Lab course illustrating the topics covered in General Physics III such as waves, optics, and modern physics. Three hours per week.', 'Undergraduate'),
('PH3230', 'Mathematical Methods in the Physical Sciences', 'PHY', 4, 'Applies advanced mathematical principles to physical science problems, including series, multivariable functions, matrix/vector algebra, and differential equations.', 'Undergraduate'),
('PH3600', 'Mechanics', 'PHY', 4, 'Covers analytical mechanics topics such as the calculus of variations, Hamilton’s Principle, Lagrangian dynamics, conservation laws, and chaos.', 'Undergraduate'),
('PH3700', 'Electromagnetism', 'PHY', 4, 'Focuses on electrostatics, magnetostatics, and Maxwell’s equations, including electric and magnetic fields in matter.', 'Undergraduate'),
('PH3800', 'Relativity', 'PHY', 4, 'Introduces concepts and principles of special and general relativity, including kinematics, mechanics, spacetime, and applications to astrophysics.', 'Undergraduate'),
('PH3900', 'Experimental Physics and Electronics Lab', 'PHY', 4, 'Provides an introduction to electronics used in experiments, including circuits, transistors, diodes, and operational amplifiers, with a focus on lab work.', 'Undergraduate'),
('PH4100', 'Thermodynamics', 'PHY', 4, 'Covers the concepts and laws of thermodynamics and their statistical basis, with applications to various physical systems.', 'Undergraduate'),
('PH4200', 'Quantum Mechanics', 'PHY', 4, 'Introduction to quantum mechanics, covering Schrödinger’s equation, angular momentum, spin, and principles such as superposition and uncertainty.', 'Undergraduate'),
('PH4600', 'Applied Mechanics', 'PHY', 4, 'Study of the statics and dynamics of rigid bodies, and the stress and strain of materials, including equilibrium, energy, momentum, and material strength.', 'Undergraduate'),
('PH4900', 'Econophysics', 'PHY', 4, 'Introduces market dynamics from a physics perspective, including statistical methods and models, Brownian motion, and probability distributions.', 'Undergraduate'),
('PH5920', 'Seminar I', 'PHY', 4, 'Capstone course integrating physics sub-disciplines, including scientific writing, ethics, and presentations. Requires a written report and seminar attendance.', 'Undergraduate'),
('PL1000', 'Introduction to Political Science', 'POL', 4, 'Overview of principles, concepts, and foundational theories in political science, including the study of government and its impact on society.', 'Undergraduate'),
('PL1050', 'Comparative Politics and Government', 'POL', 4, 'Analysis of global political systems and institutions, comparing governments, ideologies, and shaping factors of political outcomes.', 'Undergraduate'),
('PL1100', 'Political Theory and Ideologies', 'POL', 4, 'Exploration of political philosophies and thought evolution, including liberalism, conservatism, socialism, and feminism.', 'Undergraduate'),
('PL1150', 'International Relations and Global Politics', 'POL', 4, 'Examination of international relations, diplomacy, global conflicts, and the role of international organizations.', 'Undergraduate'),
('PL1200', 'American Government and Politics', 'POL', 4, 'Study of the U.S. political system, Constitution, government branches, political parties, and policymaking.', 'Undergraduate'),
('PL1250', 'Public Policy Analysis and Implementation', 'POL', 4, 'In-depth analysis of policy development and implementation challenges at various governmental levels.', 'Undergraduate'),
('PL1300', 'Political Research Methods and Data Analysis', 'POL', 4, 'Introduction to political science research methods, data collection, and data analysis techniques.', 'Undergraduate'),
('PL1350', 'Political Parties and Elections', 'POL', 4, 'Study of political parties, electoral processes, voting behavior, and the impact of elections on governance.', 'Undergraduate'),
('PL1400', 'Political Economy and Economic Policy', 'POL', 4, 'Analysis of the interplay between economics and politics, economic policy, globalization, and political decision-making.', 'Undergraduate'),
('PL1450', 'Political Leadership and Decision-Making', 'POL', 4, 'Investigation of political leadership theories, styles, and decision-making processes in politics.', 'Undergraduate'),
('PL1500', 'Political Ethics and Values', 'POL', 4, 'Examination of ethical dilemmas in politics, moral foundations of decisions, and the role of values in policymaking.', 'Undergraduate'),
('PL1550', 'Environmental Politics and Policy', 'POL', 4, 'Focus on environmental issues, sustainability, and the impact of environmental policies locally and globally.', 'Undergraduate'),
('PL1600', 'Human Rights and Social Justice', 'POL', 4, 'Delve into human rights, social justice movements, and the policies and institutions for human rights protection.', 'Undergraduate'),
('PL1650', 'Law and Politics', 'POL', 4, 'Analyzes the interplay between law and politics, and the legal system’s influence on political decisions and governance.', 'Undergraduate'),
('PL1700', 'National Security and Defense Policy', 'POL', 4, 'Examines national security strategies, defense policy, intelligence, and security maintenance challenges.', 'Undergraduate'),
('PL1750', 'Gender and Politics', 'POL', 4, 'Investigates gender in politics, womens rights, gender policies, and genders role in political decision-making.', 'Undergraduate'),
('PL1800', 'Political Communication and Media', 'POL', 4, 'Explores media impact on politics, communication strategies, and informations role in political processes.', 'Undergraduate'),
('PL1850', 'Public Administration and Bureaucracy', 'POL', 4, 'Studies public administration principles, bureaucracy, and government agency impact on policy.', 'Undergraduate'),
('PL1900', 'International Law and Diplomacy', 'POL', 4, 'Examines international law, diplomatic negotiations, treaties, and diplomacy in global conflict resolution.', 'Undergraduate'),
('PL2000', 'Political Geography and Geopolitics', 'POL', 4, 'Explores geographys influence on politics and international relations, including geopolitics and global conflicts.', 'Undergraduate'),
('PY2010', 'Introduction to Psychology', 'PSY', 4, 'A prerequisite for most psychology courses, this course investigates basic psychological principles of behavior based on the scientific method. Emphasis is placed on the socio-cultural context of human development, covering areas such as biological, cognitive, social, personality, clinical, diversity, and social justice.', 'Undergraduate'),
('PY2530', 'Psychology of Prejudice & Discrimination', 'PSY', 4, 'Explores the psychological and social processes of prejudice and discrimination. Investigates the effects of stereotypes and structural inequalities on groups and communities.', 'Undergraduate'),
('PY2720', 'Psychology of Gender', 'PSY', 4, 'Examines the correlates of gender from psychological, biological, and sociocultural perspectives. Explores theories of gender development, gender identity, and traditional gender roles.', 'Undergraduate'),
('PY3010', 'Research Design and Analysis I', 'PSY', 4, 'Introduces basic research methodologies and statistical techniques used by psychological scientists, focusing on descriptive and correlational methods. Students learn to critique professional literature, understand research design principles, conduct statistical analyses, interpret data, and write literature reviews or empirical reports in APA style.', 'Undergraduate'),
('PY3215', 'Foundations of Child Development', 'PSY', 4, 'Focuses on child development, presenting theories and research on physical, cognitive, and psychosocial growth. Topics include sensory-motor and brain development, language, problem-solving, self-identity, and social functioning, with discussion on diverse societal influences.', 'Undergraduate'),
('PY3230', 'Adulthood & Aging', 'PSY', 4, 'Explores psychological development from early adulthood to old age. It reviews personality theories, research methods, life cycle changes, demographics, coping and successful aging, and the impact of gender, culture, race, and socioeconomic background.', 'Undergraduate'),
('PY3240', 'Lifespan Development', 'PSY', 4, 'Examines theories and findings on human development across the lifespan, discussing physical, cognitive, and social/emotional development, and research in developmental psychology.', 'Undergraduate'),
('PY3310', 'Foundations in Clinical Psychology', 'PSY', 4, 'Explores mental health challenges and clinical-diagnostic systems. Examines diverse experiences of mental distress and various explanatory models including biological and cultural perspectives.', 'Undergraduate'),
('PY3311', 'Theories of Personality', 'PSY', 4, 'A survey of major theories of personality development, including psychoanalytic, behaviorist, cognitive, existential, and sociocultural theories.', 'Undergraduate'),
('PY3410', 'Cognitive Psychology', 'PSY', 4, 'Examines theoretical, conceptual, and empirical issues in cognition from an information processing perspective. It covers neurophysiological aspects of perception, memory, and cognitive processes.', 'Undergraduate'),
('PY3420', 'Learning and Motivation', 'PSY', 4, 'Explores theoretical and empirical issues in learning, classical and operant conditioning, and the role of motivation and emotion. Surveys physiological, psychoanalytic, and social learning theories.', 'Undergraduate'),
('PY3510', 'Social Psychology', 'PSY', 4, 'An introduction to social psychology, focusing on social behavior and environmental influences. Topics include attitude formation, social influence, group dynamics, aggression, and prejudice.', 'Undergraduate'),
('PY3530', 'Community Psychology', 'PSY', 4, 'Focuses on community psychology action principles and research practices. Covers prevention and intervention programs, empowerment, advocacy, and the impact of structural inequalities.', 'Undergraduate'),
('PY3610', 'Brain & Behavior', 'PSY', 4, 'Examines how the brain’s processes regulate behavior. Topics include brain anatomy, psychopharmacology, and genetics of behavior, with a focus on complex behaviors like learning and memory.', 'Undergraduate'),
('PY3620', 'Drugs & Behavior', 'PSY', 4, 'Examines psychoactive medication use in psychiatric disorders. Covers principles of psychopharmacology, brain/behavior relationships, and the integration of medication and psychotherapy.', 'Undergraduate'),
('PY3710', 'Psychology and Social Justice', 'PSY', 4, 'Introduces the concept of social justice and the psychological impacts of inequality. Investigates oppressive institutions and applies social action principles to social problems and movements.', 'Undergraduate'),
('PY4130', 'Field Experience and Research', 'PSY', 4, 'Engages students in supervised field work in clinical, psychiatric, community organizational, and agency settings. The course covers field research techniques, observational methods, and culminates in a research paper integrating the internship experience with literature review.', 'Undergraduate'),
('PY4200', 'Research Design and Analysis II', 'PSY', 4, 'Continuing the Research Methods sequence, this course trains students in research methods and implementation in Psychology. It includes reviewing literature, hypothesis testing, data analysis in SPSS, drawing evidence-based conclusions, and communicating findings in oral and written APA style formats.', 'Undergraduate'),
('PY5210', 'Senior Seminar in Developmental Psychology', 'PSY', 4, 'An in-depth evaluation of theory and research on human lifespan development stages like childhood, adolescence, and adulthood. Topics include research strategies, and biopsychosocial factors such as socioeconomic status, gender, and ethnic, racial, and cultural background.', 'Undergraduate'),
('PY5510', 'Senior Seminar in Social Psychology', 'PSY', 4, 'Focuses on theory and research of current concern to social psychologists, covering topics like public policies, power dynamics, resource disparities, environmental sustainability, media impacts, social conflict, and community-based research methods.', 'Undergraduate'),
('SY1500', 'Introductory Sociology', 'SOC', 4, 'Introduces sociology concepts and perspectives. Examines major institutions, social processes, research methods, and social theories.', 'Undergraduate'),
('SY2222', 'Sociology of Caring', 'SOC', 4, 'Examines care work, its social processes, and institutions. Discusses paid and unpaid caring labor division across gender, race, class, and nationality lines.', 'Undergraduate'),
('SY2400', 'Sociology Through the Arts', 'SOC', 4, 'Explores the relationship between art and society, examining the roles of various art forms and their impact on social norms and boundary-making activities.', 'Undergraduate'),
('SY2550', 'Social Problems', 'SOC', 4, 'Analyzes social problems like poverty and unemployment, their historical roots, social policies, and their contemporary and future consequences.', 'Undergraduate'),
('SY2600', 'Social Deviance', 'SOC', 4, 'Studies the social construction of deviance, the application of deviant labels, and the societal responses to deviant behavior.', 'Undergraduate'),
('SY2800', 'Race, Class, Gender and Sexuality', 'SOC', 4, 'Examines how race, class, gender, and sexuality shape and are shaped by institutions, interactions, and individual experiences.', 'Undergraduate'),
('SY3160', 'Sociology of Culture', 'SOC', 4, 'Engages in cultural analysis in fields like language, technology, arts, media, and their relationship to culture production/consumption processes.', 'Undergraduate'),
('SY3280', 'Social Inequality', 'SOC', 4, 'Analyzes social inequality and its impact on wealth, power, and goods distribution by class, race, and gender, and its effects on society.', 'Undergraduate'),
('SY3630', 'Political Sociology', 'SOC', 4, 'Examines social structures and processes related to political participation and explores the maintenance of power and authority in society.', 'Undergraduate'),
('SY3700', 'Family and Society', 'SOC', 4, 'Studies the connection between courtship, marriage patterns, economic systems, and the emergence of the modern family across different societies.', 'Undergraduate'),
('SY3750', 'Medical Sociology', 'SOC', 4, 'Explores the social forces defining health and illness, the distribution of medical science and professionals, and alternatives to the U.S. medical system.', 'Undergraduate'),
('SY4260', 'Social Work: Theory and Practice', 'SOC', 4, 'Examines social work practice within the context of social welfare, focusing on concepts, techniques, and value systems applicable to the field.', 'Undergraduate'),
('SY4270', 'Internship in Social Work, Sociology and Criminology', 'SOC', 4, 'Provides practical skills and work experience in social work, sociology, and criminology. Requires 90 hours of field work and includes regular discussion, a work portfolio, and a detailed report.', 'Undergraduate'),
('SY4400', 'Social Psychology', 'SOC', 4, 'Introduces social psychological theories to show how culture and society influence behavior, focusing on socialization and cross-cultural examples.', 'Undergraduate'),
('SY4500', 'Global Sociology', 'SOC', 4, 'Explores diverse cultures and global society using historical, anthropological, and sociological theories, covering socio-cultural evolution and global issues.', 'Undergraduate'),
('SY4520', 'Research Methods I', 'SOC', 4, 'Introduces concepts and principles of sociological research, including literature review, hypothesis testing, sampling methods, and qualitative data analysis.', 'Undergraduate'),
('SY4530', 'Sociological Theory I', 'SOC', 4, 'Covers the central concepts and theories of Marx, Durkheim, and Weber, exploring the content, assumptions, and empirical bases of their analyses of society.', 'Undergraduate'),
('SY4540', 'Sociological Theory II', 'SOC', 4, 'Explores modern developments in sociological theory, covering functionalism, conflict theory, neo-Marxist theories, psychoanalytic theory, feminist theory, and critical race theory.', 'Undergraduate'),
('SY4570', 'Research Methods II', 'SOC', 4, 'Focuses on quantitative data collection and analysis in sociology, including sampling, survey research, probability, tests of significance, and multivariate analysis.', 'Undergraduate'),
('SY4600', 'Social Programs, Planning and Policy', 'SOC', 4, 'Analyzes the formation and effectiveness of social policy and its impact on targeted populations, with cross-cultural comparisons and discussions on the American “Welfare State.”', 'Undergraduate'),
('VA2000', 'Introduction to Art', 'ART', 4, 'Studio course introducing art techniques and contemporary art currents, developing basic visual and verbal vocabulary in visual arts.', 'Undergraduate'),
('VA2010', 'Introduction to Creative Thinking', 'ART', 4, 'Challenges perceptions of reality through creative visual solutions. Develops skills to make creative visual statements. Required for art majors.', 'Undergraduate'),
('VA2020', 'Basic Design', 'ART', 4, 'Explores visual structures and the relationship among dimensions as related to graphics, interior design, and other visual disciplines.', 'Undergraduate'),
('VA2030', 'Drawing', 'ART', 4, 'Covers the art process from idea to final product, with an emphasis on visual notations and planning before production. Required for art majors.', 'Undergraduate'),
('VA2045', 'Introduction to Color', 'ART', 4, 'Studio class exploring color theory, application to practical situations, and differences between subtractive and additive color systems.', 'Undergraduate'),
('VA2320', 'Graphic Design I', 'ART', 4, 'Introduces elements and principles of graphic design, focusing on visual communication and software for design projects such as InDesign and Photoshop.', 'Undergraduate'),
('VA2400', 'Introduction to Photography', 'ART', 4, 'Introductory photography course focusing on visual and cultural representation, including the history of photography. Students supply their own digital camera.', 'Undergraduate'),
('VA2460', 'Painting I', 'ART', 4, 'Beginning course in painting, teaching pictorial space and color language, along with basic techniques and historical context.', 'Undergraduate'),
('VA2500', 'Art History I: 19th Century Art', 'ART', 4, 'Covers Modern Art from 1750 in the context of the Enlightenment and French Revolution, including Neo Classicism to Post-Impressionism.', 'Undergraduate'),
('VA2510', 'Art History II: Modern Art: 1900- 1945', 'ART', 4, 'Examines early 20th-century art movements such as Cubism and Surrealism and their impact on society and the role of art.', 'Undergraduate'),
('VA3100', 'Visual Culture: Warhol to the Present', 'ART', 4, 'Examines art in contemporary society, situating major art movements within socio-historical contexts of civil rights, wars, and technology. Required for Art majors.', 'Undergraduate'),
('VA3200', 'Art Tutorials I', 'ART', 4, 'Tutorial sessions for Art majors to discuss work in various media, with collective faculty criticism and development of creative process skills.', 'Undergraduate'),
('VA3380', 'Digital Video', 'ART', 4, 'Provides a foundation in digital video creation using Adobe Premiere, covering preproduction, production, and editing.', 'Undergraduate'),
('VA3400', 'Digital Imaging', 'ART', 4, 'Covers pixel-based and vector-based digital imaging software, exploring creative potential and developing skills in Photoshop. Essential for visual arts careers.', 'Undergraduate'),
('VA4200', 'Art Tutorials II', 'ART', 4, 'Second level of Art tutorials, focusing on processing students’ projects with material, technique, and theory of criticism coverage. Required for Art majors.', 'Undergraduate'),
('VA4320', 'Graphic Design II', 'ART', 4, 'Builds on Graphic Design I principles, focusing on design solutions across media platforms using software like Adobe InDesign, Photoshop, and Illustrator.', 'Undergraduate'),
('VA4460', 'Digital Animation', 'ART', 4, 'Teaches principles of digital animation, including storyboarding, key frame animation, and sound, using Adobe software.', 'Undergraduate'),
('VA5200', 'Art Tutorials III', 'ART', 4, 'Third level of Art tutorials, where Art majors focus on project research and the creative process in relation to other fields and disciplines.', 'Undergraduate'),
('VA5900', 'Senior Project', 'ART', 4, 'Capstone project for Art majors to create work for an exhibition or write a thesis, with potential recommendations for graduate programs.', 'Undergraduate');

-- --------------------------------------------------------

--
-- Table structure for table `courseprerequisite`
--

CREATE TABLE `courseprerequisite` (
  `CourseID` varchar(25) NOT NULL,
  `PRcourseID` varchar(11) NOT NULL,
  `MinGrade` varchar(3) DEFAULT NULL,
  `DOLU` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseprerequisite`
--

INSERT INTO `courseprerequisite` (`CourseID`, `PRcourseID`, `MinGrade`, `DOLU`) VALUES
('BS2410', 'BS2400', 'C', '2023-11-11'),
('BS2411', 'BS2401', 'C', '2023-11-11'),
('BS3400', 'BS2400', 'C', '2023-11-11'),
('BS3400', 'BS2410', 'C', '2023-11-11'),
('BS3450', 'BS2400', 'C', '2023-11-11'),
('BS3450', 'BS2410', 'C', '2023-11-11'),
('BS3810', 'BS2400', 'C', '2023-11-11'),
('BS3810', 'BS2410', 'C', '2023-11-11'),
('BS4400', 'BS2400', 'C', '2023-11-11'),
('BS4400', 'BS2410', 'C', '2023-11-11'),
('BS4420', 'BS4400', 'C', '2023-11-11'),
('BS4460', 'BS2400', 'C', '2023-11-11'),
('BS4460', 'BS2410', 'C', '2023-11-11'),
('BS4461', 'BS2400', 'C', '2023-11-11'),
('BS4461', 'BS2410', 'C', '2023-11-11'),
('BS4470', 'BS2400', 'C', '2023-11-11'),
('BS4470', 'BS2401', 'C', '2023-11-11'),
('BS4470', 'BS2410', 'C', '2023-11-11'),
('BS4470', 'BS2411', 'C', '2023-11-11'),
('BS4560', 'BS2400', 'C', '2023-11-11'),
('BS4560', 'BS2401', 'C', '2023-11-11'),
('BS4560', 'BS2410', 'C', '2023-11-11'),
('BS4560', 'BS2411', 'C', '2023-11-11'),
('BS5420', 'BS5410', 'C', '2023-11-11'),
('BS5590', 'BS2400', 'C', '2023-11-11'),
('BS5590', 'BS2410', 'C', '2023-11-11'),
('BS5591', 'BS2400', 'C', '2023-11-11'),
('BS5591', 'BS2410', 'C', '2023-11-11'),
('BS5592', 'BS2401', 'C', '2023-11-11'),
('BS5592', 'BS2411', 'C', '2023-11-11'),
('CP2130', 'CP2120', 'C', '2023-11-11'),
('CP2131', 'CP2121', 'C', '2023-11-11'),
('CP3310', 'CP3300', 'C', '2023-11-11'),
('CP3312', 'CP3302', 'C', '2023-11-11'),
('CP4320', 'CP3310', 'C', '2023-11-11'),
('CP4490', 'CP3310', 'C', '2023-11-11'),
('CP4515', 'CP4510', 'C', '2023-11-11'),
('CP4700', 'CP2130', 'C', '2023-11-11'),
('CP4710', 'CP2130', 'C', '2023-11-11'),
('CP4710', 'CP4700', 'C', '2023-11-11'),
('EL4800', 'EL3500', 'C', '2023-11-11'),
('EL4800', 'EL3510', 'C', '2023-11-11'),
('EL5010', 'EL5000', 'C', '2023-11-11'),
('MA2090', 'MA1020', 'C', '2023-11-11'),
('MA2310', 'MA2090', 'C', '2023-11-11'),
('MA2320', 'MA2310', 'C', '2023-11-11'),
('MA3020', 'MA2010', 'C', '2023-11-11'),
('MA3030', 'MA2090', 'C', '2023-11-11'),
('MA3160', 'MA2310', 'C', '2023-11-11'),
('MA3180', 'MA2320', 'C', '2023-11-11'),
('MA3180', 'MA3030', 'C', '2023-11-11'),
('MA3180', 'MA3160', 'C', '2023-11-11'),
('MA3210', 'MA2310', 'C', '2023-11-11'),
('MA3520', 'MA2320', 'C', '2023-11-11'),
('MA3520', 'MA3030', 'C', '2023-11-11'),
('MA4360', 'MA2320', 'C', '2023-11-11'),
('MA5120', 'MA3160', 'C', '2023-11-11'),
('MA5120', 'MA3520', 'C', '2023-11-11'),
('MA5320', 'MA2320', 'C', '2023-11-11'),
('MA5320', 'MA3520', 'C', '2023-11-11'),
('PE3435', 'PE2430', 'C', '2023-11-11'),
('PE3440', 'PE2420', 'C', '2023-11-11'),
('PE3440', 'PE2430', 'C', '2023-11-11'),
('PE4290', 'PE2420', 'C', '2023-11-11'),
('PE4290', 'PE2430', 'C', '2023-11-11'),
('PE4470', 'PE2420', 'C', '2023-11-11'),
('PE4470', 'PE2430', 'C', '2023-11-11'),
('PH2230', 'PH2220', 'C', '2023-11-11'),
('PH2231', 'PH2221', 'C', '2023-11-11'),
('PH2250', 'PH2240', 'C', '2023-11-11'),
('PH2251', 'PH2241', 'C', '2023-11-11'),
('PH2260', 'PH2250', 'C', '2023-11-11'),
('PH2261', 'PH2251', 'C', '2023-11-11'),
('PH3600', 'PH2260', 'C', '2023-11-11'),
('PH3700', 'PH2260', 'C', '2023-11-11'),
('PH3800', 'PH2260', 'C', '2023-11-11'),
('PH4100', 'PH2230', 'C', '2023-11-11'),
('PH4200', 'PH2230', 'C', '2023-11-11'),
('PH4900', 'PH4100', 'C', '2023-11-11'),
('PY3010', 'PY2010', 'C', '2023-11-11'),
('PY3215', 'PY2010', 'C', '2023-11-11'),
('PY3230', 'PY3010', 'C', '2023-11-11'),
('PY3240', 'PY2010', 'C', '2023-11-11'),
('PY3310', 'PY2010', 'C', '2023-11-11'),
('PY3311', 'PY2010', 'C', '2023-11-11'),
('PY3410', 'PY2010', 'C', '2023-11-11'),
('PY3410', 'PY3010', 'C', '2023-11-11'),
('PY3420', 'PY2010', 'C', '2023-11-11'),
('PY3420', 'PY3010', 'C', '2023-11-11'),
('PY3510', 'PY2010', 'C', '2023-11-11'),
('PY3530', 'PY2010', 'C', '2023-11-11'),
('PY3610', 'PY2010', 'C', '2023-11-11'),
('PY3610', 'PY3010', 'C', '2023-11-11'),
('PY5210', 'PY2010', 'C', '2023-11-11'),
('PY5210', 'PY3010', 'C', '2023-11-11'),
('PY5210', 'PY3215', 'C', '2023-11-11'),
('PY5210', 'PY3230', 'C', '2023-11-11'),
('PY5510', 'PY2010', 'C', '2023-11-11'),
('PY5510', 'PY3010', 'C', '2023-11-11'),
('PY5510', 'PY3510', 'C', '2023-11-11'),
('PY5510', 'PY3530', 'C', '2023-11-11'),
('SY4260', 'SY1500', 'C', '2023-11-11'),
('SY4400', 'SY1500', 'C', '2023-11-11'),
('SY4500', 'SY1500', 'C', '2023-11-11'),
('SY4520', 'SY1500', 'C', '2023-11-11'),
('SY4530', 'SY1500', 'C', '2023-11-11'),
('SY4540', 'SY1500', 'C', '2023-11-11'),
('SY4540', 'SY4530', 'C', '2023-11-11'),
('SY4570', 'SY1500', 'C', '2023-11-11'),
('SY4570', 'SY4520', 'C', '2023-11-11'),
('SY4600', 'SY1500', 'C', '2023-11-11'),
('VA2510', 'VA2500', 'C', '2023-11-11'),
('VA3200', 'VA2010', 'C', '2023-11-11'),
('VA4200', 'VA3200', 'C', '2023-11-11'),
('VA4320', 'VA2320', 'C', '2023-11-11'),
('VA5200', 'VA4200', 'C', '2023-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `coursesection`
--

CREATE TABLE `coursesection` (
  `CRN` int(11) NOT NULL,
  `CourseID` varchar(25) DEFAULT NULL,
  `SectionNum` int(11) DEFAULT NULL,
  `FacultyID` int(11) DEFAULT NULL,
  `TimeSlotID` varchar(100) DEFAULT NULL,
  `RoomID` varchar(25) DEFAULT NULL,
  `SemesterID` int(11) DEFAULT NULL,
  `AvailableSeats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `createadmin`
--

CREATE TABLE `createadmin` (
  `AdminID` int(11) NOT NULL,
  `DOC` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datagen`
--

CREATE TABLE `datagen` (
  `DataID` int(11) NOT NULL,
  `StatsID` int(11) DEFAULT NULL,
  `DateGenerated` timestamp NULL DEFAULT NULL,
  `DataType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE `day` (
  `DayID` int(11) NOT NULL,
  `WeekDay` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`DayID`, `WeekDay`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `DeptID` varchar(25) NOT NULL,
  `DeptName` varchar(100) DEFAULT NULL,
  `ChairID` int(11) DEFAULT NULL,
  `DeptManager` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNum` varchar(100) DEFAULT NULL,
  `RoomID` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`DeptID`, `DeptName`, `ChairID`, `DeptManager`, `Email`, `PhoneNum`, `RoomID`) VALUES
('ART', 'Art', 400221, 'Linda Young', 'linda.young@UAuni.edu', '(555) 234-5678', '12C'),
('BIO', 'Biology', 400061, 'Emily Jones', 'emily.jones@UAuni.edu', '(555) 456-7890', '4C'),
('BUS', 'Business', 400281, 'Olivia Lewis', 'olivia.lewis@UAuni.edu', '(555) 567-8901', '15C'),
('CHE', 'Chemistry', 400161, 'William White', 'william.white@UAuni.edu', '(555) 901-2345', '9C'),
('CIS', 'CIS (Computer Information Systems)', 400021, 'Sarah Johnson', 'sarah.johnson@UAuni.edu', '(555) 234-5678', '2C'),
('ECO', 'Economics', 400121, 'David Lee', 'david.lee@UAuni.edu', '(555) 789-0123', '7C'),
('ENG', 'English', 400041, 'Michael Williams', 'michael.williams@UAuni.edu', '(555) 345-6789', '3C'),
('HIS', 'History', 400081, 'Robert Brown', 'robert.brown@UAuni.edu', '(555) 567-8901', '5C'),
('MAT', 'Mathematics', 400141, 'Jennifer Hall', 'jennifer.hall@UAuni.edu', '(555) 890-1234', '8C'),
('MIS', 'MIS (Management Information Systems)', 400001, 'Bryan Don', 'john.smith@UAuni.edu', '(555) 123-4567', '1C'),
('PHI', 'Philosophy', 400261, 'Patricia Scott', 'patricia.scott@UAuni.edu', '(555) 456-7890', '14C'),
('PHY', 'Physics', 400201, 'James Harris', 'james.harris@UAuni.edu', '(555) 123-4567', '11C'),
('POL', 'Politics', 400241, 'Christopher Allen', 'christopher.allen@UAuni.edu', '(555) 345-6789', '13C'),
('PSY', 'Psychology', 400101, 'Maria Davis', 'maria.davis@UAuni.edu', '(555) 678-9012', '6C'),
('SOC', 'Sociology', 400181, 'Susan Clark', 'susan.clark@UAuni.edu', '(555) 012-3456', '10C');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `StudentID` int(11) NOT NULL,
  `CRN` int(11) NOT NULL,
  `Grade` varchar(3) DEFAULT NULL,
  `DOE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyID` int(11) NOT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Specialty` varchar(100) DEFAULT NULL,
  `FacultyType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facultydept`
--

CREATE TABLE `facultydept` (
  `FacultyID` int(11) NOT NULL,
  `DeptID` varchar(25) DEFAULT NULL,
  `PercentTime` varchar(100) DEFAULT NULL,
  `DOA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facultyft`
--

CREATE TABLE `facultyft` (
  `FacultyID` int(11) NOT NULL,
  `NumOfClass` int(11) DEFAULT NULL,
  `OfficeID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facultyhistory`
--

CREATE TABLE `facultyhistory` (
  `FacultyID` int(11) NOT NULL,
  `CRN` int(11) DEFAULT NULL,
  `CourseID` varchar(25) DEFAULT NULL,
  `SemesterID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facultypt`
--

CREATE TABLE `facultypt` (
  `FacultyID` int(11) NOT NULL,
  `NumOfClass` int(11) DEFAULT NULL,
  `OfficeID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gradstudent`
--

CREATE TABLE `gradstudent` (
  `StudentID` int(11) NOT NULL,
  `DeptID` varchar(25) DEFAULT NULL,
  `GradStudentType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gradstudentft`
--

CREATE TABLE `gradstudentft` (
  `StudentID` int(11) NOT NULL,
  `Standing` varchar(100) DEFAULT NULL,
  `CreditEarned` int(11) DEFAULT NULL,
  `QualifyExam` tinyint(1) DEFAULT NULL,
  `Thesis` tinyint(1) DEFAULT NULL,
  `LowCredits` int(11) DEFAULT NULL,
  `HighCredits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gradstudentpt`
--

CREATE TABLE `gradstudentpt` (
  `StudentID` int(11) NOT NULL,
  `Standing` varchar(100) DEFAULT NULL,
  `CreditEarned` int(11) DEFAULT NULL,
  `QualifyExam` tinyint(1) DEFAULT NULL,
  `Thesis` tinyint(1) DEFAULT NULL,
  `LowCredits` int(11) DEFAULT NULL,
  `HighCredits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hold`
--

CREATE TABLE `hold` (
  `HoldID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `DateOfHold` date DEFAULT NULL,
  `HoldType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `RoomID` varchar(25) NOT NULL,
  `NumOfWorkStations` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`RoomID`, `NumOfWorkStations`) VALUES
('10L', 10),
('11L', 10),
('12L', 10),
('13L', 10),
('14L', 10),
('15L', 10),
('1L', 10),
('2L', 10),
('3L', 10),
('4L', 10),
('5L', 10),
('6L', 10),
('7L', 10),
('8L', 10),
('9L', 10);

-- --------------------------------------------------------

--
-- Table structure for table `logintable`
--

CREATE TABLE `logintable` (
  `UID` int(11) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `NumOfLogin` varchar(100) DEFAULT NULL,
  `LockedOut` tinyint(1) DEFAULT NULL,
  `UserType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logintable`
--

INSERT INTO `logintable` (`UID`, `Email`, `Password`, `NumOfLogin`, `LockedOut`, `UserType`) VALUES
(3, 'JohnnyG@ua.uni', '81dc9bdb52d04dc20036dbd8313ed055', '0', 0, 'admin'),
(500001, 'jsmith500001@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500002, 'sjohnson500002@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500003, 'mbrown500003@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500004, 'edavis500004@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500005, 'jwilson500005@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500006, 'otaylor500006@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500007, 'rmartinez500007@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500008, 'eanderson500008@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500009, 'dthomas500009@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500010, 'ajackson500010@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500011, 'jwhite500011@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500012, 'sharris500012@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500013, 'cclark500013@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500014, 'mlewis500014@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500015, 'thall500015@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500016, 'ayoung500016@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500017, 'dlee500017@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500018, 'hwalker500018@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500019, 'mwright500019@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500020, 'mhill500020@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500021, 'nking500021@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500022, 'ascott500022@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500023, 'lturner500023@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500024, 'mphillips500024@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500025, 'jcampbell500025@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500026, 'oparker500026@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500027, 'wevans500027@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500028, 'eedwards500028@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500029, 'jcollins500029@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500030, 'istewart500030@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500031, 'msanchez500031@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500032, 'oharris500032@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500033, 'mclark500033@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500034, 'alewis500034@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500035, 'ahall500035@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500036, 'hyoung500036@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500037, 'jlee500037@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500038, 'gwalker500038@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500039, 'dwright500039@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500040, 'ebaker500040@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500041, 'wgreen500041@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500042, 'lsmith500042@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500043, 'bjohnson500043@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500044, 'cdavis500044@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500045, 'swilson50045@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500046, 'staylor500046@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500047, ' mmartinez500047@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500048, ' manderson500048@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500049, ' dthomas500049@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500050, 'ajackson500050@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500051, 'jwhite500051@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500052, 'sharris500052@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500053, 'cclark500053@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500054, 'mlewis500054@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500055, 'thall500055@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500056, 'ayoung500056@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500057, 'dlee500057@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500058, 'hwalker500058@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500059, 'mwright500059@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500060, 'lbaker500060@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500061, 'cgreen500061@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500062, 'gsmith500062@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500063, 'ajohnson500063@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500064, 'cdavis500064@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500065, 'wwilson500065@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500066, 'staylor500066@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500067, 'bmartinez500067@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500068, 'manderson500068@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500069, 'sthomas500069@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500070, 'ejackson500070@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500071, 'ewhite500071@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500072, 'oharris500072@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500073, 'mclark500073@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500074, 'alewis500074@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500075, 'ahall500075@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500076, 'hyoung500076@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500077, 'jlee500077@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500078, 'gwalker500078@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500079, 'dwright500079@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500080, 'ebaker500080@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500081, 'wgreen500081@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500082, 'lsmith500082@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500083, 'bjohnson500083@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500084, 'cdavis500084@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500085, 'swilson500085@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500086, 'staylor500086@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500087, 'mmartinez500087@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500088, 'manderson500088@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500089, 'dthomas500089@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500090, 'ajackson500090@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500091, 'jwhite500091@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500092, 'sharris500092@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500093, 'cclark500093@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500094, 'mlewis500094@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500095, 'thall500095@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500096, 'ayoung500096@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500097, 'dlee500097@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500098, 'hwalker500098@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500099, 'mwright500099@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500100, 'lbaker500100@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500101, 'amartinez500101@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500102, 'athompson500102@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500103, 'llewis500103@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500104, 'ohall500104@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500105, 'nking500105@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500106, 'imurphy500106@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500107, 'jpowell500107@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500108, 'sperry500108@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500109, 'llong500109@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500110, 'mwood500110@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500111, 'jcook500111@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500112, 'esanders500112@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500113, 'aturner500113@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500114, 'sgreen500114@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500115, 'dbrooks500115@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500116, 'aprice500116@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500117, 'lrogers500117@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500118, 'lhughes500118@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500119, 'bbennett500119@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500120, 'zfoster500120@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500121, 'hbryant500121@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500122, 'eperry500122@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500123, 'wharris500123@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500124, 'aadams500124@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500125, 'gwallace500125@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500126, 'hcarter500126@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500127, 'ebryant500127@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500128, 'gmiller500128@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500129, 'ocoleman500129@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500130, 'speterson500130@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500131, 'srichardson500131@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500132, 'vrussell500132@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500133, 'cgriffin500133@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500134, 'lsullivan500134@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500135, 'ahenderson500135@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500136, 'zsimmons500136@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500137, 'jcarter500137@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500138, 'ajenkins500138@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500139, 'wfoster500139@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500140, 'hthompson500140@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500141, 'hperry500141@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500142, 'mwood500142@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500143, 'ecook500143@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500144, 'osanders500144@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500145, 'jturner500145@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500146, 'egreen500146@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500147, 'abrooks500147@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500148, 'sprice500148@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500149, 'drogers500149@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500150, 'ahughes500150@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500151, 'lbennett500151@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500152, 'lfoster500152@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500153, 'bbryant500153@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500154, 'zperry500154@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500155, 'hharris500155@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500156, 'eadams500156@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500157, 'wwallace500157@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500158, 'acarter500158@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500159, 'gbryant500159@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500160, 'hmiller500160@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500161, 'ecoleman500161@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500162, 'gpeterson500162@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500163, 'orichardson500163@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500164, 'srussell500164@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500165, 'sgriffin500165@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500166, 'vsullivan500166@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500167, 'chenderson500167@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500168, 'lsimmons500168@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500169, 'acarter500169@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500170, 'zjenkins500170@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500171, 'jfoster500171@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500172, 'athompson500172@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500173, 'wperry500173@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500174, 'hwood500174@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500175, 'hcook500175@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500176, 'msanders500176@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500177, 'eturner500177@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500178, 'ogreen500178@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500179, 'abrooks500179@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500180, 'sprice500180@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500181, 'lrogers500181@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500182, 'lhughes500182@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500183, 'bbennett500183@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500184, 'zfoster500184@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500185, 'hbryant500185@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500186, 'eperry500186@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500187, 'wharris500187@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500188, 'aadams500188@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500189, 'gwallace500189@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500190, 'hcarter500190@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500191, 'ebryant500191@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500192, 'gmiller500192@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500193, 'ocoleman500193@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500194, 'speterson500194@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500195, 'srichardson500195@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500196, 'vrussell500196@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500197, 'cgriffin500197@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500198, 'lsullivan500198@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500199, 'ahenderson500199@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500200, 'zsimmons500200@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500201, 'oclark500201@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500202, 'nbaker500202@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500203, 'swright500203@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500204, 'wking500204@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500205, 'alee500205@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500206, 'jmartinez500206@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500207, 'edavis500207@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500208, 'mtaylor500208@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500209, 'ijohnson500209@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500210, 'banderson500210@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500211, 'sharris500211@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500212, 'lwilson500212@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500213, 'hthompson500213@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500214, 'mwalker500214@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500215, 'agreen500215@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500216, 'oturner500216@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500217, 'spowell500217@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500218, 'elewis500218@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500219, 'jrichardson500219@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500220, 'lmoore500220@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500221, 'acarter500221@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500222, 'hscott500222@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500223, 'cbennett500223@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500224, 'crogers500224@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500225, 'dadams500225@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500226, 'smartin500226@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500227, 'wmurphy500227@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500228, 'msimmons500228@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500229, 'jlong500229@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500230, 'escott500230@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500231, 'bcarter500231@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500232, 'odavis500232@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500233, 'jmartinez500233@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500234, 'ithompson500234@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500235, 'dgreen500235@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500236, 'awilson500236@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500237, 'ebaker500237@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500238, 'sanderson500238@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500239, 'mtaylor500239@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500240, 'sjohnson500240@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500241, 'bharris500241@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500242, 'cdavis500242@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500243, 'hwright500243@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500244, 'alee500244@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500245, 'omartinez500245@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500246, 'mturner500246@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500247, 'spowell500247@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500248, 'wlewis500248@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500249, 'aturner500249@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500250, 'ebaker500250@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500251, 'owright500251@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500252, 'jking500252@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500253, 'alee500253@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500254, 'sharris500254@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500255, 'banderson500255@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500256, 'etaylor500256@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500257, 'jdavis500257@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500258, 'lmartinez500258@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500259, 'othompson500259@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500260, 'nbaker500260@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500261, 'swright500261@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500262, 'wking500262@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500263, 'alee500263@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500264, 'jmartinez500264@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500265, 'edavis500265@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500266, 'mtaylor500266@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500267, 'ijohnson500267@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500268, 'badams500268@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500269, 'sthompson500269@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500270, 'wmartin500270@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500271, 'lscott500271@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500272, 'oturner500272@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500273, 'hmiller500273@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500274, 'mlewis500274@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500275, 'agreen500275@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500276, 'eanderson500276@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500277, 'swilson500277@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500278, 'ibaker500278@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500279, 'mclark500279@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500280, 'cthompson500280@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500281, 'jcarter500281@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500282, 'mwright500282@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500283, 'oharris500283@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500284, 'slewis500284@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500285, 'wdavis500285@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500286, 'aturner500286@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500287, 'bsmith500287@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500288, 'eanderson500288@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500289, 'ijohnson500289@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500290, 'nbaker500290@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500291, 'swright500291@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500292, 'wking500292@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500293, 'alee500293@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500294, 'jmartinez500294@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500295, 'edavis500295@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500296, 'mtaylor500296@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500297, 'ijohnson500297@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500298, 'badams500298@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500299, 'sthompson500299@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500300, 'wmartin500300@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500301, 'owilson500301@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500302, 'bthompson500302@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500303, 'eanderson500303@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500304, 'wking500304@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500305, 'adavis500305@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500306, 'jmartinez500306@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500307, 'iwright500307@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500308, 'nlewis500308@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500309, 'sjohnson500309@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500310, 'mbaker500310@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500311, 'cturner500311@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500312, 'aharris500312@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500313, 'mlee500313@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500314, 'omartinez500314@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500315, 'bdavis500315@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500316, 'etaylor500316@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500317, 'iwilson500317@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500318, 'wclark500318@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500319, 'ajohnson500319@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500320, 'janderson500320@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500321, 'oharris500321@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500322, 'bbaker500322@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500323, 'elewis500323@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500324, 'mturner500324@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500325, 'cdavis500325@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500326, 'amartinez500326@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500327, 'mharris500327@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500328, 'owilson500328@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500329, 'banderson500329@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500330, 'eking500330@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500331, 'wtaylor500331@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500332, 'ithompson500332@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500333, 'njohnson500333@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500334, 'swright500334@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500335, 'jharris500335@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500336, 'aturner500336@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500337, 'bbaker500337@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500338, 'edavis500338@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500339, 'olewis500339@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500340, 'wanderson500340@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500341, 'mmartinez500341@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500342, 'jharris500342@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500343, 'iturner500343@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500344, 'nwilson500344@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500345, 'cthompson500345@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500346, 'bjohnson500346@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500347, 'eking500347@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500348, 'otaylor500348@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500349, 'mdavis500349@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500350, 'iharris500350@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500351, 'jturner500351@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500352, 'alewis500352@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500353, 'bbaker500353@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500354, 'eanderson500354@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500355, 'omartinez500355@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500356, 'wwright500356@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500357, 'idavis500357@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500358, 'jharris500358@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500359, 'sturner500359@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500360, 'cwilson500360@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500361, 'mthompson500361@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500362, 'bjohnson500362@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500363, 'eking500363@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500364, 'otaylor500364@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500365, 'wanderson500365@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500366, 'jharris500366@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500367, 'iturner500367@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500368, 'nwilson500368@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500369, 'cthompson500369@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500370, 'bjohnson500370@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500371, 'eking500371@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500372, 'otaylor500372@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500373, 'mdavis500373@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500374, 'iharris500374@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500375, 'jturner500375@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500376, 'alewis500376@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500377, 'bbaker500377@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500378, 'eanderson500378@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500379, 'omartinez500379@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500380, 'wwright500380@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500381, 'idavis500381@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500382, 'jharris500382@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500383, 'sturner500383@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500384, 'cwilson500384@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500385, 'mthompson500385@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500386, 'bjohnson500386@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500387, 'eking500387@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500388, 'otaylor500388@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500389, 'mdavis500389@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500390, 'iharris500390@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500391, 'jturner500391@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500392, 'alewis500392@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500393, 'bbaker500393@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500394, 'eanderson500394@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500395, 'omartinez500395@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500396, 'wwright500396@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500397, 'idavis500397@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500398, 'jharris500398@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500399, 'sturner500399@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500400, 'cwilson500400@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500401, 'obaker500401@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500402, 'bwright500402@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500403, 'eharris500403@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500404, 'wturner500404@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500405, 'adavis500405@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500406, 'jmartinez500406@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500407, 'ithompson500407@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500408, 'nlewis500408@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500409, 'sjohnson500409@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500410, 'mclark500410@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500411, 'cbaker500411@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500412, 'aharris500412@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500413, 'mlee500413@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500414, 'omartinez500414@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500415, 'bdavis500415@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500416, 'etaylor500416@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500417, 'iwilson500417@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500418, 'wthompson500418@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500419, 'ajohnson500419@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500420, 'janderson500420@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500421, 'obaker500421@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500422, 'bturner500422@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500423, 'eharris500423@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500424, 'wdavis500424@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500425, 'alee500425@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500426, 'jmartinez500426@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500427, 'ithompson500427@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500428, 'nlewis500428@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500429, 'sjohnson500429@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500430, 'mclark500430@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500431, 'cbaker500431@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500432, 'aharris500432@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500433, 'mlee500433@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500434, 'omartinez500434@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500435, 'bdavis500435@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500436, 'etaylor500436@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500437, 'iwilson500437@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500438, 'wthompson500438@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500439, 'ajohnson500439@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500440, 'janderson500440@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500441, 'obaker500441@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500442, 'bturner500442@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500443, 'eharris500443@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500444, 'wdavis500444@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500445, 'alee500445@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500446, 'jmartinez500446@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500447, 'ithompson500447@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500448, 'nlewis500448@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500449, 'sjohnson500449@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500450, 'mclark500450@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500451, 'cbaker500451@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500452, 'aharris500452@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500453, 'mlee500453@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500454, 'omartinez500454@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500455, 'bdavis500455@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500456, 'etaylor500456@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500457, 'iwilson500457@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500458, 'wthompson500458@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500459, 'ajohnson500459@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500460, 'janderson500460@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500461, 'obaker500461@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500462, 'bturner500462@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500463, 'eharris500463@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500464, 'wdavis500464@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500465, 'alee500465@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500466, 'jmartinez500466@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500467, 'ithompson500467@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500468, 'nlewis500468@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500469, 'sjohnson500469@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500470, 'mclark500470@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500471, 'cbaker500471@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500472, 'aharris500472@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500473, 'mlee500473@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500474, 'omartinez500474@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500475, 'bdavis500475@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500476, 'etaylor500476@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500477, 'iwilson500477@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500478, 'wthompson500478@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500479, 'ajohnson500479@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500480, 'janderson500480@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500481, 'sturner500481@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500482, 'cwilson500482@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500483, 'mthompson500483@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500484, 'bjohnson500484@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500485, 'eking500485@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500486, 'otaylor500486@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500487, 'mdavis500487@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500488, 'iharris500488@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500489, 'jturner500489@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500490, 'alewis500490@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500491, 'bbaker500491@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500492, 'eanderson500492@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500493, 'omartinez500493@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500494, 'wwright500494@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500495, 'idavis500495@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500496, 'jharris500496@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500497, 'sturner500497@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500498, 'cwilson500498@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500499, 'mthompson500499@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500500, 'bjohnson500500@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500501, 'eking500501@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500502, 'otaylor500502@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500503, 'mdavis500503@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500504, 'iharris500504@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500505, 'jturner500505@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500506, 'alewis500506@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500507, 'bbaker500507@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500508, 'eanderson500508@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500509, 'omartinez500509@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500510, 'wwright500510@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500511, 'idavis500511@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500512, 'jharris500512@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500513, 'sturner500513@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500514, 'cwilson500514@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500515, 'mthompson500515@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500516, 'bjohnson500516@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500517, 'eking500517@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500518, 'otaylor500518@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500519, 'mdavis500519@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500520, 'iharris500520@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500521, 'jturner500521@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500522, 'alewis500522@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500523, 'bbaker500523@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500524, 'eanderson500524@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500525, 'omartinez500525@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500526, 'wwright500526@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500527, 'idavis500527@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500528, 'jharris500528@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500529, 'sturner500529@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500530, 'cwilson500530@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500531, 'mthompson500531@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500532, 'bjohnson500532@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500533, 'eking500533@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500534, 'otaylor500534@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500535, 'mdavis500535@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500536, 'iharris500536@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500537, 'jturner500537@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500538, 'alewis500538@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500539, 'bbaker500539@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500540, 'eanderson500540@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500541, 'omartinez500541@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500542, 'wwright500542@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500543, 'idavis500543@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500544, 'jharris500544@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500545, 'sturner500545@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500546, 'cwilson500546@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500547, 'mthompson500547@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500548, 'bjohnson500548@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500549, 'eking500549@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500550, 'otaylor500550@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500551, 'mdavis500551@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500552, 'iharris500552@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500553, 'jturner500553@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500554, 'alewis500554@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500555, 'bbaker500555@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500556, 'eanderson500556@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500557, 'omartinez500557@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500558, 'wwright500558@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500559, 'idavis500559@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500560, 'jharris500560@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500561, 'sturner500561@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500562, 'cwilson500562@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500563, 'mthompson500563@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500564, 'bjohnson500564@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500565, 'eking500565@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500566, 'otaylor500566@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500567, 'mdavis500567@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500568, 'iharris500568@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500569, 'jturner500569@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500570, 'alewis500570@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500571, 'bbaker500571@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500572, 'eanderson500572@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student');
INSERT INTO `logintable` (`UID`, `Email`, `Password`, `NumOfLogin`, `LockedOut`, `UserType`) VALUES
(500573, 'omartinez500573@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500574, 'wwright500574@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500575, 'idavis500575@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500576, 'jharris500576@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500577, 'sturner500577@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500578, 'cwilson500578@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500579, 'mthompson500579@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500580, 'bjohnson500580@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500581, 'eking500581@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500582, 'otaylor500582@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500583, 'mdavis500583@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500584, 'iharris500584@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500585, 'jturner500585@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500586, 'alewis500586@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500587, 'bbaker500587@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500588, 'eanderson500588@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500589, 'omartinez500589@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500590, 'wwright500590@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500591, 'idavis500591@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500592, 'jharris500592@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500593, 'sturner500593@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500594, 'cwilson500594@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500595, 'mthompson500595@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500596, 'bjohnson500596@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500597, 'eking500597@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500598, 'otaylor500598@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500599, 'mdavis500599@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500600, 'iharris500600@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500601, 'jturner500601@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500602, 'alewis500602@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500603, 'bbaker500603@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500604, 'eanderson500604@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500605, 'omartinez500605@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500606, 'wwright500606@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500607, 'idavis500607@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500608, 'jharris500608@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500609, 'sturner500609@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500610, 'cwilson500610@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500611, 'mthompson500611@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500612, 'bjohnson500612@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500613, 'eking500613@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500614, 'otaylor500614@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500615, 'mdavis500615@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500616, 'iharris500616@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500617, 'jturner500617@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500618, 'alewis500618@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500619, 'bbaker500619@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500620, 'eanderson500620@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500621, 'omartinez500621@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500622, 'wwright500622@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500623, 'idavis500623@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500624, 'jharris500624@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500625, 'sturner500625@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500626, 'cwilson500626@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500627, 'mthompson500627@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500628, 'bjohnson500628@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500629, 'eking500629@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500630, 'otaylor500630@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500631, 'mdavis500631@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500632, 'iharris500632@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500633, 'jturner500633@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500634, 'alewis500634@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500635, 'bbaker500635@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500636, 'eanderson500636@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500637, 'omartinez500637@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500638, 'wwright500638@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500639, 'idavis500639@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500640, 'jharris500640@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500641, 'sturner500641@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500642, 'cwilson500642@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500643, 'mthompson500643@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500644, 'bjohnson500644@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500645, 'eking500645@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500646, 'otaylor500646@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500647, 'mdavis500647@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500648, 'iharris500648@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500649, 'jturner500649@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500650, 'alewis500650@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500651, 'bbaker500651@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500652, 'eanderson500652@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500653, 'omartinez500653@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500654, 'wwright500654@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500655, 'idavis500655@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500656, 'jharris500656@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500657, 'sturner500657@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500658, 'cwilson500658@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500659, 'mthompson500659@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500660, 'bjohnson500660@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500661, 'eking500661@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500662, 'otaylor500662@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500663, 'mdavis500663@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500664, 'iharris500664@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500665, 'jturner500665@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500666, 'alewis500666@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500667, 'bbaker500667@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500668, 'eanderson500668@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500669, 'omartinez500669@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500670, 'wwright500670@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500671, 'idavis500671@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500672, 'jharris500672@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500673, 'sturner500673@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500674, 'cwilson500674@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500675, 'mthompson500675@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500676, 'bjohnson500676@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500677, 'eking500677@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500678, 'otaylor500678@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500679, 'mdavis500679@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500680, 'iharris500680@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500681, 'jturner500681@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500682, 'alewis500682@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500683, 'bbaker500683@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500684, 'eanderson500684@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500685, 'omartinez500685@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500686, 'wwright500686@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500687, 'idavis500687@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500688, 'jharris500688@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500689, 'sturner500689@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500690, 'cwilson500690@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500691, 'mthompson500691@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500692, 'bjohnson500692@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500693, 'eking500693@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500694, 'otaylor500694@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500695, 'mdavis500695@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500696, 'iharris500696@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500697, 'jturner500697@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500698, 'alewis500698@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500699, 'bbaker500699@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500700, 'eanderson500700@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500701, 'jsmith500701@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500702, 'sjohnson500702@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500703, 'mbrown500703@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500704, 'edavis500704@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500705, 'jwilson500705@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500706, 'otaylor500706@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500707, 'rmartinez500707@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500708, 'eanderson500708@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500709, 'dthomas500709@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500710, 'ajackson500710@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500711, 'jwhite500711@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500712, 'sharris500712@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500713, 'cclark500713@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500714, 'mlewis500714@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500715, 'thall500715@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500716, 'ayoung500716@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500717, 'dlee500717@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500718, 'hwalker500718@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500719, 'mwright500719@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500720, 'lbaker500720@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500721, 'cgreen500721@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500722, 'gsmith500722@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500723, 'ajohnson500723@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500724, 'cdavis500724@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500725, 'wwilson500725@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500726, 'staylor500726@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500727, 'bmartinez500727@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500728, 'manderson500728@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500729, 'sthomas500729@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500730, 'ejackson500730@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500731, 'ewhite500731@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500732, 'oharris500732@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500733, 'mclark500733@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500734, 'alewis500734@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500735, 'ahall500735@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500736, 'hyoung500736@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500737, 'jlee500737@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500738, 'gwalker500738@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500739, 'dwright500739@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500740, 'ebaker500740@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500741, 'wgreen500741@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500742, 'lsmith500742@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500743, 'bjohnson500743@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500744, 'cdavis500744@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500745, 'swilson500745@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500746, 'staylor500746@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500747, 'mmartinez500747@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500748, 'manderson500748@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500749, 'dthomas500749@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500750, 'ajackson500750@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500751, 'jwhite500751@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500752, 'sharris500752@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500753, 'cclark500753@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500754, 'mlewis500754@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500755, 'thall500755@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500756, 'ayoung500756@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500757, 'dlee500757@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500758, 'hwalker500758@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500759, 'mwright500759@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500760, 'lbaker500760@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500761, 'cgreen500761@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500762, 'gsmith500762@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500763, 'ajohnson500763@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500764, 'cdavis500764@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500765, 'wwilson500765@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500766, 'staylor500766@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500767, 'bmartinez500767@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500768, 'manderson500768@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500769, 'sthomas500769@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500770, 'ejackson500770@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500771, 'ewhite500771@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500772, 'oharris500772@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500773, 'mclark500773@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500774, 'alewis500774@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500775, 'ahall500775@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500776, 'hyoung500776@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500777, 'jlee500777@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500778, 'gwalker500778@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500779, 'dwright500779@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500780, 'ebaker500780@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500781, 'wgreen500781@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500782, 'lsmith500782@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500783, 'bjohnson500783@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500784, 'cdavis500784@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500785, 'swilson500785@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500786, 'staylor500786@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500787, 'mmartinez500787@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500788, 'manderson500788@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500789, 'dthomas500789@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500790, 'ajackson500790@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500791, 'jwhite500791@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500792, 'sharris500792@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500793, 'cclark500793@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500794, 'mlewis500794@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500795, 'thall500795@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500796, 'ayoung500796@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500797, 'dlee500797@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500798, 'hwalker500798@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500799, 'mwright500799@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500800, 'lbaker500800@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500801, 'amartinez500801@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500802, 'athompson500802@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500803, 'llewis500803@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500804, 'ohall500804@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500805, 'nking500805@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500806, 'imurphy500806@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500807, 'jpowell500807@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500808, 'sperry500808@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500809, 'llong500809@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500810, 'mwood500810@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500811, 'jcook500811@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500812, 'esanders500812@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500813, 'aturner500813@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500814, 'sgreen500814@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500815, 'dbrooks500815@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500816, 'aprice500816@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500817, 'lrogers500817@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500818, 'lhughes500818@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500819, 'bbennett500819@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500820, 'zfoster500820@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500821, 'hbryant500821@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500822, 'eperry500822@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500823, 'wharris500823@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500824, 'aadams500824@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500825, 'gwallace500825@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500826, 'hcarter500826@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500827, 'ebryant500827@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500828, 'gmiller500828@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500829, 'ocoleman500829@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500830, 'speterson500830@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500831, 'srichardson500831@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500832, 'vrussell500832@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500833, 'cgriffin500833@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500834, 'lsullivan500834@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500835, 'ahenderson500835@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500836, 'zsimmons500836@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500837, 'jcarter500837@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500838, 'ajenkins500838@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500839, 'wfoster500839@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500840, 'hthompson500840@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500841, 'hperry500841@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500842, 'mwood500842@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500843, 'ecook500843@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500844, 'osanders500844@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500845, 'jturner500845@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500846, 'egreen500846@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500847, 'abrooks500847@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500848, 'sprice500848@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500849, 'drogers500849@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500850, 'ahughes500850@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500851, 'lbennett500851@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500852, 'lfoster500852@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500853, 'bbryant500853@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500854, 'zperry500854@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500855, 'hharris500855@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500856, 'eadams500856@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500857, 'wwallace500857@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500858, 'acarter500858@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500859, 'gbryant500859@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500860, 'hmiller500860@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500861, 'ecoleman500861@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500862, 'gpeterson500862@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500863, 'orichardson500863@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500864, 'srussell500864@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500865, 'sgriffin500865@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500866, 'vsullivan500866@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500867, 'chenderson500867@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500868, 'lsimmons500868@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500869, 'acarter500869@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500870, 'zjenkins500870@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500871, 'jfoster500871@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500872, 'athompson500872@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500873, 'wperry500873@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500874, 'hwood500874@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500875, 'hcook500875@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500876, 'msanders500876@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500877, 'eturner500877@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500878, 'ogreen500878@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500879, 'abrooks500879@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500880, 'sprice500880@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500881, 'lrogers500881@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500882, 'lhughes500882@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500883, 'bbennett500883@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500884, 'zfoster500884@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500885, 'hbryant500885@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500886, 'eperry500886@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500887, 'wharris500887@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500888, 'aadams500888@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500889, 'gwallace500889@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500890, 'hcarter500890@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500891, 'jsmith500891@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500892, 'sjohnson500892@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500893, 'mbrown500893@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500894, 'edavis500894@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500895, 'jwilson500895@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500896, 'otaylor500896@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500897, 'rmartinez500897@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500898, 'eanderson500898@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500899, 'dthomas500899@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500900, 'ajackson500900@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500901, 'jwhite500901@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500902, 'sharris500902@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500903, 'cclark500903@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500904, 'mlewis500904@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500905, 'thall500905@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500906, 'ayoung500906@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500907, 'dlee500907@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500908, 'hwalker500908@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500909, 'mwright500909@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500910, 'lbaker500910@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500911, 'cgreen500911@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500912, 'gsmith500912@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500913, 'ajohnson500913@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500914, 'cdavis500914@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500915, 'wwilson500915@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500916, 'staylor500916@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500917, 'bmartinez500917@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500918, 'manderson500918@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500919, 'sthomas500919@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500920, 'ejackson500920@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500921, 'ewhite500921@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500922, 'oharris500922@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500923, 'mclark500923@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500924, 'alewis500924@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500925, 'ahall500925@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500926, 'hyoung500926@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500927, 'jlee500927@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500928, 'gwalker500928@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500929, 'dwright500929@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500930, 'ebaker500930@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500931, 'wgreen500931@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500932, 'lsmith500932@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500933, 'bjohnson500933@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500934, 'cdavis500934@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500935, 'swilson500935@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500936, 'staylor500936@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500937, 'mmartinez500937@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500938, 'manderson500938@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500939, 'dthomas500939@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500940, 'ajackson500940@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500941, 'jwhite500941@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500942, 'sharris500942@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500943, 'cclark500943@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500944, 'mlewis500944@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500945, 'thall500945@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500946, 'ayoung500946@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500947, 'dlee500947@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500948, 'hwalker500948@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500949, 'mwright500949@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500950, 'lbaker500950@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500951, 'cgreen500951@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500952, 'gsmith500952@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500953, 'ajohnson500953@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500954, 'cdavis500954@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500955, 'wwilson500955@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500956, 'staylor500956@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500957, 'bmartinez500957@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500958, 'manderson500958@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500959, 'sthomas500959@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500960, 'ejackson500960@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500961, 'ewhite500961@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500962, 'oharris500962@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500963, 'mclark500963@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500964, 'alewis500964@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500965, 'ahall500965@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500966, 'hyoung500966@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500967, 'jlee500967@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500968, 'gwalker500968@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500969, 'dwright500969@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500970, 'ebaker500970@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500971, 'wgreen500971@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500972, 'lsmith500972@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500973, 'bjohnson500973@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500974, 'cdavis500974@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500975, 'swilson500975@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500976, 'staylor500976@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500977, 'mmartinez500977@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500978, 'manderson500978@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500979, 'dthomas500979@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500980, 'ajackson500980@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500981, 'jwhite500981@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500982, 'sharris500982@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500983, 'cclark500983@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500984, 'mlewis500984@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500985, 'thall500985@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500986, 'ayoung500986@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500987, 'dlee500987@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500988, 'hwalker500988@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500989, 'mwright500989@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500990, 'lbaker500990@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500991, 'amartinez500991@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500992, 'athompson500992@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500993, 'llewis500993@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500994, 'ohall500994@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500995, 'nking500995@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500996, 'imurphy500996@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500997, 'jpowell500997@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500998, 'sperry500998@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(500999, 'llong500999@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student'),
(501000, 'mwood501000@ua.uni', 'e99a18c428cb38d5f260853678922e03', '0', 0, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `MajorID` int(11) NOT NULL,
  `DeptID` varchar(25) DEFAULT NULL,
  `MajorName` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`MajorID`, `DeptID`, `MajorName`) VALUES
(1, 'MIS', 'Business Intelligence and Analytics'),
(2, 'MIS', 'Information Security and Cybersecurity'),
(3, 'CIS', 'Data Science and Analytics'),
(4, 'CIS', 'Software Development and Programming'),
(5, 'ENG', 'English Literature '),
(6, 'ENG', 'Creative Writing'),
(7, 'BIO', 'Biology '),
(8, 'BIO', 'Biochemistry and Molecular Biology'),
(9, 'HIS', 'American History'),
(10, 'HIS', 'European History:'),
(11, 'PSY', 'Clinical Psychology'),
(12, 'PSY', 'Cognitive Psychology'),
(13, 'ECO', 'Microeconomics'),
(14, 'ECO', 'Macroeconomics'),
(15, 'MAT', 'Pure Mathematics'),
(16, 'MAT', 'Applied Mathematics'),
(17, 'CHE', 'Organic Chemistry'),
(18, 'CHE', 'Analytical Chemistry'),
(19, 'SOC', 'Criminology'),
(20, 'SOC', 'Social Inequality'),
(21, 'PHY', 'Classical Physics'),
(22, 'PHY', 'Quantum Physics'),
(23, 'ART', 'Studio Art'),
(24, 'ART', 'Art History'),
(25, 'POL', 'American Politics'),
(26, 'POL', 'International Politics '),
(27, 'PHI', 'Ethics'),
(28, 'PHI', 'Philosophy of Mind'),
(29, 'BUS', 'Finance'),
(30, 'BUS', 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `majorprerequisite`
--

CREATE TABLE `majorprerequisite` (
  `MajorID` int(11) NOT NULL,
  `PRmajorID` int(11) NOT NULL,
  `MinGrade` varchar(3) DEFAULT NULL,
  `DOLU` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masterschedule`
--

CREATE TABLE `masterschedule` (
  `ScheduleID` int(11) NOT NULL,
  `CourseID` varchar(100) DEFAULT NULL,
  `CourseName` varchar(40) NOT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `Time` varchar(20) DEFAULT NULL,
  `Bldg` varchar(50) DEFAULT NULL,
  `Room` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masterschedule`
--

INSERT INTO `masterschedule` (`ScheduleID`, `CourseID`, `CourseName`, `Day`, `Time`, `Bldg`, `Room`) VALUES
(302, 'CS2510', 'Computer Programming 1', 'Monday', '7:00 - 8:00 am', 'Hawks Building', '1H'),
(303, 'CS2511', 'Computer Programming 2', 'Monday', '8:10 - 9:10 am ', 'Hawks Building', '2H'),
(304, 'CS2512', 'Computer Architecture ', 'Monday', '9:20 - 10:30 am', 'Hawks Building', '3H'),
(305, 'CS2513', 'Data Structures and Algorithms ', 'Monday', '10:40 - 11:50 am', 'Hawks Building', '4H'),
(306, 'CS2514', 'Java and Object-Oriented Progamming', 'Monday', '12:00 - 1:00 pm', 'Hawks Building', '5H'),
(307, 'MS4100', 'Technical Communications ', 'Monday', '1:10 - 2:10 pm', 'Hawks Building', '6H'),
(308, 'CS4501', 'Software Engineering ', 'Monday', '2:20 - 3:30 pm ', 'Hawks Building', '7H'),
(309, 'CS4550', 'Database Management Systems ', 'Monday', '3:40 - 4:50 pm', 'Hawks Building', '8H'),
(310, 'MS4720', 'Internet and Web Technologies ', 'Monday', '5:00 - 6:10 pm ', 'Hawks Building', '9H'),
(311, 'CS5910', 'System Design & Implementation', 'Monday', '6:20 - 7:30 pm', 'Hawks Building', '10H'),
(312, 'MS1020', 'College Alegbra', 'Monday', '7:40 - 8:50 pm ', 'Hawks Building', '1H'),
(313, 'MS3030', 'Discrete Mathematics ', 'Monday', '7:00 - 8:00 am', 'Hawks Building', '2H'),
(314, 'CS3611', 'Advanced C#', 'Monday', '8:10 - 9:10 am ', 'Hawks Building', '3H'),
(315, 'MS5551', 'MIS Topics', 'Monday', '9:20 - 10:30 am', 'Hawks Building', '4H'),
(316, 'MS3240', 'Operating System', 'Monday', '10:40 - 11:50 am', 'Hawks Building', '5H'),
(317, 'MS5710', 'Computer Networks', 'Monday', '12:00 - 1:00 pm', 'Hawks Building', '6H'),
(318, 'MS2000', 'Applied Statistics ', 'Monday', '1:10 - 2:10 pm', 'Hawks Building', '7H'),
(319, 'CS3911', 'C++', 'Monday', '2:20 - 3:30 pm ', 'Hawks Building', '8H'),
(320, 'CS3420', 'Artificial Intelligence and Machine Lear', 'Monday', '3:40 - 4:50 pm', 'Hawks Building', '9H'),
(321, 'CS3211', 'Cybersecurity and Ethical Hacking', 'Monday', '5:00 - 6:10 pm ', 'Hawks Building', '10H'),
(322, 'CS5689', 'Advanced Machine Learning and Deep Neura', 'Monday', '7:00 - 8:00 am', 'Might Building ', '1M'),
(323, 'CS5695', 'Big Data Analytics and Distributed Syste', 'Monday', '8:10 - 9:10 am ', 'Might Building ', '2H'),
(324, 'CS5123', 'Natural Language Processing and Text Min', 'Monday', '9:20 - 10:30 am', 'Might Building ', '3H'),
(325, 'CS5987', 'Cloud Computing and Virtualization', 'Monday', '10:40 - 11:50 am', 'Might Building ', '4H'),
(326, 'CS5498', 'Advanced Data Structures and Algorithms', 'Monday', '12:00 - 1:00 pm', 'Might Building ', '5H'),
(327, 'MS5098', 'Computer Vision and Image Processing', 'Monday', '1:10 - 2:10 pm', 'Might Building ', '6H'),
(328, 'CS5329', 'Artificial Intelligence Ethics and Polic', 'Monday', '2:20 - 3:30 pm ', 'Might Building ', '7H'),
(329, 'CS5198', 'Quantum Computing and Quantum Algorithms', 'Monday', '3:40 - 4:50 pm', 'Might Building ', '8H'),
(330, 'MS5398', 'Cybersecurity and Network Defense Strate', 'Monday', '5:00 - 6:10 pm ', 'Might Building ', '9H'),
(331, 'CS5690', 'Software Development in Agile Environmen', 'Monday', '6:20 - 7:30 pm', 'Might Building ', '10H'),
(332, 'MS5109', 'Blockchain Technology and Cryptocurrenci', 'Monday', '7:40 - 8:50 pm ', 'Might Building ', '1H'),
(333, 'MS5165', 'Advanced Topics in Human-Computer Intera', 'Monday', '7:00 - 8:00 am', 'Might Building ', '2H'),
(334, 'CS5490', 'Parallel and Distributed Computing', 'Monday', '8:10 - 9:10 am ', 'Might Building ', '3H'),
(335, 'MS5523', 'Bioinformatics and Computational Biology', 'Monday', '9:20 - 10:30 am', 'Might Building ', '4H'),
(336, 'MS5555', 'Machine Learning for Robotics', 'Monday', '10:40 - 11:50 am', 'Might Building ', '5H'),
(337, 'MS5441', 'Secure Software Engineering and Vulnerab', 'Monday', '12:00 - 1:00 pm', 'Might Building ', '6H'),
(338, 'MS5332', 'Internet of Things (IoT) Security and Ap', 'Monday', '1:10 - 2:10 pm', 'Might Building ', '7H'),
(339, 'CS5577', 'Advanced Compiler Design and Optimizatio', 'Monday', '2:20 - 3:30 pm ', 'Might Building ', '8H'),
(340, 'CS5771', 'Distributed Databases and NoSQL Systems', 'Monday', '3:40 - 4:50 pm', 'Might Building ', '9H'),
(341, 'CS5226', 'Computer Graphics and 3D Game Developmen', 'Monday', '5:00 - 6:10 pm ', 'Might Building ', '10H'),
(342, 'EL3100', 'Structure and Grammar of English', 'Tuesday', '7:00 - 8:00 am', 'Hawks Building', '1H'),
(343, 'EL3500', 'Literature Across Cultures I: Analysis &', 'Tuesday', '8:10 - 9:10 am ', 'Hawks Building', '2H'),
(344, 'EL3510', 'Literature Across Cultures II: Theory', 'Tuesday', '9:20 - 10:30 am', 'Hawks Building', '3H'),
(345, 'EL3600', 'U.S. Literature I: Colonial to Civil War', 'Tuesday', '10:40 - 11:50 am', 'Hawks Building', '4H'),
(346, 'EL3610', 'U.S. Literature II: Civil War to Present', 'Tuesday', '12:00 - 1:00 pm', 'Hawks Building', '5H'),
(347, 'EL3560', 'Literatures of Europe Part I', 'Tuesday', '1:10 - 2:10 pm', 'Hawks Building', '6H'),
(348, 'EL3561', 'Literatures of Europe Part II', 'Tuesday', '2:20 - 3:30 pm ', 'Hawks Building', '7H'),
(349, 'EL4060', 'Literature of Class & Class Consciousnes', 'Tuesday', '3:40 - 4:50 pm', 'Hawks Building', '8H'),
(350, 'EL4311', 'Greek Drama', 'Tuesday', '5:00 - 6:10 pm ', 'Hawks Building', '9H'),
(351, 'EL4325', 'Shakespeare: Selected Plays', 'Tuesday', '6:20 - 7:30 pm', 'Hawks Building', '10H'),
(352, 'EL4800', 'Major Authors', 'Tuesday', '7:40 - 8:50 pm ', 'Hawks Building', '1H'),
(353, 'EL3865', 'Literature of Asia', 'Tuesday', '7:00 - 8:00 am', 'Hawks Building', '2H'),
(354, 'EL4630', 'Latin American Literature', 'Tuesday', '8:10 - 9:10 am ', 'Hawks Building', '3H'),
(355, 'EL5000', 'Senior Seminar- Research & Writing', 'Tuesday', '9:20 - 10:30 am', 'Hawks Building', '4H'),
(356, 'EL5010', 'Senior Seminar- Thesis', 'Tuesday', '10:40 - 11:50 am', 'Hawks Building', '5H'),
(357, 'EL1000', 'English Composition I: Exposition', 'Tuesday', '12:00 - 1:00 pm', 'Hawks Building', '6H'),
(358, 'EL1010', 'Writing Workshop', 'Tuesday', '1:10 - 2:10 pm', 'Hawks Building', '7H'),
(359, 'EL2001', 'Public Speaking', 'Tuesday', '2:20 - 3:30 pm ', 'Hawks Building', '8H'),
(360, 'EL2206', 'Science Fiction Literature', 'Tuesday', '3:40 - 4:50 pm', 'Hawks Building', '9H'),
(361, 'EL2310', 'Introduction to Literature', 'Tuesday', '5:00 - 6:10 pm ', 'Hawks Building', '10H'),
(362, 'BS2400', 'Basic Biology I', 'Tuesday', '7:00 - 8:00 am', 'Might Building ', '1H'),
(363, 'BS2401', 'Basic Biology I Lab', 'Tuesday', '8:10 - 9:10 am ', 'Might Building ', '2H'),
(364, 'BS2410', 'Basic Biology II', 'Tuesday', '9:20 - 10:30 am', 'Might Building ', '3H'),
(365, 'BS2411', 'Basic Biology II Lab', 'Tuesday', '10:40 - 11:50 am', 'Might Building ', '4H'),
(366, 'BS5410', 'Seminar I: Reading in the Discipline', 'Tuesday', '12:00 - 1:00 pm', 'Might Building ', '5H'),
(367, 'BS5420', 'Seminar II: Writing in the Discipline', 'Tuesday', '1:10 - 2:10 pm', 'Might Building ', '6H'),
(368, 'BS4400', 'Cell Biology', 'Tuesday', '2:20 - 3:30 pm ', 'Might Building ', '7H'),
(369, 'BS3400', 'Vertebrate Physiology', 'Tuesday', '3:40 - 4:50 pm', 'Might Building ', '8H'),
(370, 'BS4470', 'Ecology', 'Tuesday', '5:00 - 6:10 pm ', 'Might Building ', '9H'),
(371, 'BS3450', 'Plant Biology', 'Tuesday', '6:20 - 7:30 pm', 'Might Building ', '10H'),
(372, 'BS1000', 'Plants and Society', 'Tuesday', '7:40 - 8:50 pm ', 'Might Building ', '1H'),
(373, 'BS2490', 'Enivronmental Science', 'Tuesday', '7:00 - 8:00 am', 'Might Building ', '2H'),
(374, 'BS3810', 'Biological Aspects of Aging', 'Tuesday', '8:10 - 9:10 am ', 'Might Building ', '3H'),
(375, 'BS4420', 'Microbiology', 'Tuesday', '9:20 - 10:30 am', 'Might Building ', '4H'),
(376, 'BS4460', 'Genetics', 'Tuesday', '10:40 - 11:50 am', 'Might Building ', '5H'),
(377, 'BS4560', 'Molecular Biology', 'Tuesday', '12:00 - 1:00 pm', 'Might Building ', '6H'),
(378, 'BS4461', 'Immunology', 'Tuesday', '1:10 - 2:10 pm', 'Might Building ', '7H'),
(379, 'BS5590', 'Advanced Research', 'Tuesday', '2:20 - 3:30 pm ', 'Might Building ', '8H'),
(380, 'BS5591', 'Environmental Research', 'Tuesday', '3:40 - 4:50 pm', 'Might Building ', '9H'),
(381, 'BS5592', 'Environmental Research Lab', 'Tuesday', '5:00 - 6:10 pm ', 'Might Building ', '10H'),
(382, 'HI2681', 'Introduction to European History', 'Wednesday', '7:00 - 8:00 am', 'Hawks Building', '1H'),
(383, 'HI3091', 'African Cultures', 'Wednesday', '8:10 - 9:10 am ', 'Hawks Building', '2H'),
(384, 'HI3002', 'Rise of Reason', 'Wednesday', '9:20 - 10:30 am', 'Hawks Building', '3H'),
(385, 'HI3021', 'Europe in the Middle Ages', 'Wednesday', '10:40 - 11:50 am', 'Hawks Building', '4H'),
(386, 'HI3102', 'Hispanic Heritage', 'Wednesday', '12:00 - 1:00 pm', 'Hawks Building', '5H'),
(387, 'HI3558', 'Classical Greco-Roman History', 'Wednesday', '1:10 - 2:10 pm', 'Hawks Building', '6H'),
(388, 'HI3080', 'Asian Cultures', 'Wednesday', '3:40 - 4:50 pm', 'Hawks Building', '8H'),
(389, 'HI4905', 'Chinese Civilization', 'Wednesday', '5:00 - 6:10 pm ', 'Hawks Building', '9H'),
(390, 'HI3835', 'Islamic Cultures', 'Wednesday', '6:20 - 7:30 pm', 'Hawks Building', '10H'),
(391, 'HI3110', 'Latin American Culture', 'Wednesday', '7:40 - 8:50 pm ', 'Hawks Building', '1H'),
(392, 'HI4001', 'Nineteenth Century', 'Wednesday', '7:00 - 8:00 am', 'Hawks Building', '2H'),
(393, 'HI4011', 'Twentieth Century', 'Wednesday', '8:10 - 9:10 am ', 'Hawks Building', '3H'),
(394, 'HI2200', 'Science in Western Civilization', 'Wednesday', '9:20 - 10:30 am', 'Hawks Building', '4H'),
(395, 'HI2810', 'Geography, Earth, and People', 'Wednesday', '10:40 - 11:50 am', 'Hawks Building', '5H'),
(396, 'HI3600', 'Global Geography', 'Wednesday', '12:00 - 1:00 pm', 'Hawks Building', '6H'),
(397, 'HI5000', 'Social Studies Senior Seminar', 'Wednesday', '1:10 - 2:10 pm', 'Hawks Building', '7H'),
(398, 'HI4800', 'History of India', 'Wednesday', '2:20 - 3:30 pm ', 'Hawks Building', '8H'),
(399, 'HI3700', 'Historical Geography of Latin America', 'Wednesday', '3:40 - 4:50 pm', 'Hawks Building', '9H'),
(400, 'HI4850', 'Domesticity 19th/20th centuries', 'Wednesday', '5:00 - 6:10 pm ', 'Hawks Building', '10H'),
(401, 'PY2010', 'Introduction to Psychology', 'Wednesday', '7:00 - 8:00 am', 'Might Building ', '1H'),
(402, 'PY3010', 'Research Design and Analysis I', 'Wednesday', '8:10 - 9:10 am ', 'Might Building ', '2H'),
(403, 'PY4200', 'Research Design and Analysis II', 'Wednesday', '9:20 - 10:30 am', 'Might Building ', '3H'),
(404, 'PY4130', 'Field Experience and Research', 'Wednesday', '10:40 - 11:50 am', 'Might Building ', '4H'),
(405, 'PY5210', 'Senior Seminar in Developmental Psycholo', 'Wednesday', '12:00 - 1:00 pm', 'Might Building ', '5H'),
(406, 'PY3215', 'Foundations of Child Development', 'Wednesday', '1:10 - 2:10 pm', 'Might Building ', '6H'),
(407, 'PY3230', 'Adulthood & Aging', 'Wednesday', '2:20 - 3:30 pm ', 'Might Building ', '7H'),
(408, 'PY3410', 'Cognitive Psychology', 'Wednesday', '3:40 - 4:50 pm', 'Might Building ', '8H'),
(409, 'PY3420', 'Learning and Motivation', 'Wednesday', '5:00 - 6:10 pm ', 'Might Building ', '9H'),
(410, 'PY3510', 'Social Psychology', 'Wednesday', '6:20 - 7:30 pm', 'Might Building ', '10H'),
(411, 'PY3530', 'Community Psychology', 'Wednesday', '7:40 - 8:50 pm ', 'Might Building ', '1H'),
(412, 'PY3310', 'Foundations in Clinical Psychology', 'Wednesday', '7:00 - 8:00 am', 'Might Building ', '2H'),
(413, 'PY3311', 'Theories of Personality', 'Wednesday', '8:10 - 9:10 am ', 'Might Building ', '3H'),
(414, 'PY3610', 'Brain & Behavior', 'Wednesday', '9:20 - 10:30 am', 'Might Building ', '4H'),
(415, 'PY3620', 'Drugs & Behavior', 'Wednesday', '10:40 - 11:50 am', 'Might Building ', '5H'),
(416, 'PY3240', 'Lifespan Development', 'Wednesday', '12:00 - 1:00 pm', 'Might Building ', '6H'),
(417, 'PY2530', 'Psychology of Prejudice & Discrimination', 'Wednesday', '1:10 - 2:10 pm', 'Might Building ', '7H'),
(418, 'PY2720', 'Psychology of Gender', 'Wednesday', '2:20 - 3:30 pm ', 'Might Building ', '8H'),
(419, 'PY3710', 'Psychology and Social Justice', 'Wednesday', '3:40 - 4:50 pm', 'Might Building ', '9H'),
(420, 'PY5510', 'Senior Seminar in Social Psychology', 'Wednesday', '5:00 - 6:10 pm ', 'Might Building ', '10H'),
(421, 'PE2420', 'Principles of Microeconomics', 'Thursday', '7:00 - 8:00 am', 'Hawks Building', '1H'),
(422, 'PE2430', 'Principles of Macroeconomics', 'Thursday', '8:10 - 9:10 am ', 'Hawks Building', '2H'),
(423, 'PE3201', 'Statistics', 'Thursday', '9:20 - 10:30 am', 'Hawks Building', '3H'),
(424, 'PE3425', 'Economic Analysis-Micro', 'Thursday', '10:40 - 11:50 am', 'Hawks Building', '4H'),
(425, 'PE3435', 'Economic Analysis-Macro', 'Thursday', '12:00 - 1:00 pm', 'Hawks Building', '5H'),
(426, 'PE3410', 'Contemporary U.S. Political Economy', 'Thursday', '1:10 - 2:10 pm', 'Hawks Building', '6H'),
(427, 'PE4590', 'Global Economy in the 20th Century', 'Thursday', '5:00 - 6:10 pm ', 'Hawks Building', '9H'),
(428, 'PE4275', 'Applied Econometrics', 'Thursday', '6:20 - 7:30 pm', 'Hawks Building', '10H'),
(429, 'PE3400', 'Global South', 'Thursday', '7:40 - 8:50 pm ', 'Hawks Building', '1H'),
(430, 'PE3440', 'International Economics', 'Thursday', '7:00 - 8:00 am', 'Hawks Building', '2H'),
(431, 'PE4290', 'Environmental Economics', 'Thursday', '8:10 - 9:10 am ', 'Hawks Building', '3H'),
(432, 'PE4430', 'Health Economics', 'Thursday', '9:20 - 10:30 am', 'Hawks Building', '4H'),
(433, 'PE4455', 'Economic Development', 'Thursday', '10:40 - 11:50 am', 'Hawks Building', '5H'),
(434, 'PE4460', 'International Finance', 'Thursday', '12:00 - 1:00 pm', 'Hawks Building', '6H'),
(435, 'PE4470', 'History of Economic Thought', 'Thursday', '1:10 - 2:10 pm', 'Hawks Building', '7H'),
(436, 'PE4100', 'International Organizations in the Globa', 'Thursday', '2:20 - 3:30 pm ', 'Hawks Building', '8H'),
(437, 'PE4409', 'Urban Economics', 'Thursday', '3:40 - 4:50 pm', 'Hawks Building', '9H'),
(438, 'PE4615', 'Public Finance & Public Policy', 'Thursday', '5:00 - 6:10 pm ', 'Hawks Building', '10H'),
(439, 'MA2310', 'Calculus and Analytic Geometry I', 'Thursday', '7:00 - 8:00 am', 'Might Building ', '1H'),
(440, 'MA2320', 'Calculus and Analytic Geometry II', 'Thursday', '8:10 - 9:10 am ', 'Might Building ', '2H'),
(441, 'MA3030', 'Discrete Mathematics', 'Thursday', '9:20 - 10:30 am', 'Might Building ', '3H'),
(442, 'MA3160', 'Linear Algebra', 'Thursday', '10:40 - 11:50 am', 'Might Building ', '4H'),
(443, 'MA3210', 'Intro. To Probability & Statistics', 'Thursday', '12:00 - 1:00 pm', 'Might Building ', '5H'),
(444, 'MA3330', 'Calculus and Analytic Geometry III', 'Thursday', '1:10 - 2:10 pm', 'Might Building ', '6H'),
(445, 'MA3520', 'Transition to Advanced Mathematics', 'Thursday', '2:20 - 3:30 pm ', 'Might Building ', '7H'),
(446, 'MA4360', 'Differential Equations', 'Thursday', '3:40 - 4:50 pm', 'Might Building ', '8H'),
(447, 'MA5120', 'Abstract Algebra', 'Thursday', '5:00 - 6:10 pm ', 'Might Building ', '9H'),
(448, 'MA5320', 'Advanced Calculus I', 'Thursday', '6:20 - 7:30 pm', 'Might Building ', '10H'),
(449, 'MA1020', 'College Algebra', 'Thursday', '7:40 - 8:50 pm ', 'Might Building ', '1H'),
(450, 'MA2010', 'Foundations of Mathematics I', 'Thursday', '7:00 - 8:00 am', 'Might Building ', '2H'),
(451, 'MA2090', 'Precalculus', 'Thursday', '8:10 - 9:10 am ', 'Might Building ', '3H'),
(452, 'MA1010', 'Powertrack Math', 'Thursday', '9:20 - 10:30 am', 'Might Building ', '4H'),
(453, 'MA2500', 'History of Mathematics', 'Thursday', '10:40 - 11:50 am', 'Might Building ', '5H'),
(454, 'MA2701', 'Business Anaytics', 'Thursday', '12:00 - 1:00 pm', 'Might Building ', '6H'),
(455, 'MA2000', 'Applied Statistics', 'Thursday', '1:10 - 2:10 pm', 'Might Building ', '7H'),
(456, 'MA2702', 'Marketing Analytics', 'Thursday', '2:20 - 3:30 pm ', 'Might Building ', '8H'),
(457, 'MA3020', 'Foundations of Mathematics II', 'Thursday', '3:40 - 4:50 pm', 'Might Building ', '9H'),
(458, 'MA3180', 'Foundations of Secondary School Mathemat', 'Thursday', '5:00 - 6:10 pm ', 'Might Building ', '10H'),
(459, 'CP2120', 'Principles of Chemistry I', 'Friday', '7:00 - 8:00 am', 'Hawks Building', '1H'),
(460, 'CP2121', 'Principles of Chemistry I Lab', 'Friday', '8:10 - 9:10 am ', 'Hawks Building', '2H'),
(461, 'CP2130', 'Principles of Chemistry II', 'Friday', '9:20 - 10:30 am', 'Hawks Building', '3H'),
(462, 'CP2131', 'Principles of Chemistry II Lab', 'Friday', '10:40 - 11:50 am', 'Hawks Building', '4H'),
(463, 'CP3300', 'Organic Chemistry I', 'Friday', '12:00 - 1:00 pm', 'Hawks Building', '5H'),
(464, 'CP3302', 'Organic Chemistry I Lab', 'Friday', '1:10 - 2:10 pm', 'Hawks Building', '6H'),
(465, 'CP3310', 'Organic Chemistry II', 'Friday', '2:20 - 3:30 pm ', 'Hawks Building', '7H'),
(466, 'CP3312', 'Organic Chemistry II Lab', 'Friday', '3:40 - 4:50 pm', 'Hawks Building', '8H'),
(467, 'CP3400', 'Analytical Chemistry', 'Friday', '5:00 - 6:10 pm ', 'Hawks Building', '9H'),
(468, 'CP4700', 'Physical Chemistry I', 'Friday', '6:20 - 7:30 pm', 'Hawks Building', '10H'),
(469, 'CP4710', 'Physical Chemistry II', 'Friday', '7:40 - 8:50 pm ', 'Hawks Building', '1H'),
(470, 'CP4720', 'Physical Chemistry Lab', 'Friday', '7:00 - 8:00 am', 'Hawks Building', '2H'),
(471, 'CP3230', 'Mathematical Methods in the Physical Sci', 'Friday', '8:10 - 9:10 am ', 'Hawks Building', '3H'),
(472, 'CP3450', 'Inorganic Chemistry', 'Friday', '9:20 - 10:30 am', 'Hawks Building', '4H'),
(473, 'CP4320', 'Advanced Organic Chemistry', 'Friday', '10:40 - 11:50 am', 'Hawks Building', '5H'),
(474, 'CP4490', 'Biochemistry for Life Sciences', 'Friday', '12:00 - 1:00 pm', 'Hawks Building', '6H'),
(475, 'CP4510', 'Biochemistry I', 'Friday', '1:10 - 2:10 pm', 'Hawks Building', '7H'),
(476, 'CP4515', 'Biochemistry II', 'Friday', '2:20 - 3:30 pm ', 'Hawks Building', '8H'),
(477, 'CP4520', 'Biochemistry Lab', 'Friday', '3:40 - 4:50 pm', 'Hawks Building', '9H'),
(478, 'CP5500', 'Advanced Topics in Chemistry', 'Friday', '5:00 - 6:10 pm ', 'Hawks Building', '10H'),
(479, 'SY1500', 'Introductory Sociology', 'Friday', '7:00 - 8:00 am', 'Might Building ', '1H'),
(480, 'SY2222', 'Sociology of Caring', 'Friday', '8:10 - 9:10 am ', 'Might Building ', '2H'),
(481, 'SY2400', 'Sociology Through the Arts', 'Friday', '9:20 - 10:30 am', 'Might Building ', '3H'),
(482, 'SY2550', 'Social Problems', 'Friday', '10:40 - 11:50 am', 'Might Building ', '4H'),
(483, 'SY2600', 'Social Deviance', 'Friday', '12:00 - 1:00 pm', 'Might Building ', '5H'),
(484, 'SY2800', 'Race, Class, Gender and Sexuality', 'Friday', '1:10 - 2:10 pm', 'Might Building ', '6H'),
(485, 'SY3160', 'Sociology of Culture', 'Friday', '2:20 - 3:30 pm ', 'Might Building ', '7H'),
(486, 'SY3280', 'Social Inequality', 'Friday', '3:40 - 4:50 pm', 'Might Building ', '8H'),
(487, 'SY3630', 'Political Sociology', 'Friday', '5:00 - 6:10 pm ', 'Might Building ', '9H'),
(488, 'SY3700', 'Family and Society', 'Friday', '6:20 - 7:30 pm', 'Might Building ', '10H'),
(489, 'SY3750', 'Medical Sociology', 'Friday', '7:40 - 8:50 pm ', 'Might Building ', '1H'),
(490, 'SY4260', 'Social Work: Theory and Practice', 'Friday', '7:00 - 8:00 am', 'Might Building ', '2H'),
(491, 'SY4270', 'Internship in Social Work, Sociology and', 'Friday', '8:10 - 9:10 am ', 'Might Building ', '3H'),
(492, 'SY4400', 'Social Psychology', 'Friday', '9:20 - 10:30 am', 'Might Building ', '4H'),
(493, 'SY4500', 'Global Sociology', 'Friday', '10:40 - 11:50 am', 'Might Building ', '5H'),
(494, 'SY4600', 'Social Programs, Planning and Policy', 'Friday', '12:00 - 1:00 pm', 'Might Building ', '6H'),
(495, 'SY4520', 'Research Methods I', 'Friday', '1:10 - 2:10 pm', 'Might Building ', '7H'),
(496, 'SY4530', 'Sociological Theory I', 'Friday', '2:20 - 3:30 pm ', 'Might Building ', '8H'),
(497, 'SY4540', 'Sociological Theory II', 'Friday', '3:40 - 4:50 pm', 'Might Building ', '9H'),
(498, 'SY4570', 'Research Methods II', 'Friday', '5:00 - 6:10 pm ', 'Might Building ', '10H'),
(499, 'PH2240', 'General Physics I', 'Monday', '7:00 - 8:00 am', 'Woods Center', '1H'),
(500, 'PH2241', 'General Physics I Laboratory', 'Monday', '8:10 - 9:10 am ', 'Woods Center', '2H'),
(501, 'PH2250', 'General Physics II', 'Monday', '9:20 - 10:30 am', 'Woods Center', '3H'),
(502, 'PH2251', 'General Physics II Laboratory', 'Monday', '10:40 - 11:50 am', 'Woods Center', '4H'),
(503, 'PH2260', 'General Physics III', 'Monday', '12:00 - 1:00 pm', 'Woods Center', '5H'),
(504, 'PH2261', 'General Physics III Laboratory', 'Monday', '1:10 - 2:10 pm', 'Woods Center', '6H'),
(505, 'PH3230', 'Mathematical Methods in the Physical Sci', 'Monday', '2:20 - 3:30 pm ', 'Woods Center', '7H'),
(506, 'PH3600', 'Mechanics', 'Monday', '3:40 - 4:50 pm', 'Woods Center', '8H'),
(507, 'PH3700', 'Electromagnetism', 'Monday', '5:00 - 6:10 pm ', 'Woods Center', '9H'),
(508, 'PH3800', 'Relativity', 'Monday', '6:20 - 7:30 pm', 'Woods Center', '10H'),
(509, 'PH3900', 'Experimental Physics and Electronics Lab', 'Monday', '7:40 - 8:50 pm ', 'Woods Center', '1H'),
(510, 'PH4100', 'Thermodynamics', 'Monday', '7:00 - 8:00 am', 'Woods Center', '2H'),
(511, 'PH4200', 'Quantum Mechanics', 'Monday', '8:10 - 9:10 am ', 'Woods Center', '3H'),
(512, 'PH5920', 'Seminar I', 'Monday', '9:20 - 10:30 am', 'Woods Center', '4H'),
(513, 'PH4600', 'Applied Mechanics', 'Monday', '10:40 - 11:50 am', 'Woods Center', '5H'),
(514, 'PH4900', 'Econophysics', 'Monday', '12:00 - 1:00 pm', 'Woods Center', '6H'),
(515, 'PH2220', 'Structure of Physics I', 'Monday', '1:10 - 2:10 pm', 'Woods Center', '7H'),
(516, 'PH2221', 'Structure of Physics I Laboratory', 'Monday', '2:20 - 3:30 pm ', 'Woods Center', '8H'),
(517, 'PH2230', 'Structure of Physics II', 'Monday', '3:40 - 4:50 pm', 'Woods Center', '9H'),
(518, 'PH2231', 'Structure of Physics II Laboratory', 'Monday', '5:00 - 6:10 pm ', 'Woods Center', '10H'),
(519, 'VA2000', 'Introduction to Art', 'Monday', '6:20 - 7:30 pm', 'Woods Center', '1H'),
(520, 'VA2010', 'Introduction to Creative Thinking', 'Tuesday ', '7:00 - 8:00 am', 'Woods Center', '1H'),
(521, 'VA2020', 'Basic Design', 'Tuesday ', '8:10 - 9:10 am ', 'Woods Center', '2H'),
(522, 'VA2030', 'Drawing', 'Tuesday ', '9:20 - 10:30 am', 'Woods Center', '3H'),
(523, 'VA2045', 'Introduction to Color', 'Tuesday ', '10:40 - 11:50 am', 'Woods Center', '4H'),
(524, 'VA2500', 'Art History I: 19th Century Art', 'Tuesday ', '12:00 - 1:00 pm', 'Woods Center', '5H'),
(525, 'VA2510', 'Art History II: Modern Art: 1900- 1945', 'Tuesday ', '1:10 - 2:10 pm', 'Woods Center', '6H'),
(526, 'VA3100', 'Visual Culture: Warhol to the Present', 'Tuesday ', '2:20 - 3:30 pm ', 'Woods Center', '7H'),
(527, 'VA3200', 'Art Tutorials I', 'Tuesday ', '3:40 - 4:50 pm', 'Woods Center', '8H'),
(528, 'VA4200', 'Art Tutorials II', 'Tuesday ', '6:20 - 7:30 pm', 'Woods Center', '10H'),
(529, 'VA5200', 'Art Tutorials III', 'Tuesday ', '7:40 - 8:50 pm ', 'Woods Center', '1H'),
(530, 'VA2400', 'Introduction to Photography', 'Tuesday ', '7:00 - 8:00 am', 'Woods Center', '2H'),
(531, 'VA2460', 'Painting I', 'Tuesday ', '8:10 - 9:10 am ', 'Woods Center', '3H'),
(532, 'VA2320', 'Graphic Design I', 'Tuesday ', '9:20 - 10:30 am', 'Woods Center', '4H'),
(533, 'VA4320', 'Graphic Design II', 'Tuesday ', '10:40 - 11:50 am', 'Woods Center', '5H'),
(534, 'VA3380', 'Digital Video', 'Tuesday ', '12:00 - 1:00 pm', 'Woods Center', '6H'),
(535, 'VA3400', 'Digital Imaging', 'Tuesday ', '1:10 - 2:10 pm', 'Woods Center', '7H'),
(536, 'VA4460', 'Digital Animation', 'Tuesday ', '2:20 - 3:30 pm ', 'Woods Center', '8H'),
(537, 'VA5900', 'Senior Project', 'Tuesday ', '3:40 - 4:50 pm', 'Woods Center', '9H'),
(538, 'PL1000', 'Introduction to Political Science', 'Wednesday', '7:00 - 8:00 am', 'Woods Center', '1H'),
(539, 'PL1050', 'Comparative Politics and Government', 'Wednesday', '8:10 - 9:10 am ', 'Woods Center', '2H'),
(540, 'PL1100', 'Political Theory and Ideologies', 'Wednesday', '9:20 - 10:30 am', 'Woods Center', '3H'),
(541, 'PL1150', 'International Relations and Global Polit', 'Wednesday', '10:40 - 11:50 am', 'Woods Center', '4H'),
(542, 'PL1200', 'American Government and Politics', 'Wednesday', '12:00 - 1:00 pm', 'Woods Center', '5H'),
(543, 'PL1250', 'Public Policy Analysis and Implementatio', 'Wednesday', '1:10 - 2:10 pm', 'Woods Center', '6H'),
(544, 'PL1300', 'Political Research Methods and Data Anal', 'Wednesday', '2:20 - 3:30 pm ', 'Woods Center', '7H'),
(545, 'PL1350', 'Political Parties and Elections', 'Wednesday', '3:40 - 4:50 pm', 'Woods Center', '8H'),
(546, 'PL1400', 'Political Economy and Economic Policy', 'Wednesday', '5:00 - 6:10 pm ', 'Woods Center', '9H'),
(547, 'PL1450', 'Political Leadership and Decision-Making', 'Wednesday', '6:20 - 7:30 pm', 'Woods Center', '10H'),
(548, 'PL1500', 'Political Ethics and Values', 'Wednesday', '7:40 - 8:50 pm ', 'Woods Center', '1H'),
(549, 'PL1550', 'Environmental Politics and Policy', 'Wednesday', '7:00 - 8:00 am', 'Woods Center', '2H'),
(550, 'PL1600', 'Human Rights and Social Justice', 'Wednesday', '8:10 - 9:10 am ', 'Woods Center', '3H'),
(551, 'PL1650', 'Law and Politics', 'Wednesday', '9:20 - 10:30 am', 'Woods Center', '4H'),
(552, 'PL1700', 'National Security and Defense Policy', 'Wednesday', '10:40 - 11:50 am', 'Woods Center', '5H'),
(553, 'PL1750', 'Gender and Politics', 'Wednesday', '12:00 - 1:00 pm', 'Woods Center', '6H'),
(554, 'PL1800', 'Political Communication and Media', 'Wednesday', '1:10 - 2:10 pm', 'Woods Center', '7H'),
(555, 'PL1850', 'Public Administration and Bureaucracy', 'Wednesday', '2:20 - 3:30 pm ', 'Woods Center', '8H'),
(556, 'PL1900', 'International Law and Diplomacy', 'Wednesday', '3:40 - 4:50 pm', 'Woods Center', '9H'),
(557, 'PL2000', 'Political Geography and Geopolitics', 'Wednesday', '5:00 - 6:10 pm', 'Woods Center', '10H'),
(558, 'HI1010', 'World Religions - West', 'Thursday', '7:00 - 8:00 am', 'Woods Center', '1H'),
(559, 'HI1020', 'World Religions - East', 'Thursday', '8:10 - 9:10 am ', 'Woods Center', '2H'),
(560, 'HI2720', 'Introduction to Philosophy', 'Thursday', '9:20 - 10:30 am', 'Woods Center', '3H'),
(561, 'HI2155', 'Introduction to Comparative Religion', 'Thursday', '10:40 - 11:50 am', 'Woods Center', '4H'),
(562, 'HI2700', 'Introduction to Logic', 'Thursday', '12:00 - 1:00 pm', 'Woods Center', '5H'),
(563, 'HI3030', 'From God to the Machine: Europe from the', 'Thursday', '1:10 - 2:10 pm', 'Woods Center', '6H'),
(564, 'HI3640', 'African History', 'Thursday', '2:20 - 3:30 pm ', 'Woods Center', '7H'),
(565, 'HI3840', 'Crescent and Cross: Islam and Christiani', 'Thursday', '3:40 - 4:50 pm', 'Woods Center', '8H'),
(566, 'HI4557', 'Renaissance and Reformation in Europe', 'Thursday', '5:00 - 6:10 pm ', 'Woods Center', '9H'),
(567, 'HI3323', 'Buddhism', 'Thursday', '6:20 - 7:30 pm', 'Woods Center', '10H'),
(568, 'HI3525', 'Ancient Greek Philosophy', 'Thursday', '7:40 - 8:50 pm ', 'Woods Center', '1H'),
(569, 'HI3703', 'Modern Philosophy', 'Thursday', '7:00 - 8:00 am', 'Woods Center', '2H'),
(570, 'HI3704', 'African Religions and Philosophy', 'Thursday', '8:10 - 9:10 am ', 'Woods Center', '3H'),
(571, 'HI3710', 'Contemporary Philosophical Issues', 'Thursday', '9:20 - 10:30 am', 'Woods Center', '4H'),
(572, 'HI3950', 'Philosophy of Religion', 'Thursday', '10:40 - 11:50 am', 'Woods Center', '5H'),
(573, 'HI4051', 'Logic and Scientific Reasoning', 'Thursday', '12:00 - 1:00 pm', 'Woods Center', '6H'),
(574, 'HI4395', 'Philosophy from the 20th to the 21st Cen', 'Thursday', '1:10 - 2:10 pm', 'Woods Center', '7H'),
(575, 'HI3040', 'Analysis of Culture', 'Thursday', '2:20 - 3:30 pm ', 'Woods Center', '8H'),
(576, 'HI3200', 'Contemporary Religious Experience', 'Thursday', '3:40 - 4:50 pm', 'Woods Center', '9H'),
(577, 'HI5910', 'Senior Research Project', 'Thursday', '5:00 - 6:10 pm', 'Woods Center', '10H'),
(578, 'BU1000', 'Entrepreneurship and Small Business Mana', 'Friday', '7:00 - 8:00 am', 'Woods Center', '1H'),
(579, 'BU1050', 'Marketing and Branding', 'Friday', '8:10 - 9:10 am ', 'Woods Center', '2H'),
(580, 'BU2000', 'Financial Management', 'Friday', '9:20 - 10:30 am', 'Woods Center', '3H'),
(581, 'BU2050', 'Human Resource Management', 'Friday', '10:40 - 11:50 am', 'Woods Center', '4H'),
(582, 'BU2100', 'International Business and Globalization', 'Friday', '12:00 - 1:00 pm', 'Woods Center', '5H'),
(583, 'BU2150', 'Business Ethics and Corporate Social Res', 'Friday', '1:10 - 2:10 pm', 'Woods Center', '6H'),
(584, 'BU2200', 'Operations and Supply Chain Management', 'Friday', '2:20 - 3:30 pm ', 'Woods Center', '7H'),
(585, 'BU3000', 'E-Commerce and Digital Marketing', 'Friday', '3:40 - 4:50 pm', 'Woods Center', '8H'),
(586, 'BU3450', 'Business Law and Ethics', 'Friday', '5:00 - 6:10 pm ', 'Woods Center', '9H'),
(587, 'BU4000', 'Business Analytics and Data Science', 'Friday', '6:20 - 7:30 pm', 'Woods Center', '10H'),
(588, 'BU5500', 'Strategic Management', 'Friday', '7:40 - 8:50 pm ', 'Woods Center', '1H'),
(589, 'BU4500', 'Innovation and Product Development', 'Friday', '7:00 - 8:00 am', 'Woods Center', '2H'),
(590, 'BU2700', 'Financial Accounting', 'Friday', '8:10 - 9:10 am ', 'Woods Center', '3H'),
(591, 'BU3700', 'Sales and Negotiation Skills', 'Friday', '9:20 - 10:30 am', 'Woods Center', '4H'),
(592, 'BU2800', 'Risk Management and Insurance', 'Friday', '10:40 - 11:50 am', 'Woods Center', '5H'),
(593, 'BU1900', 'Supply Chain Logistics', 'Friday', '12:00 - 1:00 pm', 'Woods Center', '6H'),
(594, 'BU5910', 'Business Communication', 'Friday', '1:10 - 2:10 pm', 'Woods Center', '7H'),
(595, 'BU5300', 'Leadership and Organizational Behavior', 'Friday', '2:20 - 3:30 pm ', 'Woods Center', '8H'),
(596, 'BU1200', 'Entrepreneurial Finance', 'Friday', '3:40 - 4:50 pm', 'Woods Center', '9H'),
(597, 'BU5950', 'Business Negotiation and Conflict Resolu', 'Friday', '5:00 - 6:10 pm', 'Woods Center', '10H');

-- --------------------------------------------------------

--
-- Table structure for table `minor`
--

CREATE TABLE `minor` (
  `MinorID` int(11) NOT NULL,
  `DeptID` varchar(25) DEFAULT NULL,
  `MinorName` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `minor`
--

INSERT INTO `minor` (`MinorID`, `DeptID`, `MinorName`) VALUES
(1, 'MIS', 'Data Analytics'),
(2, 'MIS', 'Cybersecurity'),
(3, 'CIS', 'Data Science'),
(4, 'CIS', 'Cybersecurity'),
(5, 'ENG', 'Linguistics'),
(6, 'ENG', 'Cultural Studies'),
(7, 'BIO', 'Chemistry'),
(8, 'BIO', 'Environmental Science'),
(9, 'HIS', 'Political Science'),
(10, 'HIS', 'Cultural Studies'),
(11, 'PSY', 'Sociology'),
(12, 'PSY', 'Neuroscience'),
(13, 'ECO', 'Statistics'),
(14, 'ECO', 'Business Administration'),
(15, 'MAT', 'Computer Science'),
(16, 'MAT', 'Physics'),
(17, 'CHE', 'Biology'),
(18, 'CHE', 'Environmental Science'),
(19, 'SOC', 'Social Work'),
(20, 'SOC', 'Criminal Justice'),
(21, 'PHY', 'Mathematics'),
(22, 'PHY', 'Computer Science'),
(23, 'ART', 'Graphic Design'),
(24, 'ART', 'Creative Writing'),
(25, 'POL', 'Music Education'),
(26, 'POL', 'Political Science'),
(27, 'PHI', 'International Relations'),
(28, 'PHI', 'Political Science'),
(29, 'BUS', 'Economics'),
(30, 'BUS', 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `minorprerequisite`
--

CREATE TABLE `minorprerequisite` (
  `MinorID` int(11) NOT NULL,
  `PRmajorID` int(11) NOT NULL,
  `MinGrade` varchar(3) DEFAULT NULL,
  `DOLU` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `RoomID` varchar(25) NOT NULL,
  `OfficeID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`RoomID`, `OfficeID`) VALUES
('10C', '10DEPT'),
('11C', '11DEPT'),
('12C', '12DEPT'),
('13C', '13DEPT'),
('14C', '14DEPT'),
('15C', '15DEPT'),
('1C', '1DEPT'),
('2C', '2DEPT'),
('3C', '3DEPT'),
('4C', '4DEPT'),
('5C', '5DEPT'),
('6C', '6DEPT'),
('7C', '7DEPT'),
('8C', '8DEPT'),
('9C', '9DEPT');

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

CREATE TABLE `period` (
  `PeriodID` int(11) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `period`
--

INSERT INTO `period` (`PeriodID`, `StartTime`, `EndTime`) VALUES
(1, '07:00:00', '08:00:00'),
(2, '08:10:00', '09:10:00'),
(3, '09:20:00', '10:30:00'),
(4, '10:40:00', '11:50:00'),
(5, '12:00:00', '01:00:00'),
(6, '13:10:00', '14:10:00'),
(7, '14:20:00', '15:30:00'),
(8, '15:40:00', '16:50:00'),
(9, '17:00:00', '06:10:00'),
(10, '06:20:00', '07:30:00'),
(11, '07:40:00', '08:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RoomID` varchar(25) NOT NULL,
  `BuildingID` varchar(25) NOT NULL,
  `RoomNum` int(11) DEFAULT NULL,
  `RoomType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RoomID`, `BuildingID`, `RoomNum`, `RoomType`) VALUES
('10C', '4', 10, 'Office'),
('10H', '1', 10, 'Classroom'),
('10L', '5', 10, 'Lab'),
('10M', '2', 10, 'Classroom'),
('10W', '3', 10, 'Classroom'),
('11C', '4', 11, 'Office'),
('11L', '5', 11, 'Lab'),
('12C', '4', 12, 'Office'),
('12L', '5', 12, 'Lab'),
('13C', '4', 13, 'Office'),
('13L', '5', 13, 'Lab'),
('14C', '4', 14, 'Office'),
('14L', '5', 14, 'Lab'),
('15C', '4', 15, 'Office'),
('15L', '5', 15, 'Lab'),
('1C', '4', 1, 'Office'),
('1H', '1', 1, 'Classroom'),
('1L', '5', 1, 'Lab'),
('1M', '2', 1, 'Classroom'),
('1W', '3', 1, 'Classroom'),
('2C', '4', 2, 'Office'),
('2H', '1', 2, 'Classroom'),
('2L', '5', 2, 'Lab'),
('2M', '2', 2, 'Classroom'),
('2W', '3', 2, 'Classroom'),
('3C', '4', 3, 'Office'),
('3H', '1', 3, 'Classroom'),
('3L', '5', 3, 'Lab'),
('3M', '2', 3, 'Classroom'),
('3W', '3', 3, 'Classroom'),
('4C', '4', 4, 'Office'),
('4H', '1', 4, 'Classroom'),
('4L', '5', 4, 'Lab'),
('4M', '2', 4, 'Classroom'),
('4W', '3', 4, 'Classroom'),
('5C', '4', 5, 'Office'),
('5H', '1', 5, 'Classroom'),
('5L', '5', 5, 'Lab'),
('5M', '2', 5, 'Classroom'),
('5W', '3', 5, 'Classroom'),
('6C', '4', 6, 'Office'),
('6H', '1', 6, 'Classroom'),
('6L', '5', 6, 'Lab'),
('6M', '2', 6, 'Classroom'),
('6W', '3', 6, 'Classroom'),
('7C', '4', 7, 'Office'),
('7H', '1', 7, 'Classroom'),
('7L', '5', 7, 'Lab'),
('7M', '2', 7, 'Classroom'),
('7W', '3', 7, 'Classroom'),
('8C', '4', 8, 'Office'),
('8H', '1', 8, 'Classroom'),
('8L', '5', 8, 'Lab'),
('8M', '2', 8, 'Classroom'),
('8W', '3', 8, 'Classroom'),
('9C', '4', 9, 'Office'),
('9H', '1', 9, 'Classroom'),
('9L', '5', 9, 'Lab'),
('9M', '2', 9, 'Classroom'),
('9W', '3', 9, 'Classroom');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `SemesterID` int(11) NOT NULL,
  `SemesterName` varchar(100) DEFAULT NULL,
  `SemesterYear` year(4) NOT NULL,
  `StartTime` date NOT NULL,
  `EndTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statsoffice`
--

CREATE TABLE `statsoffice` (
  `StatsID` int(11) NOT NULL,
  `GAD` date DEFAULT NULL,
  `ClientName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `MajorID` int(11) DEFAULT NULL,
  `StudentYear` varchar(100) DEFAULT NULL,
  `StudentType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `MajorID`, `StudentYear`, `StudentType`) VALUES
(500001, 1, 'Freshman', 'Undergraduate'),
(500002, 2, 'Freshman', 'Undergraduate'),
(500003, 3, 'Freshman', 'Undergraduate'),
(500004, 4, 'Freshman', 'Undergraduate'),
(500005, 5, 'Freshman', 'Undergraduate'),
(500006, 6, 'Freshman', 'Undergraduate'),
(500007, 7, 'Freshman', 'Undergraduate'),
(500008, 8, 'Freshman', 'Undergraduate'),
(500009, 9, 'Freshman', 'Undergraduate'),
(500010, 10, 'Freshman', 'Undergraduate'),
(500011, 11, 'Freshman', 'Undergraduate'),
(500012, 12, 'Freshman', 'Undergraduate'),
(500013, 13, 'Freshman', 'Undergraduate'),
(500014, 14, 'Freshman', 'Undergraduate'),
(500015, 15, 'Freshman', 'Undergraduate'),
(500016, 16, 'Freshman', 'Undergraduate'),
(500017, 17, 'Freshman', 'Undergraduate'),
(500018, 18, 'Freshman', 'Undergraduate'),
(500019, 19, 'Freshman', 'Undergraduate'),
(500020, 20, 'Freshman', 'Undergraduate'),
(500021, 21, 'Freshman', 'Undergraduate'),
(500022, 22, 'Freshman', 'Undergraduate'),
(500023, 23, 'Freshman', 'Undergraduate'),
(500024, 24, 'Freshman', 'Undergraduate'),
(500025, 25, 'Freshman', 'Undergraduate'),
(500026, 26, 'Freshman', 'Undergraduate'),
(500027, 27, 'Freshman', 'Undergraduate'),
(500028, 28, 'Freshman', 'Undergraduate'),
(500029, 29, 'Freshman', 'Undergraduate'),
(500030, 30, 'Freshman', 'Undergraduate'),
(500031, 1, 'Freshman', 'Undergraduate'),
(500032, 2, 'Freshman', 'Undergraduate'),
(500033, 3, 'Freshman', 'Undergraduate'),
(500034, 4, 'Freshman', 'Undergraduate'),
(500035, 5, 'Freshman', 'Undergraduate'),
(500036, 6, 'Freshman', 'Undergraduate'),
(500037, 7, 'Freshman', 'Undergraduate'),
(500038, 8, 'Freshman', 'Undergraduate'),
(500039, 9, 'Freshman', 'Undergraduate'),
(500040, 10, 'Freshman', 'Undergraduate'),
(500041, 11, 'Freshman', 'Undergraduate'),
(500042, 12, 'Freshman', 'Undergraduate'),
(500043, 13, 'Freshman', 'Undergraduate'),
(500044, 14, 'Freshman', 'Undergraduate'),
(500045, 15, 'Freshman', 'Undergraduate'),
(500046, 16, 'Freshman', 'Undergraduate'),
(500047, 17, 'Freshman', 'Undergraduate'),
(500048, 18, 'Freshman', 'Undergraduate'),
(500049, 19, 'Freshman', 'Undergraduate'),
(500050, 20, 'Freshman', 'Undergraduate'),
(500051, 21, 'Freshman', 'Undergraduate'),
(500052, 22, 'Freshman', 'Undergraduate'),
(500053, 23, 'Freshman', 'Undergraduate'),
(500054, 24, 'Freshman', 'Undergraduate'),
(500055, 25, 'Freshman', 'Undergraduate'),
(500056, 26, 'Freshman', 'Undergraduate'),
(500057, 27, 'Freshman', 'Undergraduate'),
(500058, 28, 'Freshman', 'Undergraduate'),
(500059, 29, 'Freshman', 'Undergraduate'),
(500060, 30, 'Freshman', 'Undergraduate'),
(500061, 1, 'Freshman', 'Undergraduate'),
(500062, 2, 'Freshman', 'Undergraduate'),
(500063, 3, 'Freshman', 'Undergraduate'),
(500064, 4, 'Freshman', 'Undergraduate'),
(500065, 5, 'Freshman', 'Undergraduate'),
(500066, 6, 'Freshman', 'Undergraduate'),
(500067, 7, 'Freshman', 'Undergraduate'),
(500068, 8, 'Freshman', 'Undergraduate'),
(500069, 9, 'Freshman', 'Undergraduate'),
(500070, 10, 'Freshman', 'Undergraduate'),
(500071, 11, 'Freshman', 'Undergraduate'),
(500072, 12, 'Freshman', 'Undergraduate'),
(500073, 13, 'Freshman', 'Undergraduate'),
(500074, 14, 'Freshman', 'Undergraduate'),
(500075, 15, 'Freshman', 'Undergraduate'),
(500076, 16, 'Freshman', 'Undergraduate'),
(500077, 17, 'Freshman', 'Undergraduate'),
(500078, 18, 'Freshman', 'Undergraduate'),
(500079, 19, 'Freshman', 'Undergraduate'),
(500080, 20, 'Freshman', 'Undergraduate'),
(500081, 21, 'Freshman', 'Undergraduate'),
(500082, 22, 'Freshman', 'Undergraduate'),
(500083, 23, 'Freshman', 'Undergraduate'),
(500084, 24, 'Freshman', 'Undergraduate'),
(500085, 25, 'Freshman', 'Undergraduate'),
(500086, 26, 'Freshman', 'Undergraduate'),
(500087, 27, 'Freshman', 'Undergraduate'),
(500088, 28, 'Freshman', 'Undergraduate'),
(500089, 29, 'Freshman', 'Undergraduate'),
(500090, 30, 'Freshman', 'Undergraduate'),
(500091, 1, 'Freshman', 'Undergraduate'),
(500092, 2, 'Freshman', 'Undergraduate'),
(500093, 3, 'Freshman', 'Undergraduate'),
(500094, 4, 'Freshman', 'Undergraduate'),
(500095, 5, 'Freshman', 'Undergraduate'),
(500096, 6, 'Freshman', 'Undergraduate'),
(500097, 7, 'Freshman', 'Undergraduate'),
(500098, 8, 'Freshman', 'Undergraduate'),
(500099, 9, 'Freshman', 'Undergraduate'),
(500100, 10, 'Freshman', 'Undergraduate'),
(500101, 11, 'Freshman', 'Undergraduate'),
(500102, 12, 'Freshman', 'Undergraduate'),
(500103, 13, 'Freshman', 'Undergraduate'),
(500104, 14, 'Freshman', 'Undergraduate'),
(500105, 15, 'Freshman', 'Undergraduate'),
(500106, 16, 'Freshman', 'Undergraduate'),
(500107, 17, 'Freshman', 'Undergraduate'),
(500108, 18, 'Freshman', 'Undergraduate'),
(500109, 19, 'Freshman', 'Undergraduate'),
(500110, 20, 'Freshman', 'Undergraduate'),
(500111, 21, 'Freshman', 'Undergraduate'),
(500112, 22, 'Freshman', 'Undergraduate'),
(500113, 23, 'Freshman', 'Undergraduate'),
(500114, 24, 'Freshman', 'Undergraduate'),
(500115, 25, 'Freshman', 'Undergraduate'),
(500116, 26, 'Freshman', 'Undergraduate'),
(500117, 27, 'Freshman', 'Undergraduate'),
(500118, 28, 'Freshman', 'Undergraduate'),
(500119, 29, 'Freshman', 'Undergraduate'),
(500120, 30, 'Freshman', 'Undergraduate'),
(500121, 1, 'Freshman', 'Undergraduate'),
(500122, 2, 'Freshman', 'Undergraduate'),
(500123, 3, 'Freshman', 'Undergraduate'),
(500124, 4, 'Freshman', 'Undergraduate'),
(500125, 5, 'Freshman', 'Undergraduate'),
(500126, 6, 'Freshman', 'Undergraduate'),
(500127, 7, 'Freshman', 'Undergraduate'),
(500128, 8, 'Freshman', 'Undergraduate'),
(500129, 9, 'Freshman', 'Undergraduate'),
(500130, 10, 'Freshman', 'Undergraduate'),
(500131, 11, 'Freshman', 'Undergraduate'),
(500132, 12, 'Freshman', 'Undergraduate'),
(500133, 13, 'Freshman', 'Undergraduate'),
(500134, 14, 'Freshman', 'Undergraduate'),
(500135, 15, 'Freshman', 'Undergraduate'),
(500136, 16, 'Freshman', 'Undergraduate'),
(500137, 17, 'Freshman', 'Undergraduate'),
(500138, 18, 'Freshman', 'Undergraduate'),
(500139, 19, 'Freshman', 'Undergraduate'),
(500140, 20, 'Freshman', 'Undergraduate'),
(500141, 21, 'Freshman', 'Undergraduate'),
(500142, 22, 'Freshman', 'Undergraduate'),
(500143, 23, 'Freshman', 'Undergraduate'),
(500144, 24, 'Freshman', 'Undergraduate'),
(500145, 25, 'Freshman', 'Undergraduate'),
(500146, 26, 'Freshman', 'Undergraduate'),
(500147, 27, 'Freshman', 'Undergraduate'),
(500148, 28, 'Freshman', 'Undergraduate'),
(500149, 29, 'Freshman', 'Undergraduate'),
(500150, 30, 'Freshman', 'Undergraduate'),
(500151, 1, 'Freshman', 'Undergraduate'),
(500152, 2, 'Freshman', 'Undergraduate'),
(500153, 3, 'Freshman', 'Undergraduate'),
(500154, 4, 'Freshman', 'Undergraduate'),
(500155, 5, 'Freshman', 'Undergraduate'),
(500156, 6, 'Freshman', 'Undergraduate'),
(500157, 7, 'Freshman', 'Undergraduate'),
(500158, 8, 'Freshman', 'Undergraduate'),
(500159, 9, 'Freshman', 'Undergraduate'),
(500160, 10, 'Freshman', 'Undergraduate'),
(500161, 11, 'Freshman', 'Undergraduate'),
(500162, 12, 'Freshman', 'Undergraduate'),
(500163, 13, 'Freshman', 'Undergraduate'),
(500164, 14, 'Freshman', 'Undergraduate'),
(500165, 15, 'Freshman', 'Undergraduate'),
(500166, 16, 'Freshman', 'Undergraduate'),
(500167, 17, 'Freshman', 'Undergraduate'),
(500168, 18, 'Freshman', 'Undergraduate'),
(500169, 19, 'Freshman', 'Undergraduate'),
(500170, 20, 'Freshman', 'Undergraduate'),
(500171, 21, 'Freshman', 'Undergraduate'),
(500172, 22, 'Freshman', 'Undergraduate'),
(500173, 23, 'Freshman', 'Undergraduate'),
(500174, 24, 'Freshman', 'Undergraduate'),
(500175, 25, 'Freshman', 'Undergraduate'),
(500176, 26, 'Freshman', 'Undergraduate'),
(500177, 27, 'Freshman', 'Undergraduate'),
(500178, 28, 'Freshman', 'Undergraduate'),
(500179, 29, 'Freshman', 'Undergraduate'),
(500180, 30, 'Freshman', 'Undergraduate'),
(500181, 1, 'Freshman', 'Undergraduate'),
(500182, 2, 'Freshman', 'Undergraduate'),
(500183, 3, 'Freshman', 'Undergraduate'),
(500184, 4, 'Freshman', 'Undergraduate'),
(500185, 5, 'Freshman', 'Undergraduate'),
(500186, 6, 'Freshman', 'Undergraduate'),
(500187, 7, 'Freshman', 'Undergraduate'),
(500188, 8, 'Freshman', 'Undergraduate'),
(500189, 9, 'Freshman', 'Undergraduate'),
(500190, 10, 'Freshman', 'Undergraduate'),
(500191, 11, 'Freshman', 'Undergraduate'),
(500192, 12, 'Freshman', 'Undergraduate'),
(500193, 13, 'Freshman', 'Undergraduate'),
(500194, 14, 'Freshman', 'Undergraduate'),
(500195, 15, 'Freshman', 'Undergraduate'),
(500196, 16, 'Freshman', 'Undergraduate'),
(500197, 17, 'Freshman', 'Undergraduate'),
(500198, 18, 'Freshman', 'Undergraduate'),
(500199, 19, 'Freshman', 'Undergraduate'),
(500200, 20, 'Freshman', 'Undergraduate'),
(500201, 21, 'Sophomore', 'Undergraduate'),
(500202, 22, 'Sophomore', 'Undergraduate'),
(500203, 23, 'Sophomore', 'Undergraduate'),
(500204, 24, 'Sophomore', 'Undergraduate'),
(500205, 25, 'Sophomore', 'Undergraduate'),
(500206, 26, 'Sophomore', 'Undergraduate'),
(500207, 27, 'Sophomore', 'Undergraduate'),
(500208, 28, 'Sophomore', 'Undergraduate'),
(500209, 29, 'Sophomore', 'Undergraduate'),
(500210, 30, 'Sophomore', 'Undergraduate'),
(500211, 1, 'Sophomore', 'Undergraduate'),
(500212, 2, 'Sophomore', 'Undergraduate'),
(500213, 3, 'Sophomore', 'Undergraduate'),
(500214, 4, 'Sophomore', 'Undergraduate'),
(500215, 5, 'Sophomore', 'Undergraduate'),
(500216, 6, 'Sophomore', 'Undergraduate'),
(500217, 7, 'Sophomore', 'Undergraduate'),
(500218, 8, 'Sophomore', 'Undergraduate'),
(500219, 9, 'Sophomore', 'Undergraduate'),
(500220, 10, 'Sophomore', 'Undergraduate'),
(500221, 11, 'Sophomore', 'Undergraduate'),
(500222, 12, 'Sophomore', 'Undergraduate'),
(500223, 13, 'Sophomore', 'Undergraduate'),
(500224, 14, 'Sophomore', 'Undergraduate'),
(500225, 15, 'Sophomore', 'Undergraduate'),
(500226, 16, 'Sophomore', 'Undergraduate'),
(500227, 17, 'Sophomore', 'Undergraduate'),
(500228, 18, 'Sophomore', 'Undergraduate'),
(500229, 19, 'Sophomore', 'Undergraduate'),
(500230, 20, 'Sophomore', 'Undergraduate'),
(500231, 21, 'Sophomore', 'Undergraduate'),
(500232, 22, 'Sophomore', 'Undergraduate'),
(500233, 23, 'Sophomore', 'Undergraduate'),
(500234, 24, 'Sophomore', 'Undergraduate'),
(500235, 25, 'Sophomore', 'Undergraduate'),
(500236, 26, 'Sophomore', 'Undergraduate'),
(500237, 27, 'Sophomore', 'Undergraduate'),
(500238, 28, 'Sophomore', 'Undergraduate'),
(500239, 29, 'Sophomore', 'Undergraduate'),
(500240, 30, 'Sophomore', 'Undergraduate'),
(500241, 1, 'Sophomore', 'Undergraduate'),
(500242, 2, 'Sophomore', 'Undergraduate'),
(500243, 3, 'Sophomore', 'Undergraduate'),
(500244, 4, 'Sophomore', 'Undergraduate'),
(500245, 5, 'Sophomore', 'Undergraduate'),
(500246, 6, 'Sophomore', 'Undergraduate'),
(500247, 7, 'Sophomore', 'Undergraduate'),
(500248, 8, 'Sophomore', 'Undergraduate'),
(500249, 9, 'Sophomore', 'Undergraduate'),
(500250, 10, 'Sophomore', 'Undergraduate'),
(500251, 11, 'Sophomore', 'Undergraduate'),
(500252, 12, 'Sophomore', 'Undergraduate'),
(500253, 13, 'Sophomore', 'Undergraduate'),
(500254, 14, 'Sophomore', 'Undergraduate'),
(500255, 15, 'Sophomore', 'Undergraduate'),
(500256, 16, 'Sophomore', 'Undergraduate'),
(500257, 17, 'Sophomore', 'Undergraduate'),
(500258, 18, 'Sophomore', 'Undergraduate'),
(500259, 19, 'Sophomore', 'Undergraduate'),
(500260, 20, 'Sophomore', 'Undergraduate'),
(500261, 21, 'Sophomore', 'Undergraduate'),
(500262, 22, 'Sophomore', 'Undergraduate'),
(500263, 23, 'Sophomore', 'Undergraduate'),
(500264, 24, 'Sophomore', 'Undergraduate'),
(500265, 25, 'Sophomore', 'Undergraduate'),
(500266, 26, 'Sophomore', 'Undergraduate'),
(500267, 27, 'Sophomore', 'Undergraduate'),
(500268, 28, 'Sophomore', 'Undergraduate'),
(500269, 29, 'Sophomore', 'Undergraduate'),
(500270, 30, 'Sophomore', 'Undergraduate'),
(500271, 1, 'Sophomore', 'Undergraduate'),
(500272, 2, 'Sophomore', 'Undergraduate'),
(500273, 3, 'Sophomore', 'Undergraduate'),
(500274, 4, 'Sophomore', 'Undergraduate'),
(500275, 5, 'Sophomore', 'Undergraduate'),
(500276, 6, 'Sophomore', 'Undergraduate'),
(500277, 7, 'Sophomore', 'Undergraduate'),
(500278, 8, 'Sophomore', 'Undergraduate'),
(500279, 9, 'Sophomore', 'Undergraduate'),
(500280, 10, 'Sophomore', 'Undergraduate'),
(500281, 11, 'Sophomore', 'Undergraduate'),
(500282, 12, 'Sophomore', 'Undergraduate'),
(500283, 13, 'Sophomore', 'Undergraduate'),
(500284, 14, 'Sophomore', 'Undergraduate'),
(500285, 15, 'Sophomore', 'Undergraduate'),
(500286, 16, 'Sophomore', 'Undergraduate'),
(500287, 17, 'Sophomore', 'Undergraduate'),
(500288, 18, 'Sophomore', 'Undergraduate'),
(500289, 19, 'Sophomore', 'Undergraduate'),
(500290, 20, 'Sophomore', 'Undergraduate'),
(500291, 21, 'Sophomore', 'Undergraduate'),
(500292, 22, 'Sophomore', 'Undergraduate'),
(500293, 23, 'Sophomore', 'Undergraduate'),
(500294, 24, 'Sophomore', 'Undergraduate'),
(500295, 25, 'Sophomore', 'Undergraduate'),
(500296, 26, 'Sophomore', 'Undergraduate'),
(500297, 27, 'Sophomore', 'Undergraduate'),
(500298, 28, 'Sophomore', 'Undergraduate'),
(500299, 29, 'Sophomore', 'Undergraduate'),
(500300, 30, 'Sophomore', 'Undergraduate'),
(500301, 1, 'Sophomore', 'Undergraduate'),
(500302, 2, 'Sophomore', 'Undergraduate'),
(500303, 3, 'Sophomore', 'Undergraduate'),
(500304, 4, 'Sophomore', 'Undergraduate'),
(500305, 5, 'Sophomore', 'Undergraduate'),
(500306, 6, 'Sophomore', 'Undergraduate'),
(500307, 7, 'Sophomore', 'Undergraduate'),
(500308, 8, 'Sophomore', 'Undergraduate'),
(500309, 9, 'Sophomore', 'Undergraduate'),
(500310, 10, 'Sophomore', 'Undergraduate'),
(500311, 11, 'Sophomore', 'Undergraduate'),
(500312, 12, 'Sophomore', 'Undergraduate'),
(500313, 13, 'Sophomore', 'Undergraduate'),
(500314, 14, 'Sophomore', 'Undergraduate'),
(500315, 15, 'Sophomore', 'Undergraduate'),
(500316, 16, 'Sophomore', 'Undergraduate'),
(500317, 17, 'Sophomore', 'Undergraduate'),
(500318, 18, 'Sophomore', 'Undergraduate'),
(500319, 19, 'Sophomore', 'Undergraduate'),
(500320, 20, 'Sophomore', 'Undergraduate'),
(500321, 21, 'Sophomore', 'Undergraduate'),
(500322, 22, 'Sophomore', 'Undergraduate'),
(500323, 23, 'Sophomore', 'Undergraduate'),
(500324, 24, 'Sophomore', 'Undergraduate'),
(500325, 25, 'Sophomore', 'Undergraduate'),
(500326, 26, 'Sophomore', 'Undergraduate'),
(500327, 27, 'Sophomore', 'Undergraduate'),
(500328, 28, 'Sophomore', 'Undergraduate'),
(500329, 29, 'Sophomore', 'Undergraduate'),
(500330, 30, 'Sophomore', 'Undergraduate'),
(500331, 1, 'Sophomore', 'Undergraduate'),
(500332, 2, 'Sophomore', 'Undergraduate'),
(500333, 3, 'Sophomore', 'Undergraduate'),
(500334, 4, 'Sophomore', 'Undergraduate'),
(500335, 5, 'Sophomore', 'Undergraduate'),
(500336, 6, 'Sophomore', 'Undergraduate'),
(500337, 7, 'Sophomore', 'Undergraduate'),
(500338, 8, 'Sophomore', 'Undergraduate'),
(500339, 9, 'Sophomore', 'Undergraduate'),
(500340, 10, 'Sophomore', 'Undergraduate'),
(500341, 11, 'Sophomore', 'Undergraduate'),
(500342, 12, 'Sophomore', 'Undergraduate'),
(500343, 13, 'Sophomore', 'Undergraduate'),
(500344, 14, 'Sophomore', 'Undergraduate'),
(500345, 15, 'Sophomore', 'Undergraduate'),
(500346, 16, 'Sophomore', 'Undergraduate'),
(500347, 17, 'Sophomore', 'Undergraduate'),
(500348, 18, 'Sophomore', 'Undergraduate'),
(500349, 19, 'Sophomore', 'Undergraduate'),
(500350, 20, 'Sophomore', 'Undergraduate'),
(500351, 21, 'Sophomore', 'Undergraduate'),
(500352, 22, 'Sophomore', 'Undergraduate'),
(500353, 23, 'Sophomore', 'Undergraduate'),
(500354, 24, 'Sophomore', 'Undergraduate'),
(500355, 25, 'Sophomore', 'Undergraduate'),
(500356, 26, 'Sophomore', 'Undergraduate'),
(500357, 27, 'Sophomore', 'Undergraduate'),
(500358, 28, 'Sophomore', 'Undergraduate'),
(500359, 29, 'Sophomore', 'Undergraduate'),
(500360, 30, 'Sophomore', 'Undergraduate'),
(500361, 1, 'Sophomore', 'Undergraduate'),
(500362, 2, 'Sophomore', 'Undergraduate'),
(500363, 3, 'Sophomore', 'Undergraduate'),
(500364, 4, 'Sophomore', 'Undergraduate'),
(500365, 5, 'Sophomore', 'Undergraduate'),
(500366, 6, 'Sophomore', 'Undergraduate'),
(500367, 7, 'Sophomore', 'Undergraduate'),
(500368, 8, 'Sophomore', 'Undergraduate'),
(500369, 9, 'Sophomore', 'Undergraduate'),
(500370, 10, 'Sophomore', 'Undergraduate'),
(500371, 11, 'Sophomore', 'Undergraduate'),
(500372, 12, 'Sophomore', 'Undergraduate'),
(500373, 13, 'Sophomore', 'Undergraduate'),
(500374, 14, 'Sophomore', 'Undergraduate'),
(500375, 15, 'Sophomore', 'Undergraduate'),
(500376, 16, 'Sophomore', 'Undergraduate'),
(500377, 17, 'Sophomore', 'Undergraduate'),
(500378, 18, 'Sophomore', 'Undergraduate'),
(500379, 19, 'Sophomore', 'Undergraduate'),
(500380, 20, 'Sophomore', 'Undergraduate'),
(500381, 21, 'Sophomore', 'Undergraduate'),
(500382, 22, 'Sophomore', 'Undergraduate'),
(500383, 23, 'Sophomore', 'Undergraduate'),
(500384, 24, 'Sophomore', 'Undergraduate'),
(500385, 25, 'Sophomore', 'Undergraduate'),
(500386, 26, 'Sophomore', 'Undergraduate'),
(500387, 27, 'Sophomore', 'Undergraduate'),
(500388, 28, 'Sophomore', 'Undergraduate'),
(500389, 29, 'Sophomore', 'Undergraduate'),
(500390, 30, 'Sophomore', 'Undergraduate'),
(500391, 1, 'Sophomore', 'Undergraduate'),
(500392, 2, 'Sophomore', 'Undergraduate'),
(500393, 3, 'Sophomore', 'Undergraduate'),
(500394, 4, 'Sophomore', 'Undergraduate'),
(500395, 5, 'Sophomore', 'Undergraduate'),
(500396, 6, 'Sophomore', 'Undergraduate'),
(500397, 7, 'Sophomore', 'Undergraduate'),
(500398, 8, 'Sophomore', 'Undergraduate'),
(500399, 9, 'Sophomore', 'Undergraduate'),
(500400, 10, 'Sophomore', 'Undergraduate'),
(500401, 11, 'Junior', 'Undergraduate'),
(500402, 12, 'Junior', 'Undergraduate'),
(500403, 13, 'Junior', 'Undergraduate'),
(500404, 14, 'Junior', 'Undergraduate'),
(500405, 15, 'Junior', 'Undergraduate'),
(500406, 16, 'Junior', 'Undergraduate'),
(500407, 17, 'Junior', 'Undergraduate'),
(500408, 18, 'Junior', 'Undergraduate'),
(500409, 19, 'Junior', 'Undergraduate'),
(500410, 20, 'Junior', 'Undergraduate'),
(500411, 21, 'Junior', 'Undergraduate'),
(500412, 22, 'Junior', 'Undergraduate'),
(500413, 23, 'Junior', 'Undergraduate'),
(500414, 24, 'Junior', 'Undergraduate'),
(500415, 25, 'Junior', 'Undergraduate'),
(500416, 26, 'Junior', 'Undergraduate'),
(500417, 27, 'Junior', 'Undergraduate'),
(500418, 28, 'Junior', 'Undergraduate'),
(500419, 29, 'Junior', 'Undergraduate'),
(500420, 30, 'Junior', 'Undergraduate'),
(500421, 1, 'Junior', 'Undergraduate'),
(500422, 2, 'Junior', 'Undergraduate'),
(500423, 3, 'Junior', 'Undergraduate'),
(500424, 4, 'Junior', 'Undergraduate'),
(500425, 5, 'Junior', 'Undergraduate'),
(500426, 6, 'Junior', 'Undergraduate'),
(500427, 7, 'Junior', 'Undergraduate'),
(500428, 8, 'Junior', 'Undergraduate'),
(500429, 9, 'Junior', 'Undergraduate'),
(500430, 10, 'Junior', 'Undergraduate'),
(500431, 11, 'Junior', 'Undergraduate'),
(500432, 12, 'Junior', 'Undergraduate'),
(500433, 13, 'Junior', 'Undergraduate'),
(500434, 14, 'Junior', 'Undergraduate'),
(500435, 15, 'Junior', 'Undergraduate'),
(500436, 16, 'Junior', 'Undergraduate'),
(500437, 17, 'Junior', 'Undergraduate'),
(500438, 18, 'Junior', 'Undergraduate'),
(500439, 19, 'Junior', 'Undergraduate'),
(500440, 20, 'Junior', 'Undergraduate'),
(500441, 21, 'Junior', 'Undergraduate'),
(500442, 22, 'Junior', 'Undergraduate'),
(500443, 23, 'Junior', 'Undergraduate'),
(500444, 24, 'Junior', 'Undergraduate'),
(500445, 25, 'Junior', 'Undergraduate'),
(500446, 26, 'Junior', 'Undergraduate'),
(500447, 27, 'Junior', 'Undergraduate'),
(500448, 28, 'Junior', 'Undergraduate'),
(500449, 29, 'Junior', 'Undergraduate'),
(500450, 30, 'Junior', 'Undergraduate'),
(500451, 1, 'Junior', 'Undergraduate'),
(500452, 2, 'Junior', 'Undergraduate'),
(500453, 3, 'Junior', 'Undergraduate'),
(500454, 4, 'Junior', 'Undergraduate'),
(500455, 5, 'Junior', 'Undergraduate'),
(500456, 6, 'Junior', 'Undergraduate'),
(500457, 7, 'Junior', 'Undergraduate'),
(500458, 8, 'Junior', 'Undergraduate'),
(500459, 9, 'Junior', 'Undergraduate'),
(500460, 10, 'Junior', 'Undergraduate'),
(500461, 11, 'Junior', 'Undergraduate'),
(500462, 12, 'Junior', 'Undergraduate'),
(500463, 13, 'Junior', 'Undergraduate'),
(500464, 14, 'Junior', 'Undergraduate'),
(500465, 15, 'Junior', 'Undergraduate'),
(500466, 16, 'Junior', 'Undergraduate'),
(500467, 17, 'Junior', 'Undergraduate'),
(500468, 18, 'Junior', 'Undergraduate'),
(500469, 19, 'Junior', 'Undergraduate'),
(500470, 20, 'Junior', 'Undergraduate'),
(500471, 21, 'Junior', 'Undergraduate'),
(500472, 22, 'Junior', 'Undergraduate'),
(500473, 23, 'Junior', 'Undergraduate'),
(500474, 24, 'Junior', 'Undergraduate'),
(500475, 25, 'Junior', 'Undergraduate'),
(500476, 26, 'Junior', 'Undergraduate'),
(500477, 27, 'Junior', 'Undergraduate'),
(500478, 28, 'Junior', 'Undergraduate'),
(500479, 29, 'Junior', 'Undergraduate'),
(500480, 30, 'Junior', 'Undergraduate'),
(500481, 1, 'Junior', 'Undergraduate'),
(500482, 2, 'Junior', 'Undergraduate'),
(500483, 3, 'Junior', 'Undergraduate'),
(500484, 4, 'Junior', 'Undergraduate'),
(500485, 5, 'Junior', 'Undergraduate'),
(500486, 6, 'Junior', 'Undergraduate'),
(500487, 7, 'Junior', 'Undergraduate'),
(500488, 8, 'Junior', 'Undergraduate'),
(500489, 9, 'Junior', 'Undergraduate'),
(500490, 10, 'Junior', 'Undergraduate'),
(500491, 11, 'Junior', 'Undergraduate'),
(500492, 12, 'Junior', 'Undergraduate'),
(500493, 13, 'Junior', 'Undergraduate'),
(500494, 14, 'Junior', 'Undergraduate'),
(500495, 15, 'Junior', 'Undergraduate'),
(500496, 16, 'Junior', 'Undergraduate'),
(500497, 17, 'Junior', 'Undergraduate'),
(500498, 18, 'Junior', 'Undergraduate'),
(500499, 19, 'Junior', 'Undergraduate'),
(500500, 20, 'Junior', 'Undergraduate'),
(500501, 21, 'Junior', 'Undergraduate'),
(500502, 22, 'Junior', 'Undergraduate'),
(500503, 23, 'Junior', 'Undergraduate'),
(500504, 24, 'Junior', 'Undergraduate'),
(500505, 25, 'Junior', 'Undergraduate'),
(500506, 26, 'Junior', 'Undergraduate'),
(500507, 27, 'Junior', 'Undergraduate'),
(500508, 28, 'Junior', 'Undergraduate'),
(500509, 29, 'Junior', 'Undergraduate'),
(500510, 30, 'Junior', 'Undergraduate'),
(500511, 1, 'Junior', 'Undergraduate'),
(500512, 2, 'Junior', 'Undergraduate'),
(500513, 3, 'Junior', 'Undergraduate'),
(500514, 4, 'Junior', 'Undergraduate'),
(500515, 5, 'Junior', 'Undergraduate'),
(500516, 6, 'Junior', 'Undergraduate'),
(500517, 7, 'Junior', 'Undergraduate'),
(500518, 8, 'Junior', 'Undergraduate'),
(500519, 9, 'Junior', 'Undergraduate'),
(500520, 10, 'Junior', 'Undergraduate'),
(500521, 11, 'Junior', 'Undergraduate'),
(500522, 12, 'Junior', 'Undergraduate'),
(500523, 13, 'Junior', 'Undergraduate'),
(500524, 14, 'Junior', 'Undergraduate'),
(500525, 15, 'Junior', 'Undergraduate'),
(500526, 16, 'Junior', 'Undergraduate'),
(500527, 17, 'Junior', 'Undergraduate'),
(500528, 18, 'Junior', 'Undergraduate'),
(500529, 19, 'Junior', 'Undergraduate'),
(500530, 20, 'Junior', 'Undergraduate'),
(500531, 21, 'Junior', 'Undergraduate'),
(500532, 22, 'Junior', 'Undergraduate'),
(500533, 23, 'Junior', 'Undergraduate'),
(500534, 24, 'Junior', 'Undergraduate'),
(500535, 25, 'Junior', 'Undergraduate'),
(500536, 26, 'Junior', 'Undergraduate'),
(500537, 27, 'Junior', 'Undergraduate'),
(500538, 28, 'Junior', 'Undergraduate'),
(500539, 29, 'Junior', 'Undergraduate'),
(500540, 30, 'Junior', 'Undergraduate'),
(500541, 1, 'Junior', 'Undergraduate'),
(500542, 2, 'Junior', 'Undergraduate'),
(500543, 3, 'Junior', 'Undergraduate'),
(500544, 4, 'Junior', 'Undergraduate'),
(500545, 5, 'Junior', 'Undergraduate'),
(500546, 6, 'Junior', 'Undergraduate'),
(500547, 7, 'Junior', 'Undergraduate'),
(500548, 8, 'Junior', 'Undergraduate'),
(500549, 9, 'Junior', 'Undergraduate'),
(500550, 10, 'Junior', 'Undergraduate'),
(500551, 11, 'Junior', 'Undergraduate'),
(500552, 12, 'Junior', 'Undergraduate'),
(500553, 13, 'Junior', 'Undergraduate'),
(500554, 14, 'Junior', 'Undergraduate'),
(500555, 15, 'Junior', 'Undergraduate'),
(500556, 16, 'Junior', 'Undergraduate'),
(500557, 17, 'Junior', 'Undergraduate'),
(500558, 18, 'Junior', 'Undergraduate'),
(500559, 19, 'Junior', 'Undergraduate'),
(500560, 20, 'Junior', 'Undergraduate'),
(500561, 21, 'Junior', 'Undergraduate'),
(500562, 22, 'Junior', 'Undergraduate'),
(500563, 23, 'Junior', 'Undergraduate'),
(500564, 24, 'Junior', 'Undergraduate'),
(500565, 25, 'Junior', 'Undergraduate'),
(500566, 26, 'Junior', 'Undergraduate'),
(500567, 27, 'Junior', 'Undergraduate'),
(500568, 28, 'Junior', 'Undergraduate'),
(500569, 29, 'Junior', 'Undergraduate'),
(500570, 30, 'Junior', 'Undergraduate'),
(500571, 1, 'Junior', 'Undergraduate'),
(500572, 2, 'Junior', 'Undergraduate'),
(500573, 3, 'Junior', 'Undergraduate'),
(500574, 4, 'Junior', 'Undergraduate'),
(500575, 5, 'Junior', 'Undergraduate'),
(500576, 6, 'Junior', 'Undergraduate'),
(500577, 7, 'Junior', 'Undergraduate'),
(500578, 8, 'Junior', 'Undergraduate'),
(500579, 9, 'Junior', 'Undergraduate'),
(500580, 10, 'Junior', 'Undergraduate'),
(500581, 11, 'Junior', 'Undergraduate'),
(500582, 12, 'Junior', 'Undergraduate'),
(500583, 13, 'Junior', 'Undergraduate'),
(500584, 14, 'Junior', 'Undergraduate'),
(500585, 15, 'Junior', 'Undergraduate'),
(500586, 16, 'Junior', 'Undergraduate'),
(500587, 17, 'Junior', 'Undergraduate'),
(500588, 18, 'Junior', 'Undergraduate'),
(500589, 19, 'Junior', 'Undergraduate'),
(500590, 20, 'Junior', 'Undergraduate'),
(500591, 21, 'Junior', 'Undergraduate'),
(500592, 22, 'Junior', 'Undergraduate'),
(500593, 23, 'Junior', 'Undergraduate'),
(500594, 24, 'Junior', 'Undergraduate'),
(500595, 25, 'Junior', 'Undergraduate'),
(500596, 26, 'Junior', 'Undergraduate'),
(500597, 27, 'Junior', 'Undergraduate'),
(500598, 28, 'Junior', 'Undergraduate'),
(500599, 29, 'Junior', 'Undergraduate'),
(500600, 30, 'Junior', 'Undergraduate'),
(500601, 1, 'Senior', 'Undergraduate'),
(500602, 2, 'Senior', 'Undergraduate'),
(500603, 3, 'Senior', 'Undergraduate'),
(500604, 4, 'Senior', 'Undergraduate'),
(500605, 5, 'Senior', 'Undergraduate'),
(500606, 6, 'Senior', 'Undergraduate'),
(500607, 7, 'Senior', 'Undergraduate'),
(500608, 8, 'Senior', 'Undergraduate'),
(500609, 9, 'Senior', 'Undergraduate'),
(500610, 10, 'Senior', 'Undergraduate'),
(500611, 11, 'Senior', 'Undergraduate'),
(500612, 12, 'Senior', 'Undergraduate'),
(500613, 13, 'Senior', 'Undergraduate'),
(500614, 14, 'Senior', 'Undergraduate'),
(500615, 15, 'Senior', 'Undergraduate'),
(500616, 16, 'Senior', 'Undergraduate'),
(500617, 17, 'Senior', 'Undergraduate'),
(500618, 18, 'Senior', 'Undergraduate'),
(500619, 19, 'Senior', 'Undergraduate'),
(500620, 20, 'Senior', 'Undergraduate'),
(500621, 21, 'Senior', 'Undergraduate'),
(500622, 22, 'Senior', 'Undergraduate'),
(500623, 23, 'Senior', 'Undergraduate'),
(500624, 24, 'Senior', 'Undergraduate'),
(500625, 25, 'Senior', 'Undergraduate'),
(500626, 26, 'Senior', 'Undergraduate'),
(500627, 27, 'Senior', 'Undergraduate'),
(500628, 28, 'Senior', 'Undergraduate'),
(500629, 29, 'Senior', 'Undergraduate'),
(500630, 30, 'Senior', 'Undergraduate'),
(500631, 1, 'Senior', 'Undergraduate'),
(500632, 2, 'Senior', 'Undergraduate'),
(500633, 3, 'Senior', 'Undergraduate'),
(500634, 4, 'Senior', 'Undergraduate'),
(500635, 5, 'Senior', 'Undergraduate'),
(500636, 6, 'Senior', 'Undergraduate'),
(500637, 7, 'Senior', 'Undergraduate'),
(500638, 8, 'Senior', 'Undergraduate'),
(500639, 9, 'Senior', 'Undergraduate'),
(500640, 10, 'Senior', 'Undergraduate'),
(500641, 11, 'Senior', 'Undergraduate'),
(500642, 12, 'Senior', 'Undergraduate'),
(500643, 13, 'Senior', 'Undergraduate'),
(500644, 14, 'Senior', 'Undergraduate'),
(500645, 15, 'Senior', 'Undergraduate'),
(500646, 16, 'Senior', 'Undergraduate'),
(500647, 17, 'Senior', 'Undergraduate'),
(500648, 18, 'Senior', 'Undergraduate'),
(500649, 19, 'Senior', 'Undergraduate'),
(500650, 20, 'Senior', 'Undergraduate'),
(500651, 21, 'Senior', 'Undergraduate'),
(500652, 22, 'Senior', 'Undergraduate'),
(500653, 23, 'Senior', 'Undergraduate'),
(500654, 24, 'Senior', 'Undergraduate'),
(500655, 25, 'Senior', 'Undergraduate'),
(500656, 26, 'Senior', 'Undergraduate'),
(500657, 27, 'Senior', 'Undergraduate'),
(500658, 28, 'Senior', 'Undergraduate'),
(500659, 29, 'Senior', 'Undergraduate'),
(500660, 30, 'Senior', 'Undergraduate'),
(500661, 1, 'Senior', 'Undergraduate'),
(500662, 2, 'Senior', 'Undergraduate'),
(500663, 3, 'Senior', 'Undergraduate'),
(500664, 4, 'Senior', 'Undergraduate'),
(500665, 5, 'Senior', 'Undergraduate'),
(500666, 6, 'Senior', 'Undergraduate'),
(500667, 7, 'Senior', 'Undergraduate'),
(500668, 8, 'Senior', 'Undergraduate'),
(500669, 9, 'Senior', 'Undergraduate'),
(500670, 10, 'Senior', 'Undergraduate'),
(500671, 11, 'Senior', 'Undergraduate'),
(500672, 12, 'Senior', 'Undergraduate'),
(500673, 13, 'Senior', 'Undergraduate'),
(500674, 14, 'Senior', 'Undergraduate'),
(500675, 15, 'Senior', 'Undergraduate'),
(500676, 16, 'Senior', 'Undergraduate'),
(500677, 17, 'Senior', 'Undergraduate'),
(500678, 18, 'Senior', 'Undergraduate'),
(500679, 19, 'Senior', 'Undergraduate'),
(500680, 20, 'Senior', 'Undergraduate'),
(500681, 21, 'Senior', 'Undergraduate'),
(500682, 22, 'Senior', 'Undergraduate'),
(500683, 23, 'Senior', 'Undergraduate'),
(500684, 24, 'Senior', 'Undergraduate'),
(500685, 25, 'Senior', 'Undergraduate'),
(500686, 26, 'Senior', 'Undergraduate'),
(500687, 27, 'Senior', 'Undergraduate'),
(500688, 28, 'Senior', 'Undergraduate'),
(500689, 29, 'Senior', 'Undergraduate'),
(500690, 30, 'Senior', 'Undergraduate'),
(500691, 1, 'Senior', 'Undergraduate'),
(500692, 2, 'Senior', 'Undergraduate'),
(500693, 3, 'Senior', 'Undergraduate'),
(500694, 4, 'Senior', 'Undergraduate'),
(500695, 5, 'Senior', 'Undergraduate'),
(500696, 6, 'Senior', 'Undergraduate'),
(500697, 7, 'Senior', 'Undergraduate'),
(500698, 8, 'Senior', 'Undergraduate'),
(500699, 9, 'Senior', 'Undergraduate'),
(500700, 10, 'Senior', 'Undergraduate'),
(500701, 11, 'Senior', 'Undergraduate'),
(500702, 12, 'Senior', 'Undergraduate'),
(500703, 13, 'Senior', 'Undergraduate'),
(500704, 14, 'Senior', 'Undergraduate'),
(500705, 15, 'Senior', 'Undergraduate'),
(500706, 16, 'Senior', 'Undergraduate'),
(500707, 17, 'Senior', 'Undergraduate'),
(500708, 18, 'Senior', 'Undergraduate'),
(500709, 19, 'Senior', 'Undergraduate'),
(500710, 20, 'Senior', 'Undergraduate'),
(500711, 21, 'Senior', 'Undergraduate'),
(500712, 22, 'Senior', 'Undergraduate'),
(500713, 23, 'Senior', 'Undergraduate'),
(500714, 24, 'Senior', 'Undergraduate'),
(500715, 25, 'Senior', 'Undergraduate'),
(500716, 26, 'Senior', 'Undergraduate'),
(500717, 27, 'Senior', 'Undergraduate'),
(500718, 28, 'Senior', 'Undergraduate'),
(500719, 29, 'Senior', 'Undergraduate'),
(500720, 30, 'Senior', 'Undergraduate'),
(500721, 1, 'Senior', 'Undergraduate'),
(500722, 2, 'Senior', 'Undergraduate'),
(500723, 3, 'Senior', 'Undergraduate'),
(500724, 4, 'Senior', 'Undergraduate'),
(500725, 5, 'Senior', 'Undergraduate'),
(500726, 6, 'Senior', 'Undergraduate'),
(500727, 7, 'Senior', 'Undergraduate'),
(500728, 8, 'Senior', 'Undergraduate'),
(500729, 9, 'Senior', 'Undergraduate'),
(500730, 10, 'Senior', 'Undergraduate'),
(500731, 11, 'Senior', 'Undergraduate'),
(500732, 12, 'Senior', 'Undergraduate'),
(500733, 13, 'Senior', 'Undergraduate'),
(500734, 14, 'Senior', 'Undergraduate'),
(500735, 15, 'Senior', 'Undergraduate'),
(500736, 16, 'Senior', 'Undergraduate'),
(500737, 17, 'Senior', 'Undergraduate'),
(500738, 18, 'Senior', 'Undergraduate'),
(500739, 19, 'Senior', 'Undergraduate'),
(500740, 20, 'Senior', 'Undergraduate'),
(500741, 21, 'Senior', 'Undergraduate'),
(500742, 22, 'Senior', 'Undergraduate'),
(500743, 23, 'Senior', 'Undergraduate'),
(500744, 24, 'Senior', 'Undergraduate'),
(500745, 25, 'Senior', 'Undergraduate'),
(500746, 26, 'Senior', 'Undergraduate'),
(500747, 27, 'Senior', 'Undergraduate'),
(500748, 28, 'Senior', 'Undergraduate'),
(500749, 29, 'Senior', 'Undergraduate'),
(500750, 30, 'Senior', 'Undergraduate'),
(500751, 1, 'Senior', 'Undergraduate'),
(500752, 2, 'Senior', 'Undergraduate'),
(500753, 3, 'Senior', 'Undergraduate'),
(500754, 4, 'Senior', 'Undergraduate'),
(500755, 5, 'Senior', 'Undergraduate'),
(500756, 6, 'Senior', 'Undergraduate'),
(500757, 7, 'Senior', 'Undergraduate'),
(500758, 8, 'Senior', 'Undergraduate'),
(500759, 9, 'Senior', 'Undergraduate'),
(500760, 10, 'Senior', 'Undergraduate'),
(500761, 11, 'Senior', 'Undergraduate'),
(500762, 12, 'Senior', 'Undergraduate'),
(500763, 13, 'Senior', 'Undergraduate'),
(500764, 14, 'Senior', 'Undergraduate'),
(500765, 15, 'Senior', 'Undergraduate'),
(500766, 16, 'Senior', 'Undergraduate'),
(500767, 17, 'Senior', 'Undergraduate'),
(500768, 18, 'Senior', 'Undergraduate'),
(500769, 19, 'Senior', 'Undergraduate'),
(500770, 20, 'Senior', 'Undergraduate'),
(500771, 21, 'Senior', 'Undergraduate'),
(500772, 22, 'Senior', 'Undergraduate'),
(500773, 23, 'Senior', 'Undergraduate'),
(500774, 24, 'Senior', 'Undergraduate'),
(500775, 25, 'Senior', 'Undergraduate'),
(500776, 26, 'Senior', 'Undergraduate'),
(500777, 27, 'Senior', 'Undergraduate'),
(500778, 28, 'Senior', 'Undergraduate'),
(500779, 29, 'Senior', 'Undergraduate'),
(500780, 30, 'Senior', 'Undergraduate'),
(500781, 1, 'Senior', 'Undergraduate'),
(500782, 2, 'Senior', 'Undergraduate'),
(500783, 3, 'Senior', 'Undergraduate'),
(500784, 4, 'Senior', 'Undergraduate'),
(500785, 5, 'Senior', 'Undergraduate'),
(500786, 6, 'Senior', 'Undergraduate'),
(500787, 7, 'Senior', 'Undergraduate'),
(500788, 8, 'Senior', 'Undergraduate'),
(500789, 9, 'Senior', 'Undergraduate'),
(500790, 10, 'Senior', 'Undergraduate'),
(500791, 11, 'Senior', 'Undergraduate'),
(500792, 12, 'Senior', 'Undergraduate'),
(500793, 13, 'Senior', 'Undergraduate'),
(500794, 14, 'Senior', 'Undergraduate'),
(500795, 15, 'Senior', 'Undergraduate'),
(500796, 16, 'Senior', 'Undergraduate'),
(500797, 17, 'Senior', 'Undergraduate'),
(500798, 18, 'Senior', 'Undergraduate'),
(500799, 19, 'Senior', 'Undergraduate'),
(500800, 20, 'Senior', 'Undergraduate'),
(500801, 21, 'First', 'PHD'),
(500802, 22, 'Second', 'PHD'),
(500803, 23, 'Third', 'PHD'),
(500804, 24, 'Fourth', 'PHD'),
(500805, 25, 'First', 'PHD'),
(500806, 26, 'Second', 'PHD'),
(500807, 27, 'Third', 'PHD'),
(500808, 28, 'Fourth', 'PHD'),
(500809, 29, 'First', 'PHD'),
(500810, 30, 'Second', 'PHD'),
(500811, 1, 'Third', 'PHD'),
(500812, 2, 'Fourth', 'PHD'),
(500813, 3, 'First', 'PHD'),
(500814, 4, 'Second', 'PHD'),
(500815, 5, 'Third', 'PHD'),
(500816, 6, 'Fourth', 'PHD'),
(500817, 7, 'First', 'PHD'),
(500818, 8, 'Second', 'PHD'),
(500819, 9, 'Third', 'PHD'),
(500820, 10, 'Fourth', 'PHD'),
(500821, 11, 'First', 'PHD'),
(500822, 12, 'Second', 'PHD'),
(500823, 13, 'Third', 'PHD'),
(500824, 14, 'Fourth', 'PHD'),
(500825, 15, 'First', 'PHD'),
(500826, 16, 'Second', 'PHD'),
(500827, 17, 'Third', 'PHD'),
(500828, 18, 'Fourth', 'PHD'),
(500829, 19, 'First', 'PHD'),
(500830, 20, 'Second', 'PHD'),
(500831, 21, 'Third', 'PHD'),
(500832, 22, 'Fourth', 'PHD'),
(500833, 23, 'First', 'PHD'),
(500834, 24, 'Second', 'PHD'),
(500835, 25, 'Third', 'PHD'),
(500836, 26, 'Fourth', 'PHD'),
(500837, 27, 'First', 'PHD'),
(500838, 28, 'Second', 'PHD'),
(500839, 29, 'Third', 'PHD'),
(500840, 30, 'Fourth', 'PHD'),
(500841, 1, 'First', 'PHD'),
(500842, 2, 'Second', 'PHD'),
(500843, 3, 'Third', 'PHD'),
(500844, 4, 'Fourth', 'PHD'),
(500845, 5, 'First', 'PHD'),
(500846, 6, 'Second', 'PHD'),
(500847, 7, 'Third', 'PHD'),
(500848, 8, 'Fourth', 'PHD'),
(500849, 9, 'First', 'PHD'),
(500850, 10, 'Second', 'Masters'),
(500851, 11, 'Third', 'Masters'),
(500852, 12, 'Fourth', 'Masters'),
(500853, 13, 'First', 'Masters'),
(500854, 14, 'Second', 'Masters'),
(500855, 15, 'Third', 'Masters'),
(500856, 16, 'Fourth', 'Masters'),
(500857, 17, 'First', 'Masters'),
(500858, 18, 'Second', 'Masters'),
(500859, 19, 'Third', 'Masters'),
(500860, 20, 'Fourth', 'Masters'),
(500861, 21, 'First', 'Masters'),
(500862, 22, 'Second', 'Masters'),
(500863, 23, 'Third', 'Masters'),
(500864, 24, 'Fourth', 'Masters'),
(500865, 25, 'First', 'Masters'),
(500866, 26, 'Second', 'Masters'),
(500867, 27, 'Third', 'Masters'),
(500868, 28, 'Fourth', 'Masters'),
(500869, 29, 'First', 'Masters'),
(500870, 30, 'Second', 'Masters'),
(500871, 1, 'Third', 'Masters'),
(500872, 2, 'Fourth', 'Masters'),
(500873, 3, 'First', 'Masters'),
(500874, 4, 'Second', 'Masters'),
(500875, 5, 'Third', 'Masters'),
(500876, 6, 'Fourth', 'Masters'),
(500877, 7, 'First', 'Masters'),
(500878, 8, 'Second', 'Masters'),
(500879, 9, 'Third', 'Masters'),
(500880, 10, 'Fourth', 'Masters'),
(500881, 11, 'First', 'Masters'),
(500882, 12, 'Second', 'Masters'),
(500883, 13, 'Third', 'Masters'),
(500884, 14, 'Fourth', 'Masters'),
(500885, 15, 'First', 'Masters'),
(500886, 16, 'Second', 'Masters'),
(500887, 17, 'Third', 'Masters'),
(500888, 18, 'Fourth', 'Masters'),
(500889, 19, 'First', 'Masters'),
(500890, 20, 'Second', 'Masters'),
(500891, 21, 'Third', 'Masters'),
(500892, 22, 'Fourth', 'Masters'),
(500893, 23, 'First', 'Masters'),
(500894, 24, 'Second', 'Masters'),
(500895, 25, 'Third', 'Masters'),
(500896, 26, 'Fourth', 'Masters'),
(500897, 27, 'First', 'Masters'),
(500898, 28, 'Second', 'Masters'),
(500899, 29, 'Third', 'Masters'),
(500900, 30, 'Fourth', 'Masters'),
(500901, 1, 'First', 'Masters'),
(500902, 2, 'Second', 'Masters'),
(500903, 3, 'Third', 'Masters'),
(500904, 4, 'Fourth', 'Masters'),
(500905, 5, 'First', 'Masters'),
(500906, 6, 'Second', 'Masters'),
(500907, 7, 'Third', 'Masters'),
(500908, 8, 'Fourth', 'Masters'),
(500909, 9, 'First', 'Masters'),
(500910, 10, 'Second', 'Masters'),
(500911, 11, 'Third', 'Masters'),
(500912, 12, 'Fourth', 'Masters'),
(500913, 13, 'First', 'Masters'),
(500914, 14, 'Second', 'Masters'),
(500915, 15, 'Third', 'Masters'),
(500916, 16, 'Fourth', 'Masters'),
(500917, 17, 'First', 'Masters'),
(500918, 18, 'Second', 'Masters'),
(500919, 19, 'Third', 'Masters'),
(500920, 20, 'Fourth', 'Masters'),
(500921, 21, 'First', 'Masters'),
(500922, 22, 'Second', 'Masters'),
(500923, 23, 'Third', 'Masters'),
(500924, 24, 'Fourth', 'Masters'),
(500925, 25, 'First', 'Masters'),
(500926, 26, 'Second', 'Masters'),
(500927, 27, 'Third', 'Masters'),
(500928, 28, 'Fourth', 'Masters'),
(500929, 29, 'First', 'Masters'),
(500930, 30, 'Second', 'Masters'),
(500931, 1, 'Third', 'Masters'),
(500932, 2, 'Fourth', 'Masters'),
(500933, 3, 'First', 'Masters'),
(500934, 4, 'Second', 'Masters'),
(500935, 5, 'Third', 'Masters'),
(500936, 6, 'Fourth', 'Masters'),
(500937, 7, 'First', 'Masters'),
(500938, 8, 'Second', 'Masters'),
(500939, 9, 'Third', 'Masters'),
(500940, 10, 'Fourth', 'Masters'),
(500941, 11, 'First', 'Masters'),
(500942, 12, 'Second', 'Masters'),
(500943, 13, 'Third', 'Masters'),
(500944, 14, 'Fourth', 'Masters'),
(500945, 15, 'First', 'Masters'),
(500946, 16, 'Second', 'Masters'),
(500947, 17, 'Third', 'Masters'),
(500948, 18, 'Fourth', 'Masters'),
(500949, 19, 'First', 'Masters'),
(500950, 20, 'Second', 'Masters'),
(500951, 21, 'Third', 'Masters'),
(500952, 22, 'Fourth', 'Masters'),
(500953, 23, 'First', 'Masters'),
(500954, 24, 'Second', 'Masters'),
(500955, 25, 'Third', 'Masters'),
(500956, 26, 'Fourth', 'Masters'),
(500957, 27, 'First', 'Masters'),
(500958, 28, 'Second', 'Masters'),
(500959, 29, 'Third', 'Masters'),
(500960, 30, 'Fourth', 'Masters'),
(500961, 1, 'First', 'Masters'),
(500962, 2, 'Second', 'Masters'),
(500963, 3, 'Third', 'Masters'),
(500964, 4, 'Fourth', 'Masters'),
(500965, 5, 'First', 'Masters'),
(500966, 6, 'Second', 'Masters'),
(500967, 7, 'Third', 'Masters'),
(500968, 8, 'Fourth', 'Masters'),
(500969, 9, 'First', 'Masters'),
(500970, 10, 'Second', 'Masters'),
(500971, 11, 'Third', 'Masters'),
(500972, 12, 'Fourth', 'Masters'),
(500973, 13, 'First', 'Masters'),
(500974, 14, 'Second', 'Masters'),
(500975, 15, 'Third', 'Masters'),
(500976, 16, 'Fourth', 'Masters'),
(500977, 17, 'First', 'Masters'),
(500978, 18, 'Second', 'Masters'),
(500979, 19, 'Third', 'Masters'),
(500980, 20, 'Fourth', 'Masters'),
(500981, 21, 'First', 'Masters'),
(500982, 22, 'Second', 'Masters'),
(500983, 23, 'Third', 'Masters'),
(500984, 24, 'Fourth', 'Masters'),
(500985, 25, 'First', 'Masters'),
(500986, 26, 'Second', 'Masters'),
(500987, 27, 'Third', 'Masters'),
(500988, 28, 'Fourth', 'Masters'),
(500989, 29, 'First', 'Masters'),
(500990, 30, 'Second', 'Masters'),
(500991, 1, 'Third', 'Masters'),
(500992, 2, 'Fourth', 'Masters'),
(500993, 3, 'First', 'Masters'),
(500994, 4, 'Second', 'Masters'),
(500995, 5, 'Third', 'Masters'),
(500996, 6, 'Fourth', 'Masters'),
(500997, 7, 'First', 'Masters'),
(500998, 8, 'Second', 'Masters'),
(500999, 9, 'Third', 'Masters'),
(501000, 10, 'Fourth', 'Masters');

-- --------------------------------------------------------

--
-- Table structure for table `studenthistory`
--

CREATE TABLE `studenthistory` (
  `StudentID` int(11) NOT NULL,
  `CRN` int(11) NOT NULL,
  `CourseID` varchar(25) DEFAULT NULL,
  `SemesterID` int(11) DEFAULT NULL,
  `Grade` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studentmajor`
--

CREATE TABLE `studentmajor` (
  `MajorID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studentminor`
--

CREATE TABLE `studentminor` (
  `MinorID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `TimeSlotID` varchar(100) NOT NULL,
  `DayID` int(11) DEFAULT NULL,
  `PeriodID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`TimeSlotID`, `DayID`, `PeriodID`) VALUES
('10Fri', 5, 10),
('10Mon', 1, 10),
('10Thu', 4, 10),
('10Tues', 2, 10),
('10Wed', 3, 10),
('11Fri', 5, 11),
('11Mon', 1, 11),
('11Thu', 4, 11),
('11Tues', 2, 11),
('11Wed', 3, 11),
('1Fri', 5, 1),
('1Mon', 1, 1),
('1Thu', 4, 1),
('1Tues', 2, 1),
('1Wed', 3, 1),
('2Fri', 5, 2),
('2Mon', 1, 2),
('2Thu', 4, 2),
('2Tues', 2, 2),
('2Wed', 3, 2),
('3Fri', 5, 3),
('3Mon', 1, 3),
('3Thu', 4, 3),
('3Tues', 2, 3),
('3Wed', 3, 3),
('4Fri', 5, 4),
('4Mon', 1, 4),
('4Thu', 4, 4),
('4Tues', 2, 4),
('4Wed', 3, 4),
('5Fri', 5, 5),
('5Mon', 1, 5),
('5Thu', 4, 5),
('5Tues', 2, 5),
('5Wed', 3, 5),
('6Fri', 5, 6),
('6Mon', 1, 6),
('6Thu', 4, 6),
('6Tues', 2, 6),
('6Wed', 3, 6),
('7Fri', 5, 7),
('7Mon', 1, 7),
('7Thu', 4, 7),
('7Tues', 2, 7),
('7Wed', 3, 7),
('8Fri', 5, 8),
('8Mon', 1, 8),
('8Thu', 4, 8),
('8Tues', 2, 8),
('8Wed', 3, 8),
('9Fri', 5, 9),
('9Mon', 1, 9),
('9Thu', 4, 9),
('9Tues', 2, 9),
('9Wed', 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `undergradstudent`
--

CREATE TABLE `undergradstudent` (
  `StudentID` int(11) NOT NULL,
  `DeptID` varchar(25) DEFAULT NULL,
  `UnderGradStudentType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `undergradstudentft`
--

CREATE TABLE `undergradstudentft` (
  `StudentID` int(11) NOT NULL,
  `Standing` varchar(100) DEFAULT NULL,
  `LowCredits` int(11) DEFAULT NULL,
  `HighCredits` int(11) DEFAULT NULL,
  `CreditEarned` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `undergradstudentpt`
--

CREATE TABLE `undergradstudentpt` (
  `StudentID` int(11) NOT NULL,
  `Standing` varchar(100) DEFAULT NULL,
  `LowCredits` int(11) DEFAULT NULL,
  `HighCredits` int(11) DEFAULT NULL,
  `CreditEarned` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Gender` varchar(2) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `ZipCode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `FirstName`, `LastName`, `Gender`, `DOB`, `Street`, `City`, `State`, `ZipCode`) VALUES
(3, 'Johnny', 'Gilbert', 'M', '2023-11-04', '12 Old West Street', 'Westbury', 'NY', '11221'),
(500001, 'John', 'Smith', 'Ma', '2000-03-15', 'Willowshire Ct', 'Springville', 'Idaho', '90210'),
(500002, 'Sarah', 'Johnson', 'Fe', '1987-08-25', 'Westhill Way', 'Oakborough', 'New Jersey', '10001'),
(500003, 'Michael', 'Brown', 'Ma', '1995-11-03', 'Maplehill Dr', 'Granhill', 'Mississippi', '30301'),
(500004, 'Emily', 'Davis', 'Fe', '1978-06-12', 'Cedarside Ave', 'Cedarford', 'Connecticut', '60601'),
(500005, 'James', 'Wilson', 'Ma', '1992-02-28', 'Southford Ct', 'Greenhill', 'Arkansas', '90265'),
(500006, 'Olivia', 'Taylor', 'Fe', '2004-09-07', 'Mapleford Ave', 'Oakmouth', 'Montana', '30318'),
(500007, 'Robert', 'Martinez', 'Ma', '1983-12-19', 'Northport Ct', 'Brookchester', 'Rhode Island', '20001'),
(500008, 'Emma', 'Anderson', 'Fe', '1975-04-10', 'Pineview Terr', 'Granford', 'Nebraska', '90245'),
(500009, 'David', 'Thomas', 'Ma', '1998-10-23', 'Maplehill Ave', 'Bedford', 'Hawaii', '60618'),
(500010, 'Ava', 'Jackson', 'Fe', '1989-07-31', 'Oakwood Pl', 'Greenchester', 'Delaware', '30320'),
(500011, 'Joseph', 'White', 'Ma', '1981-05-22', 'Northbrook Ave', 'Hempstead', 'New Hampshire', '30339'),
(500012, 'Sophia', 'Harris', 'Fe', '1991-01-14', 'Southwood Dr', 'Uniondale', 'South Dakota', '10017'),
(500013, 'Charles', 'Clark', 'Ma', '1976-09-03', 'Oakview Ln', 'Yorkville', 'Vermont', '90001'),
(500014, 'Mia', 'Lewis', 'Fe', '1993-04-05', 'Cedarwood Ave', 'Frankville', 'North Dakota', '30310'),
(500015, 'Thomas', 'Hall', 'Ma', '2002-11-26', 'Eastdale Dr', 'Green City ', 'West Virginia', '60610'),
(500016, 'Amelia', 'Young', 'Fe', '1986-02-08', 'Pineview Ln', 'Springville', 'New Mexico', '30342'),
(500017, 'Daniel', 'Lee', 'Ma', '1996-08-17', 'Southport Pl', 'Oakborough', 'Wyoming', '90045'),
(500018, 'Harper', 'Walker', 'Fe', '1979-12-29', 'Oakhill Terr', 'Granhill', 'Alaska', '60625'),
(500019, 'Matthew', 'Wright', 'Ma', '2003-03-01', 'Parkdale Ave', 'Cedarford', 'Maine', '20011'),
(500020, 'Lily', 'Baker', 'Fe', '1990-06-24', 'Willowdale Pl', 'Greenhill', 'Nevada', '30322'),
(500021, 'Christopher', 'Green', 'Ma', '1980-10-06', 'Parkhill Rd', 'Oakmouth', 'Utah', '60630'),
(500022, 'Grace', 'Smith', 'Fe', '1994-01-18', 'Eastwood Ct', 'Brookchester', 'Kansas', '10021'),
(500023, 'Andrew', 'Johnson', 'Ma', '1977-07-28', 'Cedarside Rd', 'Granford', 'Oregon', '90260'),
(500024, 'Chloe', 'Davis', 'Fe', '2001-05-30', 'Mapleshire Ln', 'Bedford', 'Iowa', '60603'),
(500025, 'William', 'Wilson', 'Ma', '1984-09-14', 'Pinebrook St', 'Greenchester', 'Oklahoma', '20020'),
(500026, 'Sophia', 'Taylor', 'Fe', '1974-11-27', 'Northview Ln', 'Hempstead', 'Kentucky', '90272'),
(500027, 'Benjamin', 'Martinez', 'Ma', '1999-03-09', 'Oakdale Ln', 'Uniondale', 'Louisiana', '10005'),
(500028, 'Mia', 'Anderson', 'Fe', '1988-04-21', 'Westdale Ave', 'Yorkville', 'South Carolina', '30350'),
(500029, 'Samuel', 'Thomas', 'Ma', '1997-12-11', 'Willowwood Pl', 'Frankville', 'Alabama', '90012'),
(500030, 'Emily', 'Jackson', 'Fe', '1973-07-05', 'Southshire Terr', 'Green City ', 'Colorado', '60615'),
(500031, 'Ethan', 'White', 'Ma', '2005-02-12', 'Mapleshire Ct', 'Springville', 'Maryland', '30359'),
(500032, 'Olivia', 'Harris', 'Fe', '1972-08-04', 'Cedarview Way', 'Oakborough', 'Wisconsin', '10013'),
(500033, 'Matthew', 'Clark', 'Ma', '1985-01-20', 'Pinehill Ln', 'Granhill', 'Minnesota', '90274'),
(500034, 'Ava', 'Lewis', 'Fe', '2006-10-10', 'Parkview Ave', 'Cedarford', 'Missouri', '20032'),
(500035, 'Alexander', 'Hall', 'Ma', '1971-06-16', 'Eastdale Terr', 'Greenhill', 'Indiana', '30362'),
(500036, 'Harper', 'Young', 'Fe', '1982-03-26', 'Westview Dr', 'Oakmouth', 'Tennessee', '60629'),
(500037, 'Jackson', 'Lee', 'Ma', '2007-07-02', 'Southwood Ct', 'Brookchester', 'Arizona', '90017'),
(500038, 'Grace', 'Walker', 'Fe', '1970-04-07', 'Parkwood Blvd', 'Granford', 'Washington', '30328'),
(500039, 'David', 'Wright', 'Ma', '2008-08-22', 'Cedarside Pl', 'Bedford', 'Massachusetts', '60633'),
(500040, 'Emma', 'Baker', 'Fe', '1969-12-15', 'Oakwood Dr', 'Greenchester', 'Virginia', '90292'),
(500041, 'William', 'Green', 'Ma', '1968-09-02', 'Eastwood Ln', 'Hempstead', 'New York', '20038'),
(500042, 'Lily', 'Smith', 'Fe', '2009-01-25', 'Westport Pl', 'Uniondale', 'North Carolina', '10036'),
(500043, 'Benjamin', 'Johnson', 'Ma', '1967-11-08', 'Northwood Ave', 'Yorkville', 'Georgia', '90025'),
(500044, 'Chloe', 'Davis', 'Fe', '2010-06-06', 'Maplebrook Ln', 'Frankville', 'Michigan', '60637'),
(500045, 'Samuel', 'Wilson', 'Ma', '1966-05-18', 'Willowdale Dr', 'Green City ', 'Ohio', '30305'),
(500046, 'Sophia', 'Taylor', 'Fe', '1965-03-29', 'Westhill Ct', 'Springville', 'Pennsylvania', '30308'),
(500047, 'Matthew', 'Martinez', 'Ma', '2011-03-04', 'Willowport Rd', 'Oakborough', 'Illinois', '90232'),
(500048, 'Mia', 'Anderson', 'Fe', '1964-10-31', 'Parkside St', 'Granhill', 'Florida', '20005'),
(500049, 'Daniel', 'Thomas', 'Ma', '2012-09-19', 'Northhill Way', 'Cedarford', 'Texas', '60614'),
(500050, 'Ava', 'Jackson', 'Fe', '1963-01-07', 'Oakford St', 'Greenhill', 'California', '30336'),
(500051, 'Joseph', 'White', 'Ma', '2013-12-12', 'Willowview Ln', 'Oakmouth', 'Idaho', '10023'),
(500052, 'Sophia', 'Harris', 'Fe', '1962-04-23', 'Parkwood Ct', 'Brookchester', 'New Jersey', '90035'),
(500053, 'Charles', 'Clark', 'Ma', '2014-07-15', 'Easthill Rd', 'Granford', 'Mississippi', '30317'),
(500054, 'Mia', 'Lewis', 'Fe', '1961-08-26', 'Cedarshire Ln', 'Bedford', 'Connecticut', '60646'),
(500055, 'Thomas', 'Hall', 'Ma', '2015-02-28', 'Southdale Rd', 'Greenchester', 'Arkansas', '90280'),
(500056, 'Amelia', 'Young', 'Fe', '1960-11-10', 'Maplewood Pl', 'Hempstead', 'Montana', '20018'),
(500057, 'Daniel', 'Lee', 'Ma', '2016-05-21', 'Eastport Ct', 'Uniondale', 'Rhode Island', '30303'),
(500058, 'Harper', 'Walker', 'Fe', '1959-07-01', 'Northwood Pl', 'Yorkville', 'Nebraska', '30302'),
(500059, 'Matthew', 'Wright', 'Ma', '2017-09-08', 'Westwood Dr', 'Frankville', 'Hawaii', '10003'),
(500060, 'Lily', 'Baker', 'Fe', '1958-12-24', 'Willowhill Ct', 'Green City ', 'Delaware', '90048'),
(500061, 'Christopher', 'Green', 'Ma', '2018-04-03', 'Parkwood St', 'Springville', 'New Hampshire', '60628'),
(500062, 'Grace', 'Smith', 'Fe', '1957-10-13', 'Cedarwood St', 'Oakborough', 'South Dakota', '20002'),
(500063, 'Andrew', 'Johnson', 'Ma', '2019-01-16', 'Westside Pl', 'Granhill', 'Vermont', '90230'),
(500064, 'Chloe', 'Davis', 'Fe', '1956-03-06', 'Oakshire Ave', 'Cedarford', 'North Dakota', '30329'),
(500065, 'William', 'Wilson', 'Ma', '2020-06-29', 'Southview Way', 'Greenhill', 'West Virginia', '30345'),
(500066, 'Sophia', 'Taylor', 'Fe', '1955-06-09', 'Oakbrook Ln', 'Oakmouth', 'New Mexico', '90254'),
(500067, 'Benjamin', 'Martinez', 'Ma', '2021-11-27', 'Cedarview Ln', 'Brookchester', 'Wyoming', '10007'),
(500068, 'Mia', 'Anderson', 'Fe', '1954-08-22', 'Willowbrook Terr', 'Granford', 'Alaska', '20024'),
(500069, 'Samuel', 'Thomas', 'Ma', '2022-02-14', 'Northside Ave', 'Bedford', 'Maine', '60621'),
(500070, 'Emily', 'Jackson', 'Fe', '1953-01-30', 'Mapledale Dr', 'Greenchester', 'Nevada', '30327'),
(500071, 'Ethan', 'White', 'Ma', '2023-03-17', 'Parkview Ct', 'Hempstead', 'Utah', '90058'),
(500072, 'Olivia', 'Harris', 'Fe', '1952-04-05', 'Oakwood Ave', 'Uniondale', 'Kansas', '60605'),
(500073, 'Matthew', 'Clark', 'Ma', '1951-07-28', 'Cedarbrook Pl', 'Yorkville', 'Oregon', '30311'),
(500074, 'Ava', 'Lewis', 'Fe', '1950-09-18', 'Southwood Blvd', 'Frankville', 'Iowa', '10011'),
(500075, 'Alexander', 'Hall', 'Ma', '1949-12-03', 'Eastwood Blvd', 'Green City ', 'Oklahoma', '90220'),
(500076, 'Harper', 'Young', 'Fe', '1948-02-21', 'Westwood Terr', 'Springville', 'Kentucky', '20015'),
(500077, 'Jackson', 'Lee', 'Ma', '1947-05-14', 'Oakhill Dr', 'Oakborough', 'Louisiana', '90291'),
(500078, 'Grace', 'Walker', 'Fe', '1946-08-07', 'Northdale Ct', 'Granhill', 'South Carolina', '60607'),
(500079, 'David', 'Wright', 'Ma', '1945-10-25', 'Mapleshire Dr', 'Cedarford', 'Alabama', '30312'),
(500080, 'Emma', 'Baker', 'Fe', '1944-03-19', 'Pineport Ave', 'Greenhill', 'Colorado', '90064'),
(500081, 'William', 'Green', 'Ma', '1943-01-28', 'Eastside Blvd', 'Oakmouth', 'Maryland', '10027'),
(500082, 'Lily', 'Smith', 'Fe', '1942-06-02', 'Southwood Ln', 'Brookchester', 'Wisconsin', '90240'),
(500083, 'Benjamin', 'Johnson', 'Ma', '1941-09-09', 'Oakdale Ct', 'Granford', 'Minnesota', '60613'),
(500084, 'Chloe', 'Davis', 'Fe', '1940-11-11', 'Cedarview St', 'Bedford', 'Missouri', '20012'),
(500085, 'Samuel', 'Wilson', 'Ma', '1939-04-24', 'Northdale Ln', 'Greenchester', 'Indiana', '30309'),
(500086, 'Sophia', 'Taylor', 'Fe', '1938-07-17', 'Parkport Ave', 'Hempstead', 'Tennessee', '30319'),
(500087, 'Matthew', 'Martinez', 'Ma', '1937-12-29', 'Willowford Ave', 'Uniondale', 'Arizona', '90266'),
(500088, 'Mia', 'Anderson', 'Fe', '1936-02-18', 'Cedarford Pl', 'Yorkville', 'Washington', '60602'),
(500089, 'Daniel', 'Thomas', 'Ma', '1935-08-26', 'Pinebrook Ct', 'Frankville', 'Massachusetts', '30306'),
(500090, 'Ava', 'Jackson', 'Fe', '1934-10-21', 'Eastwood Pl', 'Green City ', 'Virginia', '10019'),
(500091, 'Joseph', 'White', 'Ma', '1933-05-06', 'Willowwood Ln', 'Springville', 'New York', '90210'),
(500092, 'Sophia', 'Harris', 'Fe', '1932-01-14', 'Oakview Ct', 'Oakborough', 'North Carolina', '30346'),
(500093, 'Charles', 'Clark', 'Ma', '1931-03-31', 'Westdale Ln', 'Granhill', 'Georgia', '60622'),
(500094, 'Mia', 'Lewis', 'Fe', '1930-06-30', 'Mapledale Ln', 'Cedarford', 'Michigan', '20009'),
(500095, 'Thomas', 'Hall', 'Ma', '1929-09-02', 'Pineford St', 'Greenhill', 'Ohio', '90250'),
(500096, 'Amelia', 'Young', 'Fe', '1928-11-27', 'Oakport Ln', 'Oakmouth', 'Pennsylvania', '10002'),
(500097, 'Daniel', 'Lee', 'Ma', '1927-04-10', 'Northview Ave', 'Brookchester', 'Illinois', '90034'),
(500098, 'Harper', 'Walker', 'Fe', '1926-07-15', 'Cedarhill Ave', 'Granford', 'Florida', '30307'),
(500099, 'Matthew', 'Wright', 'Ma', '1925-02-05', 'Pinehill Pl', 'Bedford', 'Texas', '60620'),
(500100, 'Lily', 'Baker', 'Fe', '1924-12-22', 'Mapleshire Blvd', 'Greenchester', 'California', '90275'),
(500101, 'Aiden', 'Martinez', 'Ma', '1972-11-23', 'Willowshire Ct', 'Hempstead', 'Idaho', '90210'),
(500102, 'Ava', 'Thompson', 'Fe', '1983-02-14', 'Westhill Way', 'Uniondale', 'New Jersey', '10001'),
(500103, 'Liam', 'Lewis', 'Ma', '1990-04-30', 'Maplehill Dr', 'Yorkville', 'Mississippi', '30301'),
(500104, 'Olivia', 'Hall', 'Fe', '1977-08-06', 'Cedarside Ave', 'Frankville', 'Connecticut', '60601'),
(500105, 'Noah', 'King', 'Ma', '1989-01-18', 'Southford Ct', 'Green City ', 'Arkansas', '90265'),
(500106, 'Isabella', 'Murphy', 'Fe', '1973-05-10', 'Mapleford Ave', 'Springville', 'Montana', '30318'),
(500107, 'James', 'Powell', 'Ma', '2001-09-27', 'Northport Ct', 'Oakborough', 'Rhode Island', '20001'),
(500108, 'Sophia', 'Perry', 'Fe', '1998-12-12', 'Pineview Terr', 'Granhill', 'Nebraska', '90245'),
(500109, 'Lucas', 'Long', 'Ma', '1995-07-31', 'Maplehill Ave', 'Cedarford', 'Hawaii', '60618'),
(500110, 'Mia', 'Wood', 'Fe', '2003-03-22', 'Oakwood Pl', 'Greenhill', 'Delaware', '30320'),
(500111, 'Jackson', 'Cook', 'Ma', '1984-06-15', 'Northbrook Ave', 'Oakmouth', 'New Hampshire', '30339'),
(500112, 'Emily', 'Sanders', 'Fe', '1976-10-29', 'Southwood Dr', 'Brookchester', 'South Dakota', '10017'),
(500113, 'Aiden', 'Turner', 'Ma', '1991-03-21', 'Oakview Ln', 'Granford', 'Vermont', '90001'),
(500114, 'Scarlett', 'Green', 'Fe', '1996-09-08', 'Cedarwood Ave', 'Bedford', 'North Dakota', '30310'),
(500115, 'Daniel', 'Brooks', 'Ma', '1987-08-17', 'Eastdale Dr', 'Greenchester', 'West Virginia', '60610'),
(500116, 'Addison', 'Price', 'Fe', '1980-11-05', 'Pineview Ln', 'Hempstead', 'New Mexico', '30342'),
(500117, 'Logan', 'Rogers', 'Ma', '1974-03-02', 'Southport Pl', 'Uniondale', 'Wyoming', '90045'),
(500118, 'Lily', 'Hughes', 'Fe', '1971-07-19', 'Oakhill Terr', 'Yorkville', 'Alaska', '60625'),
(500119, 'Benjamin', 'Bennett', 'Ma', '1999-05-20', 'Parkdale Ave', 'Frankville', 'Maine', '20011'),
(500120, 'Zoey', 'Foster', 'Fe', '1981-01-25', 'Willowdale Pl', 'Green City ', 'Nevada', '30322'),
(500121, 'Henry', 'Bryant', 'Ma', '2000-08-02', 'Parkhill Rd', 'Springville', 'Utah', '60630'),
(500122, 'Emma', 'Perry', 'Fe', '2002-12-08', 'Eastwood Ct', 'Oakborough', 'Kansas', '10021'),
(500123, 'Wyatt', 'Harris', 'Ma', '1985-04-11', 'Cedarside Rd', 'Granhill', 'Oregon', '90260'),
(500124, 'Abigail', 'Adams', 'Fe', '1992-07-15', 'Mapleshire Ln', 'Cedarford', 'Iowa', '60603'),
(500125, 'Gabriel', 'Wallace', 'Ma', '1988-09-28', 'Pinebrook St', 'Greenhill', 'Oklahoma', '20020'),
(500126, 'Hannah', 'Carter', 'Fe', '1975-12-06', 'Northview Ln', 'Oakmouth', 'Kentucky', '90272'),
(500127, 'Elijah', 'Bryant', 'Ma', '1978-02-01', 'Oakdale Ln', 'Brookchester', 'Louisiana', '10005'),
(500128, 'Grace', 'Miller', 'Fe', '1993-10-24', 'Westdale Ave', 'Granford', 'South Carolina', '30350'),
(500129, 'Oliver', 'Coleman', 'Ma', '1997-06-13', 'Willowwood Pl', 'Bedford', 'Alabama', '90012'),
(500130, 'Sofia', 'Peterson', 'Fe', '1979-04-14', 'Southshire Terr', 'Greenchester', 'Colorado', '60615'),
(500131, 'Samuel', 'Richardson', 'Ma', '2004-03-18', 'Mapleshire Ct', 'Hempstead', 'Maryland', '30359'),
(500132, 'Victoria', 'Russell', 'Fe', '1986-11-09', 'Cedarview Way', 'Uniondale', 'Wisconsin', '10013'),
(500133, 'Christopher', 'Griffin', 'Ma', '2005-07-26', 'Pinehill Ln', 'Yorkville', 'Minnesota', '90274'),
(500134, 'Lily', 'Sullivan', 'Fe', '1970-09-16', 'Parkview Ave', 'Frankville', 'Missouri', '20032'),
(500135, 'Andrew', 'Henderson', 'Ma', '1982-03-27', 'Eastdale Terr', 'Green City ', 'Indiana', '30362'),
(500136, 'Zoey', 'Simmons', 'Fe', '1994-08-03', 'Westview Dr', 'Springville', 'Tennessee', '60629'),
(500137, 'Joshua', 'Carter', 'Ma', '1972-06-20', 'Southwood Ct', 'Oakborough', 'Arizona', '90017'),
(500138, 'Ava', 'Jenkins', 'Fe', '1990-10-11', 'Parkwood Blvd', 'Granhill', 'Washington', '30328'),
(500139, 'William', 'Foster', 'Ma', '1977-01-28', 'Cedarside Pl', 'Cedarford', 'Massachusetts', '60633'),
(500140, 'Harper', 'Thompson', 'Fe', '1989-05-29', 'Oakwood Dr', 'Greenhill', 'Virginia', '90292'),
(500141, 'Henry', 'Perry', 'Ma', '1973-07-07', 'Eastwood Ln', 'Oakmouth', 'New York', '20038'),
(500142, 'Mia', 'Wood', 'Fe', '2001-12-31', 'Westport Pl', 'Brookchester', 'North Carolina', '10036'),
(500143, 'Elijah', 'Cook', 'Ma', '1998-02-22', 'Northwood Ave', 'Granford', 'Georgia', '90025'),
(500144, 'Olivia', 'Sanders', 'Fe', '1995-03-17', 'Maplebrook Ln', 'Bedford', 'Michigan', '60637'),
(500145, 'Jackson', 'Turner', 'Ma', '2003-08-21', 'Willowdale Dr', 'Greenchester', 'Ohio', '30305'),
(500146, 'Emily', 'Green', 'Fe', '1984-09-08', 'Westhill Ct', 'Hempstead', 'Pennsylvania', '30308'),
(500147, 'Aiden', 'Brooks', 'Ma', '1976-04-25', 'Willowport Rd', 'Uniondale', 'Illinois', '90232'),
(500148, 'Scarlett', 'Price', 'Fe', '1991-06-28', 'Parkside St', 'Yorkville', 'Florida', '20005'),
(500149, 'Daniel', 'Rogers', 'Ma', '1996-01-13', 'Northhill Way', 'Frankville', 'Texas', '60614'),
(500150, 'Addison', 'Hughes', 'Fe', '1987-12-09', 'Oakford St', 'Green City ', 'California', '30336'),
(500151, 'Logan', 'Bennett', 'Ma', '1980-03-23', 'Willowview Ln', 'Springville', 'Idaho', '10023'),
(500152, 'Lily', 'Foster', 'Fe', '1974-11-01', 'Parkwood Ct', 'Oakborough', 'New Jersey', '90035'),
(500153, 'Benjamin', 'Bryant', 'Ma', '1971-04-15', 'Easthill Rd', 'Granhill', 'Mississippi', '30317'),
(500154, 'Zoey', 'Perry', 'Fe', '1999-07-04', 'Cedarshire Ln', 'Cedarford', 'Connecticut', '60646'),
(500155, 'Henry', 'Harris', 'Ma', '1981-08-18', 'Southdale Rd', 'Greenhill', 'Arkansas', '90280'),
(500156, 'Emma', 'Adams', 'Fe', '2000-10-05', 'Maplewood Pl', 'Oakmouth', 'Montana', '20018'),
(500157, 'Wyatt', 'Wallace', 'Ma', '2002-05-19', 'Eastport Ct', 'Brookchester', 'Rhode Island', '30303'),
(500158, 'Abigail', 'Carter', 'Fe', '1985-02-06', 'Northwood Pl', 'Granford', 'Nebraska', '30302'),
(500159, 'Gabriel', 'Bryant', 'Ma', '1992-09-11', 'Westwood Dr', 'Bedford', 'Hawaii', '10003'),
(500160, 'Hannah', 'Miller', 'Fe', '1988-06-27', 'Willowhill Ct', 'Greenchester', 'Delaware', '90048'),
(500161, 'Elijah', 'Coleman', 'Ma', '1975-10-16', 'Parkwood St', 'Hempstead', 'New Hampshire', '60628'),
(500162, 'Grace', 'Peterson', 'Fe', '1978-12-22', 'Cedarwood St', 'Uniondale', 'South Dakota', '20002'),
(500163, 'Oliver', 'Richardson', 'Ma', '1993-02-08', 'Westside Pl', 'Yorkville', 'Vermont', '90230'),
(500164, 'Sofia', 'Russell', 'Fe', '1997-04-03', 'Oakshire Ave', 'Frankville', 'North Dakota', '30329'),
(500165, 'Samuel', 'Griffin', 'Ma', '1979-09-10', 'Southview Way', 'Green City ', 'West Virginia', '30345'),
(500166, 'Victoria', 'Sullivan', 'Fe', '2004-01-24', 'Oakbrook Ln', 'Springville', 'New Mexico', '90254'),
(500167, 'Christopher', 'Henderson', 'Ma', '1986-08-03', 'Cedarview Ln', 'Oakborough', 'Wyoming', '10007'),
(500168, 'Lily', 'Simmons', 'Fe', '2005-06-20', 'Willowbrook Terr', 'Granhill', 'Alaska', '20024'),
(500169, 'Andrew', 'Carter', 'Ma', '1970-08-04', 'Northside Ave', 'Cedarford', 'Maine', '60621'),
(500170, 'Zoey', 'Jenkins', 'Fe', '1982-01-10', 'Mapledale Dr', 'Greenhill', 'Nevada', '30327'),
(500171, 'Joshua', 'Foster', 'Ma', '1994-05-28', 'Parkview Ct', 'Oakmouth', 'Utah', '90058'),
(500172, 'Ava', 'Thompson', 'Fe', '1972-07-15', 'Oakwood Ave', 'Brookchester', 'Kansas', '60605'),
(500173, 'William', 'Perry', 'Ma', '1990-11-19', 'Cedarbrook Pl', 'Granford', 'Oregon', '30311'),
(500174, 'Harper', 'Wood', 'Fe', '1977-03-31', 'Southwood Blvd', 'Bedford', 'Iowa', '10011'),
(500175, 'Henry', 'Cook', 'Ma', '1989-08-11', 'Eastwood Blvd', 'Greenchester', 'Oklahoma', '90220'),
(500176, 'Mia', 'Sanders', 'Fe', '1973-01-29', 'Westwood Terr', 'Hempstead', 'Kentucky', '20015'),
(500177, 'Elijah', 'Turner', 'Ma', '2001-05-13', 'Oakhill Dr', 'Uniondale', 'Louisiana', '90291'),
(500178, 'Olivia', 'Green', 'Fe', '1998-10-20', 'Northdale Ct', 'Yorkville', 'South Carolina', '60607'),
(500179, 'Aiden', 'Brooks', 'Ma', '1995-12-07', 'Mapleshire Dr', 'Frankville', 'Alabama', '30312'),
(500180, 'Scarlett', 'Price', 'Fe', '2003-07-03', 'Pineport Ave', 'Green City ', 'Colorado', '90064'),
(500181, 'Logan', 'Rogers', 'Ma', '1984-03-11', 'Eastside Blvd', 'Springville', 'Maryland', '10027'),
(500182, 'Lily', 'Hughes', 'Fe', '1976-06-26', 'Southwood Ln', 'Oakborough', 'Wisconsin', '90240'),
(500183, 'Benjamin', 'Bennett', 'Ma', '1991-08-22', 'Oakdale Ct', 'Granhill', 'Minnesota', '60613'),
(500184, 'Zoey', 'Foster', 'Fe', '1996-02-05', 'Cedarview St', 'Cedarford', 'Missouri', '20012'),
(500185, 'Henry', 'Bryant', 'Ma', '1987-05-17', 'Northdale Ln', 'Greenhill', 'Indiana', '30309'),
(500186, 'Emma', 'Perry', 'Fe', '1980-10-25', 'Parkport Ave', 'Oakmouth', 'Tennessee', '30319'),
(500187, 'Wyatt', 'Harris', 'Ma', '1974-12-01', 'Willowford Ave', 'Brookchester', 'Arizona', '90266'),
(500188, 'Abigail', 'Adams', 'Fe', '1971-04-02', 'Cedarford Pl', 'Granford', 'Washington', '60602'),
(500189, 'Gabriel', 'Wallace', 'Ma', '1999-09-15', 'Pinebrook Ct', 'Bedford', 'Massachusetts', '30306'),
(500190, 'Hannah', 'Carter', 'Fe', '1981-02-09', 'Eastwood Pl', 'Greenchester', 'Virginia', '10019'),
(500191, 'Elijah', 'Bryant', 'Ma', '2000-10-12', 'Willowwood Ln', 'Hempstead', 'New York', '90210'),
(500192, 'Grace', 'Miller', 'Fe', '2002-04-27', 'Oakview Ct', 'Uniondale', 'North Carolina', '30346'),
(500193, 'Oliver', 'Coleman', 'Ma', '1985-06-29', 'Westdale Ln', 'Yorkville', 'Georgia', '60622'),
(500194, 'Sofia', 'Peterson', 'Fe', '1992-01-30', 'Mapledale Ln', 'Frankville', 'Michigan', '20009'),
(500195, 'Samuel', 'Richardson', 'Ma', '1988-11-07', 'Pineford St', 'Green City ', 'Ohio', '90250'),
(500196, 'Victoria', 'Russell', 'Fe', '1975-02-13', 'Oakport Ln', 'Springville', 'Pennsylvania', '10002'),
(500197, 'Christopher', 'Griffin', 'Ma', '1978-07-23', 'Northview Ave', 'Oakborough', 'Illinois', '90034'),
(500198, 'Lily', 'Sullivan', 'Fe', '1993-05-16', 'Cedarhill Ave', 'Granhill', 'Florida', '30307'),
(500199, 'Andrew', 'Henderson', 'Ma', '1997-09-02', 'Pinehill Pl', 'Cedarford', 'Texas', '60620'),
(500200, 'Zoey', 'Simmons', 'Fe', '1979-12-08', 'Mapleshire Blvd', 'Greenhill', 'California', '90275'),
(500201, 'Olivia', 'Clark', 'Ma', '2004-06-30', 'Willowshire Ct', 'Oakmouth', 'Idaho', '90210'),
(500202, 'Noah', 'Baker', 'Fe', '1986-02-14', 'Westhill Way', 'Brookchester', 'New Jersey', '10001'),
(500203, 'Sophia', 'Wright', 'Ma', '2005-03-29', 'Maplehill Dr', 'Granford', 'Mississippi', '30301'),
(500204, 'William', 'King', 'Fe', '1970-11-16', 'Cedarside Ave', 'Bedford', 'Connecticut', '60601'),
(500205, 'Ava', 'Lee', 'Ma', '1982-09-21', 'Southford Ct', 'Greenchester', 'Arkansas', '90265'),
(500206, 'James', 'Martinez', 'Fe', '1994-12-02', 'Mapleford Ave', 'Hempstead', 'Montana', '30318'),
(500207, 'Emma', 'Davis', 'Ma', '1972-04-25', 'Northport Ct', 'Uniondale', 'Rhode Island', '20001'),
(500208, 'Michael', 'Taylor', 'Fe', '1990-08-06', 'Pineview Terr', 'Yorkville', 'Nebraska', '90245'),
(500209, 'Isabella', 'Johnson', 'Ma', '1977-02-08', 'Maplehill Ave', 'Frankville', 'Hawaii', '60618'),
(500210, 'Benjamin', 'Anderson', 'Fe', '1989-05-31', 'Oakwood Pl', 'Green City ', 'Delaware', '30320'),
(500211, 'Sophia', 'Harris', 'Ma', '1973-08-17', 'Northbrook Ave', 'Springville', 'New Hampshire', '30339'),
(500212, 'Logan', 'Wilson', 'Fe', '2001-01-06', 'Southwood Dr', 'Oakborough', 'South Dakota', '10017'),
(500213, 'Henry', 'Thompson', 'Ma', '1998-03-15', 'Oakview Ln', 'Granhill', 'Vermont', '90001'),
(500214, 'Mia', 'Walker', 'Fe', '1995-07-27', 'Cedarwood Ave', 'Cedarford', 'North Dakota', '30310'),
(500215, 'Alexander', 'Green', 'Ma', '2003-06-19', 'Eastdale Dr', 'Greenhill', 'West Virginia', '60610'),
(500216, 'Olivia', 'Turner', 'Fe', '1984-01-24', 'Pineview Ln', 'Oakmouth', 'New Mexico', '30342'),
(500217, 'Samuel', 'Powell', 'Ma', '1976-12-03', 'Southport Pl', 'Brookchester', 'Wyoming', '90045'),
(500218, 'Emily', 'Lewis', 'Fe', '1991-03-10', 'Oakhill Terr', 'Granford', 'Alaska', '60625'),
(500219, 'Jackson', 'Richardson', 'Ma', '1996-05-26', 'Parkdale Ave', 'Bedford', 'Maine', '20011'),
(500220, 'Lily', 'Moore', 'Fe', '1987-10-05', 'Willowdale Pl', 'Greenchester', 'Nevada', '30322'),
(500221, 'Aiden', 'Carter', 'Ma', '1980-07-29', 'Parkhill Rd', 'Hempstead', 'Utah', '60630'),
(500222, 'Harper', 'Scott', 'Fe', '1974-02-13', 'Eastwood Ct', 'Uniondale', 'Kansas', '10021'),
(500223, 'Christopher', 'Bennett', 'Ma', '1971-05-21', 'Cedarside Rd', 'Yorkville', 'Oregon', '90260'),
(500224, 'Chloe', 'Rogers', 'Fe', '1999-08-19', 'Mapleshire Ln', 'Frankville', 'Iowa', '60603'),
(500225, 'Daniel', 'Adams', 'Ma', '1981-12-31', 'Pinebrook St', 'Green City ', 'Oklahoma', '20020'),
(500226, 'Sophia', 'Martin', 'Fe', '2000-02-11', 'Northview Ln', 'Springville', 'Kentucky', '90272'),
(500227, 'William', 'Murphy', 'Ma', '2002-09-12', 'Oakdale Ln', 'Oakborough', 'Louisiana', '10005'),
(500228, 'Mia', 'Simmons', 'Fe', '1985-07-18', 'Westdale Ave', 'Granhill', 'South Carolina', '30350'),
(500229, 'James', 'Long', 'Ma', '1992-08-04', 'Willowwood Pl', 'Cedarford', 'Alabama', '90012'),
(500230, 'Emily', 'Scott', 'Fe', '1988-11-25', 'Southshire Terr', 'Greenhill', 'Colorado', '60615'),
(500231, 'Benjamin', 'Carter', 'Ma', '1975-01-20', 'Mapleshire Ct', 'Oakmouth', 'Maryland', '30359'),
(500232, 'Olivia', 'Davis', 'Fe', '1978-05-15', 'Cedarview Way', 'Brookchester', 'Wisconsin', '10013'),
(500233, 'Joseph', 'Martinez', 'Ma', '1993-10-02', 'Pinehill Ln', 'Granford', 'Minnesota', '90274'),
(500234, 'Isabella', 'Thompson', 'Fe', '1997-02-27', 'Parkview Ave', 'Bedford', 'Missouri', '20032'),
(500235, 'David', 'Green', 'Ma', '1979-06-20', 'Eastdale Terr', 'Greenchester', 'Indiana', '30362'),
(500236, 'Ava', 'Wilson', 'Fe', '2004-09-21', 'Westview Dr', 'Hempstead', 'Tennessee', '60629'),
(500237, 'Emma', 'Baker', 'Ma', '1986-04-03', 'Southwood Ct', 'Uniondale', 'Arizona', '90017'),
(500238, 'Samuel', 'Anderson', 'Fe', '2005-05-10', 'Parkwood Blvd', 'Yorkville', 'Washington', '30328'),
(500239, 'Michael', 'Taylor', 'Ma', '1970-10-13', 'Cedarside Pl', 'Frankville', 'Massachusetts', '60633'),
(500240, 'Sophia', 'Johnson', 'Fe', '1982-07-01', 'Oakwood Dr', 'Green City ', 'Virginia', '90292'),
(500241, 'Benjamin', 'Harris', 'Ma', '1994-01-16', 'Eastwood Ln', 'Springville', 'New York', '20038'),
(500242, 'Chloe', 'Davis', 'Fe', '1972-03-29', 'Westport Pl', 'Oakborough', 'North Carolina', '10036'),
(500243, 'Henry', 'Wright', 'Ma', '1990-09-26', 'Northwood Ave', 'Granhill', 'Georgia', '90025'),
(500244, 'Ava', 'Lee', 'Fe', '1977-08-12', 'Maplebrook Ln', 'Cedarford', 'Michigan', '60637'),
(500245, 'Oliver', 'Martinez', 'Ma', '1989-02-07', 'Willowdale Dr', 'Greenhill', 'Ohio', '30305'),
(500246, 'Mia', 'Turner', 'Fe', '1973-01-28', 'Westhill Ct', 'Oakmouth', 'Pennsylvania', '30308'),
(500247, 'Sophia', 'Powell', 'Ma', '2001-06-03', 'Willowport Rd', 'Brookchester', 'Illinois', '90232'),
(500248, 'William', 'Lewis', 'Fe', '1998-10-10', 'Parkside St', 'Granford', 'Florida', '20005'),
(500249, 'Aiden', 'Turner', 'Ma', '1995-11-27', 'Northhill Way', 'Bedford', 'Texas', '60614'),
(500250, 'Emma', 'Baker', 'Fe', '2003-12-09', 'Oakford St', 'Greenchester', 'California', '30336'),
(500251, 'Olivia', 'Wright', 'Ma', '1984-03-21', 'Willowview Ln', 'Hempstead', 'Idaho', '10023'),
(500252, 'James', 'King', 'Fe', '1976-08-23', 'Parkwood Ct', 'Uniondale', 'New Jersey', '90035'),
(500253, 'Ava', 'Lee', 'Ma', '1991-12-20', 'Easthill Rd', 'Yorkville', 'Mississippi', '30317'),
(500254, 'Sophia', 'Harris', 'Fe', '1996-04-28', 'Cedarshire Ln', 'Frankville', 'Connecticut', '60646'),
(500255, 'Benjamin', 'Anderson', 'Ma', '1987-12-13', 'Southdale Rd', 'Green City ', 'Arkansas', '90280'),
(500256, 'Emily', 'Taylor', 'Fe', '1980-05-11', 'Maplewood Pl', 'Springville', 'Montana', '20018'),
(500257, 'Jackson', 'Davis', 'Ma', '1974-08-29', 'Eastport Ct', 'Oakborough', 'Rhode Island', '30303'),
(500258, 'Lily', 'Martinez', 'Fe', '1971-02-20', 'Northwood Pl', 'Granhill', 'Nebraska', '30302'),
(500259, 'Olivia', 'Thompson', 'Ma', '1999-03-01', 'Westwood Dr', 'Cedarford', 'Hawaii', '10003'),
(500260, 'Noah', 'Baker', 'Fe', '1981-05-04', 'Willowhill Ct', 'Greenhill', 'Delaware', '90048'),
(500261, 'Sophia', 'Wright', 'Ma', '2000-09-06', 'Parkwood St', 'Oakmouth', 'New Hampshire', '60628'),
(500262, 'William', 'King', 'Fe', '2002-01-30', 'Cedarwood St', 'Brookchester', 'South Dakota', '20002'),
(500263, 'Ava', 'Lee', 'Ma', '1985-09-17', 'Westside Pl', 'Granford', 'Vermont', '90230'),
(500264, 'James', 'Martinez', 'Fe', '1992-11-23', 'Oakshire Ave', 'Bedford', 'North Dakota', '30329'),
(500265, 'Emma', 'Davis', 'Ma', '1988-06-01', 'Southview Way', 'Greenchester', 'West Virginia', '30345'),
(500266, 'Michael', 'Taylor', 'Fe', '1975-04-14', 'Oakbrook Ln', 'Hempstead', 'New Mexico', '90254'),
(500267, 'Isabella', 'Johnson', 'Ma', '1978-10-19', 'Cedarview Ln', 'Uniondale', 'Wyoming', '10007'),
(500268, 'Benjamin', 'Adams', 'Fe', '1993-07-05', 'Willowbrook Terr', 'Yorkville', 'Alaska', '20024'),
(500269, 'Sophia', 'Thompson', 'Ma', '1997-01-15', 'Northside Ave', 'Frankville', 'Maine', '60621'),
(500270, 'William', 'Martin', 'Fe', '1979-03-26', 'Mapledale Dr', 'Green City ', 'Nevada', '30327'),
(500271, 'Logan', 'Scott', 'Ma', '2004-12-16', 'Parkview Ct', 'Springville', 'Utah', '90058'),
(500272, 'Olivia', 'Turner', 'Fe', '1986-05-01', 'Oakwood Ave', 'Oakborough', 'Kansas', '60605'),
(500273, 'Henry', 'Miller', 'Ma', '2005-08-08', 'Cedarbrook Pl', 'Granhill', 'Oregon', '30311'),
(500274, 'Mia', 'Lewis', 'Fe', '1970-06-20', 'Southwood Blvd', 'Cedarford', 'Iowa', '10011'),
(500275, 'Alexander', 'Green', 'Ma', '1982-02-09', 'Eastwood Blvd', 'Greenhill', 'Oklahoma', '90220'),
(500276, 'Emily', 'Anderson', 'Fe', '1994-09-13', 'Westwood Terr', 'Oakmouth', 'Kentucky', '20015'),
(500277, 'Samuel', 'Wilson', 'Ma', '1972-01-25', 'Oakhill Dr', 'Brookchester', 'Louisiana', '90291'),
(500278, 'Isabella', 'Baker', 'Fe', '1990-03-04', 'Northdale Ct', 'Granford', 'South Carolina', '60607'),
(500279, 'Michael', 'Clark', 'Ma', '1977-05-19', 'Mapleshire Dr', 'Bedford', 'Alabama', '30312'),
(500280, 'Chloe', 'Thompson', 'Fe', '1989-10-22', 'Pineport Ave', 'Greenchester', 'Colorado', '90064'),
(500281, 'James', 'Carter', 'Ma', '1973-12-05', 'Eastside Blvd', 'Hempstead', 'Maryland', '10027'),
(500282, 'Mia', 'Wright', 'Fe', '2001-04-01', 'Southwood Ln', 'Uniondale', 'Wisconsin', '90240'),
(500283, 'Oliver', 'Harris', 'Ma', '1998-08-27', 'Oakdale Ct', 'Yorkville', 'Minnesota', '60613'),
(500284, 'Sophia', 'Lewis', 'Fe', '1995-11-07', 'Cedarview St', 'Frankville', 'Missouri', '20012'),
(500285, 'William', 'Davis', 'Ma', '2003-12-31', 'Northdale Ln', 'Green City ', 'Indiana', '30309'),
(500286, 'Ava', 'Turner', 'Fe', '1984-04-17', 'Parkport Ave', 'Springville', 'Tennessee', '30319'),
(500287, 'Benjamin', 'Smith', 'Ma', '1976-09-30', 'Willowford Ave', 'Oakborough', 'Arizona', '90266'),
(500288, 'Emma', 'Anderson', 'Fe', '1991-06-10', 'Cedarford Pl', 'Granhill', 'Washington', '60602'),
(500289, 'Isabella', 'Johnson', 'Ma', '1996-02-15', 'Pinebrook Ct', 'Cedarford', 'Massachusetts', '30306'),
(500290, 'Noah', 'Baker', 'Fe', '1987-12-27', 'Eastwood Pl', 'Greenhill', 'Virginia', '10019'),
(500291, 'Sophia', 'Wright', 'Ma', '1980-05-02', 'Willowwood Ln', 'Oakmouth', 'New York', '90210'),
(500292, 'William', 'King', 'Fe', '1974-08-12', 'Oakview Ct', 'Brookchester', 'North Carolina', '30346'),
(500293, 'Ava', 'Lee', 'Ma', '1971-03-19', 'Westdale Ln', 'Granford', 'Georgia', '60622'),
(500294, 'James', 'Martinez', 'Fe', '1999-02-13', 'Mapledale Ln', 'Bedford', 'Michigan', '20009'),
(500295, 'Emma', 'Davis', 'Ma', '1981-07-16', 'Pineford St', 'Greenchester', 'Ohio', '90250'),
(500296, 'Michael', 'Taylor', 'Fe', '2000-09-25', 'Oakport Ln', 'Hempstead', 'Pennsylvania', '10002'),
(500297, 'Isabella', 'Johnson', 'Ma', '2002-01-14', 'Northview Ave', 'Uniondale', 'Illinois', '90034'),
(500298, 'Benjamin', 'Adams', 'Fe', '1985-09-28', 'Cedarhill Ave', 'Yorkville', 'Florida', '30307'),
(500299, 'Sophia', 'Thompson', 'Ma', '1992-12-07', 'Pinehill Pl', 'Frankville', 'Texas', '60620'),
(500300, 'William', 'Martin', 'Fe', '1988-04-20', 'Mapleshire Blvd', 'Green City ', 'California', '90275'),
(500301, 'Olivia', 'Wilson', 'Ma', '1975-01-30', 'Willowshire Ct', 'Springville', 'Idaho', '90210'),
(500302, 'Benjamin', 'Thompson', 'Fe', '1978-07-07', 'Westhill Way', 'Oakborough', 'New Jersey', '10001'),
(500303, 'Emma', 'Anderson', 'Ma', '1993-06-27', 'Maplehill Dr', 'Granhill', 'Mississippi', '30301'),
(500304, 'William', 'King', 'Fe', '1997-11-03', 'Cedarside Ave', 'Cedarford', 'Connecticut', '60601'),
(500305, 'Ava', 'Davis', 'Ma', '1979-03-11', 'Southford Ct', 'Greenhill', 'Arkansas', '90265'),
(500306, 'James', 'Martinez', 'Fe', '2004-12-04', 'Mapleford Ave', 'Oakmouth', 'Montana', '30318'),
(500307, 'Isabella', 'Wright', 'Ma', '1986-06-14', 'Northport Ct', 'Brookchester', 'Rhode Island', '20001'),
(500308, 'Noah', 'Lewis', 'Fe', '2005-08-25', 'Pineview Terr', 'Granford', 'Nebraska', '90245'),
(500309, 'Sophia', 'Johnson', 'Ma', '1970-04-27', 'Maplehill Ave', 'Bedford', 'Hawaii', '60618'),
(500310, 'Michael', 'Baker', 'Fe', '1982-02-22', 'Oakwood Pl', 'Greenchester', 'Delaware', '30320'),
(500311, 'Chloe', 'Turner', 'Ma', '1994-09-05', 'Northbrook Ave', 'Hempstead', 'New Hampshire', '30339'),
(500312, 'Alexander', 'Harris', 'Fe', '1972-01-01', 'Southwood Dr', 'Uniondale', 'South Dakota', '10017'),
(500313, 'Mia', 'Lee', 'Ma', '1990-03-20', 'Oakview Ln', 'Yorkville', 'Vermont', '90001'),
(500314, 'Olivia', 'Martinez', 'Fe', '1977-05-28', 'Cedarwood Ave', 'Frankville', 'North Dakota', '30310'),
(500315, 'Benjamin', 'Davis', 'Ma', '1989-11-09', 'Eastdale Dr', 'Green City ', 'West Virginia', '60610'),
(500316, 'Emma', 'Taylor', 'Fe', '1973-12-23', 'Pineview Ln', 'Springville', 'New Mexico', '30342'),
(500317, 'Isabella', 'Wilson', 'Ma', '2001-05-02', 'Southport Pl', 'Oakborough', 'Wyoming', '90045'),
(500318, 'William', 'Clark', 'Fe', '1998-07-18', 'Oakhill Terr', 'Granhill', 'Alaska', '60625'),
(500319, 'Ava', 'Johnson', 'Ma', '1995-10-01', 'Parkdale Ave', 'Cedarford', 'Maine', '20011'),
(500320, 'James', 'Anderson', 'Fe', '2003-12-25', 'Willowdale Pl', 'Greenhill', 'Nevada', '30322'),
(500321, 'Olivia', 'Harris', 'Ma', '1984-04-02', 'Parkhill Rd', 'Oakmouth', 'Utah', '60630'),
(500322, 'Benjamin', 'Baker', 'Fe', '1976-08-10', 'Eastwood Ct', 'Brookchester', 'Kansas', '10021'),
(500323, 'Emma', 'Lewis', 'Ma', '1991-01-28', 'Cedarside Rd', 'Granford', 'Oregon', '90260'),
(500324, 'Michael', 'Turner', 'Fe', '1996-05-04', 'Mapleshire Ln', 'Bedford', 'Iowa', '60603'),
(500325, 'Chloe', 'Davis', 'Ma', '1987-10-15', 'Pinebrook St', 'Greenchester', 'Oklahoma', '20020'),
(500326, 'Alexander', 'Martinez', 'Fe', '1980-02-25', 'Northview Ln', 'Hempstead', 'Kentucky', '90272'),
(500327, 'Mia', 'Harris', 'Ma', '1974-07-12', 'Oakdale Ln', 'Uniondale', 'Louisiana', '10005'),
(500328, 'Olivia', 'Wilson', 'Fe', '1971-03-31', 'Westdale Ave', 'Yorkville', 'South Carolina', '30350'),
(500329, 'Benjamin', 'Anderson', 'Ma', '1999-02-18', 'Willowwood Pl', 'Frankville', 'Alabama', '90012'),
(500330, 'Emma', 'King', 'Fe', '1981-07-31', 'Southshire Terr', 'Green City ', 'Colorado', '60615'),
(500331, 'William', 'Taylor', 'Ma', '2000-09-09', 'Mapleshire Ct', 'Springville', 'Maryland', '30359'),
(500332, 'Isabella', 'Thompson', 'Fe', '2002-01-08', 'Cedarview Way', 'Oakborough', 'Wisconsin', '10013'),
(500333, 'Noah', 'Johnson', 'Ma', '1985-08-30', 'Pinehill Ln', 'Granhill', 'Minnesota', '90274'),
(500334, 'Sophia', 'Wright', 'Fe', '1992-11-11', 'Parkview Ave', 'Cedarford', 'Missouri', '20032'),
(500335, 'James', 'Harris', 'Ma', '1988-04-02', 'Eastdale Terr', 'Greenhill', 'Indiana', '30362'),
(500336, 'Ava', 'Turner', 'Fe', '1975-01-15', 'Westview Dr', 'Oakmouth', 'Tennessee', '60629'),
(500337, 'Benjamin', 'Baker', 'Ma', '1978-06-21', 'Southwood Ct', 'Brookchester', 'Arizona', '90017'),
(500338, 'Emma', 'Davis', 'Fe', '1993-06-14', 'Parkwood Blvd', 'Granford', 'Washington', '30328'),
(500339, 'Olivia', 'Lewis', 'Ma', '1997-11-28', 'Cedarside Pl', 'Bedford', 'Massachusetts', '60633'),
(500340, 'William', 'Anderson', 'Fe', '1979-03-05', 'Oakwood Dr', 'Greenchester', 'Virginia', '90292'),
(500341, 'Mia', 'Martinez', 'Ma', '2004-11-25', 'Eastwood Ln', 'Hempstead', 'New York', '20038'),
(500342, 'James', 'Harris', 'Fe', '1986-07-22', 'Westport Pl', 'Uniondale', 'North Carolina', '10036'),
(500343, 'Isabella', 'Turner', 'Ma', '2005-09-28', 'Northwood Ave', 'Yorkville', 'Georgia', '90025'),
(500344, 'Noah', 'Wilson', 'Fe', '1970-02-20', 'Maplebrook Ln', 'Frankville', 'Michigan', '60637'),
(500345, 'Chloe', 'Thompson', 'Ma', '1982-04-01', 'Willowdale Dr', 'Green City ', 'Ohio', '30305'),
(500346, 'Benjamin', 'Johnson', 'Fe', '1994-09-20', 'Westhill Ct', 'Springville', 'Pennsylvania', '30308'),
(500347, 'Emma', 'King', 'Ma', '1972-01-04', 'Willowport Rd', 'Oakborough', 'Illinois', '90232'),
(500348, 'Olivia', 'Taylor', 'Fe', '1990-04-18', 'Parkside St', 'Granhill', 'Florida', '20005'),
(500349, 'Michael', 'Davis', 'Ma', '1977-05-05', 'Northhill Way', 'Cedarford', 'Texas', '60614'),
(500350, 'Isabella', 'Harris', 'Fe', '1989-10-07', 'Oakford St', 'Greenhill', 'California', '30336'),
(500351, 'James', 'Turner', 'Ma', '1973-12-11', 'Willowview Ln', 'Oakmouth', 'Idaho', '10023'),
(500352, 'Ava', 'Lewis', 'Fe', '2001-05-20', 'Parkwood Ct', 'Brookchester', 'New Jersey', '90035'),
(500353, 'Benjamin', 'Baker', 'Ma', '1998-08-15', 'Easthill Rd', 'Granford', 'Mississippi', '30317'),
(500354, 'Emma', 'Anderson', 'Fe', '1995-11-21', 'Cedarshire Ln', 'Bedford', 'Connecticut', '60646'),
(500355, 'Olivia', 'Martinez', 'Ma', '2003-12-18', 'Southdale Rd', 'Greenchester', 'Arkansas', '90280'),
(500356, 'William', 'Wright', 'Fe', '1984-04-24', 'Maplewood Pl', 'Hempstead', 'Montana', '20018'),
(500357, 'Isabella', 'Davis', 'Ma', '1976-08-26', 'Eastport Ct', 'Uniondale', 'Rhode Island', '30303'),
(500358, 'James', 'Harris', 'Fe', '1991-01-16', 'Northwood Pl', 'Yorkville', 'Nebraska', '30302'),
(500359, 'Sophia', 'Turner', 'Ma', '1996-05-09', 'Westwood Dr', 'Frankville', 'Hawaii', '10003'),
(500360, 'Chloe', 'Wilson', 'Fe', '1987-10-10', 'Willowhill Ct', 'Green City ', 'Delaware', '90048'),
(500361, 'Mia', 'Thompson', 'Ma', '1980-03-02', 'Parkwood St', 'Springville', 'New Hampshire', '60628'),
(500362, 'Benjamin', 'Johnson', 'Fe', '1974-07-26', 'Cedarwood St', 'Oakborough', 'South Dakota', '20002'),
(500363, 'Emma', 'King', 'Ma', '1971-03-05', 'Westside Pl', 'Granhill', 'Vermont', '90230'),
(500364, 'Olivia', 'Taylor', 'Fe', '1999-01-10', 'Oakshire Ave', 'Cedarford', 'North Dakota', '30329'),
(500365, 'William', 'Anderson', 'Ma', '1981-07-23', 'Southview Way', 'Greenhill', 'West Virginia', '30345'),
(500366, 'James', 'Harris', 'Fe', '2000-09-22', 'Oakbrook Ln', 'Oakmouth', 'New Mexico', '90254'),
(500367, 'Isabella', 'Turner', 'Ma', '2002-01-21', 'Cedarview Ln', 'Brookchester', 'Wyoming', '10007'),
(500368, 'Noah', 'Wilson', 'Fe', '1985-09-04', 'Willowbrook Terr', 'Granford', 'Alaska', '20024'),
(500369, 'Chloe', 'Thompson', 'Ma', '1992-11-30', 'Northside Ave', 'Bedford', 'Maine', '60621'),
(500370, 'Benjamin', 'Johnson', 'Fe', '1988-04-19', 'Mapledale Dr', 'Greenchester', 'Nevada', '30327'),
(500371, 'Emma', 'King', 'Ma', '1975-01-08', 'Parkview Ct', 'Hempstead', 'Utah', '90058'),
(500372, 'Olivia', 'Taylor', 'Fe', '1978-06-14', 'Oakwood Ave', 'Uniondale', 'Kansas', '60605'),
(500373, 'Michael', 'Davis', 'Ma', '1993-06-20', 'Cedarbrook Pl', 'Yorkville', 'Oregon', '30311'),
(500374, 'Isabella', 'Harris', 'Fe', '1997-11-17', 'Southwood Blvd', 'Frankville', 'Iowa', '10011'),
(500375, 'James', 'Turner', 'Ma', '1979-02-27', 'Eastwood Blvd', 'Green City ', 'Oklahoma', '90220'),
(500376, 'Ava', 'Lewis', 'Fe', '2004-11-15', 'Westwood Terr', 'Springville', 'Kentucky', '20015'),
(500377, 'Benjamin', 'Baker', 'Ma', '1986-07-02', 'Oakhill Dr', 'Oakborough', 'Louisiana', '90291'),
(500378, 'Emma', 'Anderson', 'Fe', '2005-10-05', 'Northdale Ct', 'Granhill', 'South Carolina', '60607'),
(500379, 'Olivia', 'Martinez', 'Ma', '1970-01-28', 'Mapleshire Dr', 'Cedarford', 'Alabama', '30312'),
(500380, 'William', 'Wright', 'Fe', '1982-03-05', 'Pineport Ave', 'Greenhill', 'Colorado', '90064'),
(500381, 'Isabella', 'Davis', 'Ma', '1994-09-13', 'Eastside Blvd', 'Oakmouth', 'Maryland', '10027'),
(500382, 'James', 'Harris', 'Fe', '1972-01-10', 'Southwood Ln', 'Brookchester', 'Wisconsin', '90240'),
(500383, 'Sophia', 'Turner', 'Ma', '1990-03-11', 'Oakdale Ct', 'Granford', 'Minnesota', '60613'),
(500384, 'Chloe', 'Wilson', 'Fe', '1977-05-22', 'Cedarview St', 'Bedford', 'Missouri', '20012'),
(500385, 'Mia', 'Thompson', 'Ma', '1989-10-29', 'Northdale Ln', 'Greenchester', 'Indiana', '30309'),
(500386, 'Benjamin', 'Johnson', 'Fe', '1973-12-02', 'Parkport Ave', 'Hempstead', 'Tennessee', '30319'),
(500387, 'Emma', 'King', 'Ma', '2001-05-28', 'Willowford Ave', 'Uniondale', 'Arizona', '90266'),
(500388, 'Olivia', 'Taylor', 'Fe', '1998-08-01', 'Cedarford Pl', 'Yorkville', 'Washington', '60602'),
(500389, 'Michael', 'Davis', 'Ma', '1995-11-02', 'Pinebrook Ct', 'Frankville', 'Massachusetts', '30306'),
(500390, 'Isabella', 'Harris', 'Fe', '2003-12-26', 'Eastwood Pl', 'Green City ', 'Virginia', '10019'),
(500391, 'James', 'Turner', 'Ma', '1984-04-19', 'Willowwood Ln', 'Springville', 'New York', '90210'),
(500392, 'Ava', 'Lewis', 'Fe', '1976-08-21', 'Oakview Ct', 'Oakborough', 'North Carolina', '30346'),
(500393, 'Benjamin', 'Baker', 'Ma', '1991-01-06', 'Westdale Ln', 'Granhill', 'Georgia', '60622'),
(500394, 'Emma', 'Anderson', 'Fe', '1996-05-02', 'Mapledale Ln', 'Cedarford', 'Michigan', '20009'),
(500395, 'Olivia', 'Martinez', 'Ma', '1987-10-27', 'Pineford St', 'Greenhill', 'Ohio', '90250'),
(500396, 'William', 'Wright', 'Fe', '1980-02-13', 'Oakport Ln', 'Oakmouth', 'Pennsylvania', '10002'),
(500397, 'Isabella', 'Davis', 'Ma', '1974-07-08', 'Northview Ave', 'Brookchester', 'Illinois', '90034'),
(500398, 'James', 'Harris', 'Fe', '1971-02-16', 'Cedarhill Ave', 'Granford', 'Florida', '30307'),
(500399, 'Sophia', 'Turner', 'Ma', '1999-02-27', 'Pinehill Pl', 'Bedford', 'Texas', '60620'),
(500400, 'Chloe', 'Wilson', 'Fe', '1981-07-04', 'Mapleshire Blvd', 'Greenchester', 'California', '90275'),
(500401, 'Olivia', 'Baker', 'Ma', '2000-09-15', 'Willowshire Ct', 'Hempstead', 'Idaho', '90210'),
(500402, 'Benjamin', 'Wright', 'Fe', '2002-01-27', 'Westhill Way', 'Uniondale', 'New Jersey', '10001'),
(500403, 'Emma', 'Harris', 'Ma', '1985-08-12', 'Maplehill Dr', 'Yorkville', 'Mississippi', '30301'),
(500404, 'William', 'Turner', 'Fe', '1992-11-15', 'Cedarside Ave', 'Frankville', 'Connecticut', '60601'),
(500405, 'Ava', 'Davis', 'Ma', '1972-11-23', 'Southford Ct', 'Green City ', 'Arkansas', '90265'),
(500406, 'James', 'Martinez', 'Fe', '1983-02-14', 'Mapleford Ave', 'Springville', 'Montana', '30318'),
(500407, 'Isabella', 'Thompson', 'Ma', '1990-04-30', 'Northport Ct', 'Oakborough', 'Rhode Island', '20001'),
(500408, 'Noah', 'Lewis', 'Fe', '1977-08-06', 'Pineview Terr', 'Granhill', 'Nebraska', '90245'),
(500409, 'Sophia', 'Johnson', 'Ma', '1989-01-18', 'Maplehill Ave', 'Cedarford', 'Hawaii', '60618'),
(500410, 'Michael', 'Clark', 'Fe', '1973-05-10', 'Oakwood Pl', 'Greenhill', 'Delaware', '30320'),
(500411, 'Chloe', 'Baker', 'Ma', '2001-09-27', 'Northbrook Ave', 'Oakmouth', 'New Hampshire', '30339'),
(500412, 'Alexander', 'Harris', 'Fe', '1998-12-12', 'Southwood Dr', 'Brookchester', 'South Dakota', '10017'),
(500413, 'Mia', 'Lee', 'Ma', '1995-07-31', 'Oakview Ln', 'Granford', 'Vermont', '90001'),
(500414, 'Olivia', 'Martinez', 'Fe', '2003-03-22', 'Cedarwood Ave', 'Bedford', 'North Dakota', '30310'),
(500415, 'Benjamin', 'Davis', 'Ma', '1984-06-15', 'Eastdale Dr', 'Greenchester', 'West Virginia', '60610'),
(500416, 'Emma', 'Taylor', 'Fe', '1976-10-29', 'Pineview Ln', 'Hempstead', 'New Mexico', '30342'),
(500417, 'Isabella', 'Wilson', 'Ma', '1991-03-21', 'Southport Pl', 'Uniondale', 'Wyoming', '90045'),
(500418, 'William', 'Thompson', 'Fe', '1996-09-08', 'Oakhill Terr', 'Yorkville', 'Alaska', '60625'),
(500419, 'Ava', 'Johnson', 'Ma', '1987-08-17', 'Parkdale Ave', 'Frankville', 'Maine', '20011'),
(500420, 'James', 'Anderson', 'Fe', '1980-11-05', 'Willowdale Pl', 'Green City ', 'Nevada', '30322'),
(500421, 'Olivia', 'Baker', 'Ma', '1974-03-02', 'Parkhill Rd', 'Springville', 'Utah', '60630'),
(500422, 'Benjamin', 'Turner', 'Fe', '1971-07-19', 'Eastwood Ct', 'Oakborough', 'Kansas', '10021'),
(500423, 'Emma', 'Harris', 'Ma', '1999-05-20', 'Cedarside Rd', 'Granhill', 'Oregon', '90260'),
(500424, 'William', 'Davis', 'Fe', '1981-01-25', 'Mapleshire Ln', 'Cedarford', 'Iowa', '60603'),
(500425, 'Ava', 'Lee', 'Ma', '2000-08-02', 'Pinebrook St', 'Greenhill', 'Oklahoma', '20020'),
(500426, 'James', 'Martinez', 'Fe', '2002-12-08', 'Northview Ln', 'Oakmouth', 'Kentucky', '90272'),
(500427, 'Isabella', 'Thompson', 'Ma', '1985-04-11', 'Oakdale Ln', 'Brookchester', 'Louisiana', '10005'),
(500428, 'Noah', 'Lewis', 'Fe', '1992-07-15', 'Westdale Ave', 'Granford', 'South Carolina', '30350'),
(500429, 'Sophia', 'Johnson', 'Ma', '1988-09-28', 'Willowwood Pl', 'Bedford', 'Alabama', '90012'),
(500430, 'Michael', 'Clark', 'Fe', '1975-12-06', 'Southshire Terr', 'Greenchester', 'Colorado', '60615'),
(500431, 'Chloe', 'Baker', 'Ma', '1978-02-01', 'Mapleshire Ct', 'Hempstead', 'Maryland', '30359'),
(500432, 'Alexander', 'Harris', 'Fe', '1993-10-24', 'Cedarview Way', 'Uniondale', 'Wisconsin', '10013'),
(500433, 'Mia', 'Lee', 'Ma', '1997-06-13', 'Pinehill Ln', 'Yorkville', 'Minnesota', '90274'),
(500434, 'Olivia', 'Martinez', 'Fe', '1979-04-14', 'Parkview Ave', 'Frankville', 'Missouri', '20032'),
(500435, 'Benjamin', 'Davis', 'Ma', '2004-03-18', 'Eastdale Terr', 'Green City ', 'Indiana', '30362'),
(500436, 'Emma', 'Taylor', 'Fe', '1986-11-09', 'Westview Dr', 'Springville', 'Tennessee', '60629'),
(500437, 'Isabella', 'Wilson', 'Ma', '2005-07-26', 'Southwood Ct', 'Oakborough', 'Arizona', '90017'),
(500438, 'William', 'Thompson', 'Fe', '1970-09-16', 'Parkwood Blvd', 'Granhill', 'Washington', '30328'),
(500439, 'Ava', 'Johnson', 'Ma', '1982-03-27', 'Cedarside Pl', 'Cedarford', 'Massachusetts', '60633'),
(500440, 'James', 'Anderson', 'Fe', '1994-08-03', 'Oakwood Dr', 'Greenhill', 'Virginia', '90292'),
(500441, 'Olivia', 'Baker', 'Ma', '1972-06-20', 'Eastwood Ln', 'Oakmouth', 'New York', '20038'),
(500442, 'Benjamin', 'Turner', 'Fe', '1990-10-11', 'Westport Pl', 'Brookchester', 'North Carolina', '10036'),
(500443, 'Emma', 'Harris', 'Ma', '1977-01-28', 'Northwood Ave', 'Granford', 'Georgia', '90025'),
(500444, 'William', 'Davis', 'Fe', '1989-05-29', 'Maplebrook Ln', 'Bedford', 'Michigan', '60637'),
(500445, 'Ava', 'Lee', 'Ma', '1973-07-07', 'Willowdale Dr', 'Greenchester', 'Ohio', '30305'),
(500446, 'James', 'Martinez', 'Fe', '2001-12-31', 'Westhill Ct', 'Hempstead', 'Pennsylvania', '30308'),
(500447, 'Isabella', 'Thompson', 'Ma', '1998-02-22', 'Willowport Rd', 'Uniondale', 'Illinois', '90232'),
(500448, 'Noah', 'Lewis', 'Fe', '1995-03-17', 'Parkside St', 'Yorkville', 'Florida', '20005'),
(500449, 'Sophia', 'Johnson', 'Ma', '2003-08-21', 'Northhill Way', 'Frankville', 'Texas', '60614'),
(500450, 'Michael', 'Clark', 'Fe', '1984-09-08', 'Oakford St', 'Green City ', 'California', '30336'),
(500451, 'Chloe', 'Baker', 'Ma', '1976-04-25', 'Willowview Ln', 'Springville', 'Idaho', '10023'),
(500452, 'Alexander', 'Harris', 'Fe', '1991-06-28', 'Parkwood Ct', 'Oakborough', 'New Jersey', '90035'),
(500453, 'Mia', 'Lee', 'Ma', '1996-01-13', 'Easthill Rd', 'Granhill', 'Mississippi', '30317'),
(500454, 'Olivia', 'Martinez', 'Fe', '1987-12-09', 'Cedarshire Ln', 'Cedarford', 'Connecticut', '60646'),
(500455, 'Benjamin', 'Davis', 'Ma', '1980-03-23', 'Southdale Rd', 'Greenhill', 'Arkansas', '90280'),
(500456, 'Emma', 'Taylor', 'Fe', '1974-11-01', 'Maplewood Pl', 'Oakmouth', 'Montana', '20018'),
(500457, 'Isabella', 'Wilson', 'Ma', '1971-04-15', 'Eastport Ct', 'Brookchester', 'Rhode Island', '30303'),
(500458, 'William', 'Thompson', 'Fe', '1999-07-04', 'Northwood Pl', 'Granford', 'Nebraska', '30302'),
(500459, 'Ava', 'Johnson', 'Ma', '1981-08-18', 'Westwood Dr', 'Bedford', 'Hawaii', '10003'),
(500460, 'James', 'Anderson', 'Fe', '2000-10-05', 'Willowhill Ct', 'Greenchester', 'Delaware', '90048'),
(500461, 'Olivia', 'Baker', 'Ma', '2002-05-19', 'Parkwood St', 'Hempstead', 'New Hampshire', '60628'),
(500462, 'Benjamin', 'Turner', 'Fe', '1985-02-06', 'Cedarwood St', 'Uniondale', 'South Dakota', '20002'),
(500463, 'Emma', 'Harris', 'Ma', '1992-09-11', 'Westside Pl', 'Yorkville', 'Vermont', '90230'),
(500464, 'William', 'Davis', 'Fe', '1988-06-27', 'Oakshire Ave', 'Frankville', 'North Dakota', '30329'),
(500465, 'Ava', 'Lee', 'Ma', '1975-10-16', 'Southview Way', 'Green City ', 'West Virginia', '30345'),
(500466, 'James', 'Martinez', 'Fe', '1978-12-22', 'Oakbrook Ln', 'Springville', 'New Mexico', '90254'),
(500467, 'Isabella', 'Thompson', 'Ma', '1993-02-08', 'Cedarview Ln', 'Oakborough', 'Wyoming', '10007'),
(500468, 'Noah', 'Lewis', 'Fe', '1997-04-03', 'Willowbrook Terr', 'Granhill', 'Alaska', '20024'),
(500469, 'Sophia', 'Johnson', 'Ma', '1979-09-10', 'Northside Ave', 'Cedarford', 'Maine', '60621'),
(500470, 'Michael', 'Clark', 'Fe', '2004-01-24', 'Mapledale Dr', 'Greenhill', 'Nevada', '30327'),
(500471, 'Chloe', 'Baker', 'Ma', '1986-08-03', 'Parkview Ct', 'Oakmouth', 'Utah', '90058'),
(500472, 'Alexander', 'Harris', 'Fe', '2005-06-20', 'Oakwood Ave', 'Brookchester', 'Kansas', '60605'),
(500473, 'Mia', 'Lee', 'Ma', '1970-08-04', 'Cedarbrook Pl', 'Granford', 'Oregon', '30311'),
(500474, 'Olivia', 'Martinez', 'Fe', '1982-01-10', 'Southwood Blvd', 'Bedford', 'Iowa', '10011'),
(500475, 'Benjamin', 'Davis', 'Ma', '1994-05-28', 'Eastwood Blvd', 'Greenchester', 'Oklahoma', '90220'),
(500476, 'Emma', 'Taylor', 'Fe', '1972-07-15', 'Westwood Terr', 'Hempstead', 'Kentucky', '20015'),
(500477, 'Isabella', 'Wilson', 'Ma', '1990-11-19', 'Oakhill Dr', 'Uniondale', 'Louisiana', '90291'),
(500478, 'William', 'Thompson', 'Fe', '1977-03-31', 'Northdale Ct', 'Yorkville', 'South Carolina', '60607'),
(500479, 'Ava', 'Johnson', 'Ma', '1989-08-11', 'Mapleshire Dr', 'Frankville', 'Alabama', '30312'),
(500480, 'James', 'Anderson', 'Fe', '1973-01-29', 'Pineport Ave', 'Green City ', 'Colorado', '90064'),
(500481, 'Sophia', 'Turner', 'Ma', '2001-05-13', 'Eastside Blvd', 'Springville', 'Maryland', '10027'),
(500482, 'Chloe', 'Wilson', 'Fe', '1998-10-20', 'Southwood Ln', 'Oakborough', 'Wisconsin', '90240'),
(500483, 'Mia', 'Thompson', 'Ma', '1995-12-07', 'Oakdale Ct', 'Granhill', 'Minnesota', '60613'),
(500484, 'Benjamin', 'Johnson', 'Fe', '2003-07-03', 'Cedarview St', 'Cedarford', 'Missouri', '20012'),
(500485, 'Emma', 'King', 'Ma', '1984-03-11', 'Northdale Ln', 'Greenhill', 'Indiana', '30309'),
(500486, 'Olivia', 'Taylor', 'Fe', '1976-06-26', 'Parkport Ave', 'Oakmouth', 'Tennessee', '30319'),
(500487, 'Michael', 'Davis', 'Ma', '1991-08-22', 'Willowford Ave', 'Brookchester', 'Arizona', '90266'),
(500488, 'Isabella', 'Harris', 'Fe', '1996-02-05', 'Cedarford Pl', 'Granford', 'Washington', '60602'),
(500489, 'James', 'Turner', 'Ma', '1987-05-17', 'Pinebrook Ct', 'Bedford', 'Massachusetts', '30306'),
(500490, 'Ava', 'Lewis', 'Fe', '1980-10-25', 'Eastwood Pl', 'Greenchester', 'Virginia', '10019'),
(500491, 'Benjamin', 'Baker', 'Ma', '1974-12-01', 'Willowwood Ln', 'Hempstead', 'New York', '90210'),
(500492, 'Emma', 'Anderson', 'Fe', '1971-04-02', 'Oakview Ct', 'Uniondale', 'North Carolina', '30346'),
(500493, 'Olivia', 'Martinez', 'Ma', '1999-09-15', 'Westdale Ln', 'Yorkville', 'Georgia', '60622'),
(500494, 'William', 'Wright', 'Fe', '1981-02-09', 'Mapledale Ln', 'Frankville', 'Michigan', '20009'),
(500495, 'Isabella', 'Davis', 'Ma', '2000-10-12', 'Pineford St', 'Green City ', 'Ohio', '90250'),
(500496, 'James', 'Harris', 'Fe', '2002-04-27', 'Oakport Ln', 'Springville', 'Pennsylvania', '10002'),
(500497, 'Sophia', 'Turner', 'Ma', '1985-06-29', 'Northview Ave', 'Oakborough', 'Illinois', '90034'),
(500498, 'Chloe', 'Wilson', 'Fe', '1992-01-30', 'Cedarhill Ave', 'Granhill', 'Florida', '30307'),
(500499, 'Mia', 'Thompson', 'Ma', '1988-11-07', 'Pinehill Pl', 'Cedarford', 'Texas', '60620'),
(500500, 'Benjamin', 'Johnson', 'Fe', '1975-02-13', 'Mapleshire Blvd', 'Greenhill', 'California', '90275'),
(500501, 'Emma', 'King', 'Fe', '1978-07-23', 'Willowshire Ct', 'Oakmouth', 'Idaho', '90210'),
(500502, 'Olivia', 'Taylor', 'Fe', '1993-05-16', 'Westhill Way', 'Brookchester', 'New Jersey', '10001'),
(500503, 'Michael', 'Davis', 'Ma', '1997-09-02', 'Maplehill Dr', 'Granford', 'Mississippi', '30301'),
(500504, 'Isabella', 'Harris', 'Fe', '1979-12-08', 'Cedarside Ave', 'Bedford', 'Connecticut', '60601');
INSERT INTO `user` (`UID`, `FirstName`, `LastName`, `Gender`, `DOB`, `Street`, `City`, `State`, `ZipCode`) VALUES
(500505, 'James', 'Turner', 'Ma', '2004-06-30', 'Southford Ct', 'Greenchester', 'Arkansas', '90265'),
(500506, 'Ava', 'Lewis', 'Fe', '1986-02-14', 'Mapleford Ave', 'Hempstead', 'Montana', '30318'),
(500507, 'Benjamin', 'Baker', 'Ma', '2005-03-29', 'Northport Ct', 'Uniondale', 'Rhode Island', '20001'),
(500508, 'Emma', 'Anderson', 'Fe', '1970-11-16', 'Pineview Terr', 'Yorkville', 'Nebraska', '90245'),
(500509, 'Olivia', 'Martinez', 'Fe', '1982-09-21', 'Maplehill Ave', 'Frankville', 'Hawaii', '60618'),
(500510, 'William', 'Wright', 'Ma', '1994-12-02', 'Oakwood Pl', 'Green City ', 'Delaware', '30320'),
(500511, 'Isabella', 'Davis', 'Fe', '1972-04-25', 'Northbrook Ave', 'Springville', 'New Hampshire', '30339'),
(500512, 'James', 'Harris', 'Ma', '1990-08-06', 'Southwood Dr', 'Oakborough', 'South Dakota', '10017'),
(500513, 'Sophia', 'Turner', 'Ma', '1977-02-08', 'Oakview Ln', 'Granhill', 'Vermont', '90001'),
(500514, 'Chloe', 'Wilson', 'Fe', '1989-05-31', 'Cedarwood Ave', 'Cedarford', 'North Dakota', '30310'),
(500515, 'Mia', 'Thompson', 'Ma', '1973-08-17', 'Eastdale Dr', 'Greenhill', 'West Virginia', '60610'),
(500516, 'Benjamin', 'Johnson', 'Fe', '2001-01-06', 'Pineview Ln', 'Oakmouth', 'New Mexico', '30342'),
(500517, 'Emma', 'King', 'Ma', '1998-03-15', 'Southport Pl', 'Brookchester', 'Wyoming', '90045'),
(500518, 'Olivia', 'Taylor', 'Fe', '1995-07-27', 'Oakhill Terr', 'Granford', 'Alaska', '60625'),
(500519, 'Michael', 'Davis', 'Ma', '2003-06-19', 'Parkdale Ave', 'Bedford', 'Maine', '20011'),
(500520, 'Isabella', 'Harris', 'Fe', '1984-01-24', 'Willowdale Pl', 'Greenchester', 'Nevada', '30322'),
(500521, 'James', 'Turner', 'Ma', '1976-12-03', 'Parkhill Rd', 'Hempstead', 'Utah', '60630'),
(500522, 'Ava', 'Lewis', 'Fe', '1991-03-10', 'Eastwood Ct', 'Uniondale', 'Kansas', '10021'),
(500523, 'Benjamin', 'Baker', 'Ma', '1996-05-26', 'Cedarside Rd', 'Yorkville', 'Oregon', '90260'),
(500524, 'Emma', 'Anderson', 'Fe', '1987-10-05', 'Mapleshire Ln', 'Frankville', 'Iowa', '60603'),
(500525, 'Olivia', 'Martinez', 'Ma', '1980-07-29', 'Pinebrook St', 'Green City ', 'Oklahoma', '20020'),
(500526, 'William', 'Wright', 'Fe', '1974-02-13', 'Northview Ln', 'Springville', 'Kentucky', '90272'),
(500527, 'Isabella', 'Davis', 'Ma', '1971-05-21', 'Oakdale Ln', 'Oakborough', 'Louisiana', '10005'),
(500528, 'James', 'Harris', 'Fe', '1999-08-19', 'Westdale Ave', 'Granhill', 'South Carolina', '30350'),
(500529, 'Sophia', 'Turner', 'Ma', '1981-12-31', 'Willowwood Pl', 'Cedarford', 'Alabama', '90012'),
(500530, 'Chloe', 'Wilson', 'Fe', '2000-02-11', 'Southshire Terr', 'Greenhill', 'Colorado', '60615'),
(500531, 'Mia', 'Thompson', 'Ma', '2002-09-12', 'Mapleshire Ct', 'Oakmouth', 'Maryland', '30359'),
(500532, 'Benjamin', 'Johnson', 'Fe', '1985-07-18', 'Cedarview Way', 'Brookchester', 'Wisconsin', '10013'),
(500533, 'Emma', 'King', 'Ma', '1992-08-04', 'Pinehill Ln', 'Granford', 'Minnesota', '90274'),
(500534, 'Olivia', 'Taylor', 'Fe', '1988-11-25', 'Parkview Ave', 'Bedford', 'Missouri', '20032'),
(500535, 'Michael', 'Davis', 'Ma', '1975-01-20', 'Eastdale Terr', 'Greenchester', 'Indiana', '30362'),
(500536, 'Isabella', 'Harris', 'Fe', '1978-05-15', 'Westview Dr', 'Hempstead', 'Tennessee', '60629'),
(500537, 'James', 'Turner', 'Ma', '1993-10-02', 'Southwood Ct', 'Uniondale', 'Arizona', '90017'),
(500538, 'Ava', 'Lewis', 'Fe', '1997-02-27', 'Parkwood Blvd', 'Yorkville', 'Washington', '30328'),
(500539, 'Benjamin', 'Baker', 'Ma', '1979-06-20', 'Cedarside Pl', 'Frankville', 'Massachusetts', '60633'),
(500540, 'Emma', 'Anderson', 'Fe', '2004-09-21', 'Oakwood Dr', 'Green City ', 'Virginia', '90292'),
(500541, 'Olivia', 'Martinez', 'Ma', '1986-04-03', 'Eastwood Ln', 'Springville', 'New York', '20038'),
(500542, 'William', 'Wright', 'Fe', '2005-05-10', 'Westport Pl', 'Oakborough', 'North Carolina', '10036'),
(500543, 'Isabella', 'Davis', 'Ma', '1970-10-13', 'Northwood Ave', 'Granhill', 'Georgia', '90025'),
(500544, 'James', 'Harris', 'Fe', '1982-07-01', 'Maplebrook Ln', 'Cedarford', 'Michigan', '60637'),
(500545, 'Sophia', 'Turner', 'Ma', '1994-01-16', 'Willowdale Dr', 'Greenhill', 'Ohio', '30305'),
(500546, 'Chloe', 'Wilson', 'Fe', '1972-03-29', 'Westhill Ct', 'Oakmouth', 'Pennsylvania', '30308'),
(500547, 'Mia', 'Thompson', 'Ma', '1990-09-26', 'Willowport Rd', 'Brookchester', 'Illinois', '90232'),
(500548, 'Benjamin', 'Johnson', 'Fe', '1977-08-12', 'Parkside St', 'Granford', 'Florida', '20005'),
(500549, 'Emma', 'King', 'Ma', '1989-02-07', 'Northhill Way', 'Bedford', 'Texas', '60614'),
(500550, 'Olivia', 'Taylor', 'Fe', '1973-01-28', 'Oakford St', 'Greenchester', 'California', '30336'),
(500551, 'Michael', 'Davis', 'Ma', '2001-06-03', 'Willowview Ln', 'Hempstead', 'Idaho', '10023'),
(500552, 'Isabella', 'Harris', 'Fe', '1998-10-10', 'Parkwood Ct', 'Uniondale', 'New Jersey', '90035'),
(500553, 'James', 'Turner', 'Ma', '1995-11-27', 'Easthill Rd', 'Yorkville', 'Mississippi', '30317'),
(500554, 'Ava', 'Lewis', 'Fe', '2003-12-09', 'Cedarshire Ln', 'Frankville', 'Connecticut', '60646'),
(500555, 'Benjamin', 'Baker', 'Ma', '1984-03-21', 'Southdale Rd', 'Green City ', 'Arkansas', '90280'),
(500556, 'Emma', 'Anderson', 'Fe', '1976-08-23', 'Maplewood Pl', 'Springville', 'Montana', '20018'),
(500557, 'Olivia', 'Martinez', 'Ma', '1991-12-20', 'Eastport Ct', 'Oakborough', 'Rhode Island', '30303'),
(500558, 'William', 'Wright', 'Fe', '1996-04-28', 'Northwood Pl', 'Granhill', 'Nebraska', '30302'),
(500559, 'Isabella', 'Davis', 'Ma', '1987-12-13', 'Westwood Dr', 'Cedarford', 'Hawaii', '10003'),
(500560, 'James', 'Harris', 'Fe', '1980-05-11', 'Willowhill Ct', 'Greenhill', 'Delaware', '90048'),
(500561, 'Sophia', 'Turner', 'Ma', '1974-08-29', 'Parkwood St', 'Oakmouth', 'New Hampshire', '60628'),
(500562, 'Chloe', 'Wilson', 'Fe', '1971-02-20', 'Cedarwood St', 'Brookchester', 'South Dakota', '20002'),
(500563, 'Mia', 'Thompson', 'Ma', '1999-03-01', 'Westside Pl', 'Granford', 'Vermont', '90230'),
(500564, 'Benjamin', 'Johnson', 'Fe', '1981-05-04', 'Oakshire Ave', 'Bedford', 'North Dakota', '30329'),
(500565, 'Emma', 'King', 'Ma', '2000-09-06', 'Southview Way', 'Greenchester', 'West Virginia', '30345'),
(500566, 'Olivia', 'Taylor', 'Fe', '2002-01-30', 'Oakbrook Ln', 'Hempstead', 'New Mexico', '90254'),
(500567, 'Michael', 'Davis', 'Ma', '1985-09-17', 'Cedarview Ln', 'Uniondale', 'Wyoming', '10007'),
(500568, 'Isabella', 'Harris', 'Fe', '1992-11-23', 'Willowbrook Terr', 'Yorkville', 'Alaska', '20024'),
(500569, 'James', 'Turner', 'Ma', '1988-06-01', 'Northside Ave', 'Frankville', 'Maine', '60621'),
(500570, 'Ava', 'Lewis', 'Fe', '1975-04-14', 'Mapledale Dr', 'Green City ', 'Nevada', '30327'),
(500571, 'Benjamin', 'Baker', 'Ma', '1978-10-19', 'Parkview Ct', 'Springville', 'Utah', '90058'),
(500572, 'Emma', 'Anderson', 'Fe', '1993-07-05', 'Oakwood Ave', 'Oakborough', 'Kansas', '60605'),
(500573, 'Olivia', 'Martinez', 'Ma', '1997-01-15', 'Cedarbrook Pl', 'Granhill', 'Oregon', '30311'),
(500574, 'William', 'Wright', 'Fe', '1979-03-26', 'Southwood Blvd', 'Cedarford', 'Iowa', '10011'),
(500575, 'Isabella', 'Davis', 'Ma', '2004-12-16', 'Eastwood Blvd', 'Greenhill', 'Oklahoma', '90220'),
(500576, 'James', 'Harris', 'Fe', '1986-05-01', 'Westwood Terr', 'Oakmouth', 'Kentucky', '20015'),
(500577, 'Sophia', 'Turner', 'Ma', '2005-08-08', 'Oakhill Dr', 'Brookchester', 'Louisiana', '90291'),
(500578, 'Chloe', 'Wilson', 'Fe', '1970-06-20', 'Northdale Ct', 'Granford', 'South Carolina', '60607'),
(500579, 'Mia', 'Thompson', 'Ma', '1982-02-09', 'Mapleshire Dr', 'Bedford', 'Alabama', '30312'),
(500580, 'Benjamin', 'Johnson', 'Fe', '1994-09-13', 'Pineport Ave', 'Greenchester', 'Colorado', '90064'),
(500581, 'Emma', 'King', 'Ma', '1972-01-25', 'Eastside Blvd', 'Hempstead', 'Maryland', '10027'),
(500582, 'Olivia', 'Taylor', 'Fe', '1990-03-04', 'Southwood Ln', 'Uniondale', 'Wisconsin', '90240'),
(500583, 'Michael', 'Davis', 'Ma', '1977-05-19', 'Oakdale Ct', 'Yorkville', 'Minnesota', '60613'),
(500584, 'Isabella', 'Harris', 'Fe', '1989-10-22', 'Cedarview St', 'Frankville', 'Missouri', '20012'),
(500585, 'James', 'Turner', 'Ma', '1973-12-05', 'Northdale Ln', 'Green City ', 'Indiana', '30309'),
(500586, 'Ava', 'Lewis', 'Fe', '2001-04-01', 'Parkport Ave', 'Springville', 'Tennessee', '30319'),
(500587, 'Benjamin', 'Baker', 'Ma', '1998-08-27', 'Willowford Ave', 'Oakborough', 'Arizona', '90266'),
(500588, 'Emma', 'Anderson', 'Fe', '1995-11-07', 'Cedarford Pl', 'Granhill', 'Washington', '60602'),
(500589, 'Olivia', 'Martinez', 'Ma', '2003-12-31', 'Pinebrook Ct', 'Cedarford', 'Massachusetts', '30306'),
(500590, 'William', 'Wright', 'Fe', '1984-04-17', 'Eastwood Pl', 'Greenhill', 'Virginia', '10019'),
(500591, 'Isabella', 'Davis', 'Ma', '1976-09-30', 'Willowwood Ln', 'Oakmouth', 'New York', '90210'),
(500592, 'James', 'Harris', 'Fe', '1991-06-10', 'Oakview Ct', 'Brookchester', 'North Carolina', '30346'),
(500593, 'Sophia', 'Turner', 'Ma', '1996-02-15', 'Westdale Ln', 'Granford', 'Georgia', '60622'),
(500594, 'Chloe', 'Wilson', 'Fe', '1987-12-27', 'Mapledale Ln', 'Bedford', 'Michigan', '20009'),
(500595, 'Mia', 'Thompson', 'Ma', '1980-05-02', 'Pineford St', 'Greenchester', 'Ohio', '90250'),
(500596, 'Benjamin', 'Johnson', 'Fe', '1974-08-12', 'Oakport Ln', 'Hempstead', 'Pennsylvania', '10002'),
(500597, 'Emma', 'King', 'Ma', '1971-03-19', 'Northview Ave', 'Uniondale', 'Illinois', '90034'),
(500598, 'Olivia', 'Taylor', 'Fe', '1999-02-13', 'Cedarhill Ave', 'Yorkville', 'Florida', '30307'),
(500599, 'Michael', 'Davis', 'Ma', '1981-07-16', 'Pinehill Pl', 'Frankville', 'Texas', '60620'),
(500600, 'Isabella', 'Harris', 'Fe', '2000-09-25', 'Mapleshire Blvd', 'Green City ', 'California', '90275'),
(500601, 'James', 'Turner', 'Ma', '2002-01-14', 'Willowshire Ct', 'Springville', 'Idaho', '90210'),
(500602, 'Ava', 'Lewis', 'Fe', '1985-09-28', 'Westhill Way', 'Oakborough', 'New Jersey', '10001'),
(500603, 'Benjamin', 'Baker', 'Ma', '1992-12-07', 'Maplehill Dr', 'Granhill', 'Mississippi', '30301'),
(500604, 'Emma', 'Anderson', 'Fe', '1988-04-20', 'Cedarside Ave', 'Cedarford', 'Connecticut', '60601'),
(500605, 'Olivia', 'Martinez', 'Ma', '1975-01-30', 'Southford Ct', 'Greenhill', 'Arkansas', '90265'),
(500606, 'William', 'Wright', 'Fe', '1978-07-07', 'Mapleford Ave', 'Oakmouth', 'Montana', '30318'),
(500607, 'Isabella', 'Davis', 'Ma', '1993-06-27', 'Northport Ct', 'Brookchester', 'Rhode Island', '20001'),
(500608, 'James', 'Harris', 'Fe', '1997-11-03', 'Pineview Terr', 'Granford', 'Nebraska', '90245'),
(500609, 'Sophia', 'Turner', 'Ma', '1979-03-11', 'Maplehill Ave', 'Bedford', 'Hawaii', '60618'),
(500610, 'Chloe', 'Wilson', 'Fe', '2004-12-04', 'Oakwood Pl', 'Greenchester', 'Delaware', '30320'),
(500611, 'Mia', 'Thompson', 'Ma', '1986-06-14', 'Northbrook Ave', 'Hempstead', 'New Hampshire', '30339'),
(500612, 'Benjamin', 'Johnson', 'Fe', '2005-08-25', 'Southwood Dr', 'Uniondale', 'South Dakota', '10017'),
(500613, 'Emma', 'King', 'Ma', '1970-04-27', 'Oakview Ln', 'Yorkville', 'Vermont', '90001'),
(500614, 'Olivia', 'Taylor', 'Fe', '1982-02-22', 'Cedarwood Ave', 'Frankville', 'North Dakota', '30310'),
(500615, 'Michael', 'Davis', 'Ma', '1994-09-05', 'Eastdale Dr', 'Green City ', 'West Virginia', '60610'),
(500616, 'Isabella', 'Harris', 'Fe', '1972-01-01', 'Pineview Ln', 'Springville', 'New Mexico', '30342'),
(500617, 'James', 'Turner', 'Ma', '1990-03-20', 'Southport Pl', 'Oakborough', 'Wyoming', '90045'),
(500618, 'Ava', 'Lewis', 'Fe', '1977-05-28', 'Oakhill Terr', 'Granhill', 'Alaska', '60625'),
(500619, 'Benjamin', 'Baker', 'Ma', '1989-11-09', 'Parkdale Ave', 'Cedarford', 'Maine', '20011'),
(500620, 'Emma', 'Anderson', 'Fe', '1973-12-23', 'Willowdale Pl', 'Greenhill', 'Nevada', '30322'),
(500621, 'Olivia', 'Martinez', 'Ma', '2001-05-02', 'Parkhill Rd', 'Oakmouth', 'Utah', '60630'),
(500622, 'William', 'Wright', 'Fe', '1998-07-18', 'Eastwood Ct', 'Brookchester', 'Kansas', '10021'),
(500623, 'Isabella', 'Davis', 'Ma', '1995-10-01', 'Cedarside Rd', 'Granford', 'Oregon', '90260'),
(500624, 'James', 'Harris', 'Fe', '2003-12-25', 'Mapleshire Ln', 'Bedford', 'Iowa', '60603'),
(500625, 'Sophia', 'Turner', 'Ma', '1984-04-02', 'Pinebrook St', 'Greenchester', 'Oklahoma', '20020'),
(500626, 'Chloe', 'Wilson', 'Fe', '1976-08-10', 'Northview Ln', 'Hempstead', 'Kentucky', '90272'),
(500627, 'Mia', 'Thompson', 'Ma', '1991-01-28', 'Oakdale Ln', 'Uniondale', 'Louisiana', '10005'),
(500628, 'Benjamin', 'Johnson', 'Fe', '1996-05-04', 'Westdale Ave', 'Yorkville', 'South Carolina', '30350'),
(500629, 'Emma', 'King', 'Ma', '1987-10-15', 'Willowwood Pl', 'Frankville', 'Alabama', '90012'),
(500630, 'Olivia', 'Taylor', 'Fe', '1980-02-25', 'Southshire Terr', 'Green City ', 'Colorado', '60615'),
(500631, 'Michael', 'Davis', 'Ma', '1974-07-12', 'Mapleshire Ct', 'Springville', 'Maryland', '30359'),
(500632, 'Isabella', 'Harris', 'Fe', '1971-03-31', 'Cedarview Way', 'Oakborough', 'Wisconsin', '10013'),
(500633, 'James', 'Turner', 'Ma', '1999-02-18', 'Pinehill Ln', 'Granhill', 'Minnesota', '90274'),
(500634, 'Ava', 'Lewis', 'Fe', '1981-07-31', 'Parkview Ave', 'Cedarford', 'Missouri', '20032'),
(500635, 'Benjamin', 'Baker', 'Ma', '2000-09-09', 'Eastdale Terr', 'Greenhill', 'Indiana', '30362'),
(500636, 'Emma', 'Anderson', 'Fe', '2002-01-08', 'Westview Dr', 'Oakmouth', 'Tennessee', '60629'),
(500637, 'Olivia', 'Martinez', 'Ma', '1985-08-30', 'Southwood Ct', 'Brookchester', 'Arizona', '90017'),
(500638, 'William', 'Wright', 'Fe', '1992-11-11', 'Parkwood Blvd', 'Granford', 'Washington', '30328'),
(500639, 'Isabella', 'Davis', 'Ma', '1988-04-02', 'Cedarside Pl', 'Bedford', 'Massachusetts', '60633'),
(500640, 'James', 'Harris', 'Fe', '1975-01-15', 'Oakwood Dr', 'Greenchester', 'Virginia', '90292'),
(500641, 'Sophia', 'Turner', 'Ma', '1978-06-21', 'Eastwood Ln', 'Hempstead', 'New York', '20038'),
(500642, 'Chloe', 'Wilson', 'Fe', '1993-06-14', 'Westport Pl', 'Uniondale', 'North Carolina', '10036'),
(500643, 'Mia', 'Thompson', 'Ma', '1997-11-28', 'Northwood Ave', 'Yorkville', 'Georgia', '90025'),
(500644, 'Benjamin', 'Johnson', 'Fe', '1979-03-05', 'Maplebrook Ln', 'Frankville', 'Michigan', '60637'),
(500645, 'Emma', 'King', 'Ma', '2004-11-25', 'Willowdale Dr', 'Green City ', 'Ohio', '30305'),
(500646, 'Olivia', 'Taylor', 'Fe', '1986-07-22', 'Westhill Ct', 'Springville', 'Pennsylvania', '30308'),
(500647, 'Michael', 'Davis', 'Ma', '2005-09-28', 'Willowport Rd', 'Oakborough', 'Illinois', '90232'),
(500648, 'Isabella', 'Harris', 'Fe', '1970-02-20', 'Parkside St', 'Granhill', 'Florida', '20005'),
(500649, 'James', 'Turner', 'Ma', '1982-04-01', 'Northhill Way', 'Cedarford', 'Texas', '60614'),
(500650, 'Ava', 'Lewis', 'Fe', '1994-09-20', 'Oakford St', 'Greenhill', 'California', '30336'),
(500651, 'Benjamin', 'Baker', 'Ma', '1972-01-04', 'Willowview Ln', 'Oakmouth', 'Idaho', '10023'),
(500652, 'Emma', 'Anderson', 'Fe', '1990-04-18', 'Parkwood Ct', 'Brookchester', 'New Jersey', '90035'),
(500653, 'Olivia', 'Martinez', 'Ma', '1977-05-05', 'Easthill Rd', 'Granford', 'Mississippi', '30317'),
(500654, 'William', 'Wright', 'Fe', '1989-10-07', 'Cedarshire Ln', 'Bedford', 'Connecticut', '60646'),
(500655, 'Isabella', 'Davis', 'Ma', '1973-12-11', 'Southdale Rd', 'Greenchester', 'Arkansas', '90280'),
(500656, 'James', 'Harris', 'Fe', '2001-05-20', 'Maplewood Pl', 'Hempstead', 'Montana', '20018'),
(500657, 'Sophia', 'Turner', 'Ma', '1998-08-15', 'Eastport Ct', 'Uniondale', 'Rhode Island', '30303'),
(500658, 'Chloe', 'Wilson', 'Fe', '1995-11-21', 'Northwood Pl', 'Yorkville', 'Nebraska', '30302'),
(500659, 'Mia', 'Thompson', 'Ma', '2003-12-18', 'Westwood Dr', 'Frankville', 'Hawaii', '10003'),
(500660, 'Benjamin', 'Johnson', 'Fe', '1984-04-24', 'Willowhill Ct', 'Green City ', 'Delaware', '90048'),
(500661, 'Emma', 'King', 'Ma', '1976-08-26', 'Parkwood St', 'Springville', 'New Hampshire', '60628'),
(500662, 'Olivia', 'Taylor', 'Fe', '1991-01-16', 'Cedarwood St', 'Oakborough', 'South Dakota', '20002'),
(500663, 'Michael', 'Davis', 'Ma', '1996-05-09', 'Westside Pl', 'Granhill', 'Vermont', '90230'),
(500664, 'Isabella', 'Harris', 'Fe', '1987-10-10', 'Oakshire Ave', 'Cedarford', 'North Dakota', '30329'),
(500665, 'James', 'Turner', 'Ma', '1980-03-02', 'Southview Way', 'Greenhill', 'West Virginia', '30345'),
(500666, 'Ava', 'Lewis', 'Fe', '1974-07-26', 'Oakbrook Ln', 'Oakmouth', 'New Mexico', '90254'),
(500667, 'Benjamin', 'Baker', 'Ma', '1971-03-05', 'Cedarview Ln', 'Brookchester', 'Wyoming', '10007'),
(500668, 'Emma', 'Anderson', 'Fe', '1999-01-10', 'Willowbrook Terr', 'Granford', 'Alaska', '20024'),
(500669, 'Olivia', 'Martinez', 'Ma', '1981-07-23', 'Northside Ave', 'Bedford', 'Maine', '60621'),
(500670, 'William', 'Wright', 'Fe', '2000-09-22', 'Mapledale Dr', 'Greenchester', 'Nevada', '30327'),
(500671, 'Isabella', 'Davis', 'Ma', '2002-01-21', 'Parkview Ct', 'Hempstead', 'Utah', '90058'),
(500672, 'James', 'Harris', 'Fe', '1985-09-04', 'Oakwood Ave', 'Uniondale', 'Kansas', '60605'),
(500673, 'Sophia', 'Turner', 'Ma', '1992-11-30', 'Cedarbrook Pl', 'Yorkville', 'Oregon', '30311'),
(500674, 'Chloe', 'Wilson', 'Fe', '1988-04-19', 'Southwood Blvd', 'Frankville', 'Iowa', '10011'),
(500675, 'Mia', 'Thompson', 'Ma', '1975-01-08', 'Eastwood Blvd', 'Green City ', 'Oklahoma', '90220'),
(500676, 'Benjamin', 'Johnson', 'Fe', '1978-06-14', 'Westwood Terr', 'Springville', 'Kentucky', '20015'),
(500677, 'Emma', 'King', 'Ma', '1993-06-20', 'Oakhill Dr', 'Oakborough', 'Louisiana', '90291'),
(500678, 'Olivia', 'Taylor', 'Fe', '1997-11-17', 'Northdale Ct', 'Granhill', 'South Carolina', '60607'),
(500679, 'Michael', 'Davis', 'Ma', '1979-02-27', 'Mapleshire Dr', 'Cedarford', 'Alabama', '30312'),
(500680, 'Isabella', 'Harris', 'Fe', '2004-11-15', 'Pineport Ave', 'Greenhill', 'Colorado', '90064'),
(500681, 'James', 'Turner', 'Ma', '1986-07-02', 'Eastside Blvd', 'Oakmouth', 'Maryland', '10027'),
(500682, 'Ava', 'Lewis', 'Fe', '2005-10-05', 'Southwood Ln', 'Brookchester', 'Wisconsin', '90240'),
(500683, 'Benjamin', 'Baker', 'Ma', '1970-01-28', 'Oakdale Ct', 'Granford', 'Minnesota', '60613'),
(500684, 'Emma', 'Anderson', 'Fe', '1982-03-05', 'Cedarview St', 'Bedford', 'Missouri', '20012'),
(500685, 'Olivia', 'Martinez', 'Ma', '1994-09-13', 'Northdale Ln', 'Greenchester', 'Indiana', '30309'),
(500686, 'William', 'Wright', 'Fe', '1972-01-10', 'Parkport Ave', 'Hempstead', 'Tennessee', '30319'),
(500687, 'Isabella', 'Davis', 'Ma', '1990-03-11', 'Willowford Ave', 'Uniondale', 'Arizona', '90266'),
(500688, 'James', 'Harris', 'Fe', '1977-05-22', 'Cedarford Pl', 'Yorkville', 'Washington', '60602'),
(500689, 'Sophia', 'Turner', 'Ma', '1989-10-29', 'Pinebrook Ct', 'Frankville', 'Massachusetts', '30306'),
(500690, 'Chloe', 'Wilson', 'Fe', '1973-12-02', 'Eastwood Pl', 'Green City ', 'Virginia', '10019'),
(500691, 'Mia', 'Thompson', 'Ma', '2001-05-28', 'Willowwood Ln', 'Springville', 'New York', '90210'),
(500692, 'Benjamin', 'Johnson', 'Fe', '1998-08-01', 'Oakview Ct', 'Oakborough', 'North Carolina', '30346'),
(500693, 'Emma', 'King', 'Ma', '1995-11-02', 'Westdale Ln', 'Granhill', 'Georgia', '60622'),
(500694, 'Olivia', 'Taylor', 'Fe', '2003-12-26', 'Mapledale Ln', 'Cedarford', 'Michigan', '20009'),
(500695, 'Michael', 'Davis', 'Ma', '1984-04-19', 'Pineford St', 'Greenhill', 'Ohio', '90250'),
(500696, 'Isabella', 'Harris', 'Fe', '1976-08-21', 'Oakport Ln', 'Oakmouth', 'Pennsylvania', '10002'),
(500697, 'James', 'Turner', 'Ma', '1991-01-06', 'Northview Ave', 'Brookchester', 'Illinois', '90034'),
(500698, 'Ava', 'Lewis', 'Fe', '1996-05-02', 'Cedarhill Ave', 'Granford', 'Florida', '30307'),
(500699, 'Benjamin', 'Baker', 'Ma', '1987-10-27', 'Pinehill Pl', 'Bedford', 'Texas', '60620'),
(500700, 'Emma', 'Anderson', 'Fe', '1980-02-13', 'Mapleshire Blvd', 'Greenchester', 'California', '90275'),
(500701, 'John', 'Smith', 'Ma', '1974-07-08', 'Willowshire Ct', 'Hempstead', 'Idaho', '90210'),
(500702, 'Sarah', 'Johnson', 'Fe', '1971-02-16', 'Westhill Way', 'Uniondale', 'New Jersey', '10001'),
(500703, 'Michael', 'Brown', 'Ma', '1999-02-27', 'Maplehill Dr', 'Yorkville', 'Mississippi', '30301'),
(500704, 'Emily', 'Davis', 'Fe', '1981-07-04', 'Cedarside Ave', 'Frankville', 'Connecticut', '60601'),
(500705, 'James', 'Wilson', 'Ma', '2000-09-15', 'Southford Ct', 'Green City ', 'Arkansas', '90265'),
(500706, 'Olivia', 'Taylor', 'Fe', '2002-01-27', 'Mapleford Ave', 'Springville', 'Montana', '30318'),
(500707, 'Robert', 'Martinez', 'Ma', '1985-08-12', 'Northport Ct', 'Oakborough', 'Rhode Island', '20001'),
(500708, 'Emma', 'Anderson', 'Fe', '1992-11-15', 'Pineview Terr', 'Granhill', 'Nebraska', '90245'),
(500709, 'David', 'Thomas', 'Ma', '1972-11-23', 'Maplehill Ave', 'Cedarford', 'Hawaii', '60618'),
(500710, 'Ava', 'Jackson', 'Fe', '1983-02-14', 'Oakwood Pl', 'Greenhill', 'Delaware', '30320'),
(500711, 'Joseph', 'White', 'Ma', '1990-04-30', 'Northbrook Ave', 'Oakmouth', 'New Hampshire', '30339'),
(500712, 'Sophia', 'Harris', 'Fe', '1977-08-06', 'Southwood Dr', 'Brookchester', 'South Dakota', '10017'),
(500713, 'Charles', 'Clark', 'Ma', '1989-01-18', 'Oakview Ln', 'Granford', 'Vermont', '90001'),
(500714, 'Mia', 'Lewis', 'Fe', '1973-05-10', 'Cedarwood Ave', 'Bedford', 'North Dakota', '30310'),
(500715, 'Thomas', 'Hall', 'Ma', '2001-09-27', 'Eastdale Dr', 'Greenchester', 'West Virginia', '60610'),
(500716, 'Amelia', 'Young', 'Fe', '1998-12-12', 'Pineview Ln', 'Hempstead', 'New Mexico', '30342'),
(500717, 'Daniel', 'Lee', 'Ma', '1995-07-31', 'Southport Pl', 'Uniondale', 'Wyoming', '90045'),
(500718, 'Harper', 'Walker', 'Fe', '2003-03-22', 'Oakhill Terr', 'Yorkville', 'Alaska', '60625'),
(500719, 'Matthew', 'Wright', 'Ma', '1984-06-15', 'Parkdale Ave', 'Frankville', 'Maine', '20011'),
(500720, 'Lily', 'Baker', 'Fe', '1976-10-29', 'Willowdale Pl', 'Green City ', 'Nevada', '30322'),
(500721, 'Christopher', 'Green', 'Ma', '1991-03-21', 'Parkhill Rd', 'Springville', 'Utah', '60630'),
(500722, 'Grace', 'Smith', 'Fe', '1996-09-08', 'Eastwood Ct', 'Oakborough', 'Kansas', '10021'),
(500723, 'Andrew', 'Johnson', 'Ma', '1987-08-17', 'Cedarside Rd', 'Granhill', 'Oregon', '90260'),
(500724, 'Chloe', 'Davis', 'Fe', '1980-11-05', 'Mapleshire Ln', 'Cedarford', 'Iowa', '60603'),
(500725, 'William', 'Wilson', 'Ma', '1974-03-02', 'Pinebrook St', 'Greenhill', 'Oklahoma', '20020'),
(500726, 'Sophia', 'Taylor', 'Fe', '1971-07-19', 'Northview Ln', 'Oakmouth', 'Kentucky', '90272'),
(500727, 'Benjamin', 'Martinez', 'Ma', '1999-05-20', 'Oakdale Ln', 'Brookchester', 'Louisiana', '10005'),
(500728, 'Mia', 'Anderson', 'Fe', '1981-01-25', 'Westdale Ave', 'Granford', 'South Carolina', '30350'),
(500729, 'Samuel', 'Thomas', 'Ma', '2000-08-02', 'Willowwood Pl', 'Bedford', 'Alabama', '90012'),
(500730, 'Emily', 'Jackson', 'Fe', '2002-12-08', 'Southshire Terr', 'Greenchester', 'Colorado', '60615'),
(500731, 'Ethan', 'White', 'Ma', '1985-04-11', 'Mapleshire Ct', 'Hempstead', 'Maryland', '30359'),
(500732, 'Olivia', 'Harris', 'Fe', '1992-07-15', 'Cedarview Way', 'Uniondale', 'Wisconsin', '10013'),
(500733, 'Matthew', 'Clark', 'Ma', '1988-09-28', 'Pinehill Ln', 'Yorkville', 'Minnesota', '90274'),
(500734, 'Ava', 'Lewis', 'Fe', '1975-12-06', 'Parkview Ave', 'Frankville', 'Missouri', '20032'),
(500735, 'Alexander', 'Hall', 'Ma', '1978-02-01', 'Eastdale Terr', 'Green City ', 'Indiana', '30362'),
(500736, 'Harper', 'Young', 'Fe', '1993-10-24', 'Westview Dr', 'Springville', 'Tennessee', '60629'),
(500737, 'Jackson', 'Lee', 'Ma', '1997-06-13', 'Southwood Ct', 'Oakborough', 'Arizona', '90017'),
(500738, 'Grace', 'Walker', 'Fe', '1979-04-14', 'Parkwood Blvd', 'Granhill', 'Washington', '30328'),
(500739, 'David', 'Wright', 'Ma', '2004-03-18', 'Cedarside Pl', 'Cedarford', 'Massachusetts', '60633'),
(500740, 'Emma', 'Baker', 'Fe', '1986-11-09', 'Oakwood Dr', 'Greenhill', 'Virginia', '90292'),
(500741, 'William', 'Green', 'Ma', '2005-07-26', 'Eastwood Ln', 'Oakmouth', 'New York', '20038'),
(500742, 'Lily', 'Smith', 'Fe', '1970-09-16', 'Westport Pl', 'Brookchester', 'North Carolina', '10036'),
(500743, 'Benjamin', 'Johnson', 'Ma', '1982-03-27', 'Northwood Ave', 'Granford', 'Georgia', '90025'),
(500744, 'Chloe', 'Davis', 'Fe', '1994-08-03', 'Maplebrook Ln', 'Bedford', 'Michigan', '60637'),
(500745, 'Samuel', 'Wilson', 'Ma', '1972-06-20', 'Willowdale Dr', 'Greenchester', 'Ohio', '30305'),
(500746, 'Sophia', 'Taylor', 'Fe', '1990-10-11', 'Westhill Ct', 'Hempstead', 'Pennsylvania', '30308'),
(500747, 'Matthew', 'Martinez', 'Ma', '1977-01-28', 'Willowport Rd', 'Uniondale', 'Illinois', '90232'),
(500748, 'Mia', 'Anderson', 'Fe', '1989-05-29', 'Parkside St', 'Yorkville', 'Florida', '20005'),
(500749, 'Daniel', 'Thomas', 'Ma', '1973-07-07', 'Northhill Way', 'Frankville', 'Texas', '60614'),
(500750, 'Ava', 'Jackson', 'Fe', '2001-12-31', 'Oakford St', 'Green City ', 'California', '30336'),
(500751, 'Joseph', 'White', 'Ma', '1998-02-22', 'Willowview Ln', 'Springville', 'Idaho', '10023'),
(500752, 'Sophia', 'Harris', 'Fe', '1995-03-17', 'Parkwood Ct', 'Oakborough', 'New Jersey', '90035'),
(500753, 'Charles', 'Clark', 'Ma', '2003-08-21', 'Easthill Rd', 'Granhill', 'Mississippi', '30317'),
(500754, 'Mia', 'Lewis', 'Fe', '1984-09-08', 'Cedarshire Ln', 'Cedarford', 'Connecticut', '60646'),
(500755, 'Thomas', 'Hall', 'Ma', '1976-04-25', 'Southdale Rd', 'Greenhill', 'Arkansas', '90280'),
(500756, 'Amelia', 'Young', 'Fe', '1991-06-28', 'Maplewood Pl', 'Oakmouth', 'Montana', '20018'),
(500757, 'Daniel', 'Lee', 'Ma', '1996-01-13', 'Eastport Ct', 'Brookchester', 'Rhode Island', '30303'),
(500758, 'Harper', 'Walker', 'Fe', '1987-12-09', 'Northwood Pl', 'Granford', 'Nebraska', '30302'),
(500759, 'Matthew', 'Wright', 'Ma', '1980-03-23', 'Westwood Dr', 'Bedford', 'Hawaii', '10003'),
(500760, 'Lily', 'Baker', 'Fe', '1974-11-01', 'Willowhill Ct', 'Greenchester', 'Delaware', '90048'),
(500761, 'Christopher', 'Green', 'Ma', '1971-04-15', 'Parkwood St', 'Hempstead', 'New Hampshire', '60628'),
(500762, 'Grace', 'Smith', 'Fe', '1999-07-04', 'Cedarwood St', 'Uniondale', 'South Dakota', '20002'),
(500763, 'Andrew', 'Johnson', 'Ma', '1981-08-18', 'Westside Pl', 'Yorkville', 'Vermont', '90230'),
(500764, 'Chloe', 'Davis', 'Fe', '2000-10-05', 'Oakshire Ave', 'Frankville', 'North Dakota', '30329'),
(500765, 'William', 'Wilson', 'Ma', '2002-05-19', 'Southview Way', 'Green City ', 'West Virginia', '30345'),
(500766, 'Sophia', 'Taylor', 'Fe', '1985-02-06', 'Oakbrook Ln', 'Springville', 'New Mexico', '90254'),
(500767, 'Benjamin', 'Martinez', 'Ma', '1992-09-11', 'Cedarview Ln', 'Oakborough', 'Wyoming', '10007'),
(500768, 'Mia', 'Anderson', 'Fe', '1988-06-27', 'Willowbrook Terr', 'Granhill', 'Alaska', '20024'),
(500769, 'Samuel', 'Thomas', 'Ma', '1975-10-16', 'Northside Ave', 'Cedarford', 'Maine', '60621'),
(500770, 'Emily', 'Jackson', 'Fe', '1978-12-22', 'Mapledale Dr', 'Greenhill', 'Nevada', '30327'),
(500771, 'Ethan', 'White', 'Ma', '1993-02-08', 'Parkview Ct', 'Oakmouth', 'Utah', '90058'),
(500772, 'Olivia', 'Harris', 'Fe', '1997-04-03', 'Oakwood Ave', 'Brookchester', 'Kansas', '60605'),
(500773, 'Matthew', 'Clark', 'Ma', '1979-09-10', 'Cedarbrook Pl', 'Granford', 'Oregon', '30311'),
(500774, 'Ava', 'Lewis', 'Fe', '2004-01-24', 'Southwood Blvd', 'Bedford', 'Iowa', '10011'),
(500775, 'Alexander', 'Hall', 'Ma', '1986-08-03', 'Eastwood Blvd', 'Greenchester', 'Oklahoma', '90220'),
(500776, 'Harper', 'Young', 'Fe', '2005-06-20', 'Westwood Terr', 'Hempstead', 'Kentucky', '20015'),
(500777, 'Jackson', 'Lee', 'Ma', '1970-08-04', 'Oakhill Dr', 'Uniondale', 'Louisiana', '90291'),
(500778, 'Grace', 'Walker', 'Fe', '1982-01-10', 'Northdale Ct', 'Yorkville', 'South Carolina', '60607'),
(500779, 'David', 'Wright', 'Ma', '1994-05-28', 'Mapleshire Dr', 'Frankville', 'Alabama', '30312'),
(500780, 'Emma', 'Baker', 'Fe', '1972-07-15', 'Pineport Ave', 'Green City ', 'Colorado', '90064'),
(500781, 'William', 'Green', 'Ma', '1990-11-19', 'Eastside Blvd', 'Springville', 'Maryland', '10027'),
(500782, 'Lily', 'Smith', 'Fe', '1977-03-31', 'Southwood Ln', 'Oakborough', 'Wisconsin', '90240'),
(500783, 'Benjamin', 'Johnson', 'Ma', '1989-08-11', 'Oakdale Ct', 'Granhill', 'Minnesota', '60613'),
(500784, 'Chloe', 'Davis', 'Fe', '1973-01-29', 'Cedarview St', 'Cedarford', 'Missouri', '20012'),
(500785, 'Samuel', 'Wilson', 'Ma', '2001-05-13', 'Northdale Ln', 'Greenhill', 'Indiana', '30309'),
(500786, 'Sophia', 'Taylor', 'Fe', '1998-10-20', 'Parkport Ave', 'Oakmouth', 'Tennessee', '30319'),
(500787, 'Matthew', 'Martinez', 'Ma', '1995-12-07', 'Willowford Ave', 'Brookchester', 'Arizona', '90266'),
(500788, 'Mia', 'Anderson', 'Fe', '2003-07-03', 'Cedarford Pl', 'Granford', 'Washington', '60602'),
(500789, 'Daniel', 'Thomas', 'Ma', '1984-03-11', 'Pinebrook Ct', 'Bedford', 'Massachusetts', '30306'),
(500790, 'Ava', 'Jackson', 'Fe', '1976-06-26', 'Eastwood Pl', 'Greenchester', 'Virginia', '10019'),
(500791, 'Joseph', 'White', 'Ma', '1991-08-22', 'Willowwood Ln', 'Hempstead', 'New York', '90210'),
(500792, 'Sophia', 'Harris', 'Fe', '1996-02-05', 'Oakview Ct', 'Uniondale', 'North Carolina', '30346'),
(500793, 'Charles', 'Clark', 'Ma', '1987-05-17', 'Westdale Ln', 'Yorkville', 'Georgia', '60622'),
(500794, 'Mia', 'Lewis', 'Fe', '1980-10-25', 'Mapledale Ln', 'Frankville', 'Michigan', '20009'),
(500795, 'Thomas', 'Hall', 'Ma', '1974-12-01', 'Pineford St', 'Green City ', 'Ohio', '90250'),
(500796, 'Amelia', 'Young', 'Fe', '1971-04-02', 'Oakport Ln', 'Springville', 'Pennsylvania', '10002'),
(500797, 'Daniel', 'Lee', 'Ma', '1999-09-15', 'Northview Ave', 'Oakborough', 'Illinois', '90034'),
(500798, 'Harper', 'Walker', 'Fe', '1981-02-09', 'Cedarhill Ave', 'Granhill', 'Florida', '30307'),
(500799, 'Matthew', 'Wright', 'Ma', '2000-10-12', 'Pinehill Pl', 'Cedarford', 'Texas', '60620'),
(500800, 'Lily', 'Baker', 'Fe', '2002-04-27', 'Mapleshire Blvd', 'Greenhill', 'California', '90275'),
(500801, 'Aiden', 'Martinez', 'Ma', '1985-06-29', 'Willowshire Ct', 'Oakmouth', 'Idaho', '90210'),
(500802, 'Ava', 'Thompson', 'Fe', '1992-01-30', 'Westhill Way', 'Brookchester', 'New Jersey', '10001'),
(500803, 'Liam', 'Lewis', 'Ma', '1988-11-07', 'Maplehill Dr', 'Granford', 'Mississippi', '30301'),
(500804, 'Olivia', 'Hall', 'Fe', '1975-02-13', 'Cedarside Ave', 'Bedford', 'Connecticut', '60601'),
(500805, 'Noah', 'King', 'Ma', '1978-07-23', 'Southford Ct', 'Greenchester', 'Arkansas', '90265'),
(500806, 'Isabella', 'Murphy', 'Fe', '1993-05-16', 'Mapleford Ave', 'Hempstead', 'Montana', '30318'),
(500807, 'James', 'Powell', 'Ma', '1997-09-02', 'Northport Ct', 'Uniondale', 'Rhode Island', '20001'),
(500808, 'Sophia', 'Perry', 'Fe', '1979-12-08', 'Pineview Terr', 'Yorkville', 'Nebraska', '90245'),
(500809, 'Lucas', 'Long', 'Ma', '2004-06-30', 'Maplehill Ave', 'Frankville', 'Hawaii', '60618'),
(500810, 'Mia', 'Wood', 'Fe', '1986-02-14', 'Oakwood Pl', 'Green City ', 'Delaware', '30320'),
(500811, 'Jackson', 'Cook', 'Ma', '2005-03-29', 'Northbrook Ave', 'Springville', 'New Hampshire', '30339'),
(500812, 'Emily', 'Sanders', 'Fe', '1970-11-16', 'Southwood Dr', 'Oakborough', 'South Dakota', '10017'),
(500813, 'Aiden', 'Turner', 'Ma', '1982-09-21', 'Oakview Ln', 'Granhill', 'Vermont', '90001'),
(500814, 'Scarlett', 'Green', 'Fe', '1994-12-02', 'Cedarwood Ave', 'Cedarford', 'North Dakota', '30310'),
(500815, 'Daniel', 'Brooks', 'Ma', '1972-04-25', 'Eastdale Dr', 'Greenhill', 'West Virginia', '60610'),
(500816, 'Addison', 'Price', 'Fe', '1990-08-06', 'Pineview Ln', 'Oakmouth', 'New Mexico', '30342'),
(500817, 'Logan', 'Rogers', 'Ma', '1977-02-08', 'Southport Pl', 'Brookchester', 'Wyoming', '90045'),
(500818, 'Lily', 'Hughes', 'Fe', '1989-05-31', 'Oakhill Terr', 'Granford', 'Alaska', '60625'),
(500819, 'Benjamin', 'Bennett', 'Ma', '1973-08-17', 'Parkdale Ave', 'Bedford', 'Maine', '20011'),
(500820, 'Zoey', 'Foster', 'Fe', '2001-01-06', 'Willowdale Pl', 'Greenchester', 'Nevada', '30322'),
(500821, 'Henry', 'Bryant', 'Ma', '1998-03-15', 'Parkhill Rd', 'Hempstead', 'Utah', '60630'),
(500822, 'Emma', 'Perry', 'Fe', '1995-07-27', 'Eastwood Ct', 'Uniondale', 'Kansas', '10021'),
(500823, 'Wyatt', 'Harris', 'Ma', '2003-06-19', 'Cedarside Rd', 'Yorkville', 'Oregon', '90260'),
(500824, 'Abigail', 'Adams', 'Fe', '1984-01-24', 'Mapleshire Ln', 'Frankville', 'Iowa', '60603'),
(500825, 'Gabriel', 'Wallace', 'Ma', '1976-12-03', 'Pinebrook St', 'Green City ', 'Oklahoma', '20020'),
(500826, 'Hannah', 'Carter', 'Fe', '1991-03-10', 'Northview Ln', 'Springville', 'Kentucky', '90272'),
(500827, 'Elijah', 'Bryant', 'Ma', '1996-05-26', 'Oakdale Ln', 'Oakborough', 'Louisiana', '10005'),
(500828, 'Grace', 'Miller', 'Fe', '1987-10-05', 'Westdale Ave', 'Granhill', 'South Carolina', '30350'),
(500829, 'Oliver', 'Coleman', 'Ma', '1980-07-29', 'Willowwood Pl', 'Cedarford', 'Alabama', '90012'),
(500830, 'Sofia', 'Peterson', 'Fe', '1974-02-13', 'Southshire Terr', 'Greenhill', 'Colorado', '60615'),
(500831, 'Samuel', 'Richardson', 'Ma', '1971-05-21', 'Mapleshire Ct', 'Oakmouth', 'Maryland', '30359'),
(500832, 'Victoria', 'Russell', 'Fe', '1999-08-19', 'Cedarview Way', 'Brookchester', 'Wisconsin', '10013'),
(500833, 'Christopher', 'Griffin', 'Ma', '1981-12-31', 'Pinehill Ln', 'Granford', 'Minnesota', '90274'),
(500834, 'Lily', 'Sullivan', 'Fe', '2000-02-11', 'Parkview Ave', 'Bedford', 'Missouri', '20032'),
(500835, 'Andrew', 'Henderson', 'Ma', '2002-09-12', 'Eastdale Terr', 'Greenchester', 'Indiana', '30362'),
(500836, 'Zoey', 'Simmons', 'Fe', '1985-07-18', 'Westview Dr', 'Hempstead', 'Tennessee', '60629'),
(500837, 'Joshua', 'Carter', 'Ma', '1992-08-04', 'Southwood Ct', 'Uniondale', 'Arizona', '90017'),
(500838, 'Ava', 'Jenkins', 'Fe', '1988-11-25', 'Parkwood Blvd', 'Yorkville', 'Washington', '30328'),
(500839, 'William', 'Foster', 'Ma', '1975-01-20', 'Cedarside Pl', 'Frankville', 'Massachusetts', '60633'),
(500840, 'Harper', 'Thompson', 'Fe', '1978-05-15', 'Oakwood Dr', 'Green City ', 'Virginia', '90292'),
(500841, 'Henry', 'Perry', 'Ma', '1993-10-02', 'Eastwood Ln', 'Springville', 'New York', '20038'),
(500842, 'Mia', 'Wood', 'Fe', '1997-02-27', 'Westport Pl', 'Oakborough', 'North Carolina', '10036'),
(500843, 'Elijah', 'Cook', 'Ma', '1979-06-20', 'Northwood Ave', 'Granhill', 'Georgia', '90025'),
(500844, 'Olivia', 'Sanders', 'Fe', '2004-09-21', 'Maplebrook Ln', 'Cedarford', 'Michigan', '60637'),
(500845, 'Jackson', 'Turner', 'Ma', '1986-04-03', 'Willowdale Dr', 'Greenhill', 'Ohio', '30305'),
(500846, 'Emily', 'Green', 'Fe', '2005-05-10', 'Westhill Ct', 'Oakmouth', 'Pennsylvania', '30308'),
(500847, 'Aiden', 'Brooks', 'Ma', '1970-10-13', 'Willowport Rd', 'Brookchester', 'Illinois', '90232'),
(500848, 'Scarlett', 'Price', 'Fe', '1982-07-01', 'Parkside St', 'Granford', 'Florida', '20005'),
(500849, 'Daniel', 'Rogers', 'Ma', '1994-01-16', 'Northhill Way', 'Bedford', 'Texas', '60614'),
(500850, 'Addison', 'Hughes', 'Fe', '1972-03-29', 'Oakford St', 'Greenchester', 'California', '30336'),
(500851, 'Logan', 'Bennett', 'Ma', '1990-09-26', 'Willowview Ln', 'Hempstead', 'Idaho', '10023'),
(500852, 'Lily', 'Foster', 'Fe', '1977-08-12', 'Parkwood Ct', 'Uniondale', 'New Jersey', '90035'),
(500853, 'Benjamin', 'Bryant', 'Ma', '1989-02-07', 'Easthill Rd', 'Yorkville', 'Mississippi', '30317'),
(500854, 'Zoey', 'Perry', 'Fe', '1973-01-28', 'Cedarshire Ln', 'Frankville', 'Connecticut', '60646'),
(500855, 'Henry', 'Harris', 'Ma', '2001-06-03', 'Southdale Rd', 'Green City ', 'Arkansas', '90280'),
(500856, 'Emma', 'Adams', 'Fe', '1998-10-10', 'Maplewood Pl', 'Springville', 'Montana', '20018'),
(500857, 'Wyatt', 'Wallace', 'Ma', '1995-11-27', 'Eastport Ct', 'Oakborough', 'Rhode Island', '30303'),
(500858, 'Abigail', 'Carter', 'Fe', '2003-12-09', 'Northwood Pl', 'Granhill', 'Nebraska', '30302'),
(500859, 'Gabriel', 'Bryant', 'Ma', '1984-03-21', 'Westwood Dr', 'Cedarford', 'Hawaii', '10003'),
(500860, 'Hannah', 'Miller', 'Fe', '1976-08-23', 'Willowhill Ct', 'Greenhill', 'Delaware', '90048'),
(500861, 'Elijah', 'Coleman', 'Ma', '1991-12-20', 'Parkwood St', 'Oakmouth', 'New Hampshire', '60628'),
(500862, 'Grace', 'Peterson', 'Fe', '1996-04-28', 'Cedarwood St', 'Brookchester', 'South Dakota', '20002'),
(500863, 'Oliver', 'Richardson', 'Ma', '1987-12-13', 'Westside Pl', 'Granford', 'Vermont', '90230'),
(500864, 'Sofia', 'Russell', 'Fe', '1980-05-11', 'Oakshire Ave', 'Bedford', 'North Dakota', '30329'),
(500865, 'Samuel', 'Griffin', 'Ma', '1974-08-29', 'Southview Way', 'Greenchester', 'West Virginia', '30345'),
(500866, 'Victoria', 'Sullivan', 'Fe', '1971-02-20', 'Oakbrook Ln', 'Hempstead', 'New Mexico', '90254'),
(500867, 'Christopher', 'Henderson', 'Ma', '1999-03-01', 'Cedarview Ln', 'Uniondale', 'Wyoming', '10007'),
(500868, 'Lily', 'Simmons', 'Fe', '1981-05-04', 'Willowbrook Terr', 'Yorkville', 'Alaska', '20024'),
(500869, 'Andrew', 'Carter', 'Ma', '2000-09-06', 'Northside Ave', 'Frankville', 'Maine', '60621'),
(500870, 'Zoey', 'Jenkins', 'Fe', '2002-01-30', 'Mapledale Dr', 'Green City ', 'Nevada', '30327'),
(500871, 'Joshua', 'Foster', 'Ma', '1985-09-17', 'Parkview Ct', 'Springville', 'Utah', '90058'),
(500872, 'Ava', 'Thompson', 'Fe', '1992-11-23', 'Oakwood Ave', 'Oakborough', 'Kansas', '60605'),
(500873, 'William', 'Perry', 'Ma', '1988-06-01', 'Cedarbrook Pl', 'Granhill', 'Oregon', '30311'),
(500874, 'Harper', 'Wood', 'Fe', '1975-04-14', 'Southwood Blvd', 'Cedarford', 'Iowa', '10011'),
(500875, 'Henry', 'Cook', 'Ma', '1978-10-19', 'Eastwood Blvd', 'Greenhill', 'Oklahoma', '90220'),
(500876, 'Mia', 'Sanders', 'Fe', '1993-07-05', 'Westwood Terr', 'Oakmouth', 'Kentucky', '20015'),
(500877, 'Elijah', 'Turner', 'Ma', '1997-01-15', 'Oakhill Dr', 'Brookchester', 'Louisiana', '90291'),
(500878, 'Olivia', 'Green', 'Fe', '1979-03-26', 'Northdale Ct', 'Granford', 'South Carolina', '60607'),
(500879, 'Aiden', 'Brooks', 'Ma', '2004-12-16', 'Mapleshire Dr', 'Bedford', 'Alabama', '30312'),
(500880, 'Scarlett', 'Price', 'Fe', '1986-05-01', 'Pineport Ave', 'Greenchester', 'Colorado', '90064'),
(500881, 'Logan', 'Rogers', 'Ma', '2005-08-08', 'Eastside Blvd', 'Hempstead', 'Maryland', '10027'),
(500882, 'Lily', 'Hughes', 'Fe', '1970-06-20', 'Southwood Ln', 'Uniondale', 'Wisconsin', '90240'),
(500883, 'Benjamin', 'Bennett', 'Ma', '1982-02-09', 'Oakdale Ct', 'Yorkville', 'Minnesota', '60613'),
(500884, 'Zoey', 'Foster', 'Fe', '1994-09-13', 'Cedarview St', 'Frankville', 'Missouri', '20012'),
(500885, 'Henry', 'Bryant', 'Ma', '1972-01-25', 'Northdale Ln', 'Green City ', 'Indiana', '30309'),
(500886, 'Emma', 'Perry', 'Fe', '1990-03-04', 'Parkport Ave', 'Springville', 'Tennessee', '30319'),
(500887, 'Wyatt', 'Harris', 'Ma', '1977-05-19', 'Willowford Ave', 'Oakborough', 'Arizona', '90266'),
(500888, 'Abigail', 'Adams', 'Fe', '1989-10-22', 'Cedarford Pl', 'Granhill', 'Washington', '60602'),
(500889, 'Gabriel', 'Wallace', 'Ma', '1973-12-05', 'Pinebrook Ct', 'Cedarford', 'Massachusetts', '30306'),
(500890, 'Hannah', 'Carter', 'Fe', '2001-04-01', 'Eastwood Pl', 'Greenhill', 'Virginia', '10019'),
(500891, 'John', 'Smith', 'Ma', '1998-08-27', 'Willowwood Ln', 'Oakmouth', 'New York', '90210'),
(500892, 'Sarah', 'Johnson', 'Fe', '1995-11-07', 'Oakview Ct', 'Brookchester', 'North Carolina', '30346'),
(500893, 'Michael', 'Brown', 'Ma', '2003-12-31', 'Westdale Ln', 'Granford', 'Georgia', '60622'),
(500894, 'Emily', 'Davis', 'Fe', '1984-04-17', 'Mapledale Ln', 'Bedford', 'Michigan', '20009'),
(500895, 'James', 'Wilson', 'Ma', '1976-09-30', 'Pineford St', 'Greenchester', 'Ohio', '90250'),
(500896, 'Olivia', 'Taylor', 'Fe', '1991-06-10', 'Oakport Ln', 'Hempstead', 'Pennsylvania', '10002'),
(500897, 'Robert', 'Martinez', 'Ma', '1996-02-15', 'Northview Ave', 'Uniondale', 'Illinois', '90034'),
(500898, 'Emma', 'Anderson', 'Fe', '1987-12-27', 'Cedarhill Ave', 'Yorkville', 'Florida', '30307'),
(500899, 'David', 'Thomas', 'Ma', '1980-05-02', 'Pinehill Pl', 'Frankville', 'Texas', '60620'),
(500900, 'Ava', 'Jackson', 'Fe', '1974-08-12', 'Mapleshire Blvd', 'Green City ', 'California', '90275'),
(500901, 'Joseph', 'White', 'Ma', '1971-03-19', 'Willowshire Ct', 'Springville', 'Idaho', '90210'),
(500902, 'Sophia', 'Harris', 'Fe', '1999-02-13', 'Westhill Way', 'Oakborough', 'New Jersey', '10001'),
(500903, 'Charles', 'Clark', 'Ma', '1981-07-16', 'Maplehill Dr', 'Granhill', 'Mississippi', '30301'),
(500904, 'Mia', 'Lewis', 'Fe', '2000-09-25', 'Cedarside Ave', 'Cedarford', 'Connecticut', '60601'),
(500905, 'Thomas', 'Hall', 'Ma', '2002-01-14', 'Southford Ct', 'Greenhill', 'Arkansas', '90265'),
(500906, 'Amelia', 'Young', 'Fe', '1985-09-28', 'Mapleford Ave', 'Oakmouth', 'Montana', '30318'),
(500907, 'Daniel', 'Lee', 'Ma', '1992-12-07', 'Northport Ct', 'Brookchester', 'Rhode Island', '20001'),
(500908, 'Harper', 'Walker', 'Fe', '1988-04-20', 'Pineview Terr', 'Granford', 'Nebraska', '90245'),
(500909, 'Matthew', 'Wright', 'Ma', '1975-01-30', 'Maplehill Ave', 'Bedford', 'Hawaii', '60618'),
(500910, 'Lily', 'Baker', 'Fe', '1978-07-07', 'Oakwood Pl', 'Greenchester', 'Delaware', '30320'),
(500911, 'Christopher', 'Green', 'Ma', '1993-06-27', 'Northbrook Ave', 'Hempstead', 'New Hampshire', '30339'),
(500912, 'Grace', 'Smith', 'Fe', '1997-11-03', 'Southwood Dr', 'Uniondale', 'South Dakota', '10017'),
(500913, 'Andrew', 'Johnson', 'Ma', '1979-03-11', 'Oakview Ln', 'Yorkville', 'Vermont', '90001'),
(500914, 'Chloe', 'Davis', 'Fe', '2004-12-04', 'Cedarwood Ave', 'Frankville', 'North Dakota', '30310'),
(500915, 'William', 'Wilson', 'Ma', '1986-06-14', 'Eastdale Dr', 'Green City ', 'West Virginia', '60610'),
(500916, 'Sophia', 'Taylor', 'Fe', '2005-08-25', 'Pineview Ln', 'Springville', 'New Mexico', '30342'),
(500917, 'Benjamin', 'Martinez', 'Ma', '1970-04-27', 'Southport Pl', 'Oakborough', 'Wyoming', '90045'),
(500918, 'Mia', 'Anderson', 'Fe', '1982-02-22', 'Oakhill Terr', 'Granhill', 'Alaska', '60625'),
(500919, 'Samuel', 'Thomas', 'Ma', '1994-09-05', 'Parkdale Ave', 'Cedarford', 'Maine', '20011'),
(500920, 'Emily', 'Jackson', 'Fe', '1972-01-01', 'Willowdale Pl', 'Greenhill', 'Nevada', '30322'),
(500921, 'Ethan', 'White', 'Ma', '1990-03-20', 'Parkhill Rd', 'Oakmouth', 'Utah', '60630'),
(500922, 'Olivia', 'Harris', 'Fe', '1977-05-28', 'Eastwood Ct', 'Brookchester', 'Kansas', '10021'),
(500923, 'Matthew', 'Clark', 'Ma', '1989-11-09', 'Cedarside Rd', 'Granford', 'Oregon', '90260'),
(500924, 'Ava', 'Lewis', 'Fe', '1973-12-23', 'Mapleshire Ln', 'Bedford', 'Iowa', '60603'),
(500925, 'Alexander', 'Hall', 'Ma', '2001-05-02', 'Pinebrook St', 'Greenchester', 'Oklahoma', '20020'),
(500926, 'Harper', 'Young', 'Fe', '1998-07-18', 'Northview Ln', 'Hempstead', 'Kentucky', '90272'),
(500927, 'Jackson', 'Lee', 'Ma', '1995-10-01', 'Oakdale Ln', 'Uniondale', 'Louisiana', '10005'),
(500928, 'Grace', 'Walker', 'Fe', '2003-12-25', 'Westdale Ave', 'Yorkville', 'South Carolina', '30350'),
(500929, 'David', 'Wright', 'Ma', '1984-04-02', 'Willowwood Pl', 'Frankville', 'Alabama', '90012'),
(500930, 'Emma', 'Baker', 'Fe', '1976-08-10', 'Southshire Terr', 'Green City ', 'Colorado', '60615'),
(500931, 'William', 'Green', 'Ma', '1991-01-28', 'Mapleshire Ct', 'Springville', 'Maryland', '30359'),
(500932, 'Lily', 'Smith', 'Fe', '1996-05-04', 'Cedarview Way', 'Oakborough', 'Wisconsin', '10013'),
(500933, 'Benjamin', 'Johnson', 'Ma', '1987-10-15', 'Pinehill Ln', 'Granhill', 'Minnesota', '90274'),
(500934, 'Chloe', 'Davis', 'Fe', '1980-02-25', 'Parkview Ave', 'Cedarford', 'Missouri', '20032'),
(500935, 'Samuel', 'Wilson', 'Ma', '1974-07-12', 'Eastdale Terr', 'Greenhill', 'Indiana', '30362'),
(500936, 'Sophia', 'Taylor', 'Fe', '1971-03-31', 'Westview Dr', 'Oakmouth', 'Tennessee', '60629'),
(500937, 'Matthew', 'Martinez', 'Ma', '1999-02-18', 'Southwood Ct', 'Brookchester', 'Arizona', '90017'),
(500938, 'Mia', 'Anderson', 'Fe', '1981-07-31', 'Parkwood Blvd', 'Granford', 'Washington', '30328'),
(500939, 'Daniel', 'Thomas', 'Ma', '2000-09-09', 'Cedarside Pl', 'Bedford', 'Massachusetts', '60633'),
(500940, 'Ava', 'Jackson', 'Fe', '2002-01-08', 'Oakwood Dr', 'Greenchester', 'Virginia', '90292'),
(500941, 'Joseph', 'White', 'Ma', '1985-08-30', 'Eastwood Ln', 'Hempstead', 'New York', '20038'),
(500942, 'Sophia', 'Harris', 'Fe', '1992-11-11', 'Westport Pl', 'Uniondale', 'North Carolina', '10036'),
(500943, 'Charles', 'Clark', 'Ma', '1988-04-02', 'Northwood Ave', 'Yorkville', 'Georgia', '90025'),
(500944, 'Mia', 'Lewis', 'Fe', '1975-01-15', 'Maplebrook Ln', 'Frankville', 'Michigan', '60637'),
(500945, 'Thomas', 'Hall', 'Ma', '1978-06-21', 'Willowdale Dr', 'Green City ', 'Ohio', '30305'),
(500946, 'Amelia', 'Young', 'Fe', '1993-06-14', 'Westhill Ct', 'Springville', 'Pennsylvania', '30308'),
(500947, 'Daniel', 'Lee', 'Ma', '1997-11-28', 'Willowport Rd', 'Oakborough', 'Illinois', '90232'),
(500948, 'Harper', 'Walker', 'Fe', '1979-03-05', 'Parkside St', 'Granhill', 'Florida', '20005'),
(500949, 'Matthew', 'Wright', 'Ma', '2004-11-25', 'Northhill Way', 'Cedarford', 'Texas', '60614'),
(500950, 'Lily', 'Baker', 'Fe', '1986-07-22', 'Oakford St', 'Greenhill', 'California', '30336'),
(500951, 'Christopher', 'Green', 'Ma', '2005-09-28', 'Willowview Ln', 'Oakmouth', 'Idaho', '10023'),
(500952, 'Grace', 'Smith', 'Fe', '1970-02-20', 'Parkwood Ct', 'Brookchester', 'New Jersey', '90035'),
(500953, 'Andrew', 'Johnson', 'Ma', '1982-04-01', 'Easthill Rd', 'Granford', 'Mississippi', '30317'),
(500954, 'Chloe', 'Davis', 'Fe', '1994-09-20', 'Cedarshire Ln', 'Bedford', 'Connecticut', '60646'),
(500955, 'William', 'Wilson', 'Ma', '1972-01-04', 'Southdale Rd', 'Greenchester', 'Arkansas', '90280'),
(500956, 'Sophia', 'Taylor', 'Fe', '1990-04-18', 'Maplewood Pl', 'Hempstead', 'Montana', '20018'),
(500957, 'Benjamin', 'Martinez', 'Ma', '1977-05-05', 'Eastport Ct', 'Uniondale', 'Rhode Island', '30303'),
(500958, 'Mia', 'Anderson', 'Fe', '1989-10-07', 'Northwood Pl', 'Yorkville', 'Nebraska', '30302'),
(500959, 'Samuel', 'Thomas', 'Ma', '1973-12-11', 'Westwood Dr', 'Frankville', 'Hawaii', '10003'),
(500960, 'Emily', 'Jackson', 'Fe', '2001-05-20', 'Willowhill Ct', 'Green City ', 'Delaware', '90048'),
(500961, 'Ethan', 'White', 'Ma', '1998-08-15', 'Parkwood St', 'Springville', 'New Hampshire', '60628'),
(500962, 'Olivia', 'Harris', 'Fe', '1995-11-21', 'Cedarwood St', 'Oakborough', 'South Dakota', '20002'),
(500963, 'Matthew', 'Clark', 'Ma', '2003-12-18', 'Westside Pl', 'Granhill', 'Vermont', '90230'),
(500964, 'Ava', 'Lewis', 'Fe', '1984-04-24', 'Oakshire Ave', 'Cedarford', 'North Dakota', '30329'),
(500965, 'Alexander', 'Hall', 'Ma', '1976-08-26', 'Southview Way', 'Greenhill', 'West Virginia', '30345'),
(500966, 'Harper', 'Young', 'Fe', '1991-01-16', 'Oakbrook Ln', 'Oakmouth', 'New Mexico', '90254'),
(500967, 'Jackson', 'Lee', 'Ma', '1996-05-09', 'Cedarview Ln', 'Brookchester', 'Wyoming', '10007'),
(500968, 'Grace', 'Walker', 'Fe', '1987-10-10', 'Willowbrook Terr', 'Granford', 'Alaska', '20024'),
(500969, 'David', 'Wright', 'Ma', '1980-03-02', 'Northside Ave', 'Bedford', 'Maine', '60621'),
(500970, 'Emma', 'Baker', 'Fe', '1974-07-26', 'Mapledale Dr', 'Greenchester', 'Nevada', '30327'),
(500971, 'William', 'Green', 'Ma', '1971-03-05', 'Parkview Ct', 'Hempstead', 'Utah', '90058'),
(500972, 'Lily', 'Smith', 'Fe', '1999-01-10', 'Oakwood Ave', 'Uniondale', 'Kansas', '60605'),
(500973, 'Benjamin', 'Johnson', 'Ma', '1981-07-23', 'Cedarbrook Pl', 'Yorkville', 'Oregon', '30311'),
(500974, 'Chloe', 'Davis', 'Fe', '2000-09-22', 'Southwood Blvd', 'Frankville', 'Iowa', '10011'),
(500975, 'Samuel', 'Wilson', 'Ma', '2002-01-21', 'Eastwood Blvd', 'Green City ', 'Oklahoma', '90220'),
(500976, 'Sophia', 'Taylor', 'Fe', '1985-09-04', 'Westwood Terr', 'Springville', 'Kentucky', '20015'),
(500977, 'Matthew', 'Martinez', 'Ma', '1992-11-30', 'Oakhill Dr', 'Oakborough', 'Louisiana', '90291'),
(500978, 'Mia', 'Anderson', 'Fe', '1988-04-19', 'Northdale Ct', 'Granhill', 'South Carolina', '60607'),
(500979, 'Daniel', 'Thomas', 'Ma', '1975-01-08', 'Mapleshire Dr', 'Cedarford', 'Alabama', '30312'),
(500980, 'Ava', 'Jackson', 'Fe', '1978-06-14', 'Pineport Ave', 'Greenhill', 'Colorado', '90064'),
(500981, 'Joseph', 'White', 'Ma', '1993-06-20', 'Eastside Blvd', 'Oakmouth', 'Maryland', '10027'),
(500982, 'Sophia', 'Harris', 'Fe', '1997-11-17', 'Southwood Ln', 'Brookchester', 'Wisconsin', '90240'),
(500983, 'Charles', 'Clark', 'Ma', '1979-02-27', 'Oakdale Ct', 'Granford', 'Minnesota', '60613'),
(500984, 'Mia', 'Lewis', 'Fe', '2004-11-15', 'Cedarview St', 'Bedford', 'Missouri', '20012'),
(500985, 'Thomas', 'Hall', 'Ma', '1986-07-02', 'Northdale Ln', 'Greenchester', 'Indiana', '30309'),
(500986, 'Amelia', 'Young', 'Fe', '2005-10-05', 'Parkport Ave', 'Hempstead', 'Tennessee', '30319'),
(500987, 'Daniel', 'Lee', 'Ma', '1970-01-28', 'Willowford Ave', 'Uniondale', 'Arizona', '90266'),
(500988, 'Harper', 'Walker', 'Fe', '1982-03-05', 'Cedarford Pl', 'Yorkville', 'Washington', '60602'),
(500989, 'Matthew', 'Wright', 'Ma', '1994-09-13', 'Pinebrook Ct', 'Frankville', 'Massachusetts', '30306'),
(500990, 'Lily', 'Baker', 'Fe', '1972-01-10', 'Eastwood Pl', 'Green City ', 'Virginia', '10019'),
(500991, 'Aiden', 'Martinez', 'Ma', '1990-03-11', 'Willowwood Ln', 'Springville', 'New York', '90210'),
(500992, 'Ava', 'Thompson', 'Fe', '1977-05-22', 'Oakview Ct', 'Oakborough', 'North Carolina', '30346'),
(500993, 'Liam', 'Lewis', 'Ma', '1989-10-29', 'Westdale Ln', 'Granhill', 'Georgia', '60622'),
(500994, 'Olivia', 'Hall', 'Fe', '1973-12-02', 'Mapledale Ln', 'Cedarford', 'Michigan', '20009'),
(500995, 'Noah', 'King', 'Ma', '2001-05-28', 'Pineford St', 'Greenhill', 'Ohio', '90250'),
(500996, 'Isabella', 'Murphy', 'Fe', '1998-08-01', 'Oakport Ln', 'Oakmouth', 'Pennsylvania', '10002'),
(500997, 'James', 'Powell', 'Ma', '1995-11-02', 'Northview Ave', 'Brookchester', 'Illinois', '90034'),
(500998, 'Sophia', 'Perry', 'Fe', '2003-12-26', 'Cedarhill Ave', 'Granford', 'Florida', '30307'),
(500999, 'Lucas', 'Long', 'Ma', '1984-04-19', 'Pinehill Pl', 'Bedford', 'Texas', '60620'),
(501000, 'Mia', 'Wood', 'Fe', '1976-08-21', 'Mapleshire Blvd', 'Greenchester', 'California', '90275');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `adminpl0`
--
ALTER TABLE `adminpl0`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `adminpl1`
--
ALTER TABLE `adminpl1`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`StudentID`,`FacultyID`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`StudentID`,`CRN`,`ClassDate`),
  ADD KEY `CRN` (`CRN`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `attendance_ibfk_3` (`CourseID`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`BuildingID`),
  ADD KEY `BuildingID` (`BuildingID`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`RoomID`),
  ADD KEY `RoomID` (`RoomID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `course_ibfk_1` (`DeptID`);

--
-- Indexes for table `courseprerequisite`
--
ALTER TABLE `courseprerequisite`
  ADD PRIMARY KEY (`CourseID`,`PRcourseID`),
  ADD KEY `CourseID` (`CourseID`,`PRcourseID`);

--
-- Indexes for table `coursesection`
--
ALTER TABLE `coursesection`
  ADD PRIMARY KEY (`CRN`),
  ADD KEY `CRN` (`CRN`),
  ADD KEY `coursesection_ibfk_1` (`CourseID`),
  ADD KEY `coursesection_ibfk_2` (`FacultyID`),
  ADD KEY `coursesection_ibfk_4` (`RoomID`),
  ADD KEY `coursesection_ibfk_5` (`SemesterID`),
  ADD KEY `coursesection_ibfk_6` (`TimeSlotID`);

--
-- Indexes for table `createadmin`
--
ALTER TABLE `createadmin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `datagen`
--
ALTER TABLE `datagen`
  ADD PRIMARY KEY (`DataID`),
  ADD KEY `StatsID` (`StatsID`),
  ADD KEY `DataID` (`DataID`);

--
-- Indexes for table `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`DayID`),
  ADD KEY `DayID` (`DayID`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`DeptID`),
  ADD KEY `DeptID` (`DeptID`),
  ADD KEY `dept_ibfk_1` (`RoomID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`StudentID`,`CRN`),
  ADD KEY `CRN` (`CRN`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `FacultyID` (`FacultyID`);

--
-- Indexes for table `facultydept`
--
ALTER TABLE `facultydept`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `facultydept_ibfk_1` (`DeptID`);

--
-- Indexes for table `facultyft`
--
ALTER TABLE `facultyft`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `OfficeID` (`OfficeID`);

--
-- Indexes for table `facultyhistory`
--
ALTER TABLE `facultyhistory`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `CRN` (`CRN`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `facultyhistory_ibfk_3` (`CourseID`),
  ADD KEY `facultyhistory_ibfk_4` (`SemesterID`);

--
-- Indexes for table `facultypt`
--
ALTER TABLE `facultypt`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `OfficeID` (`OfficeID`);

--
-- Indexes for table `gradstudent`
--
ALTER TABLE `gradstudent`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `gradstudentft`
--
ALTER TABLE `gradstudentft`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `gradstudentpt`
--
ALTER TABLE `gradstudentpt`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `hold`
--
ALTER TABLE `hold`
  ADD PRIMARY KEY (`HoldID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`RoomID`),
  ADD KEY `RoomID` (`RoomID`);

--
-- Indexes for table `logintable`
--
ALTER TABLE `logintable`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `UID` (`UID`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`MajorID`),
  ADD KEY `MajorID` (`MajorID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `majorprerequisite`
--
ALTER TABLE `majorprerequisite`
  ADD PRIMARY KEY (`MajorID`,`PRmajorID`),
  ADD KEY `MajorID` (`MajorID`,`PRmajorID`);

--
-- Indexes for table `masterschedule`
--
ALTER TABLE `masterschedule`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `ScheduleID` (`ScheduleID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `Room` (`Room`);

--
-- Indexes for table `minor`
--
ALTER TABLE `minor`
  ADD PRIMARY KEY (`MinorID`),
  ADD KEY `MinorID` (`MinorID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `minorprerequisite`
--
ALTER TABLE `minorprerequisite`
  ADD PRIMARY KEY (`MinorID`,`PRmajorID`),
  ADD KEY `MinorID` (`MinorID`,`PRmajorID`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`RoomID`) USING BTREE,
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `OfficeID` (`OfficeID`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`PeriodID`),
  ADD KEY `PeriodID` (`PeriodID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomID`,`BuildingID`),
  ADD KEY `BuildingID` (`BuildingID`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`SemesterID`),
  ADD KEY `SemesterID` (`SemesterID`);

--
-- Indexes for table `statsoffice`
--
ALTER TABLE `statsoffice`
  ADD PRIMARY KEY (`StatsID`),
  ADD UNIQUE KEY `StatsID` (`StatsID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `MajorID` (`MajorID`);

--
-- Indexes for table `studenthistory`
--
ALTER TABLE `studenthistory`
  ADD PRIMARY KEY (`StudentID`,`CRN`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `CRN` (`CRN`),
  ADD KEY `SemesterID` (`SemesterID`);

--
-- Indexes for table `studentmajor`
--
ALTER TABLE `studentmajor`
  ADD PRIMARY KEY (`MajorID`,`StudentID`),
  ADD KEY `studentmajor_ibfk_2` (`StudentID`);

--
-- Indexes for table `studentminor`
--
ALTER TABLE `studentminor`
  ADD PRIMARY KEY (`MinorID`,`StudentID`),
  ADD KEY `studentminor_ibfk_2` (`StudentID`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`TimeSlotID`),
  ADD KEY `DayID` (`DayID`),
  ADD KEY `PeriodID` (`PeriodID`);

--
-- Indexes for table `undergradstudent`
--
ALTER TABLE `undergradstudent`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `undergradstudentft`
--
ALTER TABLE `undergradstudentft`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `undergradstudentpt`
--
ALTER TABLE `undergradstudentpt`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `UID` (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `masterschedule`
--
ALTER TABLE `masterschedule`
  MODIFY `ScheduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=598;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `user` (`UID`);

--
-- Constraints for table `adminpl0`
--
ALTER TABLE `adminpl0`
  ADD CONSTRAINT `adminpl0_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `adminpl1`
--
ALTER TABLE `adminpl1`
  ADD CONSTRAINT `adminpl1_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`CRN`) REFERENCES `coursesection` (`CRN`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`);

--
-- Constraints for table `classroom`
--
ALTER TABLE `classroom`
  ADD CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `dept` (`DeptID`);

--
-- Constraints for table `courseprerequisite`
--
ALTER TABLE `courseprerequisite`
  ADD CONSTRAINT `courseprerequisite_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`);

--
-- Constraints for table `coursesection`
--
ALTER TABLE `coursesection`
  ADD CONSTRAINT `coursesection_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `coursesection_ibfk_2` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `coursesection_ibfk_4` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`),
  ADD CONSTRAINT `coursesection_ibfk_5` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`),
  ADD CONSTRAINT `coursesection_ibfk_6` FOREIGN KEY (`TimeSlotID`) REFERENCES `timeslot` (`TimeSlotID`);

--
-- Constraints for table `createadmin`
--
ALTER TABLE `createadmin`
  ADD CONSTRAINT `createadmin_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `datagen`
--
ALTER TABLE `datagen`
  ADD CONSTRAINT `datagen_ibfk_1` FOREIGN KEY (`StatsID`) REFERENCES `statsoffice` (`StatsID`);

--
-- Constraints for table `dept`
--
ALTER TABLE `dept`
  ADD CONSTRAINT `dept_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`CRN`) REFERENCES `coursesection` (`CRN`);

--
-- Constraints for table `facultydept`
--
ALTER TABLE `facultydept`
  ADD CONSTRAINT `facultydept_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `dept` (`DeptID`),
  ADD CONSTRAINT `facultydept_ibfk_2` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`);

--
-- Constraints for table `facultyft`
--
ALTER TABLE `facultyft`
  ADD CONSTRAINT `facultyft_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `facultyft_ibfk_2` FOREIGN KEY (`OfficeID`) REFERENCES `office` (`OfficeID`);

--
-- Constraints for table `facultyhistory`
--
ALTER TABLE `facultyhistory`
  ADD CONSTRAINT `facultyhistory_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `facultyhistory_ibfk_2` FOREIGN KEY (`CRN`) REFERENCES `coursesection` (`CRN`),
  ADD CONSTRAINT `facultyhistory_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `facultyhistory_ibfk_4` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`);

--
-- Constraints for table `facultypt`
--
ALTER TABLE `facultypt`
  ADD CONSTRAINT `facultypt_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `facultypt_ibfk_2` FOREIGN KEY (`OfficeID`) REFERENCES `office` (`OfficeID`);

--
-- Constraints for table `gradstudent`
--
ALTER TABLE `gradstudent`
  ADD CONSTRAINT `gradstudent_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `gradstudent_ibfk_2` FOREIGN KEY (`DeptID`) REFERENCES `dept` (`DeptID`);

--
-- Constraints for table `gradstudentft`
--
ALTER TABLE `gradstudentft`
  ADD CONSTRAINT `gradstudentft_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `gradstudentpt`
--
ALTER TABLE `gradstudentpt`
  ADD CONSTRAINT `gradstudentpt_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `hold`
--
ALTER TABLE `hold`
  ADD CONSTRAINT `hold_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);

--
-- Constraints for table `logintable`
--
ALTER TABLE `logintable`
  ADD CONSTRAINT `logintable_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`);

--
-- Constraints for table `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `major_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `dept` (`DeptID`);

--
-- Constraints for table `majorprerequisite`
--
ALTER TABLE `majorprerequisite`
  ADD CONSTRAINT `majorprerequisite_ibfk_1` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`);

--
-- Constraints for table `masterschedule`
--
ALTER TABLE `masterschedule`
  ADD CONSTRAINT `masterschedule_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `masterschedule_ibfk_2` FOREIGN KEY (`Room`) REFERENCES `room` (`RoomID`);

--
-- Constraints for table `minor`
--
ALTER TABLE `minor`
  ADD CONSTRAINT `minor_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `dept` (`DeptID`);

--
-- Constraints for table `minorprerequisite`
--
ALTER TABLE `minorprerequisite`
  ADD CONSTRAINT `minorprerequisite_ibfk_1` FOREIGN KEY (`MinorID`) REFERENCES `minor` (`MinorID`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`);

--
-- Constraints for table `studenthistory`
--
ALTER TABLE `studenthistory`
  ADD CONSTRAINT `studenthistory_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `studenthistory_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `studenthistory_ibfk_3` FOREIGN KEY (`CRN`) REFERENCES `coursesection` (`CRN`),
  ADD CONSTRAINT `studenthistory_ibfk_4` FOREIGN KEY (`SemesterID`) REFERENCES `semester` (`SemesterID`);

--
-- Constraints for table `studentmajor`
--
ALTER TABLE `studentmajor`
  ADD CONSTRAINT `studentmajor_ibfk_1` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`),
  ADD CONSTRAINT `studentmajor_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `studentminor`
--
ALTER TABLE `studentminor`
  ADD CONSTRAINT `studentminor_ibfk_1` FOREIGN KEY (`MinorID`) REFERENCES `minor` (`MinorID`),
  ADD CONSTRAINT `studentminor_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD CONSTRAINT `timeslot_ibfk_1` FOREIGN KEY (`DayID`) REFERENCES `day` (`DayID`),
  ADD CONSTRAINT `timeslot_ibfk_2` FOREIGN KEY (`PeriodID`) REFERENCES `period` (`PeriodID`);

--
-- Constraints for table `undergradstudent`
--
ALTER TABLE `undergradstudent`
  ADD CONSTRAINT `undergradstudent_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `dept` (`DeptID`),
  ADD CONSTRAINT `undergradstudent_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `undergradstudentft`
--
ALTER TABLE `undergradstudentft`
  ADD CONSTRAINT `undergradstudentft_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `undergradstudentpt`
--
ALTER TABLE `undergradstudentpt`
  ADD CONSTRAINT `undergradstudentpt_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
