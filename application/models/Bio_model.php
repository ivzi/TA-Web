<?php

class Bio_model extends CI_Model
{
    public function getbio($username = null)
    {
        if ($username != null){
            $akses = $this->db->get_where('user', ['username' => $username])->row();
            if ($akses->hak_akses == 1) {
                return $this->db->get_where('sales', ['username' => $username])->row();
            } else {
                return $this->db->get_where('sales_admin', ['username' => $username])->row();
            }            
        }        
    }
}