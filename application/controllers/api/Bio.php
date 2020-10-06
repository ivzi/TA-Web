<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Bio extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('bio_model', 'bio_m');
    }

    public function index_post()
    {
        $i_user = $this->post('username');
        if ($i_user === null){
            $data = $this->bio_m->getbio();
        } else {
            $data = $this->bio_m->getbio($i_user);
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