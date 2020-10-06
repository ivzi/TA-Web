<?php

class Login_model extends CI_Model
{
    public function getuser($username = null, $password = null)
    {
        $query1 = $this->db->query(
            "select hak_akses
            from user
            where username = '$username' and password = '$password'"
            );
        $akses = "";
        foreach ($query1->result() as $row) {
            $akses = $row->hak_akses;
        }
        if ($akses == "1") {
            $query2 = $this->db->query(
                "select status
                from sales
                where username = '$username'"
                );
            $status = "";
            foreach ($query2->result() as $row) {
                $status = $row->status;
            }
            if ($status == 0) {
                $this->db->set('status', '1');
                $this->db->where('username', $username);
                $this->db->update('sales');
                return $this->db->query(
                    "select b.kode_sales, a.username, a.hak_akses, b.nama_depan, b.nama_belakang, b.email, b.foto
                    from user a
                    join sales b
                    on a.username = b.username
                    where a.username = '$username' and a.password = '$password'"
                    )->row();
            }
        } else {
            $query3 = $this->db->query(
                "select status
                from sales_admin
                where username = '$username'"
                );
            $status = "";
            foreach ($query3->result() as $row) {
                $status = $row->status;
            }
            if ($status == 0) {
                $this->db->set('status', '1');
                $this->db->where('username', $username);
                $this->db->update('sales_admin');
                return $this->db->query(
                    "select b.kode_sales_admin, a.username, a.hak_akses, b.nama_depan, b.nama_belakang, b.email, b.foto
                    from user a
                    join sales_admin b
                    on a.username = b.username
                    where a.username = '$username' and a.password = '$password'"
                    )->row();
            }
        }
    }

    public function logout($username = null)
    {
        $query = $this->db->query(
            "select hak_akses
            from user
            where username = '$username'"
            );
        $akses = "";
        foreach ($query->result() as $row) {
            $akses = $row->hak_akses;
        }
        if ($akses == "1") {
            $this->db->set('status', '0');
            $this->db->where('username', $username);
            $this->db->update('sales');
            return "ok";
        } else {
            $this->db->set('status', '0');
            $this->db->where('username', $username);
            $this->db->update('sales_admin');
            return "ok";
        }
    }
}