<?php 
  # POST parameters:
  # wmode: (register|delete|edit)
  # world(register)regname: <name of world>
  # world(delete)regname: <name of world>
  # world(edit)regname: <new name>
  # world(edit)regold: <old world name>
  # world()auth: <world authcode>
  # pcmode: (register|delete|getcoords|setcoords|edit)
  # pc(register)pcid: <pc id>
  # pc(register)pclabel: <pc label>
  # pc(delete)pcid: <pc id>
  # pc(getcoords)pcid: <pc id>
  # pc(setcoords)pcx: <x>
  # pc(setcoords)pcy: <y>
  # pc(setcoords)pcz: <z>
  # pc(edit)pcid: <new pc id>
  # pc(edit)pclabel: <new pc label>

  # Error codes:
  # 10x New World
  # 100 Connection failed
  # 101 Query failed
  # 102 Fail to add to metatable
  # 11x Remove World
  # 110 Connection failed
  # 111 Query failed
  # 12x Edit World
  # 120 Connection failed
  # 121 Query failed
  # 20x New PC
  # 200 Connection failed
  # 201 Query failed
  # 21x Remove PC
  # 210 Connection failed
  # 211 Query failed
  # 22x Edit PC
  # 220 Connection failed
  # 221 Query failed
  # 23x Get Coords
  # 230 Connection failed
  # 231 Query failed
  # 24x Set Coords
  # 240 Connection failed
  # 241 Query failed
  # 30x Meta authentication
  # 301 Connection failed
  # 302 Query failed
  # 40x Parameter lack
  # 400 No auth parameter
  # 401 No mode
  # 402 No world
  # 403 Missing ID
  # 404 Missing Label
  # 405 Missing x/y/z
  # 406 Mode not found
  # 407 No old
  # 408 No new

  $sqlserver = "sql207.bytecluster.com";
  $sqluser = "rfgd_18650414";
  $sqlpw = "Sanpedro4563";
  $sqldb = "rfgd_18650854_omps";

  function newWorld($name) {
    $conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 100, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
    $query = "CREATE TABLE " . $name . " (
id INT(6) UNSIGNED PRIMARY KEY,
label VARCHAR(50) NOT NULL,
x INT(20) NOT NULL,
y INT(20) NOT NULL,
z INT(3) NOT NULL
)";
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 101, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $wauth = hash("sha256", $name)
    $query = "INSERT INTO meta (wname, wauth)
VALUES (" . $name . ", " . $wauth . ")";
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 102, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    $eco = ('ok' => true, 'authkey' => $wauth)
    echo(json_encode($eco); die()
  }
  function remWorld($name) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 110, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
    $query = "DROP TABLE " . $name;
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 111, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $eco = ('ok' => true)
    echo(json_encode($eco); die()
  }
  function editWorld($old, $name) {
    $conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 120, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
	$query = "RENAME TABLE `" . $old . "` TO `" . $name . "`";
	if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 121, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $eco = ('ok' => true)
    echo(json_encode($eco); die()
  }

  function newPc($world, $pcid, $label, $ipcx, $ipcy, $ipcz) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 200, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
    $query = "INSERT INTO " . $name ." (id, label, x, y, z)
VALUES ('" . $pcid . "', '" . $label . "', '" . $ipcx . "', '" . $ipcy . "', '" . $ipcz . "')";
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 201, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $eco = ('ok' => true)
    echo(json_encode($eco); die()
  }
  function remPc($world, $pcid) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 210, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
    $query = "DELETE FROM " . $world . "
WHERE id='" . $pcid . "'";
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 211, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $eco = ('ok' => true)
    echo(json_encode($eco); die()
  }
  function editPc($world, $oldid, $id, $label) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 220, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
  	$query = "UPDATE " . $world . "
SET id='" id. $ ."', label='" . $label . "'
WHERE id='" . $oldid . "'";
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 221, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $eco = ('ok' => true)
    echo(json_encode($eco); die()
  }
  function getCoords($world, $pcid) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 230, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
    $query = "SELECT id, x, y, z FROM " . $world
    $res = mysqli_query($conn, $query)
    if (mysqli_num_rows($result) == 0) {
      $eco = ('ok' => true, 'any' => false)
      echo(json_encode($eco); die()
    }
    while($row = mysqli_fetch_assoc($res)) {
        if ($row['id'] == $pcid) {
        	$eco = ('ok' => true, 'any' => true, 'x' => $row['x'], 'y' => $row['y'], 'z' => $row['z'])
        }
    }
    mysqli_close($conn);
    echo(json_encode($eco); die();
  }
  function setCoords($world, $pcid, $ipcx, $ipcy, $ipcz) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 240, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
  	$query = "UPDATE " . $world . "
SET x='" . $ipcx ."', y='" . $ipcy . "', z='" . $ipcz . "'
WHERE id='" . $pcid . "'";
    if (!mysqli_query($conn, $query)) {
      $eco = ('ok' => false, 'error_code' => 241, 'error' => 'Query failed : ' . mysqli_error($conn))
      echo(json_encode($eco); die()
    }
    mysqli_close($conn);
    $eco = ('ok' => true);
    echo(json_encode($eco); die();
  }

  function metaAuth($world, $wauth) {
  	$conn = mysqli_connect($sqlserver, $sqluser, $sqlpw, $sqldb);
    if (!$conn) {
      $eco = ('ok' => false, 'error_code' => 300, 'error' => 'Connection failed : ' . mysqli_connect_error())
      echo(json_encode($eco); die();
    }
    $query = "SELECT wname, wauth FROM meta"
    $res = mysqli_query($conn, $query)
    if (mysqli_num_rows($result) == 0) {
      $eco = ('ok' => true, 'any' => false)
      echo(json_encode($eco); die()
    }
    while($row = mysqli_fetch_assoc($res)) {
        if ($row['wname'] == $world) {
        	if ($row['wauth'] == $wauth) {
        		return ('ok' => true, 'oname' => $world, 'wkey' => $wauth)
        	} else {
        		$eco = ('ok' => false);
        		echo(json_encode($eco); die();
        	}
        } else {
        	$eco = ('ok' => false);
        	echo(json_encode($eco); die();
        }
    }
    mysqli_close($conn);
  }

  if ("" == trim($_POST['auth'])) {
  	$eco = ('ok' => false, 'error_code' => 400, 'error' => 'No auth key in post method');
  	echo(json_encode($eco); die();
  }
  $auth = $_POST['auth'];
  if("" == trim($_POST['wmode'])) {
  	if("" == trim($_POST['pcmode'])) {
  	  $eco = ('ok' => false, 'error_code' => 401, 'error' => 'No mode');
      echo(json_encode($eco); die();
  	} else {
  		$wmode = "nein";
  		$pcmode = $_POST['pcmode'];
  	}
  } else {
  	$wmode = $_POST['wmode'];
  	$pcmode = "nein";
  }
  if($wmode == "nein") {
  	if ("" == trim($_POST['world'])) {
  	  $eco = ('ok' => false, 'error_code' => 402, 'error' => 'No world in post method');
  	  echo(json_encode($eco); die();
  	}
  	$world = $_POST['world'];
	$auth = $_POST['auth'];
	if ("" == trim($_POST['id'])) {
  	  $eco = ('ok' => false, 'error_code' => 403, 'error' => 'No id in post method');
  	  echo(json_encode($eco); die();
  	}
  	$id = $_POST['id'];
  	if ("" == trim($_POST['label'])) {
  	  $label = "No Label";
  	}
  	$label = $_POST['label'];
  	$x = $_POST['x'];
  	$y = $_POST['y'];
  	$z = $_POST['z'];
  	if ("" == trim($_POST['x'])) {
  	  $x = 0;
  	}
  	if ("" == trim($_POST['y'])) {
  	  $y = 1;
  	}
  	if ("" == trim($_POST['z'])) {
  	  $z = 0;
  	}
	if($pcmode == "register") {
	  if(metaAuth($world, $auth)) {
	  	newPc($world,$id,$label,$x,$y,$z);
	  }
	} elseif($pcmode == "delete") {
	  if(metaAuth($world,$auth)) {
	  	remPc($world,$id);
	  }
	} elseif($pcmode == "getcoords") {
	  if(metaAuth($world, $auth)) {
	  	getCoords($world,$id);
	  }
	} elseif($pcmode == "setcoords") {
	  if(metaAuth($world,$auth)) {
	  	setCoords($world,$id,$x,$y,$z);
	  }
	} elseif($pcmode == "edit") {
	  if(metaAuth($world,$auth)) {
	  	editPc($world,$id,$id,$label);
	  }
	} else {
	  $eco = ('ok' => false, 'error_code' => 406, 'error' => 'PC Mode not found');
	  echo(json_encode($eco); die();
	}
  } else {
  	$name = $_POST['name'];
  	$old = $_POST['old'];
  	$new = $_POST['new'];
  	if("" == trim($_POST['name'])) {
  	  $eco = ('ok' => false, 'error_code' => 404, 'error' => 'No world name on post method');
	  echo(json_encode($eco); die();
  	}
  	if("" == trim($_POST['old'])) {
  	  $old = $name
  	}
  	if("" == trim($_POST['new'])) {
  	  $new = $old;
  	}
  	if($wmode == "register") {
	  newWorld($name);
	} elseif($wmode == "delete") {
	  if(metaAuth($name,$auth)) {
	  	remWorld($name);
	  }
	} elseif($wmode == "edit") {
	  if(metaAuth($name,$auth)) {
	  	editWorld($name,$old,$new);
	  }
	} else {
	  $eco = ('ok' => false, 'error_code' => 406, 'error' => 'World Mode not found')
	  echo(json_encode($eco); die()
	}
  }
 ?>