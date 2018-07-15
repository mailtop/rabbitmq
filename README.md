# RabbitMQ + Management + Prometheus.io exporter

[![](https://images.microbadger.com/badges/version/mailtop/rabbitmq.svg)](https://microbadger.com/images/mailtop/rabbitmq "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/mailtop/rabbitmq.svg)](https://microbadger.com/images/mailtop/rabbitmq "Get your own image badge on microbadger.com")

* [RabbitMQ + Management](https://hub.docker.com/r/library/rabbitmq/)
* [Prometheus.io exporter](https://github.com/deadtrickster/prometheus_rabbitmq_exporter)
* [Grafana Dashboard](https://github.com/deadtrickster/prometheus_rabbitmq_exporter/tree/master/priv/dashboards)

![rabbitmq prometheus exporter grafana dashboard](http://i.imgur.com/tWiDw56.png?1)

## Como compilar a imagem

```bash
make docker
docker push mailtop/rabbitmq:latest
docker push mailtop/rabbitmq:3.7.7
```

## Métricas

### Específicas do RabbitMQ

* `rabbitmq_connections`<br />
Type: gauge.<br />
RabbitMQ Connections count.

* `rabbitmq_channels`<br />
Type: gauge.<br />
RabbitMQ Channels count.

* `rabbitmq_queues`<br />
Type: gauge.<br />
RabbitMQ Queues count.

* `rabbitmq_exchanges`<br />
Type: gauge.<br />
RabbitMQ Exchanges count.

* `rabbitmq_consumers`<br />
Type: gauge.<br />
RabbitMQ Consumers count.

* `rabbitmq_queues_disk_reads`<br />
Type: counter.<br />
Total number of times messages have been read from disk by all queues.

* `rabbitmq_queues_disk_writes`<br />
Type: counter.<br />
Total number of times messages have been written to disk by all queues.

* `rabbitmq_messages_ready`<br />
Type: gauge.<br />
Messages ready for delivery.

* `rabbitmq_messages_unacknowledged`<br />
Type: gauge.<br />
Delivered but unacknowledged messages.

* `rabbitmq_messages_published_total`<br />
Type: counter.<br />
Count of messages published.

* `rabbitmq_messages_confirmed_total`<br />
Type: counter.<br />
Count of messages confirmed.

* `rabbitmq_messages_delivered_total`<br />
Type: counter.<br />
Count of messages delivered in acknowledgement mode to consumers.

* `rabbitmq_messages_delivered_no_ack_total`<br />
Type: counter.<br />
Count of messages delivered in no-acknowledgement mode to consumers.

* `rabbitmq_messages_get_total`<br />
Type: counter.<br />
Count of messages delivered in acknowledgement mode in response to basic.get.

* `rabbitmq_messages_get_no_ack_total`<br />
Type: counter.<br />
Count of messages delivered in no-acknowledgement mode in response to basic.get.

* `rabbitmq_messages_deliver_get_total`<br />
Type: counter.<br />
Sum of messages_delivered_total, messages_delivered_no_ack_total, messages_get_total and messages_get_no_ack_total.

* `rabbitmq_messages_redelivered_total`<br />
Type: counter.<br />
Count of subset of delivered messages which had the redelivered flag set.

* `rabbitmq_messages_returned_total`<br />
Type: counter.<br />
Count of messages returned to publisher as unroutable.

#### Queues

Labels: `vhost`, `queue`.

* `rabbitmq_queue_durable`<br />
Type: boolean.<br />
Whether or not the queue survives server restarts.

* `rabbitmq_queue_auto_delete`<br />
Type: boolean.<br />
Whether the queue will be deleted automatically when no longer used.

* `rabbitmq_queue_exclusive`<br />
Type: boolean.<br />
True if queue is exclusive (i.e. has owner_pid), false otherwise.

* `rabbitmq_queue_messages_ready`<br />
Type: gauge.<br />
Number of messages ready to be delivered to clients.

* `rabbitmq_queue_messages_unacknowledged`<br />
Type: gauge.<br />
Number of messages delivered to client but not yet acknowledged.

* `rabbitmq_queue_messages`<br />
Type: gauge.<br />
Sum of ready and unacknowledged messages (queue depth).

* `rabbitmq_queue_messages_ready_ram`<br />
Type: gauge.<br />
Number of messages from messages_ready which are resident in ram.

* `rabbitmq_queue_messages_unacknowledged_ram`<br />
Type: gauge.<br />
Number of messages from messages_unacknowledged which are resident in ram.

* `rabbitmq_queue_messages_ram`<br />
Type: gauge.<br />
Total number of messages which are resident in ram.

* `rabbitmq_queue_messages_persistent`<br />
Type: gauge.<br />
Total number of persisted messages in the queue (will always be 0 for transient queues).

* `rabbitmq_queue_message_bytes`<br />
Type: gauge.<br />
Sum of the size of all message bodies in the queue. This does not include the message properties (including headers) or any overhead.

* `rabbitmq_queue_message_bytes_ready`<br />
Type: gauge.<br />
Like message_bytes but counting only those messages ready to be delivered to clients.

* `rabbitmq_queue_message_bytes_unacknowledged`<br />
Type: gauge.<br />
Like message_bytes but counting only those messages delivered to clients but not yet acknowledged.

* `rabbitmq_queue_message_bytes_ram`<br />
Type: gauge.<br />
Like message_bytes but counting only those messages which are in RAM.

* `rabbitmq_queue_message_bytes_persistent`<br />
Type: gauge.<br />
Like message_bytes but counting only those messages which are persistent.

* `rabbitmq_queue_head_message_timestamp`<br />
Type: gauge.<br />
The timestamp property of the first message in the queue, if present. Timestamps of messages only appear when they are in the paged-in state.

* `rabbitmq_queue_disk_reads`<br />
Type: counter.<br />
Total number of times messages have been read from disk by this queue since it started.

* `rabbitmq_queue_disk_writes`<br />
Type: counter.<br />
Total number of times messages have been written to disk by this queue since it started.

* `rabbitmq_queue_disk_size_bytes`<br />
Type: gauge.<br />
Disk space occupied by the queue.

* `rabbitmq_queue_consumers`<br />
Type: gauge.<br />
Number of consumers.

* `rabbitmq_queue_consumer_utilisation`<br />
Type: gauge.<br />
Fraction of the time (between 0.0 and 1.0) that the queue is able to immediately deliver messages to consumers. This can be less than 1.0 if consumers are limited by network congestion or prefetch count.

* `rabbitmq_queue_memory`<br />
Type: gauge.<br />
Bytes of memory consumed by the Erlang process associated with the queue, including stack, heap and internal structures.

* `rabbitmq_queue_state`<br />
Type: gauge.<br />
The state of the queue. NaN if queue is located on cluster nodes that are currently down. 0 if queue is running normally. MsgCount if queue is synchronising.

* `rabbitmq_queue_messages_published_total`<br />
Type: counter.<br />
Count of messages published.

* `rabbitmq_queue_messages_confirmed_total`<br />
Type: counter.<br />
Count of messages confirmed.

* `rabbitmq_queue_messages_delivered_total`<br />
Type: counter.<br />
Count of messages delivered in acknowledgement mode to consumers.

* `rabbitmq_queue_messages_delivered_no_ack_total`<br />
Type: counter.<br />
Count of messages delivered in no-acknowledgement mode to consumers.

* `rabbitmq_queue_messages_get_total`<br />
Type: counter.<br />
Count of messages delivered in acknowledgement mode in response to basic.get.

* `rabbitmq_queue_messages_get_no_ack_total`<br />
Type: counter.<br />
Count of messages delivered in no-acknowledgement mode in response to basic.get.

* `rabbitmq_queue_messages_deliver_get_total`<br />
Type: counter.<br />
Sum of messages_delivered_total, messages_delivered_no_ack_total, messages_get_total and messages_get_no_ack_total.

* `rabbitmq_queue_messages_redelivered_total`<br />
Type: counter.<br />
Count of subset of delivered messages which had the redelivered flag set.

* `rabbitmq_queue_messages_returned_total`<br />
Type: counter.<br />
Count of messages returned to publisher as unroutable.

#### Exchanges

Labels: `vhost`, `exchange`.

* `rabbitmq_exchange_messages_published_total`<br />
Type: counter.<br />
Count of messages published.

* `rabbitmq_exchange_messages_published_in_total`<br />
Type: counter.<br />
Count of messages published \"in\" to an exchange, i.e. not taking account of routing.

* `rabbitmq_exchange_messages_published_out_total`<br />
Type: counter.<br />
Count of messages published \"out\" of an exchange, i.e. taking account of routing.

* `rabbitmq_exchange_messages_confirmed_total`<br />
Type: counter.<br />
Count of messages confirmed.

* `rabbitmq_exchange_messages_delivered_total`<br />
Type: counter.<br />
Count of messages delivered in acknowledgement mode to consumers.

* `rabbitmq_exchange_messages_delivered_no_ack_total`<br />
Type: counter.<br />
Count of messages delivered in no-acknowledgement mode to consumers.

* `rabbitmq_exchange_messages_get_total`<br />
Type: counter.<br />
Count of messages delivered in acknowledgement mode in response to basic.get.

* `rabbitmq_exchange_messages_get_no_ack_total`<br />
Type: counter.<br />
Count of messages delivered in no-acknowledgement mode in response to basic.get.

* `rabbitmq_exchange_messages_deliver_get_total`<br />
Type: counter.<br />
Sum of *messages_delivered_total, *messages_delivered_no_ack_total, *messages_get_total and *messages_get_no_ack_total.

* `rabbitmq_exchange_messages_redelivered_total`<br />
Type: counter.<br />
Count of subset of delivered messages which had the redelivered flag set.

* `rabbitmq_exchange_messages_returned_total`<br />
Type: counter.<br />
Count of messages returned to publisher as unroutable.

#### Tabelas do Mnesia

Várias métricas das tabelas do Mnesia, específicos do RabbitMQ.

Labels: `table`.

* `rabbitmq_mnesia_table_read_only`<br />
Type: boolean.<br />
Access mode of the table, 1 if table is read_only or 0 otherwise.

* `rabbitmq_mnesia_table_disc_copies`<br />
Type: gauge.<br />
Number of the nodes where a disc_copy of the table resides according to the schema.

* `rabbitmq_mnesia_table_disc_only_copies`<br />
Type: gauge.<br />
Number of the nodes where a disc_only_copy of the table resides according to the schema.

* `rabbitmq_mnesia_table_local_content`<br />
Type: boolean.<br />
If the table is configured to have locally unique content on each node, value is 1 or 0 otherwise.

* `rabbitmq_mnesia_table_majority_required`<br />
Type: boolean.<br />
If 1, a majority of the table replicas must be available for an update to succeed.

* `rabbitmq_mnesia_table_master_nodes`<br />
Type: gauge.<br />
Number of the master nodes of a table.

* `rabbitmq_mnesia_table_memory_bytes`<br />
Type: gauge.<br />
The number of bytes allocated to the table on this node.

* `rabbitmq_mnesia_table_ram_copies`<br />
Type: gauge.<br />
Number of the nodes where a ram_copy of the table resides according to the schema.

* `rabbitmq_mnesia_table_records_count`<br />
Type: gauge.<br />
Number of records inserted in the table.

* `rabbitmq_mnesia_table_disk_size_bytes`<br />
Type: gauge.<br />
Disk space occupied by the table (DCL + DCD).

#### Nodes

Cluster/nodes metrics.

* `rabbitmq_node_up`<br />
Type: boolean.<br />
Labels: name, type.<br />
Node running status.

### Métricas do Erlang VM & OTP

#### Informações do Sistema

* `erlang_vm_ets_limit`<br />
Type: gauge.<br />
The maximum number of ETS tables allowed.

* `erlang_vm_logical_processors`<br />
Type: gauge.<br />
The detected number of logical processors configured in the system.

* `erlang_vm_logical_processors_available`<br />
Type: gauge.<br />
The detected number of logical processors
available to the Erlang runtime system.

* `erlang_vm_logical_processors_online`<br />
Type: gauge.<br />
The detected number of logical processors online on the system.

* `erlang_vm_port_count`<br />
Type: gauge.<br />
The number of ports currently existing at the local node.

* `erlang_vm_port_limit`<br />
Type: gauge.<br />
The maximum number of simultaneously existing ports at the local node.

* `erlang_vm_process_count`<br />
Type: gauge.<br />
The number of processes currently existing at the local node.

* `erlang_vm_process_limit`<br />
Type: gauge.<br />
The maximum number of simultaneously existing processes
at the local node.

* `erlang_vm_schedulers`<br />
Type: gauge.<br />
The number of scheduler threads used by the emulator.

* `erlang_vm_schedulers_online`<br />
Type: gauge.<br />
The number of schedulers online.

* `erlang_vm_smp_support`<br />
Type: boolean.<br />
1 if the emulator has been compiled with SMP support, otherwise 0.

* `erlang_vm_threads`<br />
Type: boolean.<br />
1 if the emulator has been compiled with thread support, otherwise 0.

* `erlang_vm_thread_pool_size`<br />
Type: gauge.<br />
The number of async threads in the async thread pool
used for asynchronous driver calls.

* `erlang_vm_time_correction`<br />
Type: boolean.<br />
1 if time correction is enabled, otherwise 0.

#### Estatísticas

* `erlang_vm_statistics_bytes_output_total`<br />
Type: counter.<br />
The total number of bytes output to ports.

* `erlang_vm_statistics_bytes_received_total`<br />
Type: counter.<br />
The total number of bytes received through ports.

* `erlang_vm_statistics_context_switches`<br />
Type: counter.<br />
The total number of context switches since the system started.

* `erlang_vm_statistics_garbage_collection_number_of_gcs`<br />
Type: counter.<br />
The total number of garbage collections since the system started.

* `erlang_vm_statistics_garbage_collection_bytes_reclaimed`<br />
Type: counter.<br />
The total number of bytes reclaimed by GC since the system started.

* `erlang_vm_statistics_garbage_collection_words_reclaimed`<br />
Type: counter.<br />
The total number of words reclaimed by GC since the system started.

* `erlang_vm_statistics_reductions_total`<br />
Type: counter.<br />
Total reductions count.

* `erlang_vm_statistics_run_queues_length_total`<br />
Type: gauge.<br />
The total length of the run-queues. That is, the number of
processes and ports that are ready to run on all available run-queues.

* `erlang_vm_statistics_runtime_milliseconds`<br />
Type: counter.<br />
The sum of the runtime for all threads in the Erlang runtime system.

* `erlang_vm_statistics_wallclock_time_milliseconds`<br />
Type: counter.<br />
Can be used in the same manner as
`erlang_vm_statistics_runtime_milliseconds`, except that real time is
measured as opposed to runtime or CPU time.

#### Memória

* `erlang_vm_memory_atom_bytes_total{usage="free|used"}`<br />
Type: gauge.<br />
The total amount of memory currently allocated for atoms.
This memory is part of the memory presented as system memory.

* `erlang_vm_memory_bytes_total{kind="system|processes"}`<br />
Type: gauge.<br />
The total amount of memory currently allocated.
This is the same as the sum of the memory size for processes and system.

* `erlang_vm_dets_tables`<br />
Type: gauge.<br />
Erlang VM DETS Tables count.

* `erlang_vm_ets_tables`<br />
Type: gauge.<br />
Erlang VM ETS Tables count.

* `erlang_vm_memory_processes_bytes_total{usage="free|used"}`<br />
Type: gauge.<br />
The total amount of memory currently allocated for the Erlang processes.

* `erlang_vm_memory_system_bytes_total{usage="atom|binary|code|ets|other"}`<br />
Type: gauge.<br />
The total amount of memory currently allocated for the emulator
that is not directly related to any Erlang process.
Memory presented as processes is not included in this memory.

### Mnesia

* `erlang_mnesia_held_locks`<br />
Type: gauge.<br />
Number of held locks.

* `erlang_mnesia_lock_queue`<br />
Type: gauge.<br />
Number of transactions waiting for a lock.

* `erlang_mnesia_transaction_participants`<br />
Type: gauge.<br />
Number of participant transactions.

* `erlang_mnesia_transaction_coordinators`<br />
Type: gauge.<br />
Number of coordinator transactions.

* `erlang_mnesia_failed_transactions`<br />
Type: counter.<br />
Number of failed (i.e. aborted) transactions.

* `erlang_mnesia_committed_transactions`<br />
Type: gauge.<br />
Number of committed transactions.

* `erlang_mnesia_logged_transactions`<br />
Type: counter.<br />
Number of transactions logged.

* `erlang_mnesia_restarted_transactions`<br />
Type: counter.<br />
Total number of transaction restarts.

### Métricas de Processos

(Collector de informações de processos precisa ser habilitado)

* `process_open_fds`<br />
Type: gauge.<br />
Number of open file descriptors.

* `process_max_fds`<br />
Type: gauge.<br />
Maximum number of open file descriptors.

* `process_start_time_seconds`<br />
Type: gauge.<br />
Start time of the process since unix epoch in seconds.

* `process_uptime_seconds`<br />
Type: gauge.<br />
Process uptime in seconds.

* `process_threads_total`<br />
Type: gauge.<br />
Process threads count.

* `process_virtual_memory_bytes`<br />
Type: gauge.<br />
Virtual memory size in bytes.

* `process_resident_memory_bytes`<br />
Type: gauge.<br />
Resident memory size in bytes;

* `process_cpu_seconds_total{kind="utime|stime"}`<br />
Type: counter.<br />
Process CPU time.

### Métricas do Exporter

Labels: `registry`, `content_type`.

* `telemetry_scrape_duration_seconds`<br />
Type: summary.<br />
Scrape duration.

* `telemetry_scrape_size_bytes`<br />
Type: summary.<br />
Scrape size, uncompressed.

## Licença

MIT
