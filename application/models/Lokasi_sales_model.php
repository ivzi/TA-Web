<?php

class Lokasi_sales_model extends CI_Model
{
    public function updatelokasi($kode = null, $i_latitude = null, $i_longitude = null)
    {
        if ($kode != null && $i_latitude != null && $i_longitude != null){
            $data = array(
                'latitude' => $i_latitude,
                'longitude' => $i_longitude
            );
            $this->db->where('kode_sales', $kode);
            return $this->db->update('sales', $data);
        }
    }

    public function updatelog($kode = null, $i_tgl = null, $i_waktu = null, $i_latitude = null, $i_longitude = null)
    {
        if ($kode != null  && $i_tgl != null && $i_waktu != null && $i_latitude != null && $i_longitude != null){
            $this->db->select_max('nomor');
            $query = $this->db->get('log');
            $nomor = "";
            foreach ($query->result() as $row) {
                $nomor = $row->nomor + 1;
            }

            $data = array(
                'nomor' => $nomor,
                'kode_sales' => $kode,
                'tanggal' => $i_tgl,
                'waktu' => $i_waktu,
                'latitude' => $i_latitude,
                'longitude' => $i_longitude                
            );
            return $this->db->insert('log', $data);
        }
    }
}