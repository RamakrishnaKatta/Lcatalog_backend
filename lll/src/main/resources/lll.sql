-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2017 at 09:43 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `granie_db`
--
CREATE DATABASE IF NOT EXISTS `granie_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `granie_db`;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) NOT NULL,
  `description` mediumtext,
  `given_date` bigint(10) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `et` varchar(15) NOT NULL,
  `org_code` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `description`, `given_date`, `type`, `et`, `org_code`) VALUES
(77, 'e1', 1488758400000, 'N', 'STUD', '101BHS'),
(78, 'e2', 1488844800000, 'N', 'STUD', '101BHS'),
(79, 'e1', 1488758400000, 'E', 'STUD', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(1) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `teacher_id` int(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `worktype` varchar(15) DEFAULT NULL,
  `work_desc` varchar(80) DEFAULT NULL,
  `class` varchar(15) DEFAULT NULL,
  `org_code` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `date`, `teacher_id`, `subject`, `worktype`, `work_desc`, `class`, `org_code`) VALUES
(23, '2017-02-28', 10136776, 'MATHS', 'CW', 'test1', 'CLASS-9A', '101BHS'),
(24, '2017-02-28', 10173268, 'MORAL-SCIENCE', 'SW', 'test3', 'CLASS-10A', '101BHS'),
(25, '2017-02-27', 10174240, 'MATHS', 'HW', 'test4', 'CLASS-10A', '101BHS'),
(26, '2017-02-28', 10194474, 'CHEMISTRY', 'SW', 'test3', 'CLASS-9A', '101BHS'),
(27, '2017-03-11', 10136776, 'MATHS', 'CW', 'test cw', 'CLASS-9A', '101BHS'),
(28, '2017-03-11', 10136776, 'MATHS', 'HW', 'test hw', 'CLASS-9A', '101BHS'),
(29, '2017-03-11', 10136776, 'MATHS', 'CW', '', 'CLASS-9A', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `id` int(1) NOT NULL,
  `unique_id` varchar(10) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `classId` varchar(20) NOT NULL,
  `org_code` varchar(20) NOT NULL,
  `date` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`id`, `unique_id`, `student_id`, `classId`, `org_code`, `date`) VALUES
(64, '3102017', '10136939', 'CLASS-9A', '101BHS', 1485829572000),
(65, '3102017', '10197532', 'CLASS-9A', '101BHS', 1485829572000),
(66, '3102017', '10117567', 'CLASS-9A', '101BHS', 1485801000000),
(67, '3102017', 'NA', 'CLASS-10A', '101BHS', 1485870825000),
(68, '3102017', '1013061', 'CLASS 10', '101BHS', 1485870836000),
(69, '3102017', 'NA', 'CLASS-2A', '101BHS', 1485870852000),
(79, '112017', '10136939', 'CLASS-9A', '101BHS', 1485887400000),
(81, '112017', '10197532', 'CLASS-9A', '101BHS', 1485887400000),
(82, '412017', '10136939', 'CLASS-9A', '101BHS', 1486146600000),
(84, '412017', '10197532', 'CLASS-9A', '101BHS', 1486146600000),
(88, '412017', '10163886', 'CLASS-9A', '101BHS', 1486146600000),
(89, '412017', '10163886', 'CLASS-9A', '101BHS', 1485973800000),
(90, '512017', '10136939', 'CLASS-9A', '101BHS', 1486233000000),
(91, '512017', '10163886', 'CLASS-9A', '101BHS', 1486233000000),
(92, '512017', '10151219', 'CLASS-1A', '101BHS', 1486233000000),
(93, '512017', '10136051', 'CLASS-1A', '101BHS', 1486233000000),
(94, '512017', '10184366', 'CLASS-1A', '101BHS', 1486233000000),
(95, '512017', '10117567', 'CLASS-10A', '101BHS', 1486233000000),
(96, '812017', '10136939', 'CLASS-9A', '101BHS', 1486492200000),
(97, '812017', '10163886', 'CLASS-9A', '101BHS', 1486492200000),
(98, '1212017', '10132813', 'CLASS-9A', '101BHS', 1486837800000),
(99, '1212017', '10186727', 'CLASS-9A', '101BHS', 1486837800000),
(101, '1712017', '10137711', 'CLASS-1A', '101BHS', 1487269800000),
(102, '2612017', '10145390', 'CLASS-9A', '101BHS', 1488047400000),
(103, '2612017', '10132813', 'CLASS-9A', '101BHS', 1488047400000),
(104, '2812017', '10145390', 'CLASS-9A', '101BHS', 1488220200000),
(105, '2812017', '10145390', 'CLASS 10', '101BHS', 1485887400000),
(106, '2812017', '10145390', 'CLASS-9A', '101BHS', 1485887400000),
(107, '1122017', '10145390', 'CLASS-9A', '101BHS', 1489170600000),
(108, '1122017', '10146170', 'CLASS-9A', '101BHS', 1489170600000),
(109, '1122017', '1015298', 'CLASS-9A', '101BHS', 1489170600000);

-- --------------------------------------------------------

--
-- Table structure for table `bus_master`
--

CREATE TABLE `bus_master` (
  `id` int(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL,
  `parent_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_master`
--

INSERT INTO `bus_master` (`id`, `name`, `type`, `org_code`, `parent_id`) VALUES
(22, 'PLS', 'S', '101BHS', 21),
(23, 'TKL', 'S', '101BHS', 21),
(25, 'SPT-SKLM', 'R', '101BHS', -1),
(26, 'SKLM-VSP', 'R', '101BHS', -1),
(27, 'SPT', 'S', '101BHS', 25),
(28, 'PALASA', 'S', '101BHS', 25),
(29, 'TEKKALI', 'S', '101BHS', 25),
(30, 'SRIKAKULAM', 'S', '101BHS', 25),
(31, 'RANASTHLAM', 'S', '101BHS', 26),
(32, 'VISHAKAPATNAM', 'S', '101BHS', 26);

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_id` int(1) NOT NULL,
  `bus_no` varchar(10) NOT NULL,
  `org_code` varchar(20) NOT NULL,
  `driver_name` varchar(15) DEFAULT NULL,
  `driver_no` varchar(20) DEFAULT NULL,
  `bus_name` varchar(20) DEFAULT NULL,
  `bus_desc` varchar(30) NOT NULL,
  `bus_route` int(15) DEFAULT NULL,
  `lat` varchar(20) NOT NULL,
  `long` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_id`, `bus_no`, `org_code`, `driver_name`, `driver_no`, `bus_name`, `bus_desc`, `bus_route`, `lat`, `long`) VALUES
(10, 'as', '101BHS', 'sa', 'sa', 'as', 'as', 0, '', ''),
(11, 'kl', '101BHS', 'as', 'kl', 'kl', 'op', 25, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(1) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `type` varchar(15) NOT NULL,
  `teacher_complaint` varchar(60) NOT NULL DEFAULT '',
  `teacher_complaint_date` bigint(60) DEFAULT NULL,
  `parent_feedback_date` bigint(60) DEFAULT NULL,
  `parent_feedback` varchar(80) DEFAULT NULL,
  `teacher_name` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `student_id`, `type`, `teacher_complaint`, `teacher_complaint_date`, `parent_feedback_date`, `parent_feedback`, `teacher_name`, `status`, `org_code`) VALUES
(1, '10163886', 'SUGGESTION', 'Testing demo', 1478934507000, 1481023126000, 'D', '10173458', 'PF', '101BHS'),
(2, '10163886', 'COMPLAINT', 'She is very poor', 1481705947000, 1481706038000, 'Okk.we will take of that', '10173458', 'PF', '101BHS'),
(3, '10163886', 'SUGGESTION', 'web teast 1', 1488023409000, NULL, NULL, '10136776', 'TC', '101BHS'),
(4, '10132813', 'SUGGESTION', 'test 2', 1488023693000, NULL, NULL, '10174240', 'TC', '101BHS'),
(5, '10132813', 'COMPLAINT', 'test3', 1488023931000, NULL, NULL, '10136776', 'TC', '101BHS'),
(6, '10163886', 'WARNING', 'test globall', 1488024380000, NULL, NULL, '10174240', 'TC', '101BHS'),
(7, '10145390', 'COMPLAINT', 'Complaint testing 123', 1488131788000, 1488131886000, 'feedback testing 123', '10136776', 'PF', '101BHS'),
(8, '10145390', 'COMPLAINT', 'bloody hell', 1488253228000, 1488253285000, 'fuck the hell', '10136776', 'PF', '101BHS'),
(9, '10145390', 'COMPLAINT', 'Bad Performance', 1489073098000, 1489073376000, 'Given feedback', '10118478', 'PF', '101BHS'),
(10, '10145390', 'WARNING', 'warning test', 1489292402000, 1489292446000, 'warning feedback', '10136776', 'PF', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `fees_master`
--

CREATE TABLE `fees_master` (
  `id` int(10) NOT NULL,
  `class_name` varchar(15) DEFAULT NULL,
  `fee` varchar(15) DEFAULT NULL,
  `org_code` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_master`
--

INSERT INTO `fees_master` (`id`, `class_name`, `fee`, `org_code`) VALUES
(1, 'CLASS-1A', '2000', '101BHS'),
(7, 'CLASS 10', '20000', '101BHS'),
(8, 'CLASS-9A', '100000', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(1) NOT NULL,
  `message` longtext NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `org_code` varchar(20) NOT NULL,
  `updated_date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `student_id`, `status`, `org_code`, `updated_date`) VALUES
(1, 'Please pay your fees as soon as possible', '', 'ALL', '101BHS', 1478332865000),
(2, 'You fees is still pending of last year', '10163886', 'STUDENT', '101BHS', 1478333001000),
(3, 'testing demo gujrat', '10163886', 'STUDENT', '101BHS', 1478934356000),
(4, 'please send ur fess', '10163886', 'STUDENT', '101BHS', 1480833556000),
(5, 'hi', '', 'ALL', '101BHS', 1482900283000),
(6, 'ggg', '10163886', 'STUDENT', '101BHS', 1483028894000),
(7, 'mother day', '', 'ALL', '101BHS', 1483081171000),
(8, 'teste', '', 'ALL', '101BHS', 1486660164000),
(9, 'test2', '', '', '101BHS', 1486660401000),
(10, 'test3', '', 'ALL', '101BHS', 1486660435000),
(11, 'test5', '', 'ALL', '101BHS', 1486660858000),
(12, 'test6', '', 'ALL', '101BHS', 1486661355000),
(13, 'test8', '10152273', 'STUDENT', '101BHS', 1486661424000);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `founder` varchar(15) DEFAULT NULL,
  `org_code` varchar(15) DEFAULT NULL,
  `main_branch_address` varchar(80) DEFAULT NULL,
  `established_year` date DEFAULT NULL,
  `org_type` varchar(15) DEFAULT NULL,
  `org_sector` varchar(15) DEFAULT NULL,
  `master_data` longtext NOT NULL,
  `msg` mediumtext,
  `role_access` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `founder`, `org_code`, `main_branch_address`, `established_year`, `org_type`, `org_sector`, `master_data`, `msg`, `role_access`) VALUES
('101', 'ELITE', 'Satish Ponnada', '101BHS', 'Pennya Branch, pincode :560011,City:bangalore', '1992-04-22', 'SCHOOL', 'PVT', '{"map":"http://maps.googleapis.com/maps/api/js","cities":["vishakapatnam","srikakulam"],"roles":["POSTS","SETTINGS","DASHBOARD","ATTENDENCE","MASTERS","TEACHERS","STUDENTS","WORKOUTS","BUSES","MESSAGES","TIMETABLE","REPORTS","ANNOUNCEMENTS"]}', '<h1>Hearty Congratulations for onboarding your admin panel with us.<br><h1><h3>Thanks & Regards,<br>Granieapps.com</h3>', NULL),
('102', 'Calcutta High School', 'Rabindra Chater', '102APS', 'Makhala,maniktala,uttarpara,Hoogly Dist ,Kollkatta', '1998-11-09', 'SCHOOL', 'GOVT', '{"map":"http://maps.googleapis.com/maps/api/js","cities":["vishakapatnam","srikakulam"],"roles":["POSTS","SETTINGS","DASHBOARD","ATTENDENCE","MASTERS","TEACHERS","STUDENTS","WORKOUTS","BUSES","MESSAGES","TIMETABLE","REPORTS","ANNOUNCEMENTS"]}', '<h1>Hearty Congratulations for onboarding your admin panel with us.<br><h1><h3>Thanks & Regards,<br>Granieapps.com</h3>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parents_query`
--

CREATE TABLE `parents_query` (
  `id` int(1) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `query_type` varchar(20) DEFAULT NULL,
  `parent_query` varchar(80) DEFAULT NULL,
  `parent_query_date` bigint(20) DEFAULT NULL,
  `teacher_feedback` varchar(80) DEFAULT NULL,
  `teacher_feedback_date` bigint(20) DEFAULT NULL,
  `class_teacher_id` varchar(40) DEFAULT NULL,
  `class` varchar(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_query`
--

INSERT INTO `parents_query` (`id`, `student_id`, `query_type`, `parent_query`, `parent_query_date`, `teacher_feedback`, `teacher_feedback_date`, `class_teacher_id`, `class`, `status`, `org_code`) VALUES
(1, '10163886', 'SUGGESTION', 'Need suggestions ', 1478934623914, 'Yagh', 1478934954000, '10173458', 'CLASS-9A', 'TF', '101BHS'),
(2, '10163886', 'QUESTION', 'Is exam postponed', 1480832899948, 'Yes ', 1480832915000, '10173458', 'CLASS-9A', 'TF', '101BHS'),
(3, '10163886', 'SUGGESTION', 'Fhdfh', 1481722936023, NULL, NULL, '10173458', 'CLASS-9A', 'PQ', '101BHS'),
(4, '10163886', 'SUGGESTION', 'Rvdft', 1481726564306, NULL, NULL, '10173458', 'CLASS-9A', 'PQ', '101BHS'),
(5, '10163886', 'SUGGESTION', 'Fvfc', 1481732230740, 'test123', 1488038185000, '10173458', 'CLASS-9A', 'TF', '101BHS'),
(6, '10163886', 'QUESTION', 'Kya mera bacha pdhai pe dhyan de raha hai', 1481888708900, 'Haan but kabhi kabhi dhyan nahi deti', 1481888797000, '10173458', 'CLASS-9A', 'TF', '101BHS'),
(7, '10163886', 'SUGGESTION', 'Mani Test', 1482570806285, 'àª àªšàª®àª«àª¬', 1483784379000, '10173458', 'CLASS-9A', 'TF', '101BHS'),
(8, '10163886', 'SUGGESTION', 'Improve teaching staff', 1483066467824, 'àª àª¡àª¡àª¢àª£àª®àª¤', 1483784294000, '10173458', 'CLASS-9A', 'TF', '101BHS'),
(9, '10145390', 'QUESTION', 'Test 1', 1488131307523, 'Test 1 success', 1488131397000, '10136776', 'CLASS-9A', 'TF', '101BHS'),
(10, '10145390', 'SUGGESTION', 'test suggestion', 1488248041320, 'feedback', 1488252956000, '10136776', 'CLASS-9A', 'TF', '101BHS'),
(11, '10145390', 'QUESTION', 'test question', 1488248052744, 'Question Feedback', 1488252894000, '10136776', 'CLASS-9A', 'TF', '101BHS'),
(12, '1015298', 'SUGGESTION', 'test suggestion', 1488715220528, NULL, NULL, '10136776', 'CLASS-9A', 'PQ', '101BHS'),
(13, '10145390', 'QUESTION', 'test question', 1489292247083, 'feedback question', 1489292285000, '10136776', 'CLASS-9A', 'TF', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `period_table`
--

CREATE TABLE `period_table` (
  `id` int(1) NOT NULL,
  `teacher_name` varchar(30) DEFAULT NULL,
  `timmings` varchar(20) NOT NULL,
  `class_id` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `period_id` int(20) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `period_table`
--

INSERT INTO `period_table` (`id`, `teacher_name`, `timmings`, `class_id`, `subject`, `period_id`, `day`, `org_code`) VALUES
(18, '10136776', '9am-10am', 'CLASS-9A', 'MATHS', 1, 'MON', '101BHS'),
(19, '10194474', '10am-11am', 'CLASS-9A', 'CHEMISTRY', 2, 'MON', '101BHS'),
(20, '10118478', '1-2', 'CLASS-9A', 'MATHS', 1, 'MON', '101BHS'),
(21, '10149175', '10-11', 'CLASS-9A', 'CHEMISTRY', 2, 'MON', '101BHS'),
(22, '10173268', '1-2', 'CLASS-9A', 'MORAL-SCIENCE', 1, 'TUE', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(1) NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `img_url` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `org_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `order_id`, `img_url`, `content`, `org_code`) VALUES
(3, '3', 'http://gdurl.com/wt2y', '<b>ABOUT US :</b><br>\n<b>SchoolMate</b> is providing a direct communication between parent,classteacher and School Administration through apps available in andriod,windows,iphone,blackberry.<br>\n<b>Features : </b><br>\n <b>Dashboard : </b> After login you can see everyday updates/acheivements of your school which will be School Admin web-app.<br>\n <b>Profile : </b> Parents can view their child profile<br>\n <b>Attendence : </b> Teacher''s need not to open register and take attendence he can take from his phone and absent days will be instantly reported in parent app.<br>\n <b>Workouts : </b> Teachers need not to write H.W''s,C.W''s and maitain in dairies it can maintain in his app which will directly reported to parents app of every day activity.<br>\n <b> Events : </b> Events and Invitations will be sent parents app directly.<br>\n <b>Time Table : </b> Parents and Teachers both can view their timetable which will be arranged by school adminstration.<br>\n <b>Queries : </b> Parents can ask directly any queries to their classteacher through their app and teacher can responds istantly.<br>\n <b>Complaints : </b> Teachers can instantly send the complaints from their app directly to parents and they have to give feedback.<br>\n <b>Toppers : </b>Parents can view the toppers of their kids class.<br>\n <b>Messages : </b> Messages will be send directly to parents app.<br>\n <b>Teacher Profile : </b> Parents can view all the teacher of thier school.<br>\n <b>Bustracker : </b>Parent need to worry about their children arrival and chidren need not wait for bus in bus stop through bus tracker you easily track your bus.\n   ', '102APS'),
(4, '2', 'http://gdurl.com/L6t2', '<b>Nirmala Convent</b> and <b>SkoolMate </b> Heartfully wishing you a very Happy Married Life to the most beautiful girl Alisha May you find the love of your life\n', '102HS'),
(5, '1', 'http://gdurl.com/EmLN', '<b>Gayatri Model High School</b> is a group of people passionate about making learning experiential and life long.', '102APS'),
(7, '2 ', 'http://gdurl.com/KliD', 'Congratulations Jhansi for winning the India Got Talent 2016 pride of ILM\n', '102APS'),
(9, '1', '/images/1486897903POST.jpg', 'test1', '101BHS'),
(10, '2', '/images/1486898023POST.jpg', 'test2', '101BHS'),
(13, '4', '/images/1486899018POST.jpg', 'test unique', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `progress_report`
--

CREATE TABLE `progress_report` (
  `id` int(20) NOT NULL,
  `exam_name` varchar(15) DEFAULT NULL,
  `sub` varchar(20) DEFAULT NULL,
  `tot_marks` int(15) DEFAULT NULL,
  `got_marks` int(15) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `class_id` varchar(20) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL,
  `date` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `progress_report`
--

INSERT INTO `progress_report` (`id`, `exam_name`, `sub`, `tot_marks`, `got_marks`, `student_id`, `class_id`, `org_code`, `date`) VALUES
(108, 'FINALLY', 'MATHS', 100, 20, '10146170', 'CLASS-9A', '101BHS', 1488816592000),
(109, 'FINALLY', 'MATHS', 100, 30, '10132813', 'CLASS-9A', '101BHS', 1488816592000),
(110, 'FINALLY', 'MATHS', 100, 40, '10145390', 'CLASS-9A', '101BHS', 1488816592000),
(111, 'FINALLY', 'MATHS', 100, 50, '1015298', 'CLASS-9A', '101BHS', 1488816592000),
(112, 'FINALLY', 'MATHS', 100, 60, '10186727', 'CLASS-9A', '101BHS', 1488816592000),
(113, 'FINALLY', 'MATHS', 100, 70, '10163886', 'CLASS-9A', '101BHS', 1488816592000),
(120, 'QUARTERLY', 'MATHS', 100, 20, '10146170', 'CLASS-9A', '101BHS', 1488816624000),
(121, 'QUARTERLY', 'MATHS', 100, 30, '10132813', 'CLASS-9A', '101BHS', 1488816624000),
(122, 'QUARTERLY', 'MATHS', 100, 40, '10145390', 'CLASS-9A', '101BHS', 1488816624000),
(123, 'QUARTERLY', 'MATHS', 100, 50, '1015298', 'CLASS-9A', '101BHS', 1488816624000),
(124, 'QUARTERLY', 'MATHS', 100, 60, '10186727', 'CLASS-9A', '101BHS', 1488816624000),
(125, 'QUARTERLY', 'MATHS', 100, 70, '10163886', 'CLASS-9A', '101BHS', 1488816624000);

-- --------------------------------------------------------

--
-- Table structure for table `sm_master`
--

CREATE TABLE `sm_master` (
  `id` int(1) NOT NULL,
  `entity` varchar(30) NOT NULL,
  `type` varchar(10) NOT NULL,
  `org_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sm_master`
--

INSERT INTO `sm_master` (`id`, `entity`, `type`, `org_code`) VALUES
(2, 'CLASS-9A', 'C', '101BHS'),
(3, 'CLASS-10A', 'C', '101BHS'),
(5, 'CLASS 10', 'C', '101BHS'),
(9, 'CLASS-3A', 'C', '101BHS'),
(11, 'CLASS-3B', 'C', '101BHS'),
(12, 'CLASS-9B', 'C', '101BHS'),
(13, 'CLASS-9C', 'C', '101BHS'),
(18, 'FINALLY', 'E', '101BHS'),
(19, 'QUARTERLY', 'E', '101BHS'),
(23, 'HALF-YEARLY', 'E', '101BHS'),
(24, 'MATHS', 'S', '101BHS'),
(25, 'CHEMISTRY', 'S', '101BHS'),
(35, 'WEEKEND', 'E', '101BHS'),
(36, 'CLASS-6Y', 'C', '101BHS'),
(37, 'WEEKEND-2', 'E', '101BHS'),
(39, 'WEEKEND-3', 'E', '101BHS'),
(40, 'CLASS-12', 'C', '101BHS'),
(41, 'SCIENCE', 'S', '101BHS'),
(42, 'MORAL-SCIENCE', 'S', '101BHS'),
(43, 'HINDI', 'S', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(1) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `class` varchar(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `father_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `gn_no` varchar(20) DEFAULT NULL,
  `past_school` varchar(20) DEFAULT NULL,
  `caste` varchar(20) DEFAULT NULL,
  `sub_caste` varchar(15) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `ranking` varchar(10) DEFAULT NULL,
  `roll_no` varchar(10) DEFAULT NULL,
  `attendence` varchar(20) DEFAULT NULL,
  `disciplane` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `birth_place` varchar(15) DEFAULT NULL,
  `blood_group` varchar(15) DEFAULT NULL,
  `house_name` varchar(15) DEFAULT NULL,
  `photo` varchar(70) DEFAULT NULL,
  `percentage` varchar(10) DEFAULT NULL,
  `admission_date` varchar(25) NOT NULL DEFAULT '0000-00-00',
  `medium` varchar(15) DEFAULT NULL,
  `school_type` varchar(15) DEFAULT NULL,
  `student_type` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `adhar_no` varchar(25) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `wt_up` varchar(20) DEFAULT NULL,
  `bus_route` varchar(10) DEFAULT NULL,
  `bus_stop` varchar(10) DEFAULT NULL,
  `bus_n_driver` varchar(25) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `lc_no` varchar(15) DEFAULT NULL,
  `lc_date` varchar(20) NOT NULL DEFAULT '0000-00-00',
  `city` varchar(20) DEFAULT NULL,
  `other_details` longtext,
  `org_code` varchar(20) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `student_id`, `class`, `name`, `father_name`, `mother_name`, `phone_number`, `gn_no`, `past_school`, `caste`, `sub_caste`, `category`, `ranking`, `roll_no`, `attendence`, `disciplane`, `dob`, `birth_place`, `blood_group`, `house_name`, `photo`, `percentage`, `admission_date`, `medium`, `school_type`, `student_type`, `gender`, `adhar_no`, `email`, `wt_up`, `bus_route`, `bus_stop`, `bus_n_driver`, `status`, `lc_no`, `lc_date`, `city`, `other_details`, `org_code`, `created_time`) VALUES
(8, '10145390', 'CLASS-9A', 'student1', 'papa1', 'mama1', '12312312333', '11111', '', 'MUSLIM', 'caste1', 'OBC', '3', '2', '', '', '1992-02-28', 'sompeta', 'b', '', '/images/148687644510145390.png', '', '2012-10-01', 'ENGLISH', '', 'BOARDING', 'FEMALE', '1223344556666', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-02-12 05:14:05'),
(9, '10132813', 'CLASS-9A', 'student2', 'papa2', 'moma2', '87786876666', '22222', '', 'HINDU', '', 'OBC', '2', '1', '', '', '2017-02-28', 'test', '', '', '/images/148687673210132813.png', '', '2012-10-01', 'ENGLISH', '', 'BOARDING', 'FEMALE', '000000000000', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-02-12 05:18:52'),
(10, '10186727', 'CLASS-9A', 'student3', 'pappa3', 'moma3', '89898989898', '3333333', '', 'HINDU', '', 'OBC', '3', '3', '', '', '1992-02-12', 'vsp', '', '', '/images/148687688610186727.png', '', '2012-10-01', 'ENGLISH', '', 'BOARDING', 'MALE', '0990909090990', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-02-12 05:21:26'),
(11, '10163886', 'CLASS-9A', 'student4', 'pappa4', 'moma4', '232323232323', '555555', '', 'MUSLIM', '', 'BC', '', '4', '', '', '2017-12-31', 'sas', '', '', '/images/148687704910149968.png', '', '2012-10-01', 'ENGLISH', '', 'BOARDING', 'MALE', '898989898988', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-02-12 05:24:09'),
(12, '10133943', 'CLASS-1A', 'Satish P', 'papa test', 'moma test', '9898989888', '2222', '', 'MUSLIM', 'sdc', 'OBC', '', '', '', '', '2017-12-31', 'birthplace test', 'b', 'blue', '/images/148725643310133943.jpg', '', '2017-12-31', 'ENGLISH', '', 'BOARDING', 'MALE', '909909090990', 'stsh3g@gmail.com', '9090909090', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', 'tets', '101BHS', '2017-02-16 14:47:13'),
(13, '10119240', 'CLASS-1A', 'chinna', 'chinna pa', 'chinna ma', '8989898888', '78988', '', 'HINDU', 'vishwa', 'BC', '', '', '', '', '2017-12-31', 'spt', 'b', '', '/images/148729871910119240.jpg', '', '2017-12-31', 'ENGLISH', 'CONTINOUS', 'BOARDING', 'MALE', '898988989888', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-02-17 02:31:59'),
(14, '10137711', 'CLASS-1A', 'katish', 'kstish papa', 'katish moma', '09090909909', '787878', '', 'HINDU', '', 'BC', '', '', '', '', '1992-12-31', 'vsp', '', '', '/images/148729923710137711.jpg', '', '2012-10-01', 'ENGLISH', '', 'BOARDING', 'MALE', '8787878787877', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', 'test', '101BHS', '2017-02-17 02:40:37'),
(15, '10145714', 'CLASS-1A', 'avinash', 'avi paps', 'avi mams', '8989898822', '898989', '', 'HINDU', '', 'OBC', '', '', '', '', '1900-12-31', 'wqwqw', '', '', '/images/148730004510145714.jpg', '', '2012-10-01', 'ENGLISH', '', 'BOARDING', 'MALE', '787878787787', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-02-17 02:54:05'),
(16, '1015298', 'CLASS-9A', 'Satish Ponnada', 'Ponnada vasudeva Rao', 'Ponnada padma', '8553577356', '777777', 'Shishu vikas high sc', 'HINDU', 'vishwabrahmin', 'BC', '20', '23', '23', '99', '1992-07-03', 'sompeta', 'B+', 'red', '/images/14873490051015298.jpg', '29', '2017-02-17', 'ENGLISH', 'CONTINOUS', 'BOARDING', 'MALE', '888888888888888', 'stsh4g@mail.com', '7799535885', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', 'Just testing', '101BHS', '2017-02-17 16:30:05'),
(17, '10147611', 'CLASS-10A', 'st test', 'k', 'k', '00000000000', '12', '', 'MUSLIM', 'w', 'BC', '', '', '', '', '2017-03-01', 'jk', 'k', 's', '/images/148881404710147611.jpg', '', '2012-10-01', 'ENGLISH', 'CONTINOUS', 'NON-BOARDING', 'MALE', '8989898888888', 'w', '23', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-03-06 15:27:27'),
(18, '10146170', 'CLASS-9A', 'sttest1', 'k', 'k', '90909090000', '0', '', 'HINDU', 'm', 'OBC', '', '2', '', '', '2017-03-01', 'w', '', '', '/images/148881454610146170.jpg', '', '2012-10-01', 'ENGLISH', 'PRIMARY', 'BOARDING', 'MALE', 'opopopopopopo', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-03-06 15:35:46'),
(19, '10118913', 'CLASS-3A', 'y', 'qB', 'b', '89898988988', '8', '', 'HINDU', '', 'OBC', '', '', '', '', '2017-03-03', 'k', '', '', '/images/148881801810118913.jpg', '', '2012-10-01', 'ENGLISH', 'PLAY-SCHOOL', 'BOARDING', 'MALE', '89898988898989', '', '', '25', '27', '9', 'CONTINOUS', '', '0000-00-00', 'vishakapatnam', '', '101BHS', '2017-03-06 16:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(10) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `totol_fee` varchar(15) DEFAULT NULL,
  `paid` varchar(15) DEFAULT NULL,
  `balance` varchar(15) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL,
  `yr` varchar(10) DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_fees`
--

INSERT INTO `student_fees` (`id`, `student_id`, `class`, `totol_fee`, `paid`, `balance`, `status`, `org_code`, `yr`, `updated_on`) VALUES
(3, '123133', 'CLASS-9A', '100000', '50000', '50000', 'PENDING', '101BHS', '2017', '2017-02-15 15:45:10'),
(5, '12233', 'CLASS-9A', '100000', '100000', '0', 'PAID', '101BHS', '2017', '2017-02-16 04:31:53'),
(6, '1234', 'CLASS-9A', '100000', '28000', '72000', 'PENDING', '101BHS', '2017', '2017-02-16 14:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `student_leave`
--

CREATE TABLE `student_leave` (
  `id` int(1) NOT NULL,
  `applied_on` bigint(60) DEFAULT NULL,
  `student_id` varchar(25) DEFAULT NULL,
  `from_date` bigint(60) DEFAULT NULL,
  `to_date` bigint(60) DEFAULT NULL,
  `leave_reason` varchar(140) DEFAULT NULL,
  `leave_type` varchar(15) DEFAULT NULL,
  `leave_sub` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `class_teacher_id` varchar(15) DEFAULT NULL,
  `org_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_leave`
--

INSERT INTO `student_leave` (`id`, `applied_on`, `student_id`, `from_date`, `to_date`, `leave_reason`, `leave_type`, `leave_sub`, `status`, `class_teacher_id`, `org_code`) VALUES
(14, 1489288001223, '10145390', 1489363200000, 1489795200000, 'test2', 'CL', 'TEST2', 'PENDING', '10136776', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_details`
--

CREATE TABLE `teacher_details` (
  `teacher_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `experience` int(15) DEFAULT NULL,
  `joining_on_yr` varchar(10) DEFAULT NULL,
  `medium` varchar(20) DEFAULT NULL,
  `school_type` varchar(25) DEFAULT NULL,
  `qualification` varchar(25) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `designation` varchar(15) DEFAULT NULL,
  `pan_no` varchar(25) DEFAULT NULL,
  `adhar_no` varchar(25) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone_number` varchar(35) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `left_on` varchar(20) DEFAULT NULL,
  `photo_id` varchar(70) DEFAULT NULL,
  `other_details` longtext NOT NULL,
  `classteacher` varchar(20) NOT NULL,
  `org_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_details`
--

INSERT INTO `teacher_details` (`teacher_id`, `name`, `experience`, `joining_on_yr`, `medium`, `school_type`, `qualification`, `dob`, `designation`, `pan_no`, `adhar_no`, `email`, `phone_number`, `subject`, `status`, `left_on`, `photo_id`, `other_details`, `classteacher`, `org_code`) VALUES
('10118478', 'kkoko', 90, '2017-12-31', 'eng', 'PS', '', '2017-12-30', '', 'ioio89898', '909090999999', 'ko@mail.com', '8989898888', 'MATHS', 'CONT', '', '/images/148829731810118478.jpg', '                               ', 'CLASS-3A', '101BHS'),
('10119939', 'test', 90, '2017-12-31', 'eng', 'PS', '', '2017-12-31', '', '90909', '9090909090990', '', '90909090999', 'MATHS', 'CONT', '', '/images/148864001910119939.jpg', '                               ', 'REGULAR', '101BHS'),
('10126955', 'test2', 90, '2017-12-31', 'eng', 'PS', '', '2017-12-31', '', 'ioioi', '9987655544332', '', '90909090999', 'MATHS', 'CONT', '', '/images/148864112710126955.jpg', '                               ', 'REGULAR', '101BHS'),
('10136776', 'teach1', 12, '2017-02-01', 'eng', 'PS', '', '2017-12-31', '', 'adad2334', '190909090999', 'stsh3g@mail.com', '123132333333', 'MATHS', 'CONT', '', '/images/148683523610136776.png', '                               ', 'CLASS-9A', '101BHS'),
('10149175', 'pic test', 12, '2017-12-31', 'eng', 'PS', '', '', '', 'as8989898', '121212122222', '', '909090909090', 'CHEMISTRY', 'CONT', '', '/images/148829694910149175.jpg', '                               ', 'CLASS-12', '101BHS'),
('10173268', 'thes', 23, '2017-02-27', 'eng', 'PS', '', '2017-02-20', '', 'poe233', '9090909090999', 'stsh3g@gmail.com', '90909090999', 'MORAL-SCIENCE', 'CONT', '', '/images/148820287310173268.jpg', '                               ', 'CLASS-3B', '101BHS'),
('10174240', 'Manu Sharma', 12, '2017-12-31', 'eng', 'PS', '', '1992-12-31', '', 'FWRSWPS1022', '221312323333', 'manu@mail.com', '12312323233', 'MATHS', 'CONT', '', '/images/148690497410174240.jpg', '                               ', 'CLASS 10', '101BHS'),
('10191065', 'ioio', 90, '2017-12-31', 'eng', 'PS', '', '2017-12-31', '', 'kjkj', '9090909090999', '', '90909090999', 'MATHS', 'CONT', '', '/images/148864119110191065.jpg', '                               ', 'REGULAR', '101BHS');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(1) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `teacher_id` varchar(20) DEFAULT NULL,
  `admin_id` varchar(20) DEFAULT NULL,
  `password` varchar(80) NOT NULL DEFAULT '40be4e59b9a2a2b5dffb918c0e86b3d7',
  `role` varchar(10) NOT NULL,
  `org_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `student_id`, `teacher_id`, `admin_id`, `password`, `role`, `org_code`) VALUES
(1, NULL, NULL, '3101', '40be4e59b9a2a2b5dffb918c0e86b3d7', 'ADMIN', '101BHS'),
(2, NULL, '1018033', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(5, NULL, '10173458', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(10, NULL, '10140908', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(12, NULL, '10113605', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(32, NULL, '10136486', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(33, NULL, '10146430', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(36, NULL, '10198413', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(37, NULL, '1012906', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(39, NULL, '10124977', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(44, '10171599', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(49, '10175333', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(56, NULL, '10184080', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(67, NULL, '10136776', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(77, '10145390', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(78, '10132813', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(79, '10186727', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(80, '10149968', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(81, NULL, '10174240', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(82, '10133943', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(83, '10119240', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(84, '10137711', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(85, '10145714', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(86, '1015298', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(87, NULL, NULL, '3102', '40be4e59b9a2a2b5dffb918c0e86b3d7', 'ADMIN', '102APS'),
(88, NULL, '10173268', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(89, NULL, '10149175', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(90, NULL, '10118478', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(92, NULL, '10119939', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(93, NULL, '10126955', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(94, NULL, '10191065', NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'TEACH', '101BHS'),
(95, '10147611', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(96, '10146170', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS'),
(97, '10118913', NULL, NULL, '40be4e59b9a2a2b5dffb918c0e86b3d7', 'STUD', '101BHS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_master`
--
ALTER TABLE `bus_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_master`
--
ALTER TABLE `fees_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_index` (`class_name`,`org_code`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents_query`
--
ALTER TABLE `parents_query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `period_table`
--
ALTER TABLE `period_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_index` (`order_id`,`org_code`);

--
-- Indexes for table `progress_report`
--
ALTER TABLE `progress_report`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_index` (`exam_name`,`sub`,`student_id`);

--
-- Indexes for table `sm_master`
--
ALTER TABLE `sm_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `my_unique_key` (`entity`,`org_code`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_leave`
--
ALTER TABLE `student_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_details`
--
ALTER TABLE `teacher_details`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `attendence`
--
ALTER TABLE `attendence`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `bus_master`
--
ALTER TABLE `bus_master`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `fees_master`
--
ALTER TABLE `fees_master`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `parents_query`
--
ALTER TABLE `parents_query`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `period_table`
--
ALTER TABLE `period_table`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `progress_report`
--
ALTER TABLE `progress_report`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `sm_master`
--
ALTER TABLE `sm_master`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `student_leave`
--
ALTER TABLE `student_leave`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;--
-- Database: `lll`
--
CREATE DATABASE IF NOT EXISTS `lll` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lll`;

-- --------------------------------------------------------

--
-- Table structure for table `article_details`
--

CREATE TABLE `article_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `sub-category` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `image` varchar(25) DEFAULT NULL,
  `discount` varchar(15) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uploaded_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_details`
--

INSERT INTO `article_details` (`id`, `name`, `category`, `sub-category`, `description`, `price`, `image`, `discount`, `vendor_id`, `uploaded_user_id`) VALUES
(1, 'sofa', '1', '2', 'sofa desc', '20', NULL, '20', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  `ph_no` varchar(20) DEFAULT NULL,
  `otp_no` varchar(20) DEFAULT NULL,
  `is_otp_verified` varchar(5) DEFAULT NULL,
  `other_details` varchar(50) DEFAULT NULL,
  `vendor_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `role`, `ph_no`, `otp_no`, `is_otp_verified`, `other_details`, `vendor_id`) VALUES
(1, 'Satish', 'ADMIN', '8553577356', '66557', 'Y', 'Other Details of Satish', 1),
(2, 'Raveendra', 'USER', '8899677634', '982345', 'N', 'Other details of Home Raveedra', 1),
(3, 'Anil', 'ADMIN', '7799535443', '78896', 'Y', 'Other details of Anil', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_details`
--

CREATE TABLE `vendor_details` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `logo` varchar(20) DEFAULT NULL,
  `other_details` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_details`
--

INSERT INTO `vendor_details` (`id`, `name`, `type`, `location`, `logo`, `other_details`) VALUES
(1, 'SHOPPER-STOP', 'HIGH', 'JAYANAGAR', NULL, 'Other details of shopper stop'),
(2, 'HOME-STOP', 'LOW', 'INDIRANAGAR', NULL, 'Other details of Home stop');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_details`
--
ALTER TABLE `article_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendorId` (`vendor_id`);

--
-- Indexes for table `vendor_details`
--
ALTER TABLE `vendor_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_details`
--
ALTER TABLE `article_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vendor_details`
--
ALTER TABLE `vendor_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'ga', '{"quick_or_custom":"quick","what":"codegen","allrows":"1","output_format":"sendit","filename_template":"@TABLE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"texytext_columns":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"lll","table":"vendor_details"},{"db":"lll","table":"article_details"},{"db":"lll","table":"user_details"},{"db":"lll","table":"users"},{"db":"lll","table":"society_master"},{"db":"granie_db","table":"student_leave"},{"db":"granie_db","table":"student_details"},{"db":"granie_db","table":"users"},{"db":"granie_db","table":"teacher_details"},{"db":"granie_db","table":"progress_report"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

--
-- Dumping data for table `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('lll', 'article_details', 'uploaded_user_id', 'lll', 'user_details', 'id'),
('lll', 'article_details', 'vendor_id', 'lll', 'vendor_details', 'id'),
('lll', 'user_details', 'vendor_id', 'lll', 'vendor_details', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'granie_db', 'organizations', '{"CREATE_TIME":"2017-01-27 22:15:51","col_visib":["1","1","1","1","1","1","1","1","1","1"]}', '2017-02-17 02:21:56'),
('root', 'granie_db', 'student_details', '{"CREATE_TIME":"2017-02-11 10:29:04","col_order":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","17","16","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39"],"col_visib":["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"]}', '2017-02-12 06:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-03-20 17:24:10', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
