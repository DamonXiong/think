<?php
namespace app\index\controller;
use think\Controller;

class Photograph extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}
