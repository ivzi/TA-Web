<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Lokasi_sales extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('lokasi_sales_model', 'ls_m');
    }

    public function live_post()
    {
        $i_kode = $this->post('kode');
        $i_latitude = $this->post('latitude');
        $i_longitude = $this->post('longitude');
        if ($i_kode === null){
            $data = $this->ls_m->updatelokasi();
        } else {
            $data = $this->ls_m->updatelokasi($i_kode, $i_latitude, $i_longitude);
        }

        if ($data) {
            $this->set_response([
                'status' => true,
                'data' => $data
            ], REST_Controller::HTTP_OK);
        } else {
            $this->set_response([
                'status' => false,
                'message' => 'user not found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function log_post()
    {
        $i_kode = $this->post('kode');
        $i_tgl = $this->post('tanggal');
        $i_waktu = $this->post('waktu');
        $i_latitude = $this->post('latitude');
        $i_longitude = $this->post('longitude');
        if ($i_kode === null){
            $data = $this->ls_m->updatelog();
        } else {
            $data = $this->ls_m->updatelog($i_kode, $i_tgl, $i_waktu, $i_latitude, $i_longitude);
        }

        if ($data) {
            $this->set_response([
                'status' => true,
                'data' => $data
            ], REST_Controller::HTTP_OK);
        } else {
            $this->set_response([
                'status' => false,
                'message' => 'user not found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }
}