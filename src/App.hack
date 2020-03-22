namespace DatabaseExample\App;

use type AsyncMysqlConnection;
use type AsyncMysqlClient;

async function connect_async(string $host, int $port, string $dbname, string $username, string $password):Awaitable<?AsyncMysqlConnection> {
    try {
        return await AsyncMysqlClient::connect(
            $host,
            $port,
            $dbname,
            $username,
            $password
        );
    } catch (\Exception $ex) {
        echo $ex;
        return null;
    }
}

async function get_user_id_from_name_async(string $name, AsyncMysqlConnection $conn) : Awaitable<int> {
    $result = await $conn->queryf(
    'SELECT user_id from users WHERE name = %s',
    $name,
    );
    if ($result->numRows() !== 1) {
        return -1;
    }
    $vector = $result->vectorRows();
    return (int) $vector[0][0];
}

<<__EntryPoint>>
async function main_async() : Awaitable<void> {
    $host = '127.0.0.1';
    $port = 3306;
    $dbname = "users";
    $username = "root";
    $password = "";
    $connection = await connect_async($host, $port, $dbname, $username, $password);
    invariant($connection !== null, "Connection should not be null");
    $user_id = await get_user_id_from_name_async("joe", $connection);
    print($user_id);
}
