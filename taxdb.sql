-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 03:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taxdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_03_125449_create_receipts_table', 1),
(5, '2024_10_03_125500_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `tax` decimal(5,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `transaction_date` date NOT NULL,
  `file` blob DEFAULT NULL,
  `amount_after_tax` decimal(10,2) GENERATED ALWAYS AS (`amount` + `amount` * `tax` / 100) VIRTUAL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `tax`, `description`, `invoice_number`, `source`, `invoice_date`, `transaction_date`, `file`, `created_at`, `updated_at`) VALUES
(2, 10000.00, 5.00, 'gear', '00050', 'x company', '2024-10-03', '2024-10-17', 0x7061796d656e74732f43557251706f706d664d6d536c784f714955546d5161694c784e5a35526673624a7a6f76584b42782e706e67, NULL, NULL),
(3, 101.00, 6.00, 'ABCD1', '000014', 'Z company', '2024-10-03', '2024-10-26', 0x89504e470d0a1a0a0000000d49484452000000e1000000e10803000000096d2248000000cf504c5445ffffff38004d9f85ec35004a3200489d82ec997debfdfcfe5028622900421c0039c1b1f29e83ec502462faf7fb9b7febeae5fab9a7f1b1a3b72c0044eeeafb23003ef4f1fd987beb24003ff7f5fdbeadf2ebe6eda187ecaa93eee7e1fab5a2f0ae98efdad1f7e0d8f9d4c9f6a48cedc5b6f3e5dfe89b88a4d1c6f68f7a997c6388cabdf4b19cefa790eee3dcf9d6cedabeb2c472567f461859a593ad180037593669877192c4b9c9d2c8d6b6a8bd72558060406fc3b8c8451459684a765b3a6b5428667c6a874e1e610f0032746080279185220000143449444154789ced5d5943e23c17a6b6058b9d562c15105c5118710165041db76ffbffbfe96b597b966c50e0bdf0b9988ba149f3242767cb492d147244e3eaae7271ddda6b3d9cdfb40f4b062d4b67ed83f3d356ab757d51f97d759ce7a0f243f5eea21886eede04be1bd6dcca6543ab65e3b2e2d742d79f34dc73c3b0787a57ddf068cd71751f86fe1e40c2b275a01e69f5a0356397691a86f7575b18b53e1e4fe78b87108627f2753c3e11b474c3d3c72d8d5e8d46a5e6b3a39c8cb4d89634fd5de4f94d16b256d193f28de3aa251e658ae2b948731cdf87d29661eb1f21aa77f251a6cbd83a645b1e2aa626e578b765360c4e8aaa5126a8716b7155d368593cd93a238413e50a4ed78252bcd26cb9638a377ac34c067a865a9e69b7bcd909b319da3a223a850bf56243b90517902ae30da3aa4f70cf3d054d4ff519ee157945b505944ec5669002a845b502cec03f357171f3c46f9361264edcd283ab6237cd6072b60883ad34817bbe687a6ed6d40f77e3dc1c704b98b8dbc5d0778b9cb7599bebd333c61226ce76b158243ef814e1c12e08069c9a09dd4afbac7a5c3d6b57f6c804f8f7ed8393cac941fb9ed0486289bbcbb3c3c7f6c129eba9d6821d306476a1ebfe5e8a53a3ede227fcd04d81c3acc43bbf5bbaae879c1f1ffede01c307ba101538d3a503c285838fdb1d3ed0e57fd826b5d930e802d179bed4d0b67e482d7a85b40bb71ff4138bc60c34713ed53e41f1926947b4d80ec4142b7c81cd6aab56919d9842e11e759f31355b42700d47e09fb28f1d2bdd1eff948d8f03fcdcc3b6b5e931123fde773cdb539b76778f6d8a173fdc768af10c3274efd9877c2d5deae3c86a82169a42f6a10d0269c9905317879abe99ef72ab78a7f1864d02da7b7f8f711c1b5a2b385d45a6390acdb6ae4c11c30be611ac0e257099f64897ed98a15ba14ff021a0bfc7bbd68cad81deebae1952dfbfca786c6e1271b426ff12e28ccf022daec06e6e0e972a865446c3eb83abea71e3b87a75724dd697b1e888e1b693c3d05a5029252160787db9b4d9c125e15823d6004a696ddbc99a63a8698839bc40325ac439c11be4321065557a8033b46d8b8fde8fadc5215a4297c9082331aea19d88e6f061ebd9a80a1860119d841dc0e1b39b0825bdf15e6e2bb5f586211d4009da32414eb70d17fa1aae1294f3adabd2448860ce08ca184cd90b231fa42d81ae7904fbd4f77770b60f551d74bda1b57745f179153204561f2649a82adb02b0ef9df539c0e248b610d8cc60a96f76ec774f00ed811f2e954d00146d283e8f7f043c32412e4ef0b81b6522023e785a265c8e81f4b5c4d1790082c0e5f114e97a37c74f259c4facddcdb421087cd8b8630ea0308bb3fd1a1c606f60fbc6700a92480b1fa6cb085c3a5776887b925ded69185f6a138faeb8b3828513ec5dfbe1decdd531dc5eaeec0cf726db43b261ab57073ef5ca7777d07dc6c4b86e58ac415ba1cd702facb1273aeeb653340bb4b5b214fa522a84bfa3736ecd320c7d4d23c64e0a32820bdd13e096f878b3d152379f52bcd8faf1dab17ea981c4e26bd6d4eca5850e5b3e066e5c1b24d234bd36452fd75ba5587a303988179e8c554d4a1ddceb2d9afdd28551a5019ff22f186554d36e2eb64751538b2e50e4739dbf0d0a8e526c4fa33223a38e081c9b461683b4a186443053b9036799d2d15c24cea4ccb431f19df404dc0fafdb8c39da4e4ab1744d4a29dcd4e7689f925af6cc886b07d0a00507e2ca693f0c4f273dbac4efdd8ab6210597e1c54c571ede9cd6c269cd8f4f2a7f9245c9648469fce0cfda8561edf466b65455b28cdb28c5241abe789299d7e3cbf44ec9f5f5e9c1392d4669552e0f1b41e3f0b2d2a2e524e707a749bb8bcadd6526e754aa90006df3351958c39364f60cdc364be38e221f3f88123138352eb43cb9e111bd512436dac5c38b99129802dc11ce3de70e545b2130510dc535030e215f94818dafa0e82337a025e4ce6e13540dbcd64c677b7ca48b1ca80d2f22da85dcf97b5a1066541fbb047b6901d7b16eb6760826a9f76aac7ad02dc160c01f835e22c1d9a43abdd3388f38e44fea3529b222782ec9fee70b54bacedaa6466b0d82499f9c5f066df0260bdba147caa7984cae1930602b7350c20a9fa5e688dfea23255a19ba474a8597606c3f6bd26131eb060b4fc0811a7be0453d19bf76d26eb1cad52f5e5f3215cfec36bb50be391f009dc6f95955b226e1756ae42e71dce127f1c345dac1192d3c2157a40a78e68a9b2208b7618dd9ef242db170cb0fef2ed22b0aaeeba7a5ec45ff627e97b9848f6158af2580af5e3d4c6c763a1d714a0b1cdd73a2426e14d6b23ba6f1f8fba6727e7f7e72d33ecbbea44d4a6f987d06c45472a89f32680a7e2b0dfe5a4e14398ef5723b601f82c728cc76c1f95dcd935b9ccef0439afe0596983f0a690e6e5f2c27a560fd1d50010b864eddb1ad14b61d79e5fd212509140de31ee21b18da47d38fb8669c32000e31233fcde17ed98ba6042c3be13244b3d47ff62c00db8b7a7dd40b2821a91169c6a5df35fdf3944b2ca824cc688027aed1affd5ee4d99080f70b0c7f90ac2c41e4f5200b3086169103b48446b9bf3b542e4bb64009ec001fb2ef79ccf09d68902158a60f4c391e653a0ab235bf54e1a1436fd72c8e435a98649c80c3e8fb59113c8a227ef8e505c54ecc3f91207e5af605a218ba151e811cf98611c03194527aae0d9440e6ca6df024197d67f6d00bb3c68b657cee2c0601185e54112aeb0500c8233cc7dd0373e12ef669e759b080299c97e94383baf899e4296bbe638f51248a00dd2f49898900a8080a770fdf3d67d8b724ab6359f581720913d8519f6528c50acef1a5c9b5e919c37e644bc73e5dc4be277d28a168354d19fae10a219cee79f09261d392134c6c46ba3a431543cbd92f193294d65f886070bf7bcab0b42f97be94e13079eedfcac72c6f64c8b0b84a8c8aaf5229198e946b6339ff4e9e7b070c1d875bf8f8c388e18a394d7a3d58caf0833313b603e9bca74b0d283dbd5b65ec0025ed9e0313862b09a98998a60c83673acca86cbd3f81ff49361864e80485a033fc8c7163af6b72ff7ec53ab4336d314d2d7e17cba81d7f0e3bc9f8b38bc8324c31fec476340e90e7ad9ae21570acee7986c4f30eb0a7197d8e27bde8312c047817a74a495b8aae572befc1371c84481da62e5a036f341fba1ec3c488c07d6cff4a1ed54c854aebbc64d0ac01f3f78242e917dc48f170de8936c3421752acbfa6493dadadb8f2c9825e01919b668d5fa1ab1977179de8332cf4801c44a94dacde1743ec3052a774e57a5098f825aee9f4830cc5c9a1fa081885e869d9890143e813d9fb939f1e6f4e2a0c606c53a91eae02189ef8f7dc8b4e6e26d993008c7aee579a3244fe5c5d94c24a01afb4bac5d5002f1ac9fca22610526f98f9c9846133dbcb3c12e1716858dea401e9b79350c4979d7c138685a7ecc351b720c6b619025be13c657f326238c88ae9c489fda73004e18207a4cb88613f6b309caf7f10c3af2c8d18e40d8d1836b39e91fdf20f6208065d063ad08821f0fdec5f32863adf403483f4f80578346538681386256d8646d5be7a90d67741862065b22186da45f7fa9094f8ef82a171d9b012f243811d303c5eab0283813cc6dc01c3c2636dbd220c08bf26afedda05c3b4dc958f3bcc1186a78a64dd4e18160a677707f9e04e79596d470cb7881f863f0ce7f861b83bfc30fc6138c70fc3dde187e10fc3397e18ee0e3f0c7f18cef1c37077d83cc3a0d9791d8f5f3bcdcd7f902379d5783018c3576d9861f0317ab1cb71bd1e97ed97d187ec5c715d3406bd17277953f22ee765b42cb0df28c3cec8f2968553b653b7469dc266d0e95975f8aa5e67e30c9bbd3fa4e2d1f9d3dbc43a26af2225684e79faaacd317cf3d892dcc819e67d63ae3474d85739dedb0619967ac29aeafacb6bae04fb2fc2cae57aafb42186fba51749b9a3531fe5a757831177bf608ee81b9662e4c7f05b5e891a45b25a06130c78015d8ef265230c2d5b55726cc55ff89acd2ae8fc25a591187028b931d4801375d7d6385d472e2a14db6468599e355e8bdfeba7bab4394786057386961d3fadee00347b4a01e518823e36ce3015d5558de39125d7301b6028e5e179dc8db714defe2ac6b1ff4d0bcca7c34c6f4dcad6760d86ff12f5eb385fc38f8fe1bb80a36deec705a33f82bebce7afdbdbbfcf02fac903ff5a83614fb048f1dc03ee3fd5f91747d69b11c101a92c9fc1fbf536195330de173ce1f4d66038e43b8d33d58e63c1deb1eb5ffa1aa7299a28a7dc5d8ca8d4e3d52ca8bd34653866fd50d86530aaf32bed78b26a463091021368d7bfc12cf5d8c98ca17d523184653a01c7d0f94603ec7f0bbc6474175780ce8bc09f8fac23f8247389c49a5e94c8a00118be240c5f0043a4203857d4a3eee7917011ba4a777c28d25631d556478c9ce2096f6286f0de53843ac5b71a98399b76fb54e63792b72f5fc6e6bbc087f13e198bd364561b57f63641716d5a320a0b819176e853f9b33fd9a18e05ee96f367c83e3fc5a06cb687990b877534851d523e0ccb6dd1e35086a78d0475a6c1ad40dce227916d0c46fc0e14eb613a9c891c66d12785cdb759ce752c1af4fea5fd1fc178138dc30f38fae425b5b3cf2f7be4086d2975413c2c22e0ae49745b405b8d689126dd889ee8f5c2abf1b6c70d79ccaba744c388eb2e69f75873c0e2f4c92605fa69c21960443af524f151a3c79bee986ec6233e8c90fab4542d4caef20000999c7c32e11594ab3fe106547d494bda0b635ef4623c755d56a2152134f52263b2c781e68cd3e9ea64e7c57e27bdded24594ba9c4197d58f88224bd08ee59ede2b1d0a91b9c2775634bcb43f703306dc209a8d986a68ef43368e42870d83e2acfe670946b63c95d52123b12d629bd10df6944e0990c6d6a5c07e73a12cb3710541289bd98b470c41c71bc9bfd83da69f17606e2a81ad6a7f4f641e08ae7744da700e6f5d68e3a660d3110b17f99521585745cd5dda63d4a38f01f336532bf00e11d14dac9c0a6ddc02af16b5a433cddea48be1c48acc07e7dd31328a2e26ce3c3a6022ed67e64d1d665fd9526f2c41e996188ee9c7194af4431cdebb2225308ea9f6b23d462d9540f83173603aa071cc69b30fce02c44f8a2fdd8fc9874726de26bd66ae0a24835b4e31b1fa0e7e6bc7999101b4b98dc8ab062b7a56486a87241e12bf977c69c4761429d60e7b5e12f303cd3e6a3fcffe17d851875ac4494b2eb168d715921abc238ace7e017faec3b114d98e37d6a32fb304612cb8502a1fc01cfce1b7c480cd75c53d4584fb8529fec2049fe55b908f3f6cc12950f34ff6a9fa5c8e1b607d78314d0ccd273795d12ff90a0498229a2715413efe70449a1c26019697da60228317d3546173e918c7913b22015e34c8d7914fd0808d3fea42d50b857419c9c2a4218ef397e87281834d9c6a88a630959bceb25c5731567e92fc113d0fe2fb6ce8089c6f26825a80eaff143109486023f1e7c6149a8add82d1b3d8f98151427db95425b0b8938fd108c04b2a13fd81f78a0ecc68ac06c0eaefec17e430824fe17643df169045475d26a9c6ba4f9917b3694e36905135b3a593f926fe0e01945ffb53e623be32921acbbde6319f311669ed19983c5f244d3197c012227df2053d37a97a6c7e9157937410c217b77ded7d79239a045358df01f4d8602a021afd85b723005171d2ef2d24e8b33b4ae1ace16cb423cf2d20ef9324d5607583427e0aafc84ca99e8731a8de12e235f4f615de1db4f6b62ded4ea13a524905cfe344320113f3cab7420147eb1e13b80234a0bb44364e038a84fa602c6bfd4569f02568ee5c6693a6c8ea5295e75420415944423b9452e3a24b88d7456196fd5ff5211a511b12bf628eb7851bed29bcdf421aa5abba6fc29da25e9642e32b76ecc4b3f45461e264004ca4a844379e1428384cce9000250ef031610ab4880a3f658271efd9b2def15797052380626aefeb54a4bcf69ee3b2f3a431194368c15809418ba835c985a0a95b73812690cb78b12f107f803c0b9c38e096906c55476b96b53146ba5f9e543604fecea740519650558e523f1b017ebb2aebf7e700f48540620be77843468bcff5ac0a34cb79768df364b1d0f9c1ee6339cfca66f885b53cafa760774272388655ba2ac7600498d163f2f1aba2834b7b65a3c676d991477046008eb4ca5537401367c8e4810e4eb83bbf72fb0baec03156baeada6890f4a4dc57211fa0777ee55581bf198634955756259809c5cf9c0475230c9bcf98a0588fce410e0b9de77cd4cd2618760841ee481121209f0177ec5c8cc60618beda64acfb1a9baa49d2be7c398c29f267f84673cdecd92001178fe770e3276f8625265fac4afd2cc642d378ca248946aff932e48e6ceadabd32b5208ebdaea4e6cbf08d6c4154cfa2c08829ba94a5d3759027c3802bf5a81bc5425cd17864ad756f2b47867daeb0bf6ee8eaf69844bcb2a2408afc180eb9f33ab3154cc19e6c792fab3b387931e4eba6e315c275b6c2c3513b4522e4c470c0de2e559cd20a30644b4595b50922e4c25050b7a03a1912e1833d9f5656d1089007c33efbd79d6ce67e84263aeca1b6e41c5d861c18b22a465d902343f0c41e50d7bf5750386b336cbef37794feae17a4f39bd151d4ba725897e18017289ddcbc1c7df66e9aed8d4cf3c5eb312c8d78a560e7707bbcc497df1b7b386b31ecf0f35c5f55b1230c182fd75c3ed66138646f2e38e29b27a6e8b0553456fdcb44e1acce90298d98bcfe3dcf9301ae8a2695540335b632c3262fa1e5fc52ae13b0eebce27209c4ca0cdfd99a48559db939022666642f2f88b02a43a670680ddf510acee73570085765c8fcf5426775374d8ee6377999ee516e6175862332afebc4702a74b1d975fea7dd765586ff430cd78bc395c0cebda27e328b9c18ae1ada6823809f8ada02435830b6191503f1e6ec90a193ebc1bb009d2d3304529ae7a1b41090e19635cd0fc35cb02ac337c0503f2ad83e43701b51a3c2700e70a4a5280ccf225b2ea6ac7bcd0759e56630d212580bfd916667c640b1ad83cef2f694f0061187cc5f3655dd7903c8c4167f366cede7580cd5b18d1cc445e5b467107425eef022c5b07ed64917475e7a93d789d595bb00416f7253df291bfa259dfdf48eac1d19adfc9a6876f72deb6b605c9ed91f3ddbcf23e3c287d2e0cbb2f6bbab4514ff07bbe1d859557bec560000000049454e44ae426082, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`id`, `amount`, `description`, `invoice_number`, `source`, `invoice_date`, `created_at`, `updated_at`) VALUES
(1, 500000.00, 'x', '00012', 'y company', '2024-10-08', '2024-10-05 08:22:16', '2024-10-05 08:22:16'),
(2, 100.00, 'sa\'ed\'s salary', '10002', 'clarita media', '2024-10-23', '2024-10-22 06:53:31', '2024-10-22 06:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OG6WE1Dr37Y5X5LZPOqTVSLrRiRtuPxEQgWPyv91', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGpUbzFJMDZMMDZPUURyRDhHQjJGZUhoOFhvOVVubHc5OElBM3NESyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYXltZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729591972),
('oSyu1ZWP8qkD1POzQkAIIKdoVzu7pCpcrwWB3OBM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU52TFJtUkxZcTlxQU4zZXlrTzB3aTdMSzV6QUE3cVVSOW5sT01ycCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729590375);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
