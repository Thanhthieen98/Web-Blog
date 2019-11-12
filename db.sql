-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: webblog
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Du lịch'),(3,'Đời sống'),(1,'Văn hóa');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryid` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fkuser_idx` (`userid`),
  KEY `fkcate_idx` (`categoryid`),
  CONSTRAINT `fkcate` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`),
  CONSTRAINT `fkuser` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (10,'7 ĐIỀU THÚ VỊ VỀ GIA ĐÌNH HOÀNG GIA ANH','Bất cứ ai từng sống ở Anh sẽ biết rằng gia đình Hoàng gia có một vị trí đặc biệt trong lịch sử nước này, chưa bàn đến văn hóa hiện đại. Có thể bạn đã từng chụp ảnh bên ngoài Cung điện Buckingham với hy vọng được gặp Nữ hoàng, hay từng xem phim The Crown trên Netflix và nghĩ rằng bạn sẽ phù hợp với sự kịch tính trong Hoàng tộc phải không. Dù thế nào đi nữa thì các gia đình Hoàng gia là một phần của cuộc sống Anh điển hình.\n\n1. (Hầu hết) người dân yêu mến họ\n\nKhi du lịch đến Anh, bạn chắc chắn sẽ thấy có những người không ủng hộ chế độ quân chủ, nhưng các cuộc khảo sát trên toàn nước Anh lại không đồng quan điểm với họ. Điều này rất rõ ràng khi có 7 trong số 10 người Anh yêu mến các gia đình Hoàng gia. Có lẽ cũng tốt khi có sự phân quyền giữa người dân và chính phủ. Hoặc giống như tôi, có thể đó là vì Nữ hoàng khiến tôi nhớ về người bà của mình, và không ai dám xúc phạm bà tôi cả. KHÔNG MỘT AI.\n\n2. Họ có vô số ngôi nhà\n\nTôi thường nghe mọi người kêu gào đầy thất vọng: “Tại sao Nữ hoàng không bao giờ bước ra ngoài Cung điện Buckingham để chào người dân?”, nhưng sự thật là bà hiếm khi ở đó. Tất cả các gia đình Hoàng gia cùng các thành viên và đoàn tùy tùng của họ đều có nhiều nhà, và Nữ hoàng và chồng bà – Công tước xứ Edinburgh – có ít nhất 8 căn nhà dành cho các sự kiện hoàng gia hoặc dùng để nghỉ ngơi: Cung điện Buckingham, Lâu đài Windsor, Cung điện Holyrood House, Lâu đài Hillsborough, Nhà Sandringham, Lâu đài Balmoral, khu nghỉ Craigowan, Delnadamph. Một nửa trong số đó nằm ở Scotland – cách London khoảng 400 dặm (gần 650km). Điều này hợp lý thôi, bạn nghĩ xem Nữ hoàng hẳn phải mệt mỏi thế nào khi lúc nào cũng có đầy du khách bu quanh cung điện của mình.\n\n3. Họ không phải là “người Anh”\n\nPhía gia đình của Nữ hoàng có nguồn gốc là người Đức, và phía gia đình Công tước xứ Edinburgh có tổ tiên là người Đan Mạch và Hy Lạp. Hiện nay khi Hoàng tử Harry đã kết hôn với nữ diễn viên người Mỹ Meghan Markle thì các thành viên mới của gia đình cũng sẽ có nguồn gốc của người Mỹ gốc Phi. Như vậy, các gia đình hoàng gia còn là một phép ẩn dụ cho bản chất chiết trung của người Anh và nguồn gốc di truyền đa dạng của họ\n\n4. Họ vẫn có (phần nào) sức mạnh tối thượng\n\nChính quyền Hoàng gia không còn giống như xưa: trong quá khứ thì người trị vì sẽ quyết định những sự kiện như thời điểm đất nước giao tranh với nước khác hay đạo luật nào sẽ được thông qua. Giờ đây phần lớn quyền lực đó đã được trao cho chính phủ để được phép ra quyết định thay mặt Nữ hoàng. Tuy nhiên vẫn có kẽ hở cho phép một số quyết định được thông ra mà không cần Quốc hội phê duyệt (Quốc hội là nơi những người đại diện được bầu ra thay mặt cho nhân dân bỏ phiếu quyết định). Trong quá khứ một số Thủ tướng đã lén lút lợi dụng điều này để trục lợi cho họ mà không thông qua Quốc hội.\n\n5. Chỉ có Nữ hoàng mới có thể ăn thịt thiên nga\n\nBất kỳ quốc gia nào tồn tại Hoàng tộc đều có những quy tắc kỳ quái từ xa xưa và không còn ý nghĩa trong thời hiện đại. Ví dụ, việc đánh bắt cá voi hay cá heo trong vòng ba dặm tính từ bờ biển Anh được xem là bất hợp pháp, và bất cứ con nào chết dạt vào bờ đều thuộc sở hữu của Nữ hoàng. Bất kỳ con thiên nga nào không biết nói cũng tự động thuộc sở hữu của Nữ hoàng (đây có lẽ là một trong những điều luật kỳ lạ nhất mà người ta từng nghe). Kỳ lạ hơn nữa là chỉ có gia đình Hoàng gia mới được phép ăn thịt thiên nga, điều này có nghĩa là bạn bị cấm bắt và giết thiên nga, và điều này cũng giải thích tại sao người Anh lại dành sự tôn trọng lẫn sợ hãi cho những con chim trắng khổng lồ này. Vì những con thiên nga có thể dùng cánh khiến bạn gãy tay nên tôi sẽ không dại dột dây vào chúng.','20/01/2019',1,'1.jpg',1),(11,'10 lý do du lịch là phương pháp giáo dục tốt nhất','\nDu lịch cho bạn cơ hội khám phá\nLoài người chúng ta, không phân biệt sắc tộc hay tôn giáo, vốn sở hữu khả năng thích nghi tốt nên có thể sinh sống tại khắp mọi nơi trên trái đất. Tại mỗi khu vực nhất định, người bản địa lại sở hữu những nền văn hóa và các truyền thống đặc trưng. Du lịch vòng quanh thế giới đồng nghĩa với việc bạn sẽ có cơ hội trải nghiệm biết bao nền văn hóa đặc sắc, học hỏi về các tín ngưỡng cổ xưa và lắng nghe vô số chuyện kể hấp dẫn từ cư dân địa phương.\n\nDu lịch tạo điều kiện cho bạn trải nghiệm\nChinh phục những đỉnh núi để đắm chìm trong quang cảnh hũng vĩ, đi dạo trên những cung đường đá cuội đầy gió để tìm kiếm những quán cà phê độc đáo hay ngắm nhìn những công trình kiến trúc tinh xảo và các nhà thờ cổ đại là một số những hoạt động bạn sẽ trải nghiệm trong quá trình du lịch của mình. Mỗi nơi bạn ghé thăm trên thế giới rộng lớn này luôn đi kèm với vô số hoạt động thú vị để bạn có những kỷ niệm đáng nhớ.\n\nDu lịch đem đến cho bạn nhiều cảm xúc\nTrong suốt quá trình du lịch, bạn sẽ được trải qua nhiều cung bậc cảm xúc như phấn khởi, lo âu, sợ hãi, nhớ nhà hay hài lòng. Sự thay đổi về cảm xúc liên tục trong lúc du lịch chắc chắn sẽ khiến bạn không thực sự thoải mái nhưng đó là cách tốt nhất để dây thần kinh cảm xúc của bạn luôn hoạt động tốt. Sau chuyến du lịch khám phá thành phố lạ với biết bao hỉ nộ ái ố thì tâm trí và con tim bạn chắc chắn sẽ nhớ mãi về chuyến đi và lại tiếp tục vạch kế hoạch để lên đường tiếp.\n\nDu lịch tạo cơ hội để bạn trở nên tự lập\nĐối mặt với thực tế cuộc sống trong lúc du lịch sẽ giúp bạn học cách tự chăm sóc bạn thân tốt hơn. Bạn sẽ dần nhận ra mình hoàn toàn có khả năng tự giải quyết vấn đề, tồn tại trong bất kỳ hoàn cảnh nào và sẵn sàng đương đầu với mọi thử thách bất ngờ trên cuộc hành trình. Sau khi du lịch, bạn sẽ trở nên mạnh mẽ và không còn ngại khó như xưa.','03/03/2019',2,'2.jpg',1),(12,'10 lý do bạn nên chọn du học New Zealand','Khi nghĩ đến việc du học ở các nước thuộc nam bán cầu, ngoài lựa chọn Úc quen thuộc thì bạn có thể cân nhắc thêm một địa điểm hấp dẫn không kém là New Zealand. Quốc gia này nổi tiếng có phong cảnh thiên nhiên hữu tình cùng lựa chọn học tập đa dạng. Dưới đây là một số lý do bạn nên chọn New Zealand làm nơi du học Anh ngữ hoặc bất kỳ ngành học nào khác.\n\nHai hòn đảo, hai thế giới\nNew Zealand bao gồm hai hòn đảo với hai nhịp sống hoàn toàn khác biệt. Ở hòn đảo phía bắc, bạn sẽ đắm chìm trong môi trường học thuật thân thiện và sôi động tại thành phố Auckland hay Wellington. Ngoài ra bạn còn có thể tìm hiểu văn hóa của thổ dân Maori tại nhiều địa điểm trong vùng hoặc đến tham quan các mạch nước nóng ở thị trấn Roturua. Khí hậu ở hòn đảo phía bắc ấm hơn nên bạn có thể thoải mái tham gia hoạt động bơi lội hoặc lặn hồ tại đây.\n\nNgược lại, hòn đảo phía nam lại dành cho những người yêu thích thiên nhiên hoang dã với nhiều cung đường leo núi tuyệt đẹp. Nếu có cơ hội, bạn hãy thử trượt tuyết tại New Zealand và đến thăm thị trấn Queenstown, vốn được mệnh danh là thủ đô của những hoạt động ngoài trời.\n\nKhí hậu ôn hòa\nBạn nào có dự định du học New Zealand ở hòn đảo phía bắc thì không cần đem theo áo ấm. Khu vực này có khí hậu nóng ẩm với nhiệt độ rơi vào khoảng 20 – 30 độ C vào mùa hè và 14 đến 22 độ C vào mùa đông. Ngược lại, khí hậu ở đảo phía nam có phần khắc nghiệt hơn với khoảng 1 – 12 độ C vào mùa đông và mùa hè sẽ có nhiệt độ trung bình từ 16 đến 22 độ C.\n\nNhịp sống nhẹ nhàng và yên ả\nNew Zealand có diện tích tương đương với khu vực Great Britain của Vương quốc Anh nhưng dân số chỉ ở mức hơn 4 triệu người. Vì sự cạnh tranh thấp nên cuộc sống của người bản địa luôn nhẹ nhàng mà không phải tất bật lo toan mọi thứ. Điều đó có nghĩa người New Zealand có lối sống khá lành mạnh khi luôn có sự cân bằng giữa lao động và giải trí.\n\n','13/04/2019',3,'3.jpg',1),(25,'10 bước đăng ký nhập học vào trường hàng đầu ở Mỹ','Trường đại học là môi trường phù hợp để bạn khám phá bản thân và thế giới xung quanh nhằm xác định con đường tương lai mình muốn theo đuổi. Quá trình học tập ở bậc đại học không chỉ giúp bạn thu nạp kiến thức và kỹ năng cho công việc tương lai mà còn góp phần định hình nhân cách cá nhân. Việc lựa chọn du học Mỹ chắc chắn sẽ đem đến cho bạn môi trường giáo dục đủ chất lượng và cạnh tranh cũng như cơ hội trải nghiệm một nền văn hóa mới để có thể phát triển toàn diện. Nhìn chung thì quá trình đăng ký nhập học tại Mỹ khá đơn giản nhưng vẫn có thể khiến một số bạn cảm thấy hoang mang vì không biết nên bắt đầu từ đâu và tập trung đầu tư vào điều gì. Đó là lý do chúng tôi tổng hợp 10 bước để đăng ký nhập học vào trường hàng đầu ở Mỹ trong bài viết dưới đây để mọi người tham khảo.\r\n\r\n\r\nTìm kiếm trường đại học Mỹ phù hợp\r\nNước Mỹ có rất nhiều trường đại học chất lượng cao bao gồm cả những cái tên danh giá như Harvard, Columbia, Stanford, Princeton và Yale nên không khó để bạn tìm được một ngôi trường phù hợp với mục tiêu, định hướng và nhu cầu cá nhân của mình. Nếu bạn thích được học tập tại khu học xá rộng lớn và choáng ngợp thì có thể cân nhắc đến những cái tên như Harvard và Princeton còn nếu bạn ưng các không gian học tập ấm cúng và thân thiện thì trường Amherst College tại Massachusetts cũng rất phù hợp.\r\n\r\n \r\n\r\nTra cứu các trường đại học trong tầm ngắm\r\nAi cũng có ngôi trường mơ ước riêng nhưng bạn chỉ có thể đặt chân vào ngôi trường mình mong muốn khi thật sự cố gắng. Sau khi định hình được một số ngôi trường trông có vẻ phù hợp với mình thì bạn nên bắt đầu tìm hiểu sâu hơn về chúng. Có một thực tế bạn phải chấp nhận là yêu thích ngôi trường là một chuyện nhưng có đủ khả năng để nhập học vào trường đó không lại là chuyện khác. Chính vì thế nên việc bạn bị ban tuyển sinh của trường nào đó từ chối nhập học là điều hết sức bình thường. Vì lẽ đó nên bạn cần chuẩn bị cho mình nhiều hơn một cái tên trong danh sách các ngôi trường tiềm năng để làm kế hoạch dự phòng.\r\n\r\nTìm kiếm người hướng dẫn\r\nSau khi có được danh sách các trường đại học tiềm năng, bạn nên tìm một người có kinh nghiệm trong việc nộp hồ sơ du học Mỹ để học hỏi kinh nghiệm. Bạn có thể chủ động sắp xếp lịch hẹn với họ để nhận những lời khuyên quý báu. Nếu được bạn nên liên hệ với cựu du học sinh từng học tại trường bạn đang nhắm đến thì quá tốt. Còn không thì người đó chỉ cần có nhiều kinh nghiệm và kiến thức trong lĩnh vực bạn đang muốn theo đuổi là được.','24/05/2019',3,'1573062616194.jpg',1),(26,'10 mẹo để có bài thuyết trình ấn tượng',' Dù bạn đã đi làm, đang thực tập hay còn ngồi ở ghế nhà trường thì việc thuyết trình bằng tiếng nước ngoài luôn là một thử thách không nhỏ. 10 bí quyết thuyết trình dựa trên kinh nghiệm của một giáo viên dạy tiếng Anh dưới đây sẽ góp phần giúp kỹ năng nói ngoại ngữ trước công chúng của bạn được nâng lên một tầm cao mới.\r\n\r\nSử dụng khoảng lặng cần thiết\r\nSự yên lặng thường khiến mọi người cảm thấy ngột ngạt và ái ngại nhưng nếu bạn biết cách im lặng đúng lúc trong khi thuyết trình thì sẽ tạo hiệu quả rất tốt. Khi bạn bước lên sân khấu, mọi ánh nhìn sẽ đồng loạt đổ dồn về phía bạn nên tốt nhất bạn hãy dành ra khoảng một đến hai giây để điều chỉnh lại nhịp thở và làm quen với sự yên ắng của đám đông. Điều này sẽ góp phần khiến người nghe trông chờ vào những gì bạn sắp nói. Trong quá trình chia sẻ, sự im lặng rơi vào đúng chỗ sẽ làm tăng sự kịch tính, nhấn mạnh ý và giúp bạn hạn chế sử dụng những từ thừa như “à”, “ừm”, “kiểu”, “ờ”, vân vân.\r\n\r\nKiểm soát ngôn ngữ hình thể\r\nCác chuyên gia chỉ ra rằng 55% hành vi giao tiếp đều không sử dụng ngôn ngữ nói. Trong lúc thuyết trình, bạn nên cố gắng kiểm soát ngôn ngữ hình thể của mình. Chẳng hạn như đừng đi qua đi lại quá nhiều, hạn chế bấm đầu viết liên tục, tránh kéo lê chân khi di chuyển, không điều chỉnh trang phục thường xuyên, tuyệt đối đừng ngáp và không đứng chắn tầm nhìn của khán giả trước hình ảnh minh họa. Hãy cố gắng để từng cử chỉ của bạn khi thuyết trình đều được kiểm soát kỹ lưỡng.\r\n\r\nKể một câu chuyện\r\nAi cũng thích được nghe và được kể những câu chuyện hấp dẫn nên bạn có thể cân nhắc bắt đầu bài thuyết trình của mình bằng cách kể một câu chuyện lay động lòng người để tạo sự đồng cảm. Câu chuyện càng mang tính cá nhân thì lại càng thuyết phục nhưng không nhất thiết đó là câu chuyện của bạn mà có thể của người khác. Câu chuyện diễn ra trong quá khứ hoặc khát vọng ở tương lai đều được, miễn là nó tạo sự thu hút ở người nghe và khiến họ chú tâm vào những gì bạn trình bày.\r\n\r\nHình ảnh hóa\r\nHình ảnh có thể truyền tải thông điệp tương đương với một bài viết ngàn chữ. Hình ảnh cũng tạo ấn tượng mạnh hơn chữ viết. Một lỗi mọi người thường mắc phải khi thuyết trình là sử dụng quá nhiều chữ trong bài minh họa của mình. Nếu bạn cho khán giả thấy quá nhiều chữ thì họ sẽ chỉ lo đọc thông tin trên đó mà không chú tâm nghe những bạn trình bày. Bên cạnh đó, hình ảnh minh hoạ trực quan và sinh động cũng góp phần giúp người đọc ghi nhớ những gì bạn truyền tải tốt hơn dù đó có là thông tin thường thức, số liệu hay chuyện kể. Nếu bạn biết cách lồng ghép hình ảnh vào bài nói của mình thì khán giả sẽ dễ tiếp thu hơn.','30/06/2019',3,'1573062582655.jpg',1),(27,'10 điều đáng yêu của Singapore',' Khi nhắc đến Singapore, nhiều người sẽ liên tưởng ngay đến hệ thống tàu điện nhộn nhịp và đường sá sạch sẽ. Mặc dù các hình ảnh đó hoàn thành chính xác nhưng Singapore còn có nhiều điều thú vị khác. Từ những nhà hàng thời thượng và sang trọng mọc lên khắp nơi đến khu phố thời trang tấp nập và tươi mới, quốc gia với nhiều quy tắc truyền thống này vẫn có thể khiến bạn bất ngờ. 10 điều đáng yêu của Singapore được liệt kê dưới đây có thể sẽ thôi thúc bạn đến thăm quốc gia này ngay lập tức.\r\n\r\nNền ẩm thực phong phú\r\nVốn chịu sử ảnh hưởng từ các nền ẩm thực Trung Hoa, Ấn Độ, Malaysia và Indonesia nên không ngạc nhiên khi ẩm thực ở Singapore nổi tiếng về chất lượng và mức độ phong phú. Quốc gia này là nơi tọa lạc của nhà hàng đạt chuẩn Michelin có giá phải chăng nhất thế giới là Liao Fan Hongkong Soya Sauce Chicken Rice & Noodle. Mặc dù tên nhà hàng hơi dài nhưng bạn có thể yên tâm rằng nơi đây phục vụ các món ăn dân dã đơn giản nhưng cực kỳ ngon miệng. Singapore còn có nhiều khu chợ ẩm thực đặc sắc (gọi là trung tâm hawker) thường nằm ở khu vực dưới lòng đất nên nếu bạn chịu khó tìm thì sẽ thấy nhiều địa điểm ăn uống ngon lành.\r\n\r\nNgôn ngữ chính là tiếng Anh\r\nVì từng là thuộc địa của Anh nên ngôn ngữ chính thức được sử dụng tại đây là tiếng Anh. Singapore thu hút nhiều cư dân quốc tế đến sinh sống nên có môi trường đa sắc tộc. Vừa có ngôn ngữ chính là tiếng Anh vừa có môi trường đa văn hóa nên Singapore là địa điểm lý tưởng để bạn rèn luyện khả năng Anh ngữ và tìm hiểu văn hóa thế giới.\r\n\r\nNhiều học sinh đã chọn những khóa du học ngắn hạn, du học hè Singapore để cải thiện vốn tiếng Anh và tăng trải nghiệm của bản thân tại quốc gia phát triển vào bậc nhất châu Á này.\r\n\r\nKhách sạn Marina Bay Sands\r\nKhách sạn Marina Bay Sands là một trong những địa điểm ấn tượng nhất ở Singapore. Nếu bạn có cơ hội qua đêm tại khách sạn sang chảnh này thì bắt buộc phải trải nghiệm hồ bơi có thiết kế độc đáo nằm trên tầng thượng. Trong trường hợp bạn không phải là khách thì vẫn có thể mua vé để lên khu vực quan sát SkyPark của khách sạn có góc nhìn 360 độ để ngắm khung cảnh thành phố từ trên cao.\r\n\r\n','27/08/2019',2,'1573062665052.jpg',1),(28,'Học cách sống như người bản địa từ ngày đầu tiên',' Cô đơn, hoang mang và có chút lo sợ là những cảm xúc hầu như ai cũng trải qua khi đặt chân đến một thành phố lạ. Để có thể nhanh chóng bắt kịp với nhịp sống địa phương với nhiều nét văn hóa khác biệt, bạn có thể tham khảo một số bí quyết được liệt kê trong bài viết dưới đây. Nếu chịu khó áp dụng thì bạn hoàn toàn có thể sinh hoạt như người bản địa ngay từ ngày đầu có mặt ở vùng đất mới.\r\n\r\nMang theo một số vật dụng thân thuộc\r\nBạn nên mang theo một số món đồ thân quen để bày trí trong chỗ ở mới nhằm tạo cảm giác gần gũi. Những vật dụng đơn giản như bộ drap cũ hay hộp nến thơm yêu thích hoàn toàn có thể góp phần giúp gian phòng của bạn trở nên dễ chịu hơn. Đừng quên trang trí phòng của bạn bằng ảnh chụp bạn bè và người thân để không gian sinh hoạt thêm phần tươi sáng. Chỉ cần nơi ở của bạn đem đến cảm giác quen thuộc như ở nhà thì bạn sẽ có thêm tinh thần để thích nghi với cuộc sống mới ở thành phố lạ.\r\n\r\nGiao tiếp bằng ngôn ngữ bản địa\r\nBạn nên tương tác với mọi người bằng ngôn ngữ bản địa ngay cả khi khả năng ngoại ngữ của bạn còn hạn chế. Thời gian đầu chắc chắn sẽ gặp nhiều khó khăn nhưng nếu bạn cố gắng luyện tập hàng ngày thì sự tự tin trong giao tiếp sẽ dần được cải thiện, năng lực ngoại ngữ sớm được nâng cao và phản xạ ngôn ngữ trong lúc trò chuyện chắc chắn sẽ tự nhiên hơn. Người bản địa thường thích bắt chuyện và chào hỏi các sinh viên quốc tế cố gắng sử dụng ngôn ngữ địa phương nên bạn nhớ lưu ý.\r\n\r\nChú ý tiếng lóng\r\nNgôn ngữ nào cũng có những cụm từ hoặc cách nói lóng không được giảng dạy chính thức ở trường lớp. Khi đi thưởng trà tại London, bạn sẽ nghe mọi người dùng “cuppa” thay cho “cup of tea”. Ra quán bar uống bia ở Sydney, bạn lại thấy người dân dùng “stubby” để chỉ một ly bia nhỏ. Bạn nên chủ động quan sát và học hỏi cách người dân sử dụng từ lóng ở những chỗ mình hay lui tới để nâng cao vốn từ vựng. Nếu bạn cố gắng giữ thói quen này thì bạn sẽ sớm có cách nói chuyện không khác gì dân địa phương.\r\n\r\nBắt chước thói quen của người bản địa\r\nNếu người dân trong thành phố của bạn có thói quen đạp xe thì bạn hãy sắm một chiếc xe đạp. Nếu tàu điện ngầm là phương tiện giao thông phổ biến nhất trong thành phố thì đừng ngần ngại mua ngay thẻ tàu điện để có thể hòa mình vào nhịp sống tất bật hàng ngày. Không gì khiến bản cảm thấy hòa nhập hơn bằng việc trải nghiệm không khí hối hả vào giờ đi làm của mọi người vào buổi sáng.','30/09/2019',2,'1573062733958.jpg',1),(29,'Những thử thách chủ nhà thường gặp khi ở chung với du học sinh và cách vượt qua chúng',' Việc cho du học sinh ở chung nhà sẽ đem đến cho bạn nhiều trải nghiệm thú vị, từ cơ hội trao đổi văn hóa đến khả năng thay đổi cuộc đời của một người. Tuy nhiên quyết định này cũng sẽ có nhiều thử thách bạn cần phải vượt qua.\r\n\r\nSự nhớ nhà của du học sinh\r\nTrước tiên, bạn nên chuẩn bị tinh thần là du học sinh sẽ cảm thấy nhớ nhà và điều này hết sức bình thường nên bạn đừng quá lo lắng. Nếu du học sinh đang cảm thấy buồn bã, bạn nên nhắc họ rằng đó là cảm xúc thường thấy với những người lần đầu xa nhà và họ có thể thoải mái ủ dột trong một thời gian. Bạn có thể chủ động ngồi xuống nói chuyện với du học sinh về những gì họ đang suy nghĩ và đừng quên khuyến khích họ thường xuyên giữ liên lạc với gia đình.\r\n\r\nSau đó bạn có thể đề xuất một số hoạt động thú vị cho du học sinh làm một mình hoặc cùng làm với bạn nhằm gián tiếp nhắc họ rằng cuộc sống mới vẫn có nhiều điều lý thú để khám phá. Đó có thể là chuyến tham quan địa điểm du lịch ở địa phương, đi dạo ở vùng quê thanh bình hoặc cho phép du học sinh rủ bạn ở trường về nhà chơi. Bạn đừng quên nhắc du học sinh chụp thật nhiều ảnh đẹp để chia sẻ với người nhà và bạn bè. Việc này sẽ giúp họ tập trung vào những trải nghiệm mới ở thành phố lạ mà quên đi cảm giác nhớ nhà.\r\n\r\nDu học sinh cảm thấy không hợp với đồ ăn bạn nấu\r\nMột trong những cú sốc văn hóa du học sinh thường trải qua chính là nhận ra phong cách ẩm thực ở nước ngoài quá khác biệt so với quê nhà. Nếu du học sinh chia sẻ rằng họ cảm thấy không quen với đồ ăn bạn nấu thì đừng lấy đó làm phiền lòng vì từ từ họ sẽ dần thích nghi.\r\n\r\nCách đầu tiên để giúp du học làm quen với phong cách ẩm thực mới là cùng ăn chung với họ. Dùng bữa chung với du học sinh sẽ gián tiếp thúc đẩy họ dần thích nghi với truyền thống của gia đình cũng như văn hóa của quốc gia bạn. Bạn có thể tham khảo thêm một số gợi ý nấu nướng cho du học sinh của EF.\r\n\r\nNếu du học sinh để lại nhiều thức ăn thừa trên dĩa thì bạn nên hỏi thăm xem khẩu phần đó có quá nhiều với họ không. Nếu bạn nhận ra du học sinh quá lịch sự để thẳng thừng bảo không thích món này thì hãy chuyển đề tài sang những món ăn quê nhà yêu thích của họ và hỏi ý kiến về sự khác biệt giữa hai nền ẩm thực.','11/11/2019',1,'1573062788595.jpg',1),(30,'10 lễ hội âm nhạc mùa hè bạn không nên bỏ lỡ',' 1. Rock Am Ring, Thành phố Nürburgring, Đức\r\nDiễn ra gần đường đua công thức 1 Nürburgring, Rock Am Ring là một lễ hội có lịch sử lâu đời và khá nổi tiếng. Bắt đầu từ năm 1985, sự kiện này luôn có sự góp mặt của nhiều ban nhạc huyền thoại bao gồm AC / DC, Deep Purple và Rolling Stones. Gần đây còn có sự xuất hiện của Foo Fighters, Thirty Seconds to Mars, và Muse.\r\n\r\n\r\n\r\n2. Governors Ball, New York, US\r\nGovernors Ball là lễ hội với trái tim Big Apple. Bắt đầu vào năm 2011, sự kiện kéo dài trong nhiều ngày này bao gồm khá thể loại, từ rock, điện tử, hip-hop, indie, Americana, pop, folk và nhiều thể loại khác. Và trong khi âm nhạc là bản vẽ chính, người tham dự có thể có được trải nghiệm lễ hội đầy đủ bằng cách tham gia vào các silent disco (sàn nhảy thầm lặng), gian hàng ảnh tương tác và chơi board games với các quân cờ có kích thước bằng người thật.\r\n\r\n3. Bonnaroo, Tennessee, US\r\nBonnaroo là nơi hàng ngàn du khách yêu thích cắm trại, hàng trăm mẫu đất của Tennessee, và 150 tiết mục hoành tráng trên hơn 10 sân khấu âm nhạc. Ngay cả khi Bonnaroo được định vị là một lễ hội nhạc rock indie và alternative – R & B và người hâm mộ hip-hop cũng sẽ thỏa mãn với sự đa dạng thể loại âm nhạc đa dạng của lễ hội.','12/12/2019',1,'1573062870153.jpg',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infomation` text COLLATE utf8_unicode_ci,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123','thien','1572859639789.jpg','Mình là Nguyễn Thanh Thiên, một developer.Thuở còn là sinh viên, mình từng có những thắc mắc, trăn trở về technical, về con đường nghề nghiệp, nhưng không có ai giải đáp.Blog này là nơi mình chia sẻ những kiến thức, kinh nghiệm mà mình đạt được trong quá trình làm việc và trải nghiệm.Mong rằng nó sẽ giải đáp phần nào những khúc mắc, trăn trở cho những bạn sinh viên như mình ngày xưa.','+ 01 234 567 89','Đường Chiến Thắng, Hà Nội, Việt Nam','thanhthieen98@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `postid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fknews_idx` (`postid`),
  CONSTRAINT `fknews` FOREIGN KEY (`postid`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (25,10,25),(26,20,26),(27,30,27),(28,10,28),(29,40,29),(30,58,30);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 13:23:10
