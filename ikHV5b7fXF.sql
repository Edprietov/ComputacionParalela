-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-09-2021 a las 19:14:35
-- Versión del servidor: 8.0.13-4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ikHV5b7fXF`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logins`
--

CREATE TABLE `logins` (
  `login_id` int(32) NOT NULL,
  `user_id` int(12) NOT NULL,
  `login_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens`
--

CREATE TABLE `tokens` (
  `token_id` int(12) NOT NULL,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `expiration_date` timestamp NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `token_firebase` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tokens`
--

INSERT INTO `tokens` (`token_id`, `token`, `user_id`, `expiration_date`, `type`, `token_firebase`) VALUES
(3, 'e4b67951c96f74e66845eed2da99c522cae8d46f1e704c9c0eb21d553ca0b757', 1, '2021-08-20 01:15:19', 'Login', NULL),
(4, '7052728981a9143e4448f2fc685fba30413b51af003bbc3a51dc005fc0a81a44', 1, '2021-08-20 04:12:37', 'Login', NULL),
(5, 'e0b0006c76b17cdd007c96b55dfcebbdead080fa787ea9d6ac9df3f6acc3cc79', 1, '2021-08-20 04:14:05', 'Login', NULL),
(6, 'ae396db9e2a0c994b0fce1c387f6f9b08352dd1dcf26bf6d2c8e3869b41b4409', 1, '2021-08-20 04:14:44', 'Login', NULL),
(7, '870f5292ed11bcbcdd50d9f553c0167125ba1a7b06ae26b2351599c21c016a54', 1, '2021-08-20 04:20:15', 'Login', NULL),
(8, 'e6a83e6303476e8dce60eab1ee10d8db8488c31527895d43bd525111aaa1291c', 1, '2021-08-20 04:20:49', 'Login', NULL),
(9, '0ea044f12472c096de82ac2856e0fa08ef6f8d40d69d9b23090a226d32457032', 1, '2021-08-20 04:21:28', 'Login', NULL),
(10, 'c5afd96915a1b51ff7275d9d0fcde146b770198c4cdb663d801aaf4e46a6209e', 1, '2021-08-20 04:23:12', 'Login', NULL),
(11, '6b2da271d07c3325f1f9b22cc3a9dd2c6a6b810cca93a236ae720c451164cea0', 1, '2021-08-20 04:26:10', 'Login', NULL),
(12, '6ca9f8622f222bda7aeb8c22db2ab38a16fa731e4a1fc8975a26b8b49bf9b6b1', 1, '2021-08-20 04:31:28', 'Login', NULL),
(13, '3421bf15ba0bb31cf66eb088b4260cb8d67976c07cfd3082a996b8f0c2b68601', 1, '2021-08-20 04:31:49', 'Login', NULL),
(14, 'bf6b3821d604c0110bb1cfa2f83c2dd4de7b363fdea8b6942d0cbcecb0bbfe36', 1, '2021-08-20 04:32:34', 'Login', NULL),
(15, '8b30ae0bd118f761b384abab189c75b01f81121e2846c91963c6d1f54c6417e4', 1, '2021-08-20 04:34:23', 'Login', NULL),
(16, 'f995a8ba3934a16407f31c7ee601475ba1c2adaf9896c0e7760b0c76da7afa4f', 1, '2021-08-20 04:34:50', 'Login', NULL),
(17, '5ae57a881fa5f690d8e470ea8a92f92dd62d6298e37123139d2d61c21afb4c3b', 1, '2021-08-20 04:38:01', 'Login', NULL),
(18, '5f26b67699375f0002c03bcb07a062c9bbc3ee65d5901d8c8cdb24f9ac25f50a', 1, '2021-08-20 04:38:56', 'Login', NULL),
(19, '9c63fcc8521a2d5ea0a1140c66d73459dda6be7a2fd47dfb7ee5c2a9826593f6', 1, '2021-08-20 04:40:17', 'Login', NULL),
(20, '588b9d25f65a8e4e9ad38d6fd1c538d1d5d78a854066abbb27627f171f2b7934', 1, '2021-08-20 04:41:01', 'Login', NULL),
(21, '16d8e14db282947ab4c0a58abaa8eaf7bdea109464cfb0f5e6d8886bea1b5671', 1, '2021-08-20 04:41:50', 'Login', NULL),
(22, '937869e2c08f24f891393155c60f5d329c053af63865cc19d3046eb92975a392', 1, '2021-08-20 04:42:23', 'Login', NULL),
(23, '0c0437bdc00a14f94c6d08aa1d7a44d8f80ffd18b54a9bcabd4d9a954e2b7ce2', 1, '2021-08-20 04:44:45', 'Login', NULL),
(24, 'b0edcb486220122c9b06fd7ae225ab7437bbe50d759025c4895a2a79a3155221', 1, '2021-08-20 04:44:55', 'Login', NULL),
(25, 'ecfced6dc95aba7ac250a84458150d40ff604cc0186b1e4aef45a8fd15bc699d', 1, '2021-08-20 04:49:52', 'Login', NULL),
(26, 'f425ca91105765e6091b6545f7fddbbeba303e0bf45e8d6d1aabbde397bb9db0', 1, '2021-08-21 17:18:15', 'Login', NULL),
(27, 'c366002e494f0d48a2439e49e477bfcbebc863337fcc0d0d6b4e2f49257e7a44', 1, '2021-08-21 17:19:12', 'Login', NULL),
(28, 'b96de7add65b961386da088f9732a2b53f62a0b1e490ab7148ce3a54054444dc', 1, '2021-08-21 17:26:20', 'Login', NULL),
(29, 'ff6549e2753bc989bf4b4a02180cb67d2ebc284f9453d5eb8f19dcbe481dd929', 3, '2021-08-21 19:17:14', 'Login', NULL),
(30, '0b5d6d2f2be9adb2368f9b43772d93ef07ccbb7d17225a979a75d3be8c83b3c0', 1, '2021-08-22 05:17:29', 'Login', NULL),
(31, '4c3582ccecd3331dbb66ce70ad6375b0c29caebe1ddf348570ceda14acf10189', 4, '2021-08-22 05:22:15', 'Login', NULL),
(32, 'f770e52809f5ed3900e6231dc07504f6bf2b3dbfee022f77d831a151b45a52e3', 4, '2021-08-22 05:22:34', 'Login', NULL),
(33, '80de28cf84870cdb92ead97524487a2f6d680acb1506db94163e770d179d1d03', 1, '2021-08-22 13:18:10', 'Login', NULL),
(34, '0f7f1e0f538aee2e34dd83ee426a15fa3ddca96d5c2962baff6f764fff263596', 1, '2021-08-22 13:19:18', 'Login', NULL),
(35, 'ccc274ec88269765877a818698f5d6355f6936b42790ec16fe44afe3e343a387', 1, '2021-08-22 13:19:53', 'Login', NULL),
(36, 'bc9fbf48f36cbe5609da12dbdcb7d55e61c04dea5c3cb04afc65b461c3caa3e1', 1, '2021-08-22 13:20:36', 'Login', NULL),
(37, 'd45a393256564bf795e205b2e184f5b52ba55bda3863d1d4d207793766b525c5', 1, '2021-08-22 13:21:16', 'Login', NULL),
(38, '48857f1f621f69441abef8770286d5f3528928cd88e2960124e5926e8715a458', 1, '2021-08-22 13:22:07', 'Login', NULL),
(39, '1a1f2f6b52a258c38ada8b692cb4975de45532f31bfce387e03c8184037d4d67', 1, '2021-08-22 13:22:34', 'Login', 'mytoken'),
(40, '77e7a987f7425a7524a0c79c49b9e2622d446fe0f5d39c7a4c063ca47eb52d89', 1, '2021-08-22 13:33:11', 'Login', 'mytoken'),
(41, '056e72f45faf616df0b4b60924cabdb93aa5416a2dd1dc48fac8e635bc41e154', 1, '2021-08-22 13:33:20', 'Login', 'mytoken'),
(42, '48b47994e0651a0477525385838b7cd9f4a86cdf0490c83d32f82adc6c5943a1', 1, '2021-08-22 13:52:47', 'Login', 'mytoken'),
(43, 'c57d22ea5d64def760a4ee6af757e08e3716916e978cb07fcfdee1a87d420b2d', 1, '2021-08-22 13:59:25', 'Login', 'mytoken'),
(44, '5c0638ee2e059b0f87b1022ff38066cca3960ca3c9ef2cfc05cf0201449724e2', 1, '2021-08-22 19:19:09', 'Login', 'mytoken'),
(45, 'a808f979cfffa8a27eb1c4d130f5b46e81f4f4021e0ec2c81c286e55f30ddaeb', 1, '2021-08-22 19:20:02', 'Login', 'mytoken'),
(46, 'a61c36bfcf79f33b107232d7a6aeaa3b3260f50168b905cb7858e08811159d20', 1, '2021-08-22 20:17:14', 'Login', 'kjhadkjdjsdjasasdnkajsd'),
(47, 'cbc949bf637eaed215b42b370406dc9d7ce44f89a66d28c73d116864777e2d27', 1, '2021-08-23 18:11:06', 'Login', 'osdflkmsfdlk'),
(48, 'e4d0b47d1462b795347f68b9ecd9cb6425e3d0123176d7e94986bb6cde0bcbab', 1, '2021-08-23 19:59:42', 'Login', 'osdflkmsfdlk'),
(49, '669200e7739539fb1d9615fbe4cfd4a9ab468e7270f88a00140cefd8587bf9bd', 1, '2021-08-23 20:09:07', 'Login', 'null'),
(50, '5c7ea495deb5a8d121136b24a0ef6feba34a09f19e99b45a7b52db1f437706b2', 1, '2021-08-23 20:09:10', 'Login', 'null'),
(51, 'e09e347f5f52539e186207248f97a89cc89a3b73d9ac623d0fe6a7ff4a0090d4', 1, '2021-08-23 22:01:54', 'Login', 'null'),
(52, 'c7f61affee856185c47fdf0f1ea2ec34388b7c17f908ce1f502fdec7a39a0b27', 1, '2021-08-23 22:03:27', 'Login', 'null'),
(53, '47d14c935879d60d174b23a78598e1d4f086eda415258b412154de678d7d1125', 1, '2021-08-23 22:05:27', 'Login', 'null'),
(54, '880d5289eae3064f2213e2af11df190d9acd10a1ee1426da0c3df8516d43fa91', 1, '2021-08-23 22:06:06', 'Login', 'null'),
(55, '5c5698d9c65aef5ab6c301a24b5ee93f09f80850aaebae70dcc696288975ca72', 1, '2021-08-23 22:08:36', 'Login', 'null'),
(56, 'f19c4f0e8797ba8ea61069ba6702c13379ec2705788c3e7b83254fb48f2499c1', 5, '2021-08-23 22:37:36', 'Login', 'null'),
(57, '620f8ed398a6eae1723373fc446184c5befca781ec05abdbaaf24f7e3fa64eff', 5, '2021-08-23 22:39:35', 'Login', 'null'),
(59, 'de88c9b1c2a9b2f4629cc7a73de4a2fcddb71ffc62bc6e300c7fafbd685fb158', 17, '2021-08-24 01:00:48', 'Login', 'null'),
(60, '53f05e54451132fe98752c0d19c576b35953e4e3ff109fcc2f931fd05b9d6caa', 1, '2021-08-24 01:14:57', 'Login', 'null'),
(61, 'ef60bac84d4d86549ebe62209da1b0358598d9bf5e93bb13359633dfbc70c0a6', 1, '2021-08-24 01:14:58', 'Login', 'null'),
(62, 'a575778b9d61b3a70a5c276a59d023372214a6608236c78d5d1511780df6549e', 18, '2021-08-24 01:21:07', 'Login', 'null'),
(63, '77bbb4c4f211d8589b4362fde5529f70bb8babab33519b5bffab677cd64917e9', 19, '2021-08-24 02:29:08', 'Login', 'null'),
(64, 'e2a68671885e34b1b6bd57a294e73c99d2ac3a2fe7df53404f70955b1701bf51', 20, '2021-08-24 02:51:53', 'Login', 'null'),
(65, '7a03e36527398d8fb92dde10fbe837dbe7c4d93f1f957047cf5b2c5f9f428d65', 21, '2021-08-24 02:52:34', 'Login', 'null'),
(66, 'f0ba4b78eca3b0e68d7f5e301f693c6cfcc0c605b46cdb139b13c7a460af3a91', 1, '2021-08-24 02:54:34', 'Login', 'dgdfgdf'),
(67, '3fcf4fde4e51f32eeaf5f78662fd1ef8f624671689158b2cbcd0cebccb2faeab', 22, '2021-08-24 03:02:10', 'Login', 'null'),
(68, '0670b0aa1a40232bdc83115c1c95a001bc7b81bddf991c63fb60d6ebdd2f0a5a', 23, '2021-08-24 03:22:09', 'Login', 'null'),
(69, 'e6f315b2797a1edc862e353c6aad4038fa5aec40cdb2313d87a14b10603cc517', 24, '2021-08-24 03:24:24', 'Login', 'null'),
(70, '136a6d9ab1db93c7a87bc00d38de23408a4758b475fe3a2f0d907ae256f4d061', 4, '2021-08-24 03:27:33', 'Login', NULL),
(71, 'c8cf291358a63125bd9b41aa36bbe276cbf50aa25177843653ad75ca03343655', 25, '2021-08-24 03:30:38', 'Login', 'null'),
(72, '93875618df1206112a635844ee3f94b8f41d991f84df788230ec5c5d122148d9', 25, '2021-08-24 03:31:01', 'Login', 'null'),
(73, 'a594acf3b2c4982eda378ca6b88c81364b9fd923bfe8f1d30439bcda0bf7221b', 18, '2021-08-24 03:33:17', 'Login', 'null'),
(74, 'd6e8edd59153924bbb31b8633f3062037ea219bcbd942b1d385b56427e55ba6e', 4, '2021-08-24 03:48:21', 'Login', NULL),
(75, '2e69232d113c39d393d26cc430edf8553f597489095327df478b5808bed66c37', 4, '2021-08-24 03:51:04', 'Login', NULL),
(76, '7052c42f1a42abe210bf3a66baa4c57682c690c69c639c1dbc7efae0c96cdc27', 26, '2021-08-24 03:49:41', 'Login', NULL),
(77, 'c10d962d33ca84f01ee128189a59558c9e9755af035cb8e598247baeffaaf984', 26, '2021-08-24 03:49:48', 'Login', NULL),
(78, '5847970af47b477938d0432254ef6a37a04d644b0ae2defea34e1a2840eeb8f0', 4, '2021-08-24 04:16:03', 'Login', NULL),
(79, 'd4b7d781665a48c7027fceab9779e5a26061967ecb2537a31686a33f3544ddaa', 4, '2021-08-24 04:09:31', 'Login', NULL),
(80, 'f14ddb10ee574ab92b72ed0773c736e68c7f6494377a5a5d8e7e5def94c86844', 4, '2021-08-24 04:13:09', 'Login', NULL),
(81, '9725a3fb612cbfb065695ff18fac532b7b6b1103fe5340ec3b60ec5813b4a947', 4, '2021-08-24 04:13:11', 'Login', NULL),
(82, 'cbb6043c147352ae4bc5cf6fe577cf70f30917566673be6955ef7c5403e5ecdf', 4, '2021-08-24 04:13:12', 'Login', NULL),
(83, '7d1a80be9e36e20a9b77b8c8cdcb073e77ca35bfd8995c3007ac6012ad49c302', 4, '2021-08-24 04:13:12', 'Login', NULL),
(84, 'c040d76f6b0fa461e777e12f00720e88027082c2016acb8922a9c14371047c56', 4, '2021-08-24 04:13:13', 'Login', NULL),
(85, 'a320bde1b06edd9db4eb55d24e008c8dadef1fcbf00503e392051e014b0f7577', 4, '2021-08-24 04:13:14', 'Login', NULL),
(86, '247047ce1399d1cddd4def236bad169743265318b3f72cf9a391c04a7bb47f0d', 4, '2021-08-24 04:13:15', 'Login', NULL),
(87, 'cc7f07c4414e562337a071c2b4717a15bd8bc2d9fdb1e00cf9d042f4791667f1', 4, '2021-08-24 04:13:15', 'Login', NULL),
(88, 'cc4af6d354b27989b630bb100ddfbff72cc12f25e3fff6fdd9b01884c2f7e454', 4, '2021-08-24 04:13:16', 'Login', NULL),
(89, '7ca428e8474638309d904b0c77b2d0568c8d08fb0111f6b4cf45dcf8a9b76603', 4, '2021-08-24 04:13:16', 'Login', NULL),
(90, '4726303ceb521bcb77065dc88a83ba08e077b30466626c920acc154138d4a662', 4, '2021-08-24 04:13:16', 'Login', NULL),
(91, 'cfcf60b61f7df761bcbcf72cdf918e0123df0fd0b483ce7e5a46886b354d4222', 4, '2021-08-24 04:13:16', 'Login', NULL),
(92, '69163bcd2ab14a9218278b453e28fbd9258bd5ed1398be63d87f25ea130380a5', 4, '2021-08-24 04:13:17', 'Login', NULL),
(93, '2ed30caf6c2a1e69f2361a92e34e2da2ee648ef9af44fc1bfbf17ac5f4fdbe4d', 4, '2021-08-24 04:13:18', 'Login', NULL),
(94, '2f344b0ff3dfd111b143078e61dccd7e2d5ff3a4d11c2883214f29913ad1402b', 4, '2021-08-24 04:13:18', 'Login', NULL),
(95, '4164b59359ad82ee27862cf3126df546c0ccbda98de0fa803541ba96368d929f', 4, '2021-08-24 04:13:19', 'Login', NULL),
(96, '36aadb142d2acf9ad8e0b648474d0e11f2573529d46a6a93ee58e470a62f0a10', 4, '2021-08-24 04:13:19', 'Login', NULL),
(97, 'c0c04e337d06ec58e73ad2bdd7b4f2723604359e86169ae45ea12dc39d8690ee', 4, '2021-08-24 04:13:20', 'Login', NULL),
(98, '74682555d8b61fa26097b01c06d9f0e149cddb035ce6b819dfda9bdb92b05a23', 4, '2021-08-24 04:13:20', 'Login', NULL),
(99, 'f482e550111acd2b6d1c5fd876f663c164a4dc4c2a0a9addc7dd8f03f08954e7', 4, '2021-08-24 04:13:20', 'Login', NULL),
(100, 'd8dff4c679a4e65201fc15924b63dfea41e1db8ca1f9210ec3586c99872166f3', 4, '2021-08-24 04:13:20', 'Login', NULL),
(101, '4833a8786e937b6b09a5b4910947f61a81c83021a6ce8506c763bba6af4a3a27', 4, '2021-08-24 04:13:20', 'Login', NULL),
(102, '628f1f91dd88c3526b59c876562fde12f493182465f221c80b1ea81fa64baa86', 4, '2021-08-24 04:13:20', 'Login', NULL),
(103, '3377e90fb1dda7aa890e224c849e2a804eec7db26ae0c0b7e1c05ef55957fe04', 4, '2021-08-24 04:13:21', 'Login', NULL),
(104, '2d76c9d96a73b1b6efebc539f010ee442700c80e0e59de77285db3cecd2d68ce', 4, '2021-08-24 04:13:22', 'Login', NULL),
(105, 'cf3b59bf1f6bb711314aedf4100c39f1139c98da864311e6b20c071f9067f05b', 4, '2021-08-24 04:13:22', 'Login', NULL),
(106, '59bfcdfeb3b0b72d54e6da82c56ad09dc663ca0839e0674c67247e7cd1a49767', 4, '2021-08-24 04:13:22', 'Login', NULL),
(107, 'd957e37f73bf7bc9ddd1c426aff6a124befa54e9578b61bf9dda8732aa1c37a4', 4, '2021-08-24 04:13:22', 'Login', NULL),
(108, 'f474491acc2e22d30b745189843bc0048dc0db21016b37dbbdfd1f56cec857da', 4, '2021-08-24 04:13:22', 'Login', NULL),
(109, 'fc6aff139d3465efaf0d362cf2f0b4176d17f6155043d2b512f6dc440bcd4796', 4, '2021-08-24 04:13:23', 'Login', NULL),
(110, '3a4c784e167f3324595e51546c7b311a0156e3e3b719628f43cb66182e23539d', 4, '2021-08-24 04:13:23', 'Login', NULL),
(111, 'ffd8771bb8587b427b10b094cad4e5f5a6a5752f4ee4321b635a2b0409360976', 4, '2021-08-24 04:13:24', 'Login', NULL),
(112, '45eab0df8d1a2ee88338ea88cf26a10acd1a1661210c3f305bd00abbfc55c065', 4, '2021-08-24 04:13:24', 'Login', NULL),
(113, '0340a74544214ac58d7821d1b63fc191ebff223ba5e7f25e69a4b3d0d7789880', 4, '2021-08-24 04:13:24', 'Login', NULL),
(114, '097088e3d0d6a5d8b0c288a3f44eb493ee17119ca6dd33021f3a0fd4eabd9bda', 4, '2021-08-24 04:15:36', 'Login', NULL),
(115, 'b2dd7c4a6d4b74d14aaf47c5879480fdd77c3c450b33ada757dbca6834c0b638', 4, '2021-08-24 04:15:36', 'Login', NULL),
(116, 'dc938e1c2040558676e96b4a0c9fe106172c8ac1101c68858ce525e64456648c', 4, '2021-08-24 04:15:38', 'Login', NULL),
(117, '7842dee8c097589178a9b15ef5dbf6e1ec7634d83b1116c3567e03b2709a9309', 4, '2021-08-24 04:15:49', 'Login', NULL),
(118, '775a81fb1cd8fbac4bfdb673257f63c4c0f3a0fbaac35e1641e6f9a13ab23bdf', 4, '2021-08-24 04:15:49', 'Login', NULL),
(119, '4bcaae2d8ac074b6d93167f2c7a6fbbe1497d7cd3334ff24509e32c95ee87d74', 4, '2021-08-24 04:15:49', 'Login', NULL),
(120, 'c1059e8f1138e3f6f2ca2ee18ad1d16f79cbe058733efe28086b0fe116c0db61', 4, '2021-08-24 04:15:50', 'Login', NULL),
(121, '7607b5e883af77f2960efa70a92d9df644b8808aa641b27acc6970281b52ab7c', 4, '2021-08-24 04:15:51', 'Login', NULL),
(122, '70c1c6e4f9aad8cadb51aed4a1e791a47b119e083adced81368322c1e5f6ec3e', 4, '2021-08-24 04:15:52', 'Login', NULL),
(123, '8eb4385bed7803c1370eb8c48053ec83cbcc67c8b0638eea47caf918d85e21cb', 4, '2021-08-24 04:15:52', 'Login', NULL),
(124, 'ac07852d21ff4b415cbd62de69ec7ce3493e59ffd5da8ce8ce0a9971e409f6f2', 4, '2021-08-24 04:15:52', 'Login', NULL),
(125, '430661745e480e91f9d4f985c733bb553a018071035f0d5432d644a66ab44eb8', 4, '2021-08-24 04:15:52', 'Login', NULL),
(126, '8adf9be9a54b76d026bd9079bdaf26405a349a5ff12608140d4e9326a6aaa2bb', 4, '2021-08-24 04:15:53', 'Login', NULL),
(127, '0f9a226d86a1fe9c56b7f94e904220ca76c1271419d6f9d606b6e540052e4bd2', 4, '2021-08-24 04:15:53', 'Login', NULL),
(128, 'a4c9591ab167f9845af280c0f1353e3ff2e357239d2c10a110bb74b9fc75f375', 4, '2021-08-24 04:15:55', 'Login', NULL),
(129, '29c7c8e9e2256cf4e42443b4eab4359509e7ac249e1656f17aa4e8f519e0437f', 4, '2021-08-24 04:15:55', 'Login', NULL),
(130, '66b78b2826ab1a0ffbc5574b48e17bf60a2f348382b0dd6517c57c2cf4e0b10e', 4, '2021-08-24 04:15:56', 'Login', NULL),
(131, '449d9415587c4c168459d136b6da8e03e813a520e518cf45187a9ca53739da84', 4, '2021-08-24 04:15:56', 'Login', NULL),
(132, 'e3b5e4a501994cc0b1288f557690740ae6c7ab4117da3d7bdb935590be2c348e', 4, '2021-08-24 04:15:56', 'Login', NULL),
(133, '64b8085b2dc735ecf6d27a4beabec3e2acf2b99ae28810a0ce33710c86720c8d', 4, '2021-08-24 04:15:56', 'Login', NULL),
(134, 'a82427f239f297bd7b6195bf4d5e81e3ca66b62809ee914014809e7b7b4f3ec3', 4, '2021-08-24 04:15:56', 'Login', NULL),
(135, 'f441ee784861b7de1fd7460c4947ce788c27a4070f1f9f48e095c3eaeb3d0d6d', 4, '2021-08-24 04:15:57', 'Login', NULL),
(136, 'adf8913262ba3127c29df40b44f2e4d930385de4ef4f5d837112d03abc059e79', 4, '2021-08-24 04:15:57', 'Login', NULL),
(137, '0b8f1bad7207dc88af7eb4c85e201a9f0c365d3fbdd0358d8a9b1feabddd347a', 4, '2021-08-24 04:15:58', 'Login', NULL),
(138, '0244796cde1fe6fafd9115f9f2548d68f8f71ed7590d8906a4e795ab302cacbf', 4, '2021-08-24 04:15:58', 'Login', NULL),
(139, 'ee07f5919cd6241cacc7701508bd09316411bcaee30eb1ab01a6deea699e546b', 4, '2021-08-24 04:15:58', 'Login', NULL),
(140, 'f1c5e16d61ab7c90eed3877452cda10ffb08031d004a84c9b677792e40a34fcd', 4, '2021-08-24 04:15:59', 'Login', NULL),
(141, '5412573db6113d061209da213cad3d6e5e316c9e339914ce1a391d6794ad4352', 4, '2021-08-24 04:15:59', 'Login', NULL),
(142, 'd1124b475f3ed68962f355ccad07497eb41cadb6d0621ea3937b8a56c829df0c', 4, '2021-08-24 04:15:59', 'Login', NULL),
(143, 'f1b6b1b7c7e2a641168ac0380a439f57dbfbdeacda568cb22f3c4caa9b60a8b6', 4, '2021-08-24 04:15:59', 'Login', NULL),
(144, 'af2668b912982bb1d05e6c54174951e96ccca027b3995d14a0f17b517b325b03', 4, '2021-08-24 04:15:59', 'Login', NULL),
(145, 'a129d8b426b904f6f22e53c76d32a35a68f844b63317b574203f20a08a7de893', 4, '2021-08-24 04:16:00', 'Login', NULL),
(146, '52edd6d73885a31a074178c3b7c70c870532daf3663f87d79ecaa79cd8403e73', 4, '2021-08-24 04:16:00', 'Login', NULL),
(147, '42856366af576a8ea28f0034e21a478e8d6358bef959d44e67c253a11aa513f9', 4, '2021-08-24 04:16:00', 'Login', NULL),
(148, '747757d1f6d01a1cb31f075e0a6b472e234a68c986b81967234696923ef17df8', 4, '2021-08-24 04:16:00', 'Login', NULL),
(149, '770f2ebff78b830e97bb8ea81f6322b399917c248bcf509929381251280167f5', 4, '2021-08-24 04:16:00', 'Login', NULL),
(150, '8681027365b6638a344f3b10cf39a7f843c988e377e453836533e16f768137a0', 4, '2021-08-24 04:16:01', 'Login', NULL),
(151, 'c92e5692d93a74c3a91a1e35688f03c5243f33175ed3233d478bd08d8eb78df5', 4, '2021-08-24 04:16:01', 'Login', NULL),
(152, 'a651a90536c9ca2e9c41d00edd571dbbeb66f0ad2cb22a1de84df825ce6b7e3c', 18, '2021-08-26 22:20:51', 'Login', 'null'),
(153, '426ef1630ced688ce48ba643275c8859ebc9f10951b76fbf8a743be314b3a89f', 18, '2021-08-26 22:23:47', 'Login', 'null'),
(154, '3be87827a21c0f8218b878f05dec7e7f5535c48d24fca7858ea1eb73d88d2599', 18, '2021-08-26 22:23:56', 'Login', 'null'),
(155, 'b7cdaf6212b2d214e7a587e2601a32f428a889ed0f8b3d27510e1402568da24b', 18, '2021-08-26 22:26:48', 'Login', 'null'),
(156, '0922967e04b6efd8dc21d69704cd9dbb5c2b22c84a7260748a0e194906a53e21', 18, '2021-08-26 22:30:40', 'Login', 'null'),
(157, '6fcdfbc1e073f7933bb00be4c72e931f63c60b9014b629ed25597262ac656be7', 18, '2021-08-26 22:40:29', 'Login', 'null'),
(158, '47a9ea2b479d5966c0b372be6f96bc868ad0aa5d4e7f25b0790e1aca2a3b6a08', 28, '2021-08-26 22:47:00', 'Login', 'null'),
(159, 'c46914f7110c222832a08e0164adab228988d57cba8e3f7e341aef25bc7c3ede', 29, '2021-08-26 23:07:52', 'Login', 'null'),
(160, '5e57781a75e619cdab25cdc3d8b5cb3e617dbfd71866dfd24d34adc937b96041', 29, '2021-08-26 23:14:29', 'Login', 'null'),
(161, 'f2c25849b1e9d73fc813f7b3bff1456ad0e594059d918e4a89b57a07f9deab58', 29, '2021-08-26 23:15:33', 'Login', 'null'),
(162, '236cf9ce62f9e292060e199a831fce00d6b0987c1db2183bdf3d1b840dd463c1', 30, '2021-08-26 23:25:51', 'Login', 'null'),
(163, '2484c387144dc2760942d34949fdf9381642db76251053c3643f6c9678001e3e', 29, '2021-08-26 23:46:34', 'Login', 'null'),
(164, '83f93a71b4a15e3ad6b63af664d78e1ea089965212d34d1b8eb0752957dfac90', 29, '2021-08-26 23:49:46', 'Login', 'null'),
(165, 'd2a022b272eb96a10fd1790c8d0af24b78ffc50c578e9b4e18fd87be75e765f4', 29, '2021-08-26 23:51:13', 'Login', 'null'),
(166, 'f04edf942604a5ad64552456f76a116641664aedf3c281779dba0ab5c06df7df', 32, '2021-08-26 23:52:19', 'Login', 'null'),
(167, '0c015c4e6ffe4aad1a1889500761863ab2485def95327d101ba59d6a899e7f1e', 32, '2021-08-26 23:55:16', 'Login', 'null'),
(168, '58bb429726e8fc1c93bbabe514d8d91c2ab8d851624f255faa248ec11e603940', 32, '2021-08-27 00:44:28', 'Login', 'null'),
(169, 'df2707e8ef72f69d6f43b606dd318f16d5427bf307e0b0a220b386ef2c18896f', 29, '2021-08-27 06:32:26', 'Login', 'null'),
(170, 'b056889fbb5f122d6b41f289f87a65d3fb2e08c2c4497196736d6b13623e89a4', 32, '2021-08-27 06:33:05', 'Login', 'null'),
(171, 'e34351519296f6bcb32edea0be1743a2ecb5af70547f18c6a831fc67273ad70c', 56, '2021-08-27 06:33:36', 'Login', 'null'),
(172, 'b660350dd8ff4d505d7e2de4de23676b3197c20a2a955907b55806d0e0fc4140', 57, '2021-08-27 06:36:21', 'Login', 'null'),
(173, 'c744bbe44db1c3918c6e6a17b62dcae6b903e4fe9a8c86360c24509d211142e0', 70, '2021-08-27 17:08:04', 'Login', 'null'),
(174, 'fbd19161559744bf60c7f55480a6ff1b5e7a78e5bec632c59832f5c6aeaab596', 72, '2021-08-27 17:24:20', 'Login', 'null'),
(175, 'd90b380f9db462e56de44ff3e68e980618a160d9d2baf1911fe57927444a9ff0', 70, '2021-08-27 18:09:08', 'Login', 'null'),
(176, '164dfd6666976e4cb4f508477325e4289f7dce29487e4acee420119087df59da', 1, '2021-09-02 05:32:04', 'Login', NULL),
(177, 'd1ad0388af442054061009c7e30ff93256d5b13e0ac90448de260d9bf443ff38', 1, '2021-09-02 05:33:06', 'Login', 'cluanquie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(12) NOT NULL,
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallet_id` int(12) DEFAULT NULL,
  `block_account` tinyint(1) NOT NULL,
  `user_type` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `user_password`, `wallet_id`, `block_account`, `user_type`) VALUES
(1, 'Oscar', 'Alvarez', 'oalvarezr@unal.edu.co', 'password', 1, 0, 1),
(2, 'pepe', 'ramirez', 'prueba@unal.edu.co', 'password', 0, 0, 0),
(3, 'pepin', 'pepito', 'prueba2@unal.edu.co', 'password', 0, 0, 0),
(4, 'David', 'Leon', 'david@local.com', 'Asdas123', 0, 0, 0),
(5, 'Felipe', 'Riaño', 'friano@unal.edu.co', 'Pineda2020', 0, 0, 1),
(17, 'felipe', 'riaño', 'felipepineda1997@gmail.com', 'abc12', 0, 0, 1),
(18, 'bus', 'bus', 'bus@bus.com', 'password', 0, 0, 2),
(19, 'felipe', 'felipe', 'felipe@felipe.com', 'abc123', 0, 0, 1),
(20, 'felipe', 'riaño', 'felipe@felipe1.com', 'abc123', 0, 0, 1),
(21, 'ndjd', 'bfhdbd', 'bdhd@jfjf.com', 'hdhdbd', 0, 0, 1),
(22, 'felhdjd', 'vdhdbd', 'bdhd@gdhdbs.cjcbs', 'gagshs', 0, 0, 1),
(23, 'hdhd', 'veggd', 'vshbdhd@fhf.vi', 'bdhdbd', 0, 0, 1),
(24, 'hdhdgd', 'cdgdhdh', 'hshs@hdhdb.chdhhd', 'hshdhd', 0, 0, 1),
(25, 'abc', 'abc', 'abc@abc.abc', 'abc', 0, 0, 1),
(26, 'gfgdfg', 'dfgdg', 'a@a.co', '123', 0, 0, 0),
(27, 'Pepe', 'Perez', 'edprietov@unal.edu.co', '140910', 0, 0, 0),
(28, 'pepito', 'abc', 'abc@abc.com', '123', 0, 0, 1),
(29, 'abcd', 'abcd', 'abcd@abcd.com', 'abcd', 0, 0, 1),
(30, 'a', 'a', 'a@a.com', 'a', 0, 0, 1),
(32, 'bus2', 'Bus2', 'bus1@bus.com', 'password', 0, 0, 2),
(33, 'oañ', 'asd', 'asd', 'password', 0, 0, 0),
(36, 'oweañ', 'asd', 'aewsd', 'password', 0, 0, 0),
(37, 'oweañ', 'asd', 'aewasdfsd', 'password', 0, 0, 0),
(38, 'oweañ', 'asd', 'aewsdfewertrsd', 'password', 0, 0, 0),
(39, 'oweañ', 'asd', 'aewsdfeweerfrtrsd', 'password', 0, 0, 0),
(41, 'oweañ', 'asd', 'aewsdfeweedgrfrtrsd', 'password', 0, 0, 0),
(42, 'oweañ', 'asd', 'aewsdfeweedgrfrtrsdfhd', 'password', 0, 0, 0),
(43, 'oweañ', 'asd', 'aewsdfeweedgrdsfrtrsdfhd', 'password', 0, 0, 0),
(45, 'oweañ', 'asd', 'aewsdfeweedsrfgfggrdsfrtrsdfhd', 'password', 0, 0, 0),
(46, 'oweañ', 'asd', 'aewsdfwereweedsrfgfggrdsfrtrsdfhd', 'password', 0, 0, 0),
(47, 'oweañ', 'asd', 'aewsdfwereweedsrfgfggrdsdfgsfrtrsdfhd', 'password', 0, 0, 0),
(48, 'oweañ', 'asd', 'aewsdfwereweedfgsrfgfggrdsdfgsfrtrsdfhd', 'password', 0, 0, 0),
(49, 'oweañ', 'asd', 'aewsdfwerewsefgeedfgsrfgfggrdsdfgsfrtrsdfhd', 'password', 0, 0, 0),
(50, 'oweañ', 'asd', 'aewsdfwew435d', 'password', 0, 0, 0),
(51, 'oweañ', 'asd', 'aewsdfwesfdgw435d', 'password', 0, 0, 0),
(52, 'oweañ', 'asd', 'aewsesdfwesfdgw435d', 'password', 0, 0, 0),
(53, 'oweañ', 'asd', 'aprueba435d', 'password', 0, 0, 0),
(54, 'oweañ', 'asd', 'aprueba4e35d', 'password', 0, 0, 0),
(55, 'oweañ', 'asd', 'aprueba4dsdfe35d', 'password', 0, 0, 0),
(56, 'alvaro', 'uribe', 'alvari@uribe.com', 'password', 0, 0, 1),
(57, 'alvarito', 'alvarito', 'alvaro@alvarito.com', 'password', 0, 0, 1),
(59, 'David', 'Leon', 'davidx@local.com', 'Asdas123', 0, 0, 0),
(60, 'uu', 'uu', 'u@n.com', 'password', 0, 0, 1),
(61, 'kk', 'kk', 'k@k.com', 'password', 0, 0, 1),
(62, 'aa', 'aa', 'zx@zx.com', 'password', 0, 0, 0),
(66, 'oweañ', 'asd', 'aprueba4dsdsffe35d', 'password', 0, 0, 0),
(67, 'David', 'Leon', 'dleonmu@unal.edu.co', 'Asdas123', 0, 0, 0),
(69, 'aa', 'aa', 'wxyz@zx.com', 'password', 0, 0, 0),
(70, 'pepe', 'pepe', 'pepe@abc.com', 'password', 0, 0, 1),
(71, 'David', 'Leon', 'd@l.com', 'Asdas123', 0, 0, 0),
(72, 'hola', 'hola', 'hola@hola.com', '123', 0, 0, 1),
(73, 'Busetero1', 'Apellido', 'bus2@bus.com', 'password', 0, 0, 0),
(74, 'Busetero1', 'Apellido', 'fjfgjffghjfjfghjffgj@bus.com', 'password', 0, 0, 0),
(75, 'Busetero1', 'Apellido', 'fjfgjffghjfjfghjffgfghfhj@bus.com', 'password', 0, 0, 0),
(76, 'Busetero1', 'Apellido', 'dgdfgdfgdfgdfg5646456456@bus.com', 'password', 0, 0, 0),
(77, 'Busetero1', 'Apellido', 't78678678678686786@bus.com', 'password', 0, 0, 0),
(78, 'Busetero1', 'Apellido', 't7867867867868678yuiyui6@bus.com', 'password', 0, 0, 0),
(79, 'Busetero1', 'Apellido', 't7867867867868678yyuiyuiuiyui6@bus.com', 'password', 0, 0, 0),
(80, 'Busetero1', 'Apellido', 'bus3@bus.com', 'password', 0, 0, 0),
(81, 'Busetero1', 'Apellido', 'sfdsdfsdfsdfsdf@bus.com', 'password', 0, 0, 0),
(82, 'Busetero1', 'Apellido', 'sfdsdfsdsdfsdffsdfsdf@bus.com', 'password', 0, 0, 0),
(83, 'Busetero1', 'Apellido', 'sfdsdfsdsdfsdfsdfsdffsdfsdf@bus.com', 'password', 0, 0, 0),
(84, 'Busetero1', 'Apellido', 'sfdsdfsdsdfsdfssdfsdfdfsdffsdfsdf@bus.com', 'password', 0, 0, 0),
(85, 'Busetero1', 'Apellido', 'sfdsdfsdsdfsdfssdfssdfsdfdfdfsdffsdfsdf@bus.com', 'password', 0, 0, 0),
(86, 'Busetero1', 'Apellido', 'sfdsdfsdsdfsdfssdfssdfsg3556fdfdfsdfsdf@bus.com', 'password', 0, 0, 0),
(87, 'Busetero1', 'Apellido', 'sfdsdfsdsdfsdfssdfssdfsg3556fdfdfsdfsf@bus.com', 'password', 0, 0, 0),
(88, 'Busetero1', 'Apellido', 'bus4@bus.com', 'password', 0, 0, 0),
(89, 'Busetero1', 'Apellido', 'jhgkhkghkghkg@bus.com', 'password', 0, 0, 0),
(90, 'Busetero1', 'Apellido', 'yuiyuiyuiyuiyui@bus.com', 'password', 0, 0, 0),
(91, 'Busetero1', 'Apellido', 'gghkghjkghjk@bus.com', 'password', 0, 0, 0),
(92, 'Busetero1', 'Apellido', 'gkghjkghkgh@bus.com', 'password', 0, 0, 0),
(93, 'Busetero1', 'Apellido', 'gkghjkghkdfggh@bus.com', 'password', 0, 0, 0),
(95, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdsdfgh@bus.com', 'password', 0, 0, 0),
(97, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdsdfghzzz@bus.com', 'password', 0, 0, 0),
(98, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdsdfghzzzxx@bus.com', 'password', 0, 0, 0),
(99, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdssfdsdfdfghzzzxx@bus.com', 'password', 0, 0, 0),
(101, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdssfdsdfdfgmmmmhzzzxx@bus.com', 'password', 0, 0, 0),
(102, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdssfdsdfdfgmmmmhzzvvvvvxx@bus.com', 'password', 0, 0, 0),
(103, 'Busetero1', 'Apellido', 'gkghjkghkdfsfdssfdsdfdfgmmmmhzzvvvvvxxww@bus.com', 'password', 0, 0, 0),
(104, 'Busetero1', 'Apellido', 'bus5@bus.com', 'password', 0, 0, 0),
(107, 'Busetero1', 'Apellido', '12341@hola.com', 'password', 0, 0, 0),
(109, 'Busetero1', 'Apellido', '123412@hola.com', 'password', 0, 0, 0),
(110, 'Busetero1', 'Apellido', 'prueba@hola.com', 'password', 0, 0, 0),
(111, 'Busetero1', 'Apellido', 'prueba1@hola.com', 'password', 0, 0, 0),
(114, 'prueba', 'prueba', 'prueba20@a.com', 'password', 0, 0, 1),
(115, 'last', 'las', 'last@last.com', 'password', 0, 0, 1),
(117, 'Busetero1', 'Apellido', 'prueba99@hola.com', 'password', 0, 0, 0),
(118, 'Busetero1', 'Apellido', 'prueba9ff9@hola.com', 'password', 0, 0, 0),
(122, '', '', '', '', 0, 0, 0),
(127, 'oweañ', 'asd', 'apruebde4dsdsffe35d', 'password', 0, 0, 0),
(128, 'oweañ', 'asd', 'valor', 'password', 0, 0, 0),
(129, 'oweañ', 'asd', 'valor1', 'password', 0, 0, 0),
(130, 'oweañ', 'asd', 'valor2', 'password', 0, 0, 0),
(131, 'oweañ', 'asd', 'valor3', 'password', 0, 0, 0),
(132, 'oweañ', 'asd', 'valor4', 'password', 0, 0, 0),
(133, 'oweañ', 'asd', 'valor5', 'password', 0, 0, 0),
(134, 'oweañ', 'asd', 'valor6', 'password', 0, 0, 0),
(135, 'oweañ', 'asd', 'valor7', 'password', 0, 0, 0),
(136, 'oweañ', 'asd', 'valor8', 'password', 0, 0, 0),
(137, 'oweañ', 'asd', 'valor9', 'password', 0, 0, 0),
(138, 'oweañ', 'asd', 'valor10', 'password', 0, 0, 0),
(139, 'oweañ', 'asd', 'valor11', 'password', 0, 0, 0),
(140, 'oweañ', 'asd', 'valor12', 'password', 0, 0, 0),
(141, 'oweañ', 'asd', 'valor13', 'password', 0, 0, 0),
(142, 'oweañ', 'asd', 'valor14', 'password', 0, 0, 0),
(143, 'oweañ', 'asd', 'valor15', 'password', 0, 0, 0),
(144, 'oweañ', 'asd', 'valor16', 'password', 0, 0, 0),
(145, 'oweañ', 'asd', 'valor17', 'password', 0, 0, 0),
(146, 'oweañ', 'asd', 'valor18', 'password', 0, 0, 0),
(147, 'oweañ', 'asd', 'valor19', 'password', 0, 0, 0),
(148, 'oweañ', 'asd', 'valor20', 'password', 0, 0, 0),
(149, 'oweañ', 'asd', 'valor21', 'password', 0, 0, 0),
(150, 'oweañ', 'asd', 'valor22', 'password', 0, 0, 0),
(151, 'oweañ', 'asd', 'valor23', 'password', 0, 0, 0),
(152, 'oweañ', 'asd', 'valor24', 'password', 0, 0, 0),
(153, 'oweañ', 'asd', 'valor25', 'password', 0, 0, 0),
(154, 'oweañ', 'asd', 'valor26', 'password', 0, 0, 0),
(156, 'oweañ', 'asd', 'valor27', 'password', 0, 0, 0),
(157, 'oweañ', 'asd', 'valor28', 'password', 0, 0, 0),
(158, 'oscar', 'asd', 'email1', 'password', 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `logins`
--
ALTER TABLE `logins`
  MODIFY `login_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tokens`
--
ALTER TABLE `tokens`
  MODIFY `token_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
