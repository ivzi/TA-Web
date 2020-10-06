/*
 Navicat Premium Data Transfer

 Source Server         : Happy Sales
 Source Server Type    : MySQL
 Source Server Version : 100413
 Source Host           : sql165.main-hosting.eu:3306
 Source Schema         : u592641212_happysales

 Target Server Type    : MySQL
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 07/10/2020 01:26:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absensi
-- ----------------------------
DROP TABLE IF EXISTS `absensi`;
CREATE TABLE `absensi`  (
  `nomor` int(11) NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `waktu` datetime(0) NOT NULL,
  `foto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`nomor`) USING BTREE,
  INDEX `kode_sales`(`kode_sales`) USING BTREE,
  CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `sales` (`kode_sales`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `kode_area` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `area` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_area`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for daftar_kunjungan
-- ----------------------------
DROP TABLE IF EXISTS `daftar_kunjungan`;
CREATE TABLE `daftar_kunjungan`  (
  `kode_kunjungan` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_lokasi` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_kunjungan`) USING BTREE,
  INDEX `kode_sales`(`kode_sales`) USING BTREE,
  INDEX `kode_lokasi`(`kode_lokasi`) USING BTREE,
  CONSTRAINT `daftar_kunjungan_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `sales` (`kode_sales`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `daftar_kunjungan_ibfk_2` FOREIGN KEY (`kode_lokasi`) REFERENCES `lokasi` (`kode_lokasi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_order
-- ----------------------------
DROP TABLE IF EXISTS `data_order`;
CREATE TABLE `data_order`  (
  `kode_order` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_order` datetime(0) NOT NULL,
  `total_harga` int(11) NOT NULL,
  PRIMARY KEY (`kode_order`) USING BTREE,
  INDEX `kode_sales`(`kode_sales`) USING BTREE,
  CONSTRAINT `data_order_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `sales` (`kode_sales`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for detail_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_order`;
CREATE TABLE `detail_order`  (
  `nomor` int(11) NOT NULL,
  `kode_order` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_produk` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  PRIMARY KEY (`nomor`) USING BTREE,
  INDEX `kode_order`(`kode_order`) USING BTREE,
  INDEX `kode_produk`(`kode_produk`) USING BTREE,
  CONSTRAINT `detail_order_ibfk_1` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_order_ibfk_2` FOREIGN KEY (`kode_order`) REFERENCES `data_order` (`kode_order`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kinerja_sales
-- ----------------------------
DROP TABLE IF EXISTS `kinerja_sales`;
CREATE TABLE `kinerja_sales`  (
  `kode_kinerja` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`kode_kinerja`) USING BTREE,
  INDEX `kode_sales`(`kode_sales`) USING BTREE,
  CONSTRAINT `kinerja_sales_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `sales` (`kode_sales`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for laporan_kunjungan
-- ----------------------------
DROP TABLE IF EXISTS `laporan_kunjungan`;
CREATE TABLE `laporan_kunjungan`  (
  `nomor` int(11) NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_kunjungan` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `waktu` datetime(0) NOT NULL,
  `keterangan` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`nomor`) USING BTREE,
  INDEX `kode_sales`(`kode_sales`) USING BTREE,
  INDEX `kode_kunjungan`(`kode_kunjungan`) USING BTREE,
  CONSTRAINT `laporan_kunjungan_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `sales` (`kode_sales`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `nomor` int(11) NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time(0) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`nomor`) USING BTREE,
  INDEX `kode_sales`(`kode_sales`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 'kds101', '0000-00-00', '00:00:00', -8.161338, 112.606565);
INSERT INTO `log` VALUES (2, 'kds101', '0000-00-00', '00:00:00', -8.161548, 112.606575);
INSERT INTO `log` VALUES (3, 'kds101', '0000-00-00', '00:00:00', -8.161758, 112.606585);
INSERT INTO `log` VALUES (4, 'kds101', '0000-00-00', '00:00:00', -8.161968, 112.606595);
INSERT INTO `log` VALUES (5, 'kds102', '0000-00-00', '00:00:00', -8.16409, 112.606565);
INSERT INTO `log` VALUES (6, 'kds101', '2020-09-25', '00:00:00', -8.1625174, 112.6036848);
INSERT INTO `log` VALUES (7, 'kds101', '2020-09-25', '00:00:00', -8.1702876, 112.5977938);
INSERT INTO `log` VALUES (8, 'kds101', '2020-09-25', '00:00:00', -8.1794642, 112.5951098);
INSERT INTO `log` VALUES (9, 'kds101', '2020-09-25', '00:00:00', -8.1813479, 112.5949311);
INSERT INTO `log` VALUES (10, 'kds101', '2020-09-25', '00:00:00', -8.1913479, 112.5949311);
INSERT INTO `log` VALUES (11, 'kds101', '2020-09-25', '00:00:00', -8.1953479, 112.5949311);
INSERT INTO `log` VALUES (12, 'kds101', '2020-09-25', '00:00:00', -8.1993479, 112.5949311);
INSERT INTO `log` VALUES (13, 'kds102', '2020-09-25', '00:00:00', -8.1813479, 112.5949311);
INSERT INTO `log` VALUES (14, 'kds102', '2020-09-26', '00:00:00', -8.1612902, 112.6045897);
INSERT INTO `log` VALUES (15, 'kds101', '2020-09-26', '00:00:00', -8.1612902, 112.6045897);
INSERT INTO `log` VALUES (16, 'kds101', '2020-09-26', '00:00:00', -8.1218561, 112.5914276);
INSERT INTO `log` VALUES (17, 'kds101', '2020-09-26', '00:00:00', -8.032805, 112.626642);

-- ----------------------------
-- Table structure for lokasi
-- ----------------------------
DROP TABLE IF EXISTS `lokasi`;
CREATE TABLE `lokasi`  (
  `kode_lokasi` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_area` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_lokasi` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`kode_lokasi`) USING BTREE,
  INDEX `kode_area`(`kode_area`) USING BTREE,
  CONSTRAINT `lokasi_ibfk_1` FOREIGN KEY (`kode_area`) REFERENCES `area` (`kode_area`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor
-- ----------------------------
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor`  (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `kode_sales_admin` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor
-- ----------------------------
INSERT INTO `monitor` VALUES (1, 'kda101', 'kds101');
INSERT INTO `monitor` VALUES (2, 'kda101', 'kds102');
INSERT INTO `monitor` VALUES (3, 'kda102', 'kds103');

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `kode_produk` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_produk` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kode_produk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `kode_sales` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_depan` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_belakang` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_daftar` date NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`kode_sales`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('kds101', 'irfan', 'Irfan', 'A', '085785334080', 'irfanzid11@gmail.com', 'Gondanglegi', '2020-04-01', 'assets/images/user.jpg', '0', -8.1622403, 112.6036055);
INSERT INTO `sales` VALUES ('kds102', 'zidni', 'Zidni', 'A', '085785334080', 'irfanzid11@gmail.com', 'Gondanglegi', '2020-04-02', 'assets/images/user.jpg', '0', -8.1631191, 112.6081321);
INSERT INTO `sales` VALUES ('kds103', 'A', 'A', 'A', '085785334080', 'irfanzid11@gmail.com', 'Gondanglegi', '2020-04-01', 'assets/images/user.jpg', '0', -8.16409, 112.606565);

-- ----------------------------
-- Table structure for sales_admin
-- ----------------------------
DROP TABLE IF EXISTS `sales_admin`;
CREATE TABLE `sales_admin`  (
  `kode_sales_admin` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_depan` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_belakang` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_daftar` date NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`kode_sales_admin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales_admin
-- ----------------------------
INSERT INTO `sales_admin` VALUES ('kda101', 'muhamad', 'Muhamad', 'A', '085785334080', 'irfanzid11@gmail.com', 'Gondanglegi', '2020-04-03', 'assets/images/user.jpg', '0', 0, 0);
INSERT INTO `sales_admin` VALUES ('kda102', 'A', 'A', 'A', '085785334080', 'irfanzid11@gmail.com', 'Gondanglegi', '2020-04-02', 'assets/images/user.jpg', '1', -8.16409, 112.606665);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hak_akses` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('irfan', '202cb962ac59075b964b07152d234b70', '1');
INSERT INTO `user` VALUES ('muhamad', '202cb962ac59075b964b07152d234b70', '2');
INSERT INTO `user` VALUES ('zidni', '202cb962ac59075b964b07152d234b70', '1');

SET FOREIGN_KEY_CHECKS = 1;
