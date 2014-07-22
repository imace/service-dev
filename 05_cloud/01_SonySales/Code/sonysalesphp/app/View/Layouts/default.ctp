<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
	<title>
		<?php echo $title_for_layout; ?>
	</title>
	<?php echo $this->Html->script('http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js');?>
	<?php echo $this->Html->script('relation.js');?>
	<?php echo $this->Html->script('http://lib.sinaapp.com/js/jquery-mobile/1.0.1/jquery.mobile-1.0.1.min.js');?>
	<?php echo $this->Html->css('common.css');?>
	<?php
		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body>
	<div id="container">
		<div id="content">

			<?php echo $this->Session->flash(); ?>

			<?php echo $this->fetch('content'); ?>
		</div>
	</div>
</body>
</html>