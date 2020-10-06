<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Login extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Login_model', 'lgn');
    }

    public function index_post()
    {
        $i_user = $this->post('username');
        $i_pass = md5($this->post('password'));
        if ($i_user === null){
            $data = $this->lgn->getuser();
        } else {
            $data = $this->lgn->getuser($i_user, $i_pass);
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

    public function logout_post()
    {
        $i_user = $this->post('username');
        if ($i_user === null){
            $data = $this->lgn->logout();
        } else {
            $data = $this->lgn->logout($i_user);
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