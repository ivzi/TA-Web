<?php

class Monitor_model extends CI_Model
{
    public function getLog($kode = null, $tgl = null)
    {
        if ($kode == null){
            return $this->db->get('log')->result_array();
        } else {
            return $this->db->query(
                "select a.nomor, a.kode_sales, a.tanggal, a.waktu, a.latitude, a.longitude, b.nama_depan, b.nama_belakang
                from log a 
                join sales b 
                on a.kode_sales = b.kode_sales
                where a.kode_sales = '$kode' and a.tanggal = '$tgl'")->result_array();
            // return $this->db->get_where('log', ['kode_sales' => $kode])->result_array();
        }
    }

    public function getLoc($k = null)
    {
        // return $k;
        return $this->db->query(
            "select c.kode_sales, c.nama_depan, c.nama_belakang, c.foto, c.latitude, c.longitude 
            from monitor a 
            join sales_admin b 
            on a.kode_sales_admin = b.kode_sales_admin
            join sales c
            on a.kode_sales = c.kode_sales
            where a.kode_sales_admin = '$k'")->result_array();
    }
}