<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * ============================================================================
 * 版权所有 2013-2018 余姚市一洋网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.163.com;
 * QQ: 57790081
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
*/

/**
* 
*/

class Liveapp extends MY_Controller{

	public function __construct() {
		parent::__construct();
		$this->load->model('Live_model','n');		
		$this->load->model('Category_model','cate');		
		$this->load->library('form_validation');
		if ($this->isAdmin() == false) redirect("admin/login"); 
	}
	
	public function index()
	{
		$this->tlist();
	}

	public function tlist()
	{

		$master_sdata = array('status'=>0);
		$sdata['func'] = 'live';
		$sdata['status'] = '1';
		$catename = $this->cate->L($sdata, 'cateid,catename');
		foreach ($catename as $k => $v) 
			$category[$v['cateid']] = $v['catename'];

		$list = $this->n->L($master_sdata, '*', $this->_p['pagenumb'], ($this->_p['pagecur'] == 0) ? 0 : ($this->_p['pagecur']-1) * $this->_p['pagenumb'], 'sort', 'asc');
		foreach ($list as $k => $v)
		{
			if (!empty($category[$v['cateid']]))
				$list[$k]['catename'] = $category[$v['cateid']];
			else
				$list[$k]['catename'] = '';
		}

		$this->_p['pagecount'] = $this->input->post('pagecount');
		if (empty($this->_p['pagecount'])) 
		{
			$this->_p['pagecount'] = $this->n->C($master_sdata);
		}
		$this->_d['page'] = eyPage($this->_p,$master_sdata);
		$this->_d['list'] = $list;
		$this->_d['pagecount'] = $this->_p['pagecount'];
		$this->load->view($this->_d['cfg']['tpl_admin'] . 'live/app_list', $this->_d);
	}

	public function add()
	{
		if (!$this->admin_priv('live_app'))
		{
			show_error("您没有权限进行此操作！");
		}
		if ($this->form_validation->run() == false)
		{
			if (validation_errors() != '')
			{
				$retmsg['code'] = '0';
				$retmsg['msg'] = validation_errors();
				exit(json_encode($retmsg));
			}

			$this->_data['row'] = $this->n->INIT();
			$this->_data['act'] = 'add';

			$catedata =  cate2list(0, $this->cate->getCateData('news','all'));
			$this->_data['catelist'] = array2option($catedata, '', 1);
			$this->load->view('admin/live/detail', $this->_data);
		}
		else
		{
			$postdata = $this->input->post();
			$postdata['ctime'] = time();

			if ($this->n->A($postdata) > 0)
			{
				$retmsg['code'] = '1';
				$retmsg['msg'] = $this->lang->line('comm_sucess_tip');
				exit(json_encode($retmsg));
			}
			else
			{
				$retmsg['code'] = '0';
				$retmsg['msg'] = $this->lang->line('comm_fail_tip');
				exit(json_encode($retmsg));
			}
		}
	}

	public function modi($id)
	{
		if (!$this->admin_priv('live_app'))
		{
			show_error("您没有权限进行此操作！");
		}
		$this->load->model('Userinfo_model','u');

		if ($this->form_validation->run('live/roomapp') == false)
		{
			if (validation_errors() != '')
			{
				$retmsg['code'] = '0';
				$retmsg['msg'] = validation_errors();
				exit(json_encode($retmsg));
			}

			$this->_d['row'] = $this->n->O(array('roomid'=>$id));
			$this->_d['act'] = 'modi';

			$catedata =  cate2list(0, $this->cate->getCateData('live','all'));		
			$this->_d['catelist'] = array2option($catedata, $this->_d['row']['cateid'], 1);
			$this->load->view($this->_d['cfg']['tpl_admin'] . 'live/app_detail', $this->_d);
		}
		else
		{
			$postdata = $this->input->post();
			$postdata['mtime'] = time();
			if ($this->n->M($postdata, array('roomid'=>$id)) === true)
			{
				if ($postdata['status'] == '1') $this->u->setMaster($postdata['userid'], $id);
				$retmsg['code'] = '1';
				$retmsg['msg'] = $this->lang->line('comm_sucess_tip');
				exit(json_encode($retmsg));
			}
			else
			{
				$retmsg['code'] = '0';
				$retmsg['msg'] = $this->lang->line('comm_fail_tip');
				exit(json_encode($retmsg));
			}
		}
	}

	public function del($id)
	{
		if (!$this->admin_priv('live_app'))
		{
			show_error("您没有权限进行此操作！");
		}
		if ($id == '') exit($this->lang->line('access_error'));
		$this->load->model('Livemaster_model','m');
		$sdata = array('roomid'=>$id);
		if ($this->m->C($sdata) == 0)
		{
//			$sdata['roomid'] = $id;
			$this->n->D($sdata);			
		}
	}
}

?>
