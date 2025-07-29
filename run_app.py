import queue_system

if __name__ == "__main__":
    queue_system.serve(queue_system.app, host=queue_system.HOST, port=queue_system.PORT, threads=4, url_scheme='http')