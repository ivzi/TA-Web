<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Monitor extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('monitor_model', 'monitor_m');
    }

    public function log_post()
    {
        $i_kode = $this->post('kode');
        $i_tgl = $this->post('tanggal');
        if ($i_kode === null){
            $data = $this->monitor_m->getLog($i_kode, $i_tgl);
        } else {
            $data = $this->monitor_m->getLog($i_kode, $i_tgl);
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

    public function loc_post()
    {
        $i_k = $this->post('kode');
        if ($i_k === null){
            $d = $this->monitor_m->getLoc($i_k);
        } else {
            $d = $this->monitor_m->getLoc($i_k);
        }

        if ($d) {
            $this->set_response([
                'status' => true,
                'data' => $d
            ], REST_Controller::HTTP_OK);
        } else {
            $this->set_response([
                'status' => false,
                'message' => 'user not found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }
}