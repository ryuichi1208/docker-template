<?php
$filename = '/path/to/foo.txt';

if (file_exists($filename)) {
    echo "$filename が存在します";
} else {
    echo "$filename は存在しません";
}
?>
