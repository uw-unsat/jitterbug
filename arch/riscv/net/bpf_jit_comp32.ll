; ModuleID = '/home/lukenels/repo/linux/arch/riscv/net/bpf_jit_comp32.c'
source_filename = "/home/lukenels/repo/linux/arch/riscv/net/bpf_jit_comp32.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-linux-gnu"

%struct.bpf_insn = type { i8, i8, i16, i32 }
%struct.rv_jit_context = type { %struct.bpf_prog*, i32*, i32, i32, i32*, i32, i32 }
%struct.bpf_prog = type { i16, i16, i32, i32, i32, i32, [8 x i8], %struct.bpf_prog_aux*, %struct.sock_fprog_kern*, i32 (i8*, %struct.bpf_insn*)*, [0 x %struct.sock_filter], [0 x %struct.bpf_insn] }
%struct.bpf_prog_aux = type { %struct.atomic64_t, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.bpf_ctx_arg_aux*, %struct.bpf_prog*, i8, i8, i8, i8, i32, %struct.bpf_trampoline*, %struct.hlist_node, %struct.btf_type*, i8*, %struct.bpf_prog**, i8*, %struct.bpf_jit_poke_descriptor*, i32, %struct.bpf_ksym, %struct.bpf_prog_ops*, %struct.bpf_map**, %struct.bpf_prog*, %struct.user_struct*, i64, [2 x %struct.bpf_map*], [16 x i8], %struct.bpf_prog_offload*, %struct.btf*, %struct.bpf_func_info*, %struct.bpf_func_info_aux*, %struct.bpf_line_info*, i8**, i32, i32, i32, i32, %struct.exception_table_entry*, %struct.bpf_prog_stats*, %union.anon.128 }
%struct.atomic64_t = type { i64 }
%struct.bpf_ctx_arg_aux = type { i32, i32 }
%struct.bpf_trampoline = type { %struct.hlist_node, %struct.mutex, %struct.refcount_struct, i64, %struct.anon, %struct.bpf_prog*, [3 x %struct.hlist_head], [3 x i32], i8*, i64, %struct.bpf_ksym }
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.list_head, i8* }
%struct.atomic_t = type { i32 }
%struct.spinlock = type { %union.anon }
%union.anon = type { %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.arch_spinlock_t, i32, i32, i8* }
%struct.arch_spinlock_t = type { i32 }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.refcount_struct = type { %struct.atomic_t }
%struct.anon = type { %struct.btf_func_model, i8*, i8 }
%struct.btf_func_model = type { i8, i8, [12 x i8] }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.btf_type = type opaque
%struct.bpf_jit_poke_descriptor = type { i8*, %union.anon.0, i8, i8, i16 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { %struct.bpf_map*, i32 }
%struct.bpf_map = type { %struct.bpf_map_ops*, %struct.bpf_map*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.btf*, %struct.bpf_map_memory, [16 x i8], i32, i8, i8, [46 x i8], %struct.atomic64_t, %struct.atomic64_t, %struct.work_struct, %struct.mutex, i64, [56 x i8] }
%struct.bpf_map_ops = type { i32 (%union.bpf_attr*)*, %struct.bpf_map* (%union.bpf_attr*)*, void (%struct.bpf_map*, %struct.file*)*, void (%struct.bpf_map*)*, i32 (%struct.bpf_map*, i8*, i8*)*, void (%struct.bpf_map*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*)*, i8* (%struct.bpf_map*, %struct.file*, i32)*, void (i8*)*, i32 (%struct.bpf_map*, %struct.bpf_insn*)*, i32 (i8*)*, void (%struct.bpf_map*, i8*, %struct.seq_file*)*, i32 (%struct.bpf_map*, %struct.btf*, %struct.btf_type*, %struct.btf_type*)*, i32 (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, i32, %struct.bpf_prog*, %struct.bpf_prog*)*, i32 (%struct.bpf_map*, i64*, i32)*, i32 (%struct.bpf_map*, i64, i32*)*, i32 (%struct.bpf_map*, %struct.vm_area_struct*)*, i32 (%struct.bpf_map*, %struct.file*, %struct.poll_table_struct*)* }
%union.bpf_attr = type { %struct.anon.6 }
%struct.anon.6 = type { i32, i32, i64, i64, i32, i32, i64, i32, i32, [16 x i8], i32, i32, i32, i32, i64, i32, i32, i64, i32, i32, i32 }
%struct.file = type { %union.anon.21, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, i32, %struct.atomic_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, %struct.list_head, %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.21 = type { %struct.callback_head }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.vfsmount = type opaque
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [36 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i32, i8*, %union.anon.107, %struct.list_head, %struct.list_head, %union.anon.108 }
%struct.seqcount = type { i32 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.22, i8* }
%union.anon.22 = type { i64 }
%struct.lockref = type { %union.anon.105 }
%union.anon.105 = type { %struct.anon.106 }
%struct.anon.106 = type { %struct.spinlock, i32 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.path*, i1)*, %struct.dentry* (%struct.dentry*, %struct.inode*)*, [12 x i8] }
%struct.super_block = type { %struct.list_head, i32, i8, i32, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i32, i32, i32, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, %struct.xattr_handler**, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, i8*, i32, i64, i64, i32, %struct.fsnotify_mark_connector*, [32 x i8], %struct.uuid_t, i32, i32, %struct.mutex, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic_t, %struct.atomic_t, i32, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.user_namespace*, %struct.list_lru, %struct.list_lru, %struct.callback_head, %struct.work_struct, %struct.mutex, i32, [52 x i8], %struct.spinlock, %struct.list_head, %struct.spinlock, %struct.list_head, [16 x i8] }
%struct.file_system_type = type { i8*, i32, i32 (%struct.fs_context*)*, %struct.fs_parameter_spec*, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.fs_context = type opaque
%struct.fs_parameter_spec = type opaque
%struct.module = type { i32, %struct.list_head, [60 x i8], %struct.module_kobject, %struct.module_attribute*, i8*, i8*, %struct.kobject*, %struct.kernel_symbol*, i32*, i32, %struct.mutex, %struct.kernel_param*, i32, i32, %struct.kernel_symbol*, i32*, i8, %struct.kernel_symbol*, i32*, i32, i32, %struct.exception_table_entry*, i32 ()*, %struct.module_layout, %struct.module_layout, %struct.mod_arch_specific, i32, i32, %struct.list_head, %struct.bug_entry*, %struct.mod_kallsyms*, %struct.mod_kallsyms, %struct.module_sect_attrs*, %struct.module_notes_attrs*, i8*, i8*, i32, i8*, i32, i32, %struct.srcu_struct**, %struct.list_head, %struct.list_head, void ()*, %struct.atomic_t, [40 x i8] }
%struct.module_kobject = type { %struct.kobject, %struct.module*, %struct.kobject*, %struct.module_param_attrs*, %struct.completion* }
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [64 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.attribute_group**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)*, void (%struct.kobject*, %struct.kuid_t*, %struct.kgid_t*)* }
%struct.sysfs_ops = type { i32 (%struct.kobject*, %struct.attribute*, i8*)*, i32 (%struct.kobject*, %struct.attribute*, i8*, i32)* }
%struct.attribute = type { i8*, i16 }
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, i16 (%struct.kobject*, %struct.bin_attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i32, i8*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i32)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i32)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.vm_area_struct = type { i32, i32, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i32, %struct.mm_struct*, %struct.pgprot_t, i32, %struct.anon.96, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i32, %struct.file*, i8*, %struct.atomic_t, %struct.vm_userfaultfd_ctx }
%struct.rb_node = type { i32, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.anon.24, [0 x i32] }
%struct.anon.24 = type { %struct.vm_area_struct*, %struct.rb_root, i64, i32 (%struct.file*, i32, i32, i32, i32)*, i32, i32, i32, i32, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i32, i32, i32, i32, %struct.atomic64_t, i32, i32, i32, i32, %struct.spinlock, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [42 x i32], %struct.mm_rss_stat, %struct.linux_binfmt*, %struct.mm_context_t, i32, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.user_namespace*, %struct.file*, %struct.atomic_t, %struct.uprobes_state, %struct.work_struct }
%struct.rb_root = type { %struct.rb_node* }
%struct.pgd_t = type { i32 }
%struct.mm_rss_stat = type { [4 x %struct.atomic_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i8*, %struct.cpumask }
%struct.cpumask = type { [1 x i32] }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.task_struct = type { %struct.thread_info, i32, i8*, %struct.refcount_struct, i32, i32, %struct.llist_node, i32, i32, i32, i32, i32, %struct.task_struct*, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, [24 x i8], %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, i32, i32, %struct.cpumask*, %struct.cpumask, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, %struct.vmacache, %struct.task_rss_stat, i32, i32, i32, i32, i32, i32, i8, [3 x i8], i8, i32, %struct.restart_block, i32, i32, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.pid*, [4 x %struct.hlist_node], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, %struct.prev_cputime, i32, i32, i64, i64, i32, i32, %struct.posix_cputimers, %struct.cred*, %struct.cred*, %struct.cred*, %struct.key*, [16 x i8], %struct.nameidata*, %struct.sysv_sem, %struct.sysv_shm, i32, i32, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i32, i32, i32, %struct.callback_head*, %struct.seccomp, i64, i64, %struct.spinlock, %struct.raw_spinlock, %struct.wake_q_node, %struct.rb_root_cached, %struct.task_struct*, %struct.rt_mutex_waiter*, %struct.mutex_waiter*, i32, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, %struct.capture_control*, i32, %struct.kernel_siginfo*, %struct.task_io_accounting, %struct.css_set*, %struct.list_head, %struct.robust_list_head*, %struct.list_head, %struct.futex_pi_state*, %struct.mutex, i32, %struct.tlbflush_unmap_batch, %union.anon.95, %struct.pipe_inode_info*, %struct.page_frag, i32, i32, i32, i64, i64, i32, i32, %struct.task_struct*, %struct.refcount_struct, %struct.thread_struct, [56 x i8] }
%struct.thread_info = type { i32, i32, %struct.mm_segment_t, i32, i32, i32 }
%struct.mm_segment_t = type { i32 }
%struct.llist_node = type { %struct.llist_node* }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, i32, [36 x i8], %struct.sched_avg }
%struct.load_weight = type { i32, i32 }
%struct.sched_statistics = type {}
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i64, i64, i64, i32, i32, i32, i32, i32, [4 x i8], %struct.util_est, [8 x i8] }
%struct.util_est = type { i32, i32 }
%struct.sched_rt_entity = type { %struct.list_head, i32, i32, i32, i16, i16, %struct.sched_rt_entity* }
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i64, i32, i8, %struct.hrtimer, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, i64, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i8, i8, i8, i8 }
%struct.timerqueue_node = type { %struct.rb_node, i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.seqcount, %struct.hrtimer*, %struct.timerqueue_head, i64 ()*, i64 }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, i8, i32, i16, i16, i32, i64, %struct.hrtimer*, i64, %struct.hrtimer*, [8 x %struct.hrtimer_clock_base], [48 x i8] }
%struct.timerqueue_head = type { %struct.rb_root_cached }
%struct.sched_info = type {}
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.vmacache = type { i64, [4 x %struct.vm_area_struct*] }
%struct.task_rss_stat = type { i32, [4 x i32] }
%struct.restart_block = type { i32 (%struct.restart_block*)*, %union.anon.25 }
%union.anon.25 = type { %struct.anon.26 }
%struct.anon.26 = type { i32*, i32, i32, i32, i64, i32* }
%struct.pid = type { %struct.refcount_struct, i32, %struct.spinlock, [4 x %struct.hlist_head], %struct.hlist_head, %struct.wait_queue_head, %struct.callback_head, [1 x %struct.upid] }
%struct.wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.upid = type { i32, %struct.pid_namespace* }
%struct.pid_namespace = type opaque
%struct.prev_cputime = type { i64, i64, %struct.raw_spinlock }
%struct.posix_cputimers = type { [3 x %struct.posix_cputimer_base], i32, i32 }
%struct.posix_cputimer_base = type { i64, %struct.timerqueue_head }
%struct.key = type { %struct.refcount_struct, i32, %union.anon.30, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.31, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i16, i32, %union.anon.32, %union.anon.36, %struct.key_restriction* }
%union.anon.30 = type { %struct.rb_node }
%struct.key_user = type opaque
%union.anon.31 = type { i64 }
%struct.kuid_t = type { i32 }
%struct.kgid_t = type { i32 }
%union.anon.32 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { i32, %union.anon.33, %struct.key_type*, %struct.key_tag*, i8* }
%union.anon.33 = type { i32 }
%struct.key_type = type opaque
%struct.key_tag = type { %struct.callback_head, %struct.refcount_struct, i8 }
%union.anon.36 = type { %union.key_payload }
%union.key_payload = type { [4 x i8*] }
%struct.key_restriction = type { i32 (%struct.key*, %struct.key_type*, %union.key_payload*, %struct.key*)*, %struct.key*, %struct.key_type* }
%struct.nameidata = type opaque
%struct.sysv_sem = type { %struct.sem_undo_list* }
%struct.sem_undo_list = type opaque
%struct.sysv_shm = type { %struct.list_head }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.nsproxy = type { %struct.atomic_t, %struct.uts_namespace*, %struct.ipc_namespace*, %struct.mnt_namespace*, %struct.pid_namespace*, %struct.net*, %struct.time_namespace*, %struct.time_namespace*, %struct.cgroup_namespace* }
%struct.uts_namespace = type opaque
%struct.ipc_namespace = type opaque
%struct.mnt_namespace = type opaque
%struct.net = type { %struct.refcount_struct, %struct.refcount_struct, %struct.spinlock, i32, i32, i32, %struct.spinlock, %struct.atomic_t, %struct.list_head, %struct.list_head, %struct.llist_node, %struct.key_tag*, %struct.user_namespace*, %struct.ucounts*, %struct.idr, %struct.ns_common, %struct.list_head, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.ctl_table_set, %struct.sock*, %struct.sock*, %struct.uevent_sock*, %struct.hlist_head*, %struct.hlist_head*, %struct.raw_notifier_head, i32, %struct.net_device*, %struct.list_head, %struct.netns_core, %struct.netns_mib, %struct.netns_packet, %struct.netns_unix, %struct.netns_nexthop, [60 x i8], %struct.netns_ipv4, %struct.netns_ipv6, %struct.net_generic*, %struct.netns_bpf, %struct.atomic64_t, %struct.sock*, [36 x i8] }
%struct.ucounts = type { %struct.hlist_node, %struct.user_namespace*, %struct.kuid_t, i32, [10 x %struct.atomic_t] }
%struct.idr = type { %struct.xarray, i32, i32 }
%struct.xarray = type { %struct.spinlock, i32, i8* }
%struct.ns_common = type { %struct.atomic_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.proc_dir_entry = type opaque
%struct.ctl_table_set = type { i32 (%struct.ctl_table_set*)*, %struct.ctl_dir }
%struct.ctl_dir = type { %struct.ctl_table_header, %struct.rb_root }
%struct.ctl_table_header = type { %union.anon.40, %struct.completion*, %struct.ctl_table*, %struct.ctl_table_root*, %struct.ctl_table_set*, %struct.ctl_dir*, %struct.ctl_node*, %struct.hlist_head }
%union.anon.40 = type { %struct.anon.41 }
%struct.anon.41 = type { %struct.ctl_table*, i32, i32, i32 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i32*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.wait_queue_head }
%struct.ctl_table_root = type { %struct.ctl_table_set, %struct.ctl_table_set* (%struct.ctl_table_root*)*, void (%struct.ctl_table_header*, %struct.ctl_table*, %struct.kuid_t*, %struct.kgid_t*)*, i32 (%struct.ctl_table_header*, %struct.ctl_table*)* }
%struct.ctl_node = type { %struct.rb_node, %struct.ctl_table_header* }
%struct.uevent_sock = type opaque
%struct.raw_notifier_head = type { %struct.notifier_block* }
%struct.notifier_block = type { i32 (%struct.notifier_block*, i32, i8*)*, %struct.notifier_block*, i32 }
%struct.net_device = type { [16 x i8], %struct.netdev_name_node*, %struct.dev_ifalias*, i32, i32, i32, i32, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.anon.109, i64, i64, i64, i64, i64, i64, i64, i32, i32, %struct.net_device_stats, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.net_device_ops*, %struct.ethtool_ops*, %struct.ndisc_ops*, %struct.header_ops*, i32, i32, i16, i16, i8, i8, i8, i8, i32, i32, i32, i16, i16, i8, i16, i16, [32 x i8], i8, i8, i8, i8, i16, i16, i16, %struct.spinlock, i8, i8, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.kset*, i32, i32, %struct.in_device*, %struct.inet6_dev*, %struct.wireless_dev*, %struct.wpan_dev*, i8*, %struct.netdev_rx_queue*, i32, i32, %struct.bpf_prog*, i32, i32, i32 (%struct.sk_buff**)*, i8*, %struct.netdev_queue*, [32 x i8], %struct.cpu_rmap*, %struct.hlist_node, [24 x i8], %struct.netdev_queue*, i32, i32, %struct.Qdisc*, i32, %struct.spinlock, %struct.xdp_dev_bulk_queue*, %struct.xps_dev_maps*, %struct.xps_dev_maps*, %struct.timer_list, i32, %struct.list_head, i32*, %struct.list_head, i8, i8, i16, i8, void (%struct.net_device*)*, %struct.possible_net_t, %union.anon.125, %struct.device, [4 x %struct.attribute_group*], %struct.attribute_group*, %struct.rtnl_link_ops*, i32, i16, i16, [16 x %struct.netdev_tc_txq], [16 x i8], %struct.phy_device*, %struct.sfp_bus*, %struct.lock_class_key*, %struct.lock_class_key*, i8, i8, %struct.list_head, [12 x i8] }
%struct.netdev_name_node = type { %struct.hlist_node, %struct.list_head, %struct.net_device*, i8* }
%struct.dev_ifalias = type { %struct.callback_head, [0 x i8] }
%struct.anon.109 = type { %struct.list_head, %struct.list_head }
%struct.net_device_stats = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.net_device_ops = type { i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.sk_buff*, %struct.net_device*, i64)*, i16 (%struct.net_device*, %struct.sk_buff*, %struct.net_device*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ifreq*, i32)*, i32 (%struct.net_device*, %struct.ifmap*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.neigh_parms*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.rtnl_link_stats64*)*, i1 (%struct.net_device*, i32)*, i32 (i32, %struct.net_device*, i8*)*, %struct.net_device_stats* (%struct.net_device*)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i16, i8, i16)*, i32 (%struct.net_device*, i32, i32, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_info*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_stats*)*, i32 (%struct.net_device*, i32, %struct.nlattr**)*, i32 (%struct.net_device*, i32, %struct.sk_buff*)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_guid*, %struct.ifla_vf_guid*)*, i32 (%struct.net_device*, i32, i64, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, %struct.sk_buff*, i16, i32)*, i32 (%struct.net_device*, %struct.net_device*, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, %struct.net_device* (%struct.net_device*, %struct.sk_buff*, i1)*, i64 (%struct.net_device*, i64)*, i32 (%struct.net_device*, i64)*, i32 (%struct.net_device*, %struct.neighbour*)*, void (%struct.net_device*, %struct.neighbour*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16, i16, %struct.netlink_ext_ack*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16)*, i32 (%struct.sk_buff*, %struct.netlink_callback*, %struct.net_device*, %struct.net_device*, i32*)*, i32 (%struct.sk_buff*, %struct.nlattr**, %struct.net_device*, i8*, i16, i32, i32, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16, %struct.netlink_ext_ack*)*, i32 (%struct.sk_buff*, i32, i32, %struct.net_device*, i32, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, i8*, i32)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, i8* (%struct.net_device*, %struct.net_device*)*, void (%struct.net_device*, i8*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.sk_buff*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.netdev_bpf*)*, i32 (%struct.net_device*, i32, %struct.xdp_frame**, i32)*, i32 (%struct.net_device*, i32, i32)*, %struct.devlink_port* (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ip_tunnel_parm*, i32)* }
%struct.sk_buff = type { %union.anon.45, %union.anon.48, %union.anon.49, [48 x i8], %union.anon.50, i32, i32, i16, i16, i16, [0 x i8], i8, [0 x i32], [0 x i8], i16, [0 x i8], i16, %union.anon.52, i32, i32, i32, i16, i16, %union.anon.54, %union.anon.55, %union.anon.56, i16, i16, i16, i16, i16, i16, i16, [0 x i32], i8*, i8*, i8*, i8*, i32, %struct.refcount_struct }
%union.anon.45 = type { %struct.anon.46 }
%struct.anon.46 = type { %struct.sk_buff*, %struct.sk_buff*, %union.anon.47 }
%union.anon.47 = type { %struct.net_device* }
%union.anon.48 = type { %struct.sock* }
%union.anon.49 = type { i64 }
%union.anon.50 = type { %struct.anon.51 }
%struct.anon.51 = type { i32, void (%struct.sk_buff*)* }
%union.anon.52 = type { i32 }
%union.anon.54 = type { i32 }
%union.anon.55 = type { i32 }
%union.anon.56 = type { i16 }
%struct.ifreq = type { %union.anon.110, %union.anon.111 }
%union.anon.110 = type { [16 x i8] }
%union.anon.111 = type { %struct.ifmap }
%struct.ifmap = type { i32, i32, i16, i8, i8, i8 }
%struct.neigh_parms = type opaque
%struct.rtnl_link_stats64 = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.ifla_vf_info = type { i32, [32 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i16 }
%struct.ifla_vf_stats = type { i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.nlattr = type { i16, i16 }
%struct.ifla_vf_guid = type { i32, i64 }
%struct.netlink_ext_ack = type { i8*, %struct.nlattr*, [20 x i8], i8 }
%struct.neighbour = type opaque
%struct.ndmsg = type { i8, i8, i16, i32, i16, i8, i8 }
%struct.netlink_callback = type { %struct.sk_buff*, %struct.nlmsghdr*, i32 (%struct.sk_buff*, %struct.netlink_callback*)*, i32 (%struct.netlink_callback*)*, i8*, %struct.module*, %struct.netlink_ext_ack*, i16, i16, i32, i32, i32, i8, %union.anon.113 }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%union.anon.113 = type { [6 x i32], [24 x i8] }
%struct.netdev_phys_item_id = type { [32 x i8], i8 }
%struct.udp_tunnel_info = type opaque
%struct.netdev_bpf = type { i32, %union.anon.114 }
%union.anon.114 = type { %struct.anon.115 }
%struct.anon.115 = type { i32, %struct.bpf_prog*, %struct.netlink_ext_ack* }
%struct.xdp_frame = type { i8*, i16, i16, i32, %struct.xdp_mem_info, %struct.net_device* }
%struct.xdp_mem_info = type { i32, i32 }
%struct.devlink_port = type opaque
%struct.ip_tunnel_parm = type opaque
%struct.ethtool_ops = type { i32, void (%struct.net_device*, %struct.ethtool_drvinfo*)*, i32 (%struct.net_device*)*, void (%struct.net_device*, %struct.ethtool_regs*, i8*)*, void (%struct.net_device*, %struct.ethtool_wolinfo*)*, i32 (%struct.net_device*, %struct.ethtool_wolinfo*)*, i32 (%struct.net_device*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, %struct.ethtool_coalesce*)*, void (%struct.net_device*, %struct.ethtool_ringparam*)*, i32 (%struct.net_device*, %struct.ethtool_ringparam*)*, void (%struct.net_device*, %struct.ethtool_pauseparam*)*, i32 (%struct.net_device*, %struct.ethtool_pauseparam*)*, void (%struct.net_device*, %struct.ethtool_test*, i64*)*, void (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.ethtool_stats*, i64*)*, i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.ethtool_rxnfc*, i32*)*, i32 (%struct.net_device*, %struct.ethtool_rxnfc*)*, i32 (%struct.net_device*, %struct.ethtool_flash*)*, i32 (%struct.net_device*, i32*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i32*, i8*, i8*)*, i32 (%struct.net_device*, i32*, i8*, i8)*, i32 (%struct.net_device*, i32*, i8*, i8*, i32)*, i32 (%struct.net_device*, i32*, i8*, i8, i32*, i1)*, void (%struct.net_device*, %struct.ethtool_channels*)*, i32 (%struct.net_device*, %struct.ethtool_channels*)*, i32 (%struct.net_device*, %struct.ethtool_dump*)*, i32 (%struct.net_device*, %struct.ethtool_dump*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_dump*)*, i32 (%struct.net_device*, %struct.ethtool_ts_info*)*, i32 (%struct.net_device*, %struct.ethtool_modinfo*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_eee*)*, i32 (%struct.net_device*, %struct.ethtool_eee*)*, i32 (%struct.net_device*, %struct.ethtool_tunable*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_tunable*, i8*)*, i32 (%struct.net_device*, i32, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, i32, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, %struct.ethtool_link_ksettings*)*, i32 (%struct.net_device*, %struct.ethtool_link_ksettings*)*, i32 (%struct.net_device*, %struct.ethtool_fecparam*)*, i32 (%struct.net_device*, %struct.ethtool_fecparam*)*, void (%struct.net_device*, %struct.ethtool_stats*, i64*)* }
%struct.ethtool_drvinfo = type { i32, [32 x i8], [32 x i8], [32 x i8], [32 x i8], [32 x i8], [12 x i8], i32, i32, i32, i32, i32 }
%struct.ethtool_regs = type { i32, i32, i32, [0 x i8] }
%struct.ethtool_wolinfo = type { i32, i32, i32, [6 x i8] }
%struct.ethtool_coalesce = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_ringparam = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_pauseparam = type { i32, i32, i32, i32 }
%struct.ethtool_test = type { i32, i32, i32, i32, [0 x i64] }
%struct.ethtool_rxnfc = type { i32, i32, i64, %struct.ethtool_rx_flow_spec, %union.anon.119, [0 x i32] }
%struct.ethtool_rx_flow_spec = type { i32, %union.ethtool_flow_union, %struct.ethtool_flow_ext, %union.ethtool_flow_union, %struct.ethtool_flow_ext, i64, i32 }
%union.ethtool_flow_union = type { %struct.ethtool_tcpip6_spec, [12 x i8] }
%struct.ethtool_tcpip6_spec = type { [4 x i32], [4 x i32], i16, i16, i8 }
%struct.ethtool_flow_ext = type { [2 x i8], [6 x i8], i16, i16, [2 x i32] }
%union.anon.119 = type { i32 }
%struct.ethtool_flash = type { i32, i32, [128 x i8] }
%struct.ethtool_channels = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_dump = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_ts_info = type { i32, i32, i32, i32, [3 x i32], i32, [3 x i32] }
%struct.ethtool_modinfo = type { i32, i32, i32, [8 x i32] }
%struct.ethtool_eeprom = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_eee = type { i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%struct.ethtool_tunable = type { i32, i32, i32, i32, [0 x i8*] }
%struct.ethtool_link_ksettings = type { %struct.ethtool_link_settings, %struct.anon.120 }
%struct.ethtool_link_settings = type { i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [1 x i8], [7 x i32], [0 x i32] }
%struct.anon.120 = type { [3 x i32], [3 x i32], [3 x i32] }
%struct.ethtool_fecparam = type { i32, i32, i32, i32 }
%struct.ethtool_stats = type { i32, i32, [0 x i64] }
%struct.ndisc_ops = type opaque
%struct.header_ops = type { i32 (%struct.sk_buff*, %struct.net_device*, i16, i8*, i8*, i32)*, i32 (%struct.sk_buff*, i8*)*, i32 (%struct.neighbour*, %struct.hh_cache*, i16)*, void (%struct.hh_cache*, %struct.net_device*, i8*)*, i1 (i8*, i32)*, i16 (%struct.sk_buff*)* }
%struct.hh_cache = type { i32, %struct.seqlock_t, [24 x i32] }
%struct.seqlock_t = type { %struct.seqcount, %struct.spinlock }
%struct.netdev_hw_addr_list = type { %struct.list_head, i32 }
%struct.in_device = type opaque
%struct.inet6_dev = type opaque
%struct.wireless_dev = type opaque
%struct.wpan_dev = type opaque
%struct.netdev_rx_queue = type { %struct.rps_map*, %struct.rps_dev_flow_table*, %struct.kobject, %struct.net_device*, [16 x i8], %struct.xdp_rxq_info }
%struct.rps_map = type { i32, %struct.callback_head, [0 x i16] }
%struct.rps_dev_flow_table = type { i32, %struct.callback_head, [0 x %struct.rps_dev_flow] }
%struct.rps_dev_flow = type { i16, i16, i32 }
%struct.xdp_rxq_info = type { %struct.net_device*, i32, i32, %struct.xdp_mem_info, [44 x i8] }
%struct.cpu_rmap = type opaque
%struct.netdev_queue = type { %struct.net_device*, %struct.Qdisc*, %struct.Qdisc*, %struct.kobject, i32, i32, %struct.net_device*, [4 x i8], %struct.spinlock, i32, i32, i32, [36 x i8], %struct.dql }
%struct.dql = type { i32, i32, i32, [52 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [24 x i8] }
%struct.Qdisc = type { i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, i32, i32, %struct.Qdisc_ops*, %struct.qdisc_size_table*, %struct.hlist_node, i32, i32, %struct.netdev_queue*, %struct.net_rate_estimator*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, i32, %struct.refcount_struct, %struct.sk_buff_head, %struct.qdisc_skb_head, %struct.gnet_stats_basic_packed, %struct.seqcount, %struct.gnet_stats_queue, i32, %struct.Qdisc*, %struct.sk_buff_head, [60 x i8], %struct.spinlock, %struct.spinlock, i8, %struct.callback_head, [20 x i8] }
%struct.Qdisc_ops = type { %struct.Qdisc_ops*, %struct.Qdisc_class_ops*, [16 x i8], i32, i32, i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, %struct.sk_buff* (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, %struct.sk_buff*)*, i32 (%struct.Qdisc*, %struct.gnet_dump*)*, void (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*)*, i32 (%struct.Qdisc*)*, %struct.module* }
%struct.Qdisc_class_ops = type { i32, %struct.netdev_queue* (%struct.Qdisc*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i32, %struct.Qdisc*, %struct.Qdisc**, %struct.netlink_ext_ack*)*, %struct.Qdisc* (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, i32, %struct.nlattr**, i32*, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, %struct.qdisc_walker*)*, %struct.tcf_block* (%struct.Qdisc*, i32, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i32, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, %struct.sk_buff*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i32, %struct.gnet_dump*)* }
%struct.tcmsg = type { i8, i8, i16, i32, i32, i32, i32 }
%struct.qdisc_walker = type opaque
%struct.tcf_block = type { %struct.mutex, %struct.list_head, i32, i32, %struct.refcount_struct, %struct.net*, %struct.Qdisc*, %struct.rw_semaphore, %struct.flow_block, %struct.list_head, i8, %struct.atomic_t, i32, i32, %struct.anon.121, %struct.callback_head, [128 x %struct.hlist_head], %struct.mutex }
%struct.flow_block = type { %struct.list_head }
%struct.anon.121 = type { %struct.tcf_chain*, %struct.list_head }
%struct.tcf_chain = type { %struct.mutex, %struct.tcf_proto*, %struct.list_head, %struct.tcf_block*, i32, i32, i32, i8, i8, %struct.tcf_proto_ops*, i8*, %struct.callback_head }
%struct.tcf_proto = type { %struct.tcf_proto*, i8*, i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i16, i32, i8*, %struct.tcf_proto_ops*, %struct.tcf_chain*, %struct.spinlock, i8, %struct.refcount_struct, %struct.callback_head, %struct.hlist_node }
%struct.tcf_result = type { %union.anon.122 }
%union.anon.122 = type { %struct.anon.123 }
%struct.anon.123 = type { i32, i32 }
%struct.tcf_proto_ops = type { %struct.list_head, [16 x i8], i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i32 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, i1, %struct.netlink_ext_ack*)*, i8* (%struct.tcf_proto*, i32)*, void (%struct.tcf_proto*, i8*)*, i32 (%struct.net*, %struct.sk_buff*, %struct.tcf_proto*, i32, i32, %struct.nlattr**, i8**, i1, i1, %struct.netlink_ext_ack*)*, i32 (%struct.tcf_proto*, i8*, i8*, i1, %struct.netlink_ext_ack*)*, i1 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, %struct.tcf_walker*, i1)*, i32 (%struct.tcf_proto*, i1, i32 (i32, i8*, i8*)*, i8*, %struct.netlink_ext_ack*)*, void (%struct.tcf_proto*, i8*)*, void (%struct.tcf_proto*, i8*)*, void (i8*, i32, i32, i8*, i32)*, i8* (%struct.net*, %struct.tcf_chain*, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (i8*)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.sk_buff*, %struct.net*, i8*)*, %struct.module*, i32 }
%struct.tcf_walker = type opaque
%struct.gnet_dump = type { %struct.spinlock*, %struct.sk_buff*, %struct.nlattr*, i32, i32, i32, i8*, i32, %struct.tc_stats }
%struct.tc_stats = type { i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.qdisc_size_table = type { %struct.callback_head, %struct.list_head, %struct.tc_sizespec, i32, [0 x i16] }
%struct.tc_sizespec = type { i8, i8, i16, i32, i32, i32, i32, i32 }
%struct.net_rate_estimator = type opaque
%struct.gnet_stats_basic_cpu = type { %struct.gnet_stats_basic_packed, %struct.u64_stats_sync, [12 x i8] }
%struct.u64_stats_sync = type { %struct.seqcount }
%struct.qdisc_skb_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.gnet_stats_basic_packed = type { i64, i64 }
%struct.gnet_stats_queue = type { i32, i32, i32, i32, i32 }
%struct.sk_buff_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.xdp_dev_bulk_queue = type opaque
%struct.xps_dev_maps = type { %struct.callback_head, [0 x %struct.xps_map*] }
%struct.xps_map = type { i32, i32, %struct.callback_head, [0 x i16] }
%struct.timer_list = type { %struct.hlist_node, i32, void (%struct.timer_list*)*, i32 }
%struct.possible_net_t = type { %struct.net* }
%union.anon.125 = type { i8* }
%struct.device = type { %struct.kobject, %struct.device*, %struct.device_private*, i8*, %struct.device_type*, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.mutex, %struct.dev_links_info, %struct.dev_pm_info, %struct.dev_pm_domain*, %struct.irq_domain*, %struct.list_head, %struct.dma_map_ops*, i64*, i64, i64, i32, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.dev_archdata, %struct.device_node*, %struct.fwnode_handle*, i32, i32, %struct.spinlock, %struct.list_head, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, %struct.dev_iommu*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key, i8 }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, i32, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.attribute_group**, %struct.dev_pm_ops*, void (%struct.device*)*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_links_info = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, i8, i32 }
%struct.dev_pm_info = type { %struct.pm_message, i16, i32, %struct.spinlock, i8, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.pm_subsys_data = type { %struct.spinlock, i32 }
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, i32 (%struct.device*)*, void (%struct.device*, i1)*, i32 (%struct.device*)*, void (%struct.device*)*, void (%struct.device*)* }
%struct.irq_domain = type opaque
%struct.dma_map_ops = type { i8* (%struct.device*, i32, i32*, i32, i32)*, void (%struct.device*, i32, i8*, i32, i32)*, i32 (%struct.device*, %struct.vm_area_struct*, i8*, i32, i32, i32)*, i32 (%struct.device*, %struct.sg_table*, i8*, i32, i32, i32)*, i32 (%struct.device*, %struct.page*, i32, i32, i32, i32)*, void (%struct.device*, i32, i32, i32, i32)*, i32 (%struct.device*, %struct.scatterlist*, i32, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32, i32)*, i32 (%struct.device*, i32, i32, i32, i32)*, void (%struct.device*, i32, i32, i32, i32)*, void (%struct.device*, i32, i32, i32)*, void (%struct.device*, i32, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, i8*, i32, i32)*, i32 (%struct.device*, i64)*, i64 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.sg_table = type { %struct.scatterlist*, i32, i32 }
%struct.scatterlist = type { i32, i32, i32, i32 }
%struct.page = type { i32, %union.anon.64, %union.anon.80, %struct.atomic_t }
%union.anon.64 = type { %struct.anon.65 }
%struct.anon.65 = type { %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.80 = type { %struct.atomic_t }
%struct.device_dma_parameters = type { i32, i32 }
%struct.dma_coherent_mem = type opaque
%struct.dev_archdata = type {}
%struct.device_node = type opaque
%struct.fwnode_handle = type { %struct.fwnode_handle*, %struct.fwnode_operations*, %struct.device* }
%struct.fwnode_operations = type { %struct.fwnode_handle* (%struct.fwnode_handle*)*, void (%struct.fwnode_handle*)*, i1 (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*, %struct.device*)*, i1 (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i32, i8*, i32)*, i32 (%struct.fwnode_handle*, i8*, i8**, i32)*, i8* (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i8*, i32, i32, %struct.fwnode_reference_args*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, i32 (%struct.fwnode_handle*, %struct.fwnode_endpoint*)*, i32 (%struct.fwnode_handle*, %struct.device*)* }
%struct.fwnode_reference_args = type { %struct.fwnode_handle*, i32, [8 x i64] }
%struct.fwnode_endpoint = type { i32, i32, %struct.fwnode_handle* }
%struct.class = type { i8*, %struct.module*, %struct.attribute_group**, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, void (%struct.device*, %struct.kuid_t*, %struct.kgid_t*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.iommu_group = type opaque
%struct.dev_iommu = type opaque
%struct.rtnl_link_ops = type { %struct.list_head, i8*, i32, void (%struct.net_device*)*, i32, %struct.nla_policy*, i32 (%struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (%struct.net_device*, %struct.list_head*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 ()*, i32 ()*, i32, %struct.nla_policy*, i32 (%struct.net_device*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*, %struct.net_device*)*, %struct.net* (%struct.net_device*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.sk_buff*, %struct.net_device*, i32*, i32)* }
%struct.nla_policy = type { i8, i8, i16, %union.anon.126 }
%union.anon.126 = type { i32 }
%struct.netdev_tc_txq = type { i16, i16 }
%struct.phy_device = type opaque
%struct.sfp_bus = type opaque
%struct.netns_core = type { %struct.ctl_table_header*, i32, i32*, %struct.prot_inuse* }
%struct.prot_inuse = type opaque
%struct.netns_mib = type { %struct.tcp_mib*, %struct.ipstats_mib*, %struct.linux_mib*, %struct.udp_mib*, %struct.udp_mib*, %struct.icmp_mib*, %struct.icmpmsg_mib*, %struct.proc_dir_entry*, %struct.udp_mib*, %struct.udp_mib*, %struct.ipstats_mib*, %struct.icmpv6_mib*, %struct.icmpv6msg_mib* }
%struct.tcp_mib = type { [16 x i32] }
%struct.linux_mib = type { [122 x i32] }
%struct.icmp_mib = type { [28 x i32] }
%struct.icmpmsg_mib = type { [512 x %struct.atomic_t] }
%struct.udp_mib = type { [9 x i32] }
%struct.ipstats_mib = type { [37 x i64], %struct.u64_stats_sync }
%struct.icmpv6_mib = type { [6 x i32] }
%struct.icmpv6msg_mib = type { [512 x %struct.atomic_t] }
%struct.netns_packet = type { %struct.mutex, %struct.hlist_head }
%struct.netns_unix = type { i32, %struct.ctl_table_header* }
%struct.netns_nexthop = type { %struct.rb_root, %struct.hlist_head*, i32, i32, %struct.atomic_notifier_head }
%struct.atomic_notifier_head = type { %struct.spinlock, %struct.notifier_block* }
%struct.netns_ipv4 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ipv4_devconf*, %struct.ipv4_devconf*, %struct.ip_ra_chain*, %struct.mutex, i8, %struct.hlist_head*, i8, %struct.sock*, %struct.sock**, %struct.sock*, %struct.inet_peer_base*, %struct.sock**, %struct.fqdir*, i32, i32, i32, i32, i32, i32, %struct.local_ports, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, %struct.inet_timewait_death_row, i32, i32, %struct.tcp_congestion_ops*, %struct.tcp_fastopen_context*, %struct.spinlock, i32, %struct.atomic_t, i32, i32, i32, i32, i32, i32, i32, %struct.ping_group_range, %struct.atomic_t, i32*, i32, %struct.fib_notifier_ops*, i32, %struct.fib_notifier_ops*, i32, %struct.atomic_t, %struct.siphash_key_t, [48 x i8] }
%struct.ipv4_devconf = type opaque
%struct.ip_ra_chain = type opaque
%struct.inet_peer_base = type opaque
%struct.fqdir = type { i32, i32, i32, i32, %struct.inet_frags*, %struct.net*, i8, [39 x i8], %struct.rhashtable, [16 x i8], %struct.atomic_t, %struct.work_struct, [44 x i8] }
%struct.inet_frags = type { i32, void (%struct.inet_frag_queue*, i8*)*, void (%struct.inet_frag_queue*)*, void (%struct.timer_list*)*, %struct.kmem_cache*, i8*, %struct.rhashtable_params, %struct.refcount_struct, %struct.completion }
%struct.inet_frag_queue = type { %struct.rhash_head, %union.anon.43, %struct.timer_list, %struct.spinlock, %struct.refcount_struct, %struct.rb_root, %struct.sk_buff*, %struct.sk_buff*, i64, i32, i32, i8, i16, %struct.fqdir*, %struct.callback_head }
%struct.rhash_head = type { %struct.rhash_head* }
%union.anon.43 = type { %struct.frag_v6_compare_key }
%struct.frag_v6_compare_key = type { %struct.in6_addr, %struct.in6_addr, i32, i32, i32 }
%struct.in6_addr = type { %union.anon.44 }
%union.anon.44 = type { [4 x i32] }
%struct.kmem_cache = type opaque
%struct.rhashtable_params = type { i16, i16, i16, i16, i32, i16, i8, i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)*, i32 (%struct.rhashtable_compare_arg*, i8*)* }
%struct.rhashtable_compare_arg = type { %struct.rhashtable*, i8* }
%struct.rhashtable = type { %struct.bucket_table*, i32, i32, %struct.rhashtable_params, i8, %struct.work_struct, %struct.mutex, %struct.spinlock, %struct.atomic_t }
%struct.bucket_table = type { i32, i32, i32, %struct.list_head, %struct.callback_head, %struct.bucket_table*, %struct.lockdep_map, [32 x i8], [0 x %struct.rhash_lock_head*] }
%struct.lockdep_map = type {}
%struct.rhash_lock_head = type {}
%struct.local_ports = type { %struct.seqlock_t, [2 x i32], i8 }
%struct.inet_timewait_death_row = type { %struct.atomic_t, [60 x i8], %struct.inet_hashinfo*, i32, [56 x i8] }
%struct.inet_hashinfo = type opaque
%struct.tcp_congestion_ops = type opaque
%struct.tcp_fastopen_context = type opaque
%struct.ping_group_range = type { %struct.seqlock_t, [2 x %struct.kgid_t] }
%struct.fib_notifier_ops = type opaque
%struct.siphash_key_t = type { [2 x i64] }
%struct.netns_ipv6 = type { %struct.netns_sysctl_ipv6, %struct.ipv6_devconf*, %struct.ipv6_devconf*, %struct.inet_peer_base*, %struct.fqdir*, %struct.fib6_info*, %struct.rt6_info*, %struct.rt6_statistics*, %struct.timer_list, %struct.hlist_head*, %struct.fib6_table*, %struct.list_head, [20 x i8], %struct.dst_ops, %struct.rwlock_t, %struct.spinlock, i32, i32, %struct.sock**, %struct.sock*, %struct.sock*, %struct.sock*, %struct.sock*, %struct.atomic_t, %struct.atomic_t, %struct.seg6_pernet_data*, %struct.fib_notifier_ops*, %struct.fib_notifier_ops*, i32, %struct.anon.57, [20 x i8] }
%struct.netns_sysctl_ipv6 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x i32], i32*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8 }
%struct.ipv6_devconf = type opaque
%struct.fib6_info = type opaque
%struct.rt6_info = type opaque
%struct.rt6_statistics = type opaque
%struct.fib6_table = type opaque
%struct.dst_ops = type { i16, i32, i32 (%struct.dst_ops*)*, %struct.dst_entry* (%struct.dst_entry*, i32)*, i32 (%struct.dst_entry*)*, i32 (%struct.dst_entry*)*, i32* (%struct.dst_entry*, i32)*, void (%struct.dst_entry*)*, void (%struct.dst_entry*, %struct.net_device*, i32)*, %struct.dst_entry* (%struct.dst_entry*)*, void (%struct.sk_buff*)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*, i32, i1)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*)*, i32 (%struct.net*, %struct.sock*, %struct.sk_buff*)*, %struct.neighbour* (%struct.dst_entry*, %struct.sk_buff*, i8*)*, void (%struct.dst_entry*, i8*)*, %struct.kmem_cache*, [60 x i8], %struct.percpu_counter, [32 x i8] }
%struct.dst_entry = type opaque
%struct.percpu_counter = type { %struct.raw_spinlock, i64, i32* }
%struct.rwlock_t = type { %struct.arch_rwlock_t, i32, i32, i8* }
%struct.arch_rwlock_t = type { i32 }
%struct.seg6_pernet_data = type opaque
%struct.anon.57 = type { %struct.hlist_head, %struct.spinlock, i32 }
%struct.net_generic = type opaque
%struct.netns_bpf = type { [1 x %struct.bpf_prog*], [1 x %struct.bpf_link*] }
%struct.bpf_link = type { %struct.atomic64_t, i32, i32, %struct.bpf_link_ops*, %struct.bpf_prog*, %struct.work_struct }
%struct.bpf_link_ops = type { void (%struct.bpf_link*)*, void (%struct.bpf_link*)*, i32 (%struct.bpf_link*, %struct.bpf_prog*, %struct.bpf_prog*)*, void (%struct.bpf_link*, %struct.seq_file*)*, i32 (%struct.bpf_link*, %struct.bpf_link_info*)* }
%struct.seq_file = type { i8*, i32, i32, i32, i32, i64, i64, %struct.mutex, %struct.seq_operations*, i32, %struct.file*, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.bpf_link_info = type { i32, i32, i32, %union.anon.58 }
%union.anon.58 = type { %struct.anon.59 }
%struct.anon.59 = type { i64, i32 }
%struct.sock = type opaque
%struct.time_namespace = type opaque
%struct.cgroup_namespace = type { %struct.refcount_struct, %struct.ns_common, %struct.user_namespace*, %struct.ucounts*, %struct.css_set* }
%struct.signal_struct = type { %struct.refcount_struct, %struct.atomic_t, i32, %struct.list_head, %struct.wait_queue_head, %struct.task_struct*, %struct.sigpending, %struct.hlist_head, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, i64, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.posix_cputimers, [4 x %struct.pid*], %struct.pid*, i32, %struct.tty_struct*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.prev_cputime, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.task_io_accounting, i64, [16 x %struct.rlimit], i8, i16, i16, %struct.mm_struct*, %struct.mutex, %struct.mutex }
%struct.cpu_itimer = type { i64, i64 }
%struct.thread_group_cputimer = type { %struct.task_cputime_atomic }
%struct.task_cputime_atomic = type { %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t }
%struct.tty_struct = type opaque
%struct.rlimit = type { i32, i32 }
%struct.sighand_struct = type { %struct.spinlock, %struct.refcount_struct, %struct.wait_queue_head, [64 x %struct.k_sigaction] }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i32, %struct.sigset_t }
%struct.sigset_t = type { [2 x i32] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.seccomp = type {}
%struct.wake_q_node = type { %struct.wake_q_node* }
%struct.rb_root_cached = type { %struct.rb_root, %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.mutex_waiter = type { %struct.list_head, %struct.task_struct*, %struct.ww_acquire_ctx*, i8* }
%struct.ww_acquire_ctx = type opaque
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.io_context = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i16, i32, i32, %struct.xarray, %struct.io_cq*, %struct.hlist_head, %struct.work_struct }
%struct.io_cq = type { %struct.request_queue*, %struct.io_context*, %union.anon.82, %union.anon.83, i32 }
%struct.request_queue = type opaque
%union.anon.82 = type { %struct.list_head }
%union.anon.83 = type { %struct.hlist_node }
%struct.capture_control = type opaque
%struct.kernel_siginfo = type { %struct.anon.84 }
%struct.anon.84 = type { i32, i32, i32, %union.__sifields }
%union.__sifields = type { %struct.anon.88 }
%struct.anon.88 = type { i32, i32, i32, i32, i32 }
%struct.task_io_accounting = type {}
%struct.css_set = type { [1 x %struct.cgroup_subsys_state*], %struct.refcount_struct, %struct.css_set*, %struct.cgroup*, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, [1 x %struct.list_head], %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.cgroup*, %struct.cgroup*, %struct.css_set*, i8, %struct.callback_head }
%struct.cgroup_subsys_state = type { %struct.cgroup*, %struct.cgroup_subsys*, %struct.percpu_ref, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i64, %struct.atomic_t, %struct.work_struct, %struct.rcu_work, %struct.cgroup_subsys_state* }
%struct.cgroup_subsys = type { %struct.cgroup_subsys_state* (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*, i32)*, i32 (%struct.seq_file*, %struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void ()*, i32 (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.cgroup_subsys_state*)*, i8, i32, i8*, i8*, %struct.cgroup_root*, %struct.idr, %struct.list_head, %struct.cftype*, %struct.cftype*, i32 }
%struct.cgroup_taskset = type opaque
%struct.cgroup_root = type { %struct.kernfs_root*, i32, i32, %struct.cgroup, i64, %struct.atomic_t, %struct.list_head, i32, [4096 x i8], [64 x i8] }
%struct.kernfs_root = type { %struct.kernfs_node*, i32, %struct.idr, i32, i32, %struct.kernfs_syscall_ops*, %struct.list_head, %struct.wait_queue_head }
%struct.kernfs_syscall_ops = type { i32 (%struct.seq_file*, %struct.kernfs_root*)*, i32 (%struct.kernfs_node*, i8*, i16)*, i32 (%struct.kernfs_node*)*, i32 (%struct.kernfs_node*, %struct.kernfs_node*, i8*)*, i32 (%struct.seq_file*, %struct.kernfs_node*, %struct.kernfs_root*)* }
%struct.cgroup = type { %struct.cgroup_subsys_state, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.kernfs_node*, %struct.cgroup_file, %struct.cgroup_file, i16, i16, i16, i16, [1 x %struct.cgroup_subsys_state*], %struct.cgroup_root*, %struct.list_head, [1 x %struct.list_head], %struct.cgroup*, %struct.cgroup*, %struct.cgroup_rstat_cpu*, %struct.list_head, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.prev_cputime, %struct.list_head, %struct.mutex, %struct.wait_queue_head, %struct.work_struct, %struct.psi_group, %struct.cgroup_bpf, %struct.atomic_t, %struct.cgroup_freezer_state, [0 x i64] }
%struct.cgroup_file = type { %struct.kernfs_node*, i32, %struct.timer_list }
%struct.cgroup_rstat_cpu = type { %struct.u64_stats_sync, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.cgroup*, %struct.cgroup* }
%struct.cgroup_base_stat = type { %struct.task_cputime }
%struct.task_cputime = type { i64, i64, i64 }
%struct.psi_group = type {}
%struct.cgroup_bpf = type { [34 x %struct.bpf_prog_array*], [34 x %struct.list_head], [34 x i32], %struct.bpf_prog_array*, %struct.percpu_ref, %struct.work_struct }
%struct.bpf_prog_array = type { %struct.callback_head, [0 x %struct.bpf_prog_array_item] }
%struct.bpf_prog_array_item = type { %struct.bpf_prog*, [2 x %struct.bpf_cgroup_storage*] }
%struct.bpf_cgroup_storage = type { %union.anon.81, %struct.bpf_cgroup_storage_map*, %struct.bpf_cgroup_storage_key, %struct.list_head, %struct.rb_node, %struct.callback_head }
%union.anon.81 = type { %struct.bpf_storage_buffer* }
%struct.bpf_storage_buffer = type { %struct.callback_head, [0 x i8] }
%struct.bpf_cgroup_storage_map = type opaque
%struct.bpf_cgroup_storage_key = type { i64, i32 }
%struct.cgroup_freezer_state = type { i8, i32, i32, i32 }
%struct.cftype = type { [64 x i8], i32, i32, i32, i32, %struct.cgroup_subsys*, %struct.list_head, %struct.kernfs_ops*, i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)* }
%struct.kernfs_ops = type { i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32, i8, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)* }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, %struct.seq_file*, i8*, %struct.mutex, %struct.mutex, i32, %struct.list_head, i8*, i32, i8, %struct.vm_operations_struct* }
%struct.poll_table_struct = type opaque
%struct.percpu_ref = type { %struct.atomic_t, i32, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head }
%struct.rcu_work = type { %struct.work_struct, %struct.callback_head, %struct.workqueue_struct* }
%struct.robust_list_head = type opaque
%struct.futex_pi_state = type opaque
%struct.tlbflush_unmap_batch = type {}
%union.anon.95 = type { %struct.callback_head }
%struct.pipe_inode_info = type { %struct.mutex, %struct.wait_queue_head, %struct.wait_queue_head, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer*, %struct.user_struct* }
%struct.fasync_struct = type { %struct.rwlock_t, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i32 }
%struct.pipe_buf_operations = type { i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.page_frag = type { %struct.page*, i16, i16 }
%struct.thread_struct = type { i32, i32, [12 x i32], %struct.__riscv_d_ext_state }
%struct.__riscv_d_ext_state = type { [32 x i64], i32 }
%struct.completion = type { i32, %struct.swait_queue_head }
%struct.swait_queue_head = type { %struct.raw_spinlock, %struct.list_head }
%struct.kioctx_table = type opaque
%struct.uprobes_state = type {}
%struct.pgprot_t = type { i32 }
%struct.anon.96 = type { %struct.rb_node, i32 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i32)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*, i32)*, void (%struct.vm_fault*, i32, i32)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i32, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, %struct.page* (%struct.vm_area_struct*, i32)* }
%struct.vm_fault = type { %struct.vm_area_struct*, i32, i32, i32, i32, %struct.pmd_t*, %struct.pud_t*, %struct.pte_t, %struct.page*, %struct.page*, %struct.pte_t*, %struct.spinlock*, %struct.page* }
%struct.pmd_t = type { %struct.pud_t }
%struct.pud_t = type { %struct.p4d_t }
%struct.p4d_t = type { %struct.pgd_t }
%struct.pte_t = type { i32 }
%struct.vm_userfaultfd_ctx = type {}
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.63, i8*, i64, i16, i16, %struct.kernfs_iattrs* }
%union.anon.63 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.refcount_struct }
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i32 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i32 (%struct.module_attribute*, %struct.module_kobject*, i8*, i32)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.module*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.97 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.97 = type { i8* }
%struct.kernel_symbol = type { i32, i8*, i8* }
%struct.module_layout = type { i8*, i32, i32, i32, i32 }
%struct.mod_arch_specific = type { %struct.mod_section, %struct.mod_section, %struct.mod_section }
%struct.mod_section = type { %struct.elf32_shdr*, i32, i32 }
%struct.elf32_shdr = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.bug_entry = type { i32, i8*, i16, i16 }
%struct.mod_kallsyms = type { %struct.elf32_sym*, i32, i8*, i8* }
%struct.elf32_sym = type { i32, i32, i32, i8, i8, i16 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.srcu_struct = type { [1 x %struct.srcu_node], [2 x %struct.srcu_node*], %struct.mutex, %struct.spinlock, %struct.mutex, i32, i32, i32, i32, i32, %struct.srcu_data*, i32, %struct.mutex, %struct.completion, %struct.atomic_t, %struct.delayed_work }
%struct.srcu_node = type { %struct.spinlock, [4 x i32], [4 x i32], i32, %struct.srcu_node*, i32, i32 }
%struct.srcu_data = type { [2 x i32], [2 x i32], [48 x i8], %struct.spinlock, %struct.rcu_segcblist, i32, i32, i8, %struct.timer_list, %struct.work_struct, %struct.callback_head, %struct.srcu_node*, i32, i32, %struct.srcu_struct*, [60 x i8] }
%struct.rcu_segcblist = type { %struct.callback_head*, [4 x %struct.callback_head**], [4 x i32], i32, i8, i8 }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.lock_class_key = type {}
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i32 (%struct.super_block*, %struct.shrink_control*)*, i32 (%struct.super_block*, %struct.shrink_control*)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.shrink_control = type { i32, i32, i32, i32, %struct.mem_cgroup* }
%struct.mem_cgroup = type opaque
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)*, i32 (%struct.inode*, %struct.kprojid_t*)*, i32 (%struct.inode*, i64*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.spinlock, %struct.atomic_t, %struct.super_block*, %struct.kqid, i64, i32, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.98, i32 }
%union.anon.98 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.kprojid_t = type { i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.qc_info*)*, i32 (%struct.super_block*, [2 x i32], %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.kqid*, %struct.qc_dqblk*)*, i32 (%struct.super_block*, [2 x i32], %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.qc_state*)*, i32 (%struct.super_block*, i32)* }
%struct.qc_info = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.qc_dqblk = type { i32, i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, i64, i32 }
%struct.qc_state = type { i32, [3 x %struct.qc_type_state] }
%struct.qc_type_state = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64 }
%struct.export_operations = type opaque
%struct.rw_semaphore = type { %struct.atomic_t, %struct.atomic_t, %struct.raw_spinlock, %struct.list_head, i8* }
%struct.xattr_handler = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, i8, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.backing_dev_info*, %struct.list_head, i32, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
%struct.backing_dev_info = type opaque
%struct.mtd_info = type opaque
%struct.quota_info = type { i32, %struct.rw_semaphore, [3 x %struct.inode*], [3 x %struct.mem_dqinfo], [3 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i32, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.sb_writers = type { i32, %struct.wait_queue_head, [3 x %struct.percpu_rw_semaphore] }
%struct.percpu_rw_semaphore = type { %struct.rcu_sync, i32*, %struct.rcuwait, %struct.wait_queue_head, %struct.atomic_t }
%struct.rcu_sync = type { i32, i32, %struct.wait_queue_head, %struct.callback_head }
%struct.rcuwait = type { %struct.task_struct* }
%struct.fsnotify_mark_connector = type opaque
%struct.uuid_t = type { [16 x i8] }
%struct.shrinker = type { i32 (%struct.shrinker*, %struct.shrink_control*)*, i32 (%struct.shrinker*, %struct.shrink_control*)*, i32, i32, i32, %struct.list_head, %struct.atomic_t* }
%struct.workqueue_struct = type opaque
%struct.user_namespace = type { %struct.uid_gid_map, %struct.uid_gid_map, %struct.uid_gid_map, %struct.atomic_t, %struct.user_namespace*, i32, %struct.kuid_t, %struct.kgid_t, %struct.ns_common, i32, %struct.list_head, %struct.key*, %struct.rw_semaphore, %struct.work_struct, %struct.ctl_table_set, %struct.ctl_table_header*, %struct.ucounts*, [10 x i32] }
%struct.uid_gid_map = type { i32, %union.anon.38 }
%union.anon.38 = type { [5 x %struct.uid_gid_extent] }
%struct.uid_gid_extent = type { i32, i32, i32 }
%struct.list_lru = type { %struct.list_lru_node* }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_lru_one, i32, [32 x i8] }
%struct.list_lru_one = type { %struct.list_head, i32 }
%union.anon.107 = type { %struct.list_head }
%union.anon.108 = type { %struct.hlist_node }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i32, %union.anon.99, i32, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.spinlock, i16, i8, i8, i64, %struct.seqcount, i32, %struct.rw_semaphore, i32, i32, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.100, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %union.anon.101, %struct.file_lock_context*, %struct.address_space, %struct.list_head, %union.anon.104, i32, i32, %struct.fsnotify_mark_connector*, i8* }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.inode*, %struct.delayed_call*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.path*, %struct.kstat*, i32, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec64*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, [44 x i8] }
%struct.delayed_call = type { void (i8*)*, i8* }
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.file* }
%struct.kstat = type { i32, i16, i32, i32, i64, i64, i64, i32, i32, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.timespec64, i64, i64 }
%struct.fiemap_extent_info = type opaque
%union.anon.99 = type { i32 }
%struct.timespec64 = type { i64, i32 }
%union.anon.100 = type { %struct.callback_head }
%union.anon.101 = type { %struct.file_operations* }
%struct.file_lock_context = type { %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head }
%struct.address_space = type { %struct.inode*, %struct.xarray, i32, %struct.atomic_t, %struct.rb_root_cached, %struct.rw_semaphore, i32, i32, i32, %struct.address_space_operations*, i32, i32, %struct.spinlock, %struct.list_head, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, void (%struct.readahead_control*)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i1 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.page*)*, i32 (%struct.page*, i32, i32)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.readahead_control = type opaque
%struct.kiocb = type { %struct.file*, i64, void (%struct.kiocb*, i32, i32)*, i8*, i32, i16, i16, i32 }
%struct.iov_iter = type { i32, i32, i32, %union.anon.66, %union.anon.67 }
%union.anon.66 = type { %struct.iovec* }
%struct.iovec = type { i8*, i32 }
%union.anon.67 = type { %struct.anon.68 }
%struct.anon.68 = type { i32, i32 }
%struct.swap_info_struct = type opaque
%union.anon.104 = type { %struct.pipe_inode_info* }
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, i1)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.vm_area_struct*)*, i32, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.file*, %struct.page*, i32, i32, i64*, i32)*, i32 (%struct.file*, i32, i32, i32, i32)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.pipe_inode_info*, %struct.file*, i64*, i32, i32)*, i32 (%struct.file*, i64*, %struct.pipe_inode_info*, i32, i32)*, i32 (%struct.file*, i32, %struct.file_lock**, i8**)*, i32 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)*, i32 (%struct.file*, i64, %struct.file*, i64, i32, i32)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i32 (%struct.file*, i64, i64, i32)* }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, i8*, i32, i8, i32, i32, %struct.wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i32, i32, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.102 }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i8* (i8*)*, void (i8*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock*, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)*, i1 (%struct.file_lock*)* }
%union.anon.102 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.cred = type { %struct.atomic_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %union.anon.42 }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.group_info = type { %struct.atomic_t, i32, [0 x %struct.kgid_t] }
%union.anon.42 = type { %struct.callback_head }
%struct.file_ra_state = type { i32, i32, i32, i32, i32, i64 }
%struct.bpf_map_memory = type { i32, %struct.user_struct* }
%struct.work_struct = type { %struct.atomic_t, %struct.list_head, void (%struct.work_struct*)* }
%struct.bpf_ksym = type { i32, i32, [128 x i8], %struct.list_head, %struct.latch_tree_node, i8 }
%struct.latch_tree_node = type { [2 x %struct.rb_node] }
%struct.bpf_prog_ops = type { i32 (%struct.bpf_prog*, %union.bpf_attr*, %union.bpf_attr*)* }
%struct.user_struct = type { %struct.refcount_struct, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, i32, i32, %struct.atomic_t, %struct.hlist_node, %struct.kuid_t, %struct.atomic_t, %struct.ratelimit_state }
%struct.ratelimit_state = type { %struct.raw_spinlock, i32, i32, i32, i32, i32, i32 }
%struct.bpf_prog_offload = type { %struct.bpf_prog*, %struct.net_device*, %struct.bpf_offload_dev*, i8*, %struct.list_head, i8, i8, i8*, i32 }
%struct.bpf_offload_dev = type opaque
%struct.btf = type opaque
%struct.bpf_func_info = type { i32, i32 }
%struct.bpf_func_info_aux = type { i16, i8 }
%struct.bpf_line_info = type { i32, i32, i32, i32 }
%struct.exception_table_entry = type { i32, i32 }
%struct.bpf_prog_stats = type { i64, i64, %struct.u64_stats_sync, [12 x i8] }
%union.anon.128 = type { %struct.work_struct }
%struct.sock_fprog_kern = type { i16, %struct.sock_filter* }
%struct.sock_filter = type { i16, i8, i8, i32 }

@bpf2rv32 = internal constant [14 x [2 x i8]] [[2 x i8] c"\12\09", [2 x i8] c"\0B\0A", [2 x i8] c"\0D\0C", [2 x i8] c"\0F\0E", [2 x i8] c"\11\10", [2 x i8] c"\14\13", [2 x i8] c"\D8\D4", [2 x i8] c"\D0\CC", [2 x i8] c"\C8\C4", [2 x i8] c"\C0\BC", [2 x i8] c"\16\15", [2 x i8] c"\B8\B4", [2 x i8] c"\1C\07", [2 x i8] c"\1E\1D"], align 1
@.str = private unnamed_addr constant [35 x i8] c"\013bpf-jit: BPF_END imm %d invalid\0A\00", align 1
@bpf_jit_emit_insn.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"\016bpf-jit: not supported: opcode %02x ***\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"\013bpf-jit: unknown opcode %02x\0A\00", align 1

; Function Attrs: nounwind
define dso_local i32 @bpf_jit_emit_insn(%struct.bpf_insn* %0, %struct.rv_jit_context* %1, i1 zeroext %2) local_unnamed_addr #0 {
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 0
  %7 = load i8, i8* %6, align 4
  %8 = and i8 %7, 5
  %9 = or i8 %8, 2
  %10 = icmp eq i8 %9, 7
  %11 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 0
  %12 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %13 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %12, i32 0, i32 11, i32 0
  %14 = ptrtoint %struct.bpf_insn* %0 to i32
  %15 = ptrtoint %struct.bpf_insn* %13 to i32
  %16 = sub i32 %14, %15
  %17 = ashr exact i32 %16, 3
  %18 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 2
  %19 = load i16, i16* %18, align 2
  %20 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 1
  %23 = load i8, i8* %22, align 1
  %24 = and i8 %23, 15
  %25 = zext i8 %24 to i32
  %26 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 0
  %27 = lshr i8 %23, 4
  %28 = zext i8 %27 to i32
  %29 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %28, i32 0
  %30 = zext i8 %7 to i32
  switch i8 %7, label %3986 [
    i8 -65, label %31
    i8 15, label %31
    i8 7, label %31
    i8 31, label %31
    i8 23, label %31
    i8 95, label %31
    i8 79, label %31
    i8 -81, label %31
    i8 47, label %31
    i8 39, label %31
    i8 111, label %31
    i8 127, label %31
    i8 -49, label %31
    i8 -121, label %98
    i8 63, label %3982
    i8 55, label %3982
    i8 -97, label %3982
    i8 -105, label %3982
    i8 -73, label %99
    i8 87, label %99
    i8 71, label %99
    i8 -89, label %99
    i8 103, label %99
    i8 119, label %99
    i8 -57, label %99
    i8 -68, label %874
    i8 12, label %975
    i8 28, label %975
    i8 92, label %975
    i8 76, label %975
    i8 -84, label %975
    i8 44, label %975
    i8 36, label %975
    i8 60, label %975
    i8 52, label %975
    i8 -100, label %975
    i8 -108, label %975
    i8 108, label %975
    i8 124, label %975
    i8 -52, label %975
    i8 -76, label %1046
    i8 4, label %1046
    i8 20, label %1046
    i8 84, label %1046
    i8 68, label %1046
    i8 -92, label %1046
    i8 100, label %1046
    i8 116, label %1046
    i8 -60, label %1046
    i8 -124, label %1673
    i8 -44, label %1674
    i8 -36, label %1822
    i8 5, label %2076
    i8 -123, label %2155
    i8 -11, label %2260
    i8 29, label %2346
    i8 21, label %2346
    i8 30, label %2346
    i8 22, label %2346
    i8 93, label %2346
    i8 85, label %2346
    i8 94, label %2346
    i8 86, label %2346
    i8 -67, label %2346
    i8 -75, label %2346
    i8 -66, label %2346
    i8 -74, label %2346
    i8 -83, label %2346
    i8 -91, label %2346
    i8 -82, label %2346
    i8 -90, label %2346
    i8 61, label %2346
    i8 53, label %2346
    i8 62, label %2346
    i8 54, label %2346
    i8 45, label %2346
    i8 37, label %2346
    i8 46, label %2346
    i8 38, label %2346
    i8 -35, label %2346
    i8 -43, label %2346
    i8 -34, label %2346
    i8 -42, label %2346
    i8 -51, label %2346
    i8 -59, label %2346
    i8 -50, label %2346
    i8 -58, label %2346
    i8 125, label %2346
    i8 117, label %2346
    i8 126, label %2346
    i8 118, label %2346
    i8 109, label %2346
    i8 101, label %2346
    i8 110, label %2346
    i8 102, label %2346
    i8 77, label %2346
    i8 69, label %2346
    i8 78, label %2346
    i8 70, label %2346
    i8 -107, label %3121
    i8 24, label %3183
    i8 113, label %3383
    i8 105, label %3383
    i8 97, label %3383
    i8 121, label %3383
    i8 114, label %3694
    i8 106, label %3694
    i8 98, label %3694
    i8 122, label %3694
    i8 115, label %3694
    i8 107, label %3694
    i8 99, label %3694
    i8 123, label %3694
    i8 -61, label %3694
    i8 -37, label %3982
  ]

31:                                               ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3
  %32 = and i32 %30, 8
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %95

34:                                               ; preds = %31
  %35 = add i32 %21, 2048
  %36 = and i32 %21, 4095
  %37 = icmp ult i32 %35, 4096
  %38 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %39 = load i32*, i32** %38, align 4
  %40 = icmp eq i32* %39, null
  br i1 %37, label %65, label %41

41:                                               ; preds = %34
  br i1 %40, label %42, label %46

42:                                               ; preds = %41
  %43 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %44 = load i32, i32* %43, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %43, align 4
  br label %61

46:                                               ; preds = %41
  %47 = and i32 %35, -4096
  %48 = or i32 %47, 3767
  %49 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %50 = load i32, i32* %49, align 4
  %51 = getelementptr i32, i32* %39, i32 %50
  store i32 %48, i32* %51, align 4
  %52 = load i32*, i32** %38, align 4
  %53 = load i32, i32* %49, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %49, align 4
  %55 = icmp eq i32* %52, null
  br i1 %55, label %61, label %56

56:                                               ; preds = %46
  %57 = shl nuw i32 %36, 20
  %58 = or i32 %57, 954003
  %59 = getelementptr i32, i32* %52, i32 %54
  store i32 %58, i32* %59, align 4
  %60 = load i32, i32* %49, align 4
  br label %61

61:                                               ; preds = %56, %46, %42
  %62 = phi i32* [ %49, %46 ], [ %49, %56 ], [ %43, %42 ]
  %63 = phi i32 [ %54, %46 ], [ %60, %56 ], [ %45, %42 ]
  %64 = add i32 %63, 1
  store i32 %64, i32* %62, align 4
  br label %76

65:                                               ; preds = %34
  br i1 %40, label %72, label %66

66:                                               ; preds = %65
  %67 = shl nuw i32 %36, 20
  %68 = or i32 %67, 3731
  %69 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %70 = load i32, i32* %69, align 4
  %71 = getelementptr i32, i32* %39, i32 %70
  store i32 %68, i32* %71, align 4
  br label %72

72:                                               ; preds = %66, %65
  %73 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %74 = load i32, i32* %73, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %73, align 4
  br label %76

76:                                               ; preds = %61, %72
  %77 = phi i32 [ %64, %61 ], [ %75, %72 ]
  %78 = icmp sgt i32 %21, -1
  %79 = load i32*, i32** %38, align 4
  %80 = icmp eq i32* %79, null
  br i1 %78, label %81, label %86

81:                                               ; preds = %76
  br i1 %80, label %91, label %82

82:                                               ; preds = %81
  %83 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %84 = getelementptr i32, i32* %79, i32 %77
  store i32 3859, i32* %84, align 4
  %85 = load i32, i32* %83, align 4
  br label %91

86:                                               ; preds = %76
  br i1 %80, label %91, label %87

87:                                               ; preds = %86
  %88 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %89 = getelementptr i32, i32* %79, i32 %77
  store i32 -1044717, i32* %89, align 4
  %90 = load i32, i32* %88, align 4
  br label %91

91:                                               ; preds = %86, %87, %81, %82
  %92 = phi i32 [ %85, %82 ], [ %77, %81 ], [ %90, %87 ], [ %77, %86 ]
  %93 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %94 = add i32 %92, 1
  store i32 %94, i32* %93, align 4
  br label %95

95:                                               ; preds = %91, %31
  %96 = phi i8* [ %29, %31 ], [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %91 ]
  %97 = and i8 %7, -16
  call fastcc void @emit_alu_r64(i8* %26, i8* %96, %struct.rv_jit_context* %1, i8 zeroext %97)
  br label %3989

98:                                               ; preds = %3
  call fastcc void @emit_alu_r64(i8* %26, i8* getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %struct.rv_jit_context* %1, i8 zeroext -128)
  br label %3989

99:                                               ; preds = %3, %3, %3, %3, %3, %3, %3
  %100 = and i8 %7, -16
  %101 = load i8, i8* %26, align 1
  %102 = lshr i32 3008, %25
  %103 = and i32 %102, 1
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %105, label %136

105:                                              ; preds = %99
  %106 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %107 = load i32*, i32** %106, align 4
  %108 = icmp eq i32* %107, null
  br i1 %108, label %109, label %113

109:                                              ; preds = %105
  %110 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %111 = load i32, i32* %110, align 4
  %112 = add i32 %111, 1
  store i32 %112, i32* %110, align 4
  br label %132

113:                                              ; preds = %105
  %114 = sext i8 %101 to i32
  %115 = shl nsw i32 %114, 20
  %116 = or i32 %115, 273923
  %117 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %118 = load i32, i32* %117, align 4
  %119 = getelementptr i32, i32* %107, i32 %118
  store i32 %116, i32* %119, align 4
  %120 = load i32*, i32** %106, align 4
  %121 = load i32, i32* %117, align 4
  %122 = add i32 %121, 1
  store i32 %122, i32* %117, align 4
  %123 = icmp eq i32* %120, null
  br i1 %123, label %132, label %124

124:                                              ; preds = %113
  %125 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %126 = load i8, i8* %125, align 1
  %127 = sext i8 %126 to i32
  %128 = shl nsw i32 %127, 20
  %129 = or i32 %128, 271235
  %130 = getelementptr i32, i32* %120, i32 %122
  store i32 %129, i32* %130, align 4
  %131 = load i32, i32* %117, align 4
  br label %132

132:                                              ; preds = %124, %113, %109
  %133 = phi i32* [ %117, %113 ], [ %117, %124 ], [ %110, %109 ]
  %134 = phi i32 [ %122, %113 ], [ %131, %124 ], [ %112, %109 ]
  %135 = add i32 %134, 1
  store i32 %135, i32* %133, align 4
  br label %136

136:                                              ; preds = %132, %99
  %137 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %132 ], [ %26, %99 ]
  %138 = zext i8 %100 to i32
  %139 = add nsw i32 %138, -64
  %140 = lshr exact i32 %139, 4
  switch i32 %140, label %823 [
    i32 7, label %141
    i32 1, label %226
    i32 0, label %313
    i32 6, label %400
    i32 2, label %489
    i32 3, label %601
    i32 8, label %713
  ]

141:                                              ; preds = %136
  %142 = getelementptr i8, i8* %137, i32 1
  %143 = load i8, i8* %142, align 1
  %144 = add i32 %21, 2048
  %145 = and i32 %21, 4095
  %146 = icmp ult i32 %144, 4096
  br i1 %146, label %180, label %147

147:                                              ; preds = %141
  %148 = zext i8 %143 to i32
  %149 = shl nuw nsw i32 %148, 7
  %150 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %151 = load i32*, i32** %150, align 4
  %152 = icmp eq i32* %151, null
  br i1 %152, label %153, label %157

153:                                              ; preds = %147
  %154 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %155 = load i32, i32* %154, align 4
  %156 = add i32 %155, 1
  store i32 %156, i32* %154, align 4
  br label %176

157:                                              ; preds = %147
  %158 = and i32 %144, -4096
  %159 = or i32 %158, %149
  %160 = or i32 %159, 55
  %161 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %162 = load i32, i32* %161, align 4
  %163 = getelementptr i32, i32* %151, i32 %162
  store i32 %160, i32* %163, align 4
  %164 = load i32*, i32** %150, align 4
  %165 = load i32, i32* %161, align 4
  %166 = add i32 %165, 1
  store i32 %166, i32* %161, align 4
  %167 = icmp eq i32* %164, null
  br i1 %167, label %176, label %168

168:                                              ; preds = %157
  %169 = shl nuw nsw i32 %148, 15
  %170 = shl nuw i32 %145, 20
  %171 = or i32 %170, %149
  %172 = or i32 %171, %169
  %173 = or i32 %172, 19
  %174 = getelementptr i32, i32* %164, i32 %166
  store i32 %173, i32* %174, align 4
  %175 = load i32, i32* %161, align 4
  br label %176

176:                                              ; preds = %168, %157, %153
  %177 = phi i32* [ %161, %157 ], [ %161, %168 ], [ %154, %153 ]
  %178 = phi i32 [ %166, %157 ], [ %175, %168 ], [ %156, %153 ]
  %179 = add i32 %178, 1
  store i32 %179, i32* %177, align 4
  br label %197

180:                                              ; preds = %141
  %181 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %182 = load i32*, i32** %181, align 4
  %183 = icmp eq i32* %182, null
  br i1 %183, label %193, label %184

184:                                              ; preds = %180
  %185 = zext i8 %143 to i32
  %186 = shl nuw nsw i32 %185, 7
  %187 = shl nuw i32 %145, 20
  %188 = or i32 %187, %186
  %189 = or i32 %188, 19
  %190 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %191 = load i32, i32* %190, align 4
  %192 = getelementptr i32, i32* %182, i32 %191
  store i32 %189, i32* %192, align 4
  br label %193

193:                                              ; preds = %184, %180
  %194 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %195 = load i32, i32* %194, align 4
  %196 = add i32 %195, 1
  store i32 %196, i32* %194, align 4
  br label %197

197:                                              ; preds = %193, %176
  %198 = phi i32 [ %179, %176 ], [ %196, %193 ]
  %199 = icmp sgt i32 %21, -1
  %200 = load i8, i8* %137, align 1
  %201 = zext i8 %200 to i32
  %202 = shl nuw nsw i32 %201, 7
  %203 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %204 = load i32*, i32** %203, align 4
  %205 = icmp eq i32* %204, null
  br i1 %199, label %206, label %216

206:                                              ; preds = %197
  br i1 %205, label %212, label %207

207:                                              ; preds = %206
  %208 = or i32 %202, 19
  %209 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %210 = getelementptr i32, i32* %204, i32 %198
  store i32 %208, i32* %210, align 4
  %211 = load i32, i32* %209, align 4
  br label %212

212:                                              ; preds = %207, %206
  %213 = phi i32 [ %211, %207 ], [ %198, %206 ]
  %214 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %215 = add i32 %213, 1
  store i32 %215, i32* %214, align 4
  br label %823

216:                                              ; preds = %197
  br i1 %205, label %222, label %217

217:                                              ; preds = %216
  %218 = or i32 %202, -1048557
  %219 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %220 = getelementptr i32, i32* %204, i32 %198
  store i32 %218, i32* %220, align 4
  %221 = load i32, i32* %219, align 4
  br label %222

222:                                              ; preds = %217, %216
  %223 = phi i32 [ %221, %217 ], [ %198, %216 ]
  %224 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %225 = add i32 %223, 1
  store i32 %225, i32* %224, align 4
  br label %823

226:                                              ; preds = %136
  %227 = add i32 %21, 2048
  %228 = icmp ult i32 %227, 4096
  br i1 %228, label %229, label %250

229:                                              ; preds = %226
  %230 = getelementptr i8, i8* %137, i32 1
  %231 = load i8, i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %234 = load i32*, i32** %233, align 4
  %235 = icmp eq i32* %234, null
  br i1 %235, label %246, label %236

236:                                              ; preds = %229
  %237 = shl nuw nsw i32 %232, 7
  %238 = shl nuw nsw i32 %232, 15
  %239 = shl nsw i32 %21, 20
  %240 = or i32 %239, %238
  %241 = or i32 %240, %237
  %242 = or i32 %241, 28691
  %243 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %244 = load i32, i32* %243, align 4
  %245 = getelementptr i32, i32* %234, i32 %244
  store i32 %242, i32* %245, align 4
  br label %246

246:                                              ; preds = %236, %229
  %247 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %248 = load i32, i32* %247, align 4
  %249 = add i32 %248, 1
  store i32 %249, i32* %247, align 4
  br label %294

250:                                              ; preds = %226
  %251 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %252 = load i32*, i32** %251, align 4
  %253 = icmp eq i32* %252, null
  br i1 %253, label %254, label %258

254:                                              ; preds = %250
  %255 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %256 = load i32, i32* %255, align 4
  %257 = add i32 %256, 1
  store i32 %257, i32* %255, align 4
  br label %268

258:                                              ; preds = %250
  %259 = and i32 %227, -4096
  %260 = or i32 %259, 695
  %261 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %262 = load i32, i32* %261, align 4
  %263 = getelementptr i32, i32* %252, i32 %262
  store i32 %260, i32* %263, align 4
  %264 = load i32*, i32** %251, align 4
  %265 = load i32, i32* %261, align 4
  %266 = add i32 %265, 1
  store i32 %266, i32* %261, align 4
  %267 = icmp eq i32* %264, null
  br i1 %267, label %268, label %272

268:                                              ; preds = %258, %254
  %269 = phi i32* [ %255, %254 ], [ %261, %258 ]
  %270 = phi i32 [ %257, %254 ], [ %266, %258 ]
  %271 = add i32 %270, 1
  store i32 %271, i32* %269, align 4
  br label %290

272:                                              ; preds = %258
  %273 = shl i32 %21, 20
  %274 = or i32 %273, 164499
  %275 = getelementptr i32, i32* %264, i32 %266
  store i32 %274, i32* %275, align 4
  %276 = load i32, i32* %261, align 4
  %277 = load i32*, i32** %251, align 4
  %278 = add i32 %276, 1
  store i32 %278, i32* %261, align 4
  %279 = getelementptr i8, i8* %137, i32 1
  %280 = load i8, i8* %279, align 1
  %281 = zext i8 %280 to i32
  %282 = icmp eq i32* %277, null
  br i1 %282, label %290, label %283

283:                                              ; preds = %272
  %284 = shl nuw nsw i32 %281, 7
  %285 = shl nuw nsw i32 %281, 15
  %286 = or i32 %284, %285
  %287 = or i32 %286, 5271603
  %288 = getelementptr i32, i32* %277, i32 %278
  store i32 %287, i32* %288, align 4
  %289 = load i32, i32* %261, align 4
  br label %290

290:                                              ; preds = %283, %272, %268
  %291 = phi i32 [ %278, %272 ], [ %289, %283 ], [ %271, %268 ]
  %292 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %293 = add i32 %291, 1
  store i32 %293, i32* %292, align 4
  br label %294

294:                                              ; preds = %290, %246
  %295 = phi i32 [ %293, %290 ], [ %249, %246 ]
  %296 = icmp sgt i32 %21, -1
  br i1 %296, label %297, label %823

297:                                              ; preds = %294
  %298 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %299 = load i32*, i32** %298, align 4
  %300 = icmp eq i32* %299, null
  br i1 %300, label %309, label %301

301:                                              ; preds = %297
  %302 = load i8, i8* %137, align 1
  %303 = zext i8 %302 to i32
  %304 = shl nuw nsw i32 %303, 7
  %305 = or i32 %304, 19
  %306 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %307 = getelementptr i32, i32* %299, i32 %295
  store i32 %305, i32* %307, align 4
  %308 = load i32, i32* %306, align 4
  br label %309

309:                                              ; preds = %301, %297
  %310 = phi i32 [ %295, %297 ], [ %308, %301 ]
  %311 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %312 = add i32 %310, 1
  store i32 %312, i32* %311, align 4
  br label %823

313:                                              ; preds = %136
  %314 = add i32 %21, 2048
  %315 = icmp ult i32 %314, 4096
  br i1 %315, label %316, label %337

316:                                              ; preds = %313
  %317 = getelementptr i8, i8* %137, i32 1
  %318 = load i8, i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %321 = load i32*, i32** %320, align 4
  %322 = icmp eq i32* %321, null
  br i1 %322, label %333, label %323

323:                                              ; preds = %316
  %324 = shl nuw nsw i32 %319, 7
  %325 = shl nuw nsw i32 %319, 15
  %326 = shl nsw i32 %21, 20
  %327 = or i32 %326, %325
  %328 = or i32 %327, %324
  %329 = or i32 %328, 24595
  %330 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %331 = load i32, i32* %330, align 4
  %332 = getelementptr i32, i32* %321, i32 %331
  store i32 %329, i32* %332, align 4
  br label %333

333:                                              ; preds = %323, %316
  %334 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %335 = load i32, i32* %334, align 4
  %336 = add i32 %335, 1
  store i32 %336, i32* %334, align 4
  br label %381

337:                                              ; preds = %313
  %338 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %339 = load i32*, i32** %338, align 4
  %340 = icmp eq i32* %339, null
  br i1 %340, label %341, label %345

341:                                              ; preds = %337
  %342 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %343 = load i32, i32* %342, align 4
  %344 = add i32 %343, 1
  store i32 %344, i32* %342, align 4
  br label %355

345:                                              ; preds = %337
  %346 = and i32 %314, -4096
  %347 = or i32 %346, 695
  %348 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %349 = load i32, i32* %348, align 4
  %350 = getelementptr i32, i32* %339, i32 %349
  store i32 %347, i32* %350, align 4
  %351 = load i32*, i32** %338, align 4
  %352 = load i32, i32* %348, align 4
  %353 = add i32 %352, 1
  store i32 %353, i32* %348, align 4
  %354 = icmp eq i32* %351, null
  br i1 %354, label %355, label %359

355:                                              ; preds = %345, %341
  %356 = phi i32* [ %342, %341 ], [ %348, %345 ]
  %357 = phi i32 [ %344, %341 ], [ %353, %345 ]
  %358 = add i32 %357, 1
  store i32 %358, i32* %356, align 4
  br label %377

359:                                              ; preds = %345
  %360 = shl i32 %21, 20
  %361 = or i32 %360, 164499
  %362 = getelementptr i32, i32* %351, i32 %353
  store i32 %361, i32* %362, align 4
  %363 = load i32, i32* %348, align 4
  %364 = load i32*, i32** %338, align 4
  %365 = add i32 %363, 1
  store i32 %365, i32* %348, align 4
  %366 = getelementptr i8, i8* %137, i32 1
  %367 = load i8, i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = icmp eq i32* %364, null
  br i1 %369, label %377, label %370

370:                                              ; preds = %359
  %371 = shl nuw nsw i32 %368, 7
  %372 = shl nuw nsw i32 %368, 15
  %373 = or i32 %371, %372
  %374 = or i32 %373, 5267507
  %375 = getelementptr i32, i32* %364, i32 %365
  store i32 %374, i32* %375, align 4
  %376 = load i32, i32* %348, align 4
  br label %377

377:                                              ; preds = %370, %359, %355
  %378 = phi i32 [ %365, %359 ], [ %376, %370 ], [ %358, %355 ]
  %379 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %380 = add i32 %378, 1
  store i32 %380, i32* %379, align 4
  br label %381

381:                                              ; preds = %377, %333
  %382 = phi i32 [ %380, %377 ], [ %336, %333 ]
  %383 = icmp slt i32 %21, 0
  br i1 %383, label %384, label %823

384:                                              ; preds = %381
  %385 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %386 = load i32*, i32** %385, align 4
  %387 = icmp eq i32* %386, null
  br i1 %387, label %396, label %388

388:                                              ; preds = %384
  %389 = load i8, i8* %137, align 1
  %390 = zext i8 %389 to i32
  %391 = shl nuw nsw i32 %390, 7
  %392 = or i32 %391, -1023981
  %393 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %394 = getelementptr i32, i32* %386, i32 %382
  store i32 %392, i32* %394, align 4
  %395 = load i32, i32* %393, align 4
  br label %396

396:                                              ; preds = %388, %384
  %397 = phi i32 [ %382, %384 ], [ %395, %388 ]
  %398 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %399 = add i32 %397, 1
  store i32 %399, i32* %398, align 4
  br label %823

400:                                              ; preds = %136
  %401 = add i32 %21, 2048
  %402 = icmp ult i32 %401, 4096
  br i1 %402, label %403, label %424

403:                                              ; preds = %400
  %404 = getelementptr i8, i8* %137, i32 1
  %405 = load i8, i8* %404, align 1
  %406 = zext i8 %405 to i32
  %407 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %408 = load i32*, i32** %407, align 4
  %409 = icmp eq i32* %408, null
  br i1 %409, label %420, label %410

410:                                              ; preds = %403
  %411 = shl nuw nsw i32 %406, 7
  %412 = shl nuw nsw i32 %406, 15
  %413 = shl nsw i32 %21, 20
  %414 = or i32 %413, %412
  %415 = or i32 %414, %411
  %416 = or i32 %415, 16403
  %417 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %418 = load i32, i32* %417, align 4
  %419 = getelementptr i32, i32* %408, i32 %418
  store i32 %416, i32* %419, align 4
  br label %420

420:                                              ; preds = %410, %403
  %421 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %422 = load i32, i32* %421, align 4
  %423 = add i32 %422, 1
  store i32 %423, i32* %421, align 4
  br label %468

424:                                              ; preds = %400
  %425 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %426 = load i32*, i32** %425, align 4
  %427 = icmp eq i32* %426, null
  br i1 %427, label %428, label %432

428:                                              ; preds = %424
  %429 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %430 = load i32, i32* %429, align 4
  %431 = add i32 %430, 1
  store i32 %431, i32* %429, align 4
  br label %442

432:                                              ; preds = %424
  %433 = and i32 %401, -4096
  %434 = or i32 %433, 695
  %435 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %436 = load i32, i32* %435, align 4
  %437 = getelementptr i32, i32* %426, i32 %436
  store i32 %434, i32* %437, align 4
  %438 = load i32*, i32** %425, align 4
  %439 = load i32, i32* %435, align 4
  %440 = add i32 %439, 1
  store i32 %440, i32* %435, align 4
  %441 = icmp eq i32* %438, null
  br i1 %441, label %442, label %446

442:                                              ; preds = %432, %428
  %443 = phi i32* [ %429, %428 ], [ %435, %432 ]
  %444 = phi i32 [ %431, %428 ], [ %440, %432 ]
  %445 = add i32 %444, 1
  store i32 %445, i32* %443, align 4
  br label %464

446:                                              ; preds = %432
  %447 = shl i32 %21, 20
  %448 = or i32 %447, 164499
  %449 = getelementptr i32, i32* %438, i32 %440
  store i32 %448, i32* %449, align 4
  %450 = load i32, i32* %435, align 4
  %451 = load i32*, i32** %425, align 4
  %452 = add i32 %450, 1
  store i32 %452, i32* %435, align 4
  %453 = getelementptr i8, i8* %137, i32 1
  %454 = load i8, i8* %453, align 1
  %455 = zext i8 %454 to i32
  %456 = icmp eq i32* %451, null
  br i1 %456, label %464, label %457

457:                                              ; preds = %446
  %458 = shl nuw nsw i32 %455, 7
  %459 = shl nuw nsw i32 %455, 15
  %460 = or i32 %458, %459
  %461 = or i32 %460, 5259315
  %462 = getelementptr i32, i32* %451, i32 %452
  store i32 %461, i32* %462, align 4
  %463 = load i32, i32* %435, align 4
  br label %464

464:                                              ; preds = %457, %446, %442
  %465 = phi i32 [ %452, %446 ], [ %463, %457 ], [ %445, %442 ]
  %466 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %467 = add i32 %465, 1
  store i32 %467, i32* %466, align 4
  br label %468

468:                                              ; preds = %464, %420
  %469 = phi i32 [ %467, %464 ], [ %423, %420 ]
  %470 = icmp slt i32 %21, 0
  br i1 %470, label %471, label %823

471:                                              ; preds = %468
  %472 = load i8, i8* %137, align 1
  %473 = zext i8 %472 to i32
  %474 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %475 = load i32*, i32** %474, align 4
  %476 = icmp eq i32* %475, null
  br i1 %476, label %485, label %477

477:                                              ; preds = %471
  %478 = shl nuw nsw i32 %473, 7
  %479 = shl nuw nsw i32 %473, 15
  %480 = or i32 %478, %479
  %481 = or i32 %480, -1032173
  %482 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %483 = getelementptr i32, i32* %475, i32 %469
  store i32 %481, i32* %483, align 4
  %484 = load i32, i32* %482, align 4
  br label %485

485:                                              ; preds = %477, %471
  %486 = phi i32 [ %469, %471 ], [ %484, %477 ]
  %487 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %488 = add i32 %486, 1
  store i32 %488, i32* %487, align 4
  br label %823

489:                                              ; preds = %136
  %490 = icmp sgt i32 %21, 31
  br i1 %490, label %491, label %530

491:                                              ; preds = %489
  %492 = getelementptr i8, i8* %137, i32 1
  %493 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %494 = load i32*, i32** %493, align 4
  %495 = icmp eq i32* %494, null
  br i1 %495, label %496, label %500

496:                                              ; preds = %491
  %497 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %498 = load i32, i32* %497, align 4
  %499 = add i32 %498, 1
  store i32 %499, i32* %497, align 4
  br label %526

500:                                              ; preds = %491
  %501 = load i8, i8* %137, align 1
  %502 = zext i8 %501 to i32
  %503 = shl nuw nsw i32 %502, 7
  %504 = load i8, i8* %492, align 1
  %505 = zext i8 %504 to i32
  %506 = shl nuw nsw i32 %505, 15
  %507 = shl i32 %21, 20
  %508 = add i32 %507, -33554432
  %509 = or i32 %508, %503
  %510 = or i32 %509, %506
  %511 = or i32 %510, 4115
  %512 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %513 = load i32, i32* %512, align 4
  %514 = getelementptr i32, i32* %494, i32 %513
  store i32 %511, i32* %514, align 4
  %515 = load i32*, i32** %493, align 4
  %516 = load i32, i32* %512, align 4
  %517 = add i32 %516, 1
  store i32 %517, i32* %512, align 4
  %518 = icmp eq i32* %515, null
  br i1 %518, label %526, label %519

519:                                              ; preds = %500
  %520 = load i8, i8* %492, align 1
  %521 = zext i8 %520 to i32
  %522 = shl nuw nsw i32 %521, 7
  %523 = or i32 %522, 19
  %524 = getelementptr i32, i32* %515, i32 %517
  store i32 %523, i32* %524, align 4
  %525 = load i32, i32* %512, align 4
  br label %526

526:                                              ; preds = %519, %500, %496
  %527 = phi i32* [ %512, %500 ], [ %512, %519 ], [ %497, %496 ]
  %528 = phi i32 [ %517, %500 ], [ %525, %519 ], [ %499, %496 ]
  %529 = add i32 %528, 1
  store i32 %529, i32* %527, align 4
  br label %823

530:                                              ; preds = %489
  %531 = icmp eq i32 %21, 0
  br i1 %531, label %823, label %532

532:                                              ; preds = %530
  %533 = getelementptr i8, i8* %137, i32 1
  %534 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %535 = load i32*, i32** %534, align 4
  %536 = icmp eq i32* %535, null
  br i1 %536, label %537, label %539

537:                                              ; preds = %532
  %538 = shl i32 %21, 20
  br label %551

539:                                              ; preds = %532
  %540 = load i8, i8* %533, align 1
  %541 = zext i8 %540 to i32
  %542 = shl nuw nsw i32 %541, 15
  %543 = shl i32 %21, 20
  %544 = sub i32 33554432, %543
  %545 = or i32 %544, %542
  %546 = or i32 %545, 21139
  %547 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %548 = load i32, i32* %547, align 4
  %549 = getelementptr i32, i32* %535, i32 %548
  store i32 %546, i32* %549, align 4
  %550 = load i32*, i32** %534, align 4
  br label %551

551:                                              ; preds = %539, %537
  %552 = phi i32 [ %538, %537 ], [ %543, %539 ]
  %553 = phi i32* [ null, %537 ], [ %550, %539 ]
  %554 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %555 = load i32, i32* %554, align 4
  %556 = add i32 %555, 1
  store i32 %556, i32* %554, align 4
  %557 = load i8, i8* %137, align 1
  %558 = zext i8 %557 to i32
  %559 = icmp eq i32* %553, null
  br i1 %559, label %560, label %562

560:                                              ; preds = %551
  %561 = add i32 %555, 2
  store i32 %561, i32* %554, align 4
  br label %575

562:                                              ; preds = %551
  %563 = shl nuw nsw i32 %558, 7
  %564 = shl nuw nsw i32 %558, 15
  %565 = or i32 %552, %564
  %566 = or i32 %565, %563
  %567 = or i32 %566, 4115
  %568 = getelementptr i32, i32* %553, i32 %556
  store i32 %567, i32* %568, align 4
  %569 = load i32, i32* %554, align 4
  %570 = load i32*, i32** %534, align 4
  %571 = add i32 %569, 1
  store i32 %571, i32* %554, align 4
  %572 = load i8, i8* %137, align 1
  %573 = zext i8 %572 to i32
  %574 = icmp eq i32* %570, null
  br i1 %574, label %575, label %578

575:                                              ; preds = %562, %560
  %576 = phi i32 [ %561, %560 ], [ %571, %562 ]
  %577 = add i32 %576, 1
  store i32 %577, i32* %554, align 4
  br label %598

578:                                              ; preds = %562
  %579 = shl nuw nsw i32 %573, 7
  %580 = shl nuw nsw i32 %573, 20
  %581 = or i32 %579, %580
  %582 = or i32 %581, 188467
  %583 = getelementptr i32, i32* %570, i32 %571
  store i32 %582, i32* %583, align 4
  %584 = load i32, i32* %554, align 4
  %585 = load i32*, i32** %534, align 4
  %586 = add i32 %584, 1
  store i32 %586, i32* %554, align 4
  %587 = load i8, i8* %533, align 1
  %588 = zext i8 %587 to i32
  %589 = icmp eq i32* %585, null
  br i1 %589, label %598, label %590

590:                                              ; preds = %578
  %591 = shl nuw nsw i32 %588, 7
  %592 = shl nuw nsw i32 %588, 15
  %593 = or i32 %552, %592
  %594 = or i32 %593, %591
  %595 = or i32 %594, 4115
  %596 = getelementptr i32, i32* %585, i32 %586
  store i32 %595, i32* %596, align 4
  %597 = load i32, i32* %554, align 4
  br label %598

598:                                              ; preds = %590, %578, %575
  %599 = phi i32 [ %586, %578 ], [ %597, %590 ], [ %577, %575 ]
  %600 = add i32 %599, 1
  store i32 %600, i32* %554, align 4
  br label %823

601:                                              ; preds = %136
  %602 = icmp sgt i32 %21, 31
  br i1 %602, label %603, label %642

603:                                              ; preds = %601
  %604 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %605 = load i32*, i32** %604, align 4
  %606 = icmp eq i32* %605, null
  br i1 %606, label %607, label %611

607:                                              ; preds = %603
  %608 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %609 = load i32, i32* %608, align 4
  %610 = add i32 %609, 1
  store i32 %610, i32* %608, align 4
  br label %638

611:                                              ; preds = %603
  %612 = getelementptr i8, i8* %137, i32 1
  %613 = load i8, i8* %612, align 1
  %614 = zext i8 %613 to i32
  %615 = shl nuw nsw i32 %614, 7
  %616 = load i8, i8* %137, align 1
  %617 = zext i8 %616 to i32
  %618 = shl nuw nsw i32 %617, 15
  %619 = shl i32 %21, 20
  %620 = add i32 %619, -33554432
  %621 = or i32 %620, %615
  %622 = or i32 %621, %618
  %623 = or i32 %622, 20499
  %624 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %625 = load i32, i32* %624, align 4
  %626 = getelementptr i32, i32* %605, i32 %625
  store i32 %623, i32* %626, align 4
  %627 = load i32*, i32** %604, align 4
  %628 = load i32, i32* %624, align 4
  %629 = add i32 %628, 1
  store i32 %629, i32* %624, align 4
  %630 = icmp eq i32* %627, null
  br i1 %630, label %638, label %631

631:                                              ; preds = %611
  %632 = load i8, i8* %137, align 1
  %633 = zext i8 %632 to i32
  %634 = shl nuw nsw i32 %633, 7
  %635 = or i32 %634, 19
  %636 = getelementptr i32, i32* %627, i32 %629
  store i32 %635, i32* %636, align 4
  %637 = load i32, i32* %624, align 4
  br label %638

638:                                              ; preds = %631, %611, %607
  %639 = phi i32* [ %624, %611 ], [ %624, %631 ], [ %608, %607 ]
  %640 = phi i32 [ %629, %611 ], [ %637, %631 ], [ %610, %607 ]
  %641 = add i32 %640, 1
  store i32 %641, i32* %639, align 4
  br label %823

642:                                              ; preds = %601
  %643 = icmp eq i32 %21, 0
  br i1 %643, label %823, label %644

644:                                              ; preds = %642
  %645 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %646 = load i32*, i32** %645, align 4
  %647 = icmp eq i32* %646, null
  br i1 %647, label %648, label %650

648:                                              ; preds = %644
  %649 = shl i32 %21, 20
  br label %662

650:                                              ; preds = %644
  %651 = load i8, i8* %137, align 1
  %652 = zext i8 %651 to i32
  %653 = shl nuw nsw i32 %652, 15
  %654 = shl i32 %21, 20
  %655 = sub i32 33554432, %654
  %656 = or i32 %655, %653
  %657 = or i32 %656, 4755
  %658 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %659 = load i32, i32* %658, align 4
  %660 = getelementptr i32, i32* %646, i32 %659
  store i32 %657, i32* %660, align 4
  %661 = load i32*, i32** %645, align 4
  br label %662

662:                                              ; preds = %650, %648
  %663 = phi i32 [ %649, %648 ], [ %654, %650 ]
  %664 = phi i32* [ null, %648 ], [ %661, %650 ]
  %665 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %666 = load i32, i32* %665, align 4
  %667 = add i32 %666, 1
  store i32 %667, i32* %665, align 4
  %668 = getelementptr i8, i8* %137, i32 1
  %669 = load i8, i8* %668, align 1
  %670 = zext i8 %669 to i32
  %671 = icmp eq i32* %664, null
  br i1 %671, label %672, label %674

672:                                              ; preds = %662
  %673 = add i32 %666, 2
  store i32 %673, i32* %665, align 4
  br label %687

674:                                              ; preds = %662
  %675 = shl nuw nsw i32 %670, 7
  %676 = shl nuw nsw i32 %670, 15
  %677 = or i32 %663, %676
  %678 = or i32 %677, %675
  %679 = or i32 %678, 20499
  %680 = getelementptr i32, i32* %664, i32 %667
  store i32 %679, i32* %680, align 4
  %681 = load i32, i32* %665, align 4
  %682 = load i32*, i32** %645, align 4
  %683 = add i32 %681, 1
  store i32 %683, i32* %665, align 4
  %684 = load i8, i8* %668, align 1
  %685 = zext i8 %684 to i32
  %686 = icmp eq i32* %682, null
  br i1 %686, label %687, label %690

687:                                              ; preds = %674, %672
  %688 = phi i32 [ %673, %672 ], [ %683, %674 ]
  %689 = add i32 %688, 1
  store i32 %689, i32* %665, align 4
  br label %710

690:                                              ; preds = %674
  %691 = shl nuw nsw i32 %685, 7
  %692 = shl nuw nsw i32 %685, 20
  %693 = or i32 %691, %692
  %694 = or i32 %693, 188467
  %695 = getelementptr i32, i32* %682, i32 %683
  store i32 %694, i32* %695, align 4
  %696 = load i32, i32* %665, align 4
  %697 = load i32*, i32** %645, align 4
  %698 = add i32 %696, 1
  store i32 %698, i32* %665, align 4
  %699 = load i8, i8* %137, align 1
  %700 = zext i8 %699 to i32
  %701 = icmp eq i32* %697, null
  br i1 %701, label %710, label %702

702:                                              ; preds = %690
  %703 = shl nuw nsw i32 %700, 7
  %704 = shl nuw nsw i32 %700, 15
  %705 = or i32 %663, %704
  %706 = or i32 %705, %703
  %707 = or i32 %706, 20499
  %708 = getelementptr i32, i32* %697, i32 %698
  store i32 %707, i32* %708, align 4
  %709 = load i32, i32* %665, align 4
  br label %710

710:                                              ; preds = %702, %690, %687
  %711 = phi i32 [ %698, %690 ], [ %709, %702 ], [ %689, %687 ]
  %712 = add i32 %711, 1
  store i32 %712, i32* %665, align 4
  br label %823

713:                                              ; preds = %136
  %714 = icmp sgt i32 %21, 31
  br i1 %714, label %715, label %754

715:                                              ; preds = %713
  %716 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %717 = load i32*, i32** %716, align 4
  %718 = icmp eq i32* %717, null
  br i1 %718, label %736, label %719

719:                                              ; preds = %715
  %720 = getelementptr i8, i8* %137, i32 1
  %721 = load i8, i8* %720, align 1
  %722 = zext i8 %721 to i32
  %723 = shl nuw nsw i32 %722, 7
  %724 = load i8, i8* %137, align 1
  %725 = zext i8 %724 to i32
  %726 = shl nuw nsw i32 %725, 15
  %727 = shl i32 %21, 20
  %728 = add i32 %727, -33554432
  %729 = or i32 %728, %723
  %730 = or i32 %729, %726
  %731 = or i32 %730, 1073762323
  %732 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %733 = load i32, i32* %732, align 4
  %734 = getelementptr i32, i32* %717, i32 %733
  store i32 %731, i32* %734, align 4
  %735 = load i32*, i32** %716, align 4
  br label %736

736:                                              ; preds = %719, %715
  %737 = phi i32* [ null, %715 ], [ %735, %719 ]
  %738 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %739 = load i32, i32* %738, align 4
  %740 = add i32 %739, 1
  store i32 %740, i32* %738, align 4
  %741 = load i8, i8* %137, align 1
  %742 = zext i8 %741 to i32
  %743 = icmp eq i32* %737, null
  br i1 %743, label %751, label %744

744:                                              ; preds = %736
  %745 = shl nuw nsw i32 %742, 7
  %746 = shl nuw nsw i32 %742, 15
  %747 = or i32 %745, %746
  %748 = or i32 %747, 1106268179
  %749 = getelementptr i32, i32* %737, i32 %740
  store i32 %748, i32* %749, align 4
  %750 = load i32, i32* %738, align 4
  br label %751

751:                                              ; preds = %744, %736
  %752 = phi i32 [ %740, %736 ], [ %750, %744 ]
  %753 = add i32 %752, 1
  store i32 %753, i32* %738, align 4
  br label %823

754:                                              ; preds = %713
  %755 = icmp eq i32 %21, 0
  br i1 %755, label %823, label %756

756:                                              ; preds = %754
  %757 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %758 = load i32*, i32** %757, align 4
  %759 = icmp eq i32* %758, null
  br i1 %759, label %772, label %760

760:                                              ; preds = %756
  %761 = load i8, i8* %137, align 1
  %762 = zext i8 %761 to i32
  %763 = shl nuw nsw i32 %762, 15
  %764 = shl i32 %21, 20
  %765 = sub i32 33554432, %764
  %766 = or i32 %765, %763
  %767 = or i32 %766, 4755
  %768 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %769 = load i32, i32* %768, align 4
  %770 = getelementptr i32, i32* %758, i32 %769
  store i32 %767, i32* %770, align 4
  %771 = load i32*, i32** %757, align 4
  br label %772

772:                                              ; preds = %760, %756
  %773 = phi i32* [ null, %756 ], [ %771, %760 ]
  %774 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %775 = load i32, i32* %774, align 4
  %776 = add i32 %775, 1
  store i32 %776, i32* %774, align 4
  %777 = getelementptr i8, i8* %137, i32 1
  %778 = load i8, i8* %777, align 1
  %779 = zext i8 %778 to i32
  %780 = icmp eq i32* %773, null
  br i1 %780, label %781, label %783

781:                                              ; preds = %772
  %782 = add i32 %775, 2
  store i32 %782, i32* %774, align 4
  br label %797

783:                                              ; preds = %772
  %784 = shl nuw nsw i32 %779, 7
  %785 = shl nuw nsw i32 %779, 15
  %786 = shl i32 %21, 20
  %787 = or i32 %786, %785
  %788 = or i32 %787, %784
  %789 = or i32 %788, 20499
  %790 = getelementptr i32, i32* %773, i32 %776
  store i32 %789, i32* %790, align 4
  %791 = load i32, i32* %774, align 4
  %792 = load i32*, i32** %757, align 4
  %793 = add i32 %791, 1
  store i32 %793, i32* %774, align 4
  %794 = load i8, i8* %777, align 1
  %795 = zext i8 %794 to i32
  %796 = icmp eq i32* %792, null
  br i1 %796, label %797, label %800

797:                                              ; preds = %783, %781
  %798 = phi i32 [ %782, %781 ], [ %793, %783 ]
  %799 = add i32 %798, 1
  store i32 %799, i32* %774, align 4
  br label %820

800:                                              ; preds = %783
  %801 = shl nuw nsw i32 %795, 7
  %802 = shl nuw nsw i32 %795, 20
  %803 = or i32 %801, %802
  %804 = or i32 %803, 188467
  %805 = getelementptr i32, i32* %792, i32 %793
  store i32 %804, i32* %805, align 4
  %806 = load i32, i32* %774, align 4
  %807 = load i32*, i32** %757, align 4
  %808 = add i32 %806, 1
  store i32 %808, i32* %774, align 4
  %809 = load i8, i8* %137, align 1
  %810 = zext i8 %809 to i32
  %811 = icmp eq i32* %807, null
  br i1 %811, label %820, label %812

812:                                              ; preds = %800
  %813 = shl nuw nsw i32 %810, 7
  %814 = shl nuw nsw i32 %810, 15
  %815 = or i32 %786, %814
  %816 = or i32 %815, %813
  %817 = or i32 %816, 1073762323
  %818 = getelementptr i32, i32* %807, i32 %808
  store i32 %817, i32* %818, align 4
  %819 = load i32, i32* %774, align 4
  br label %820

820:                                              ; preds = %812, %800, %797
  %821 = phi i32 [ %808, %800 ], [ %819, %812 ], [ %799, %797 ]
  %822 = add i32 %821, 1
  store i32 %822, i32* %774, align 4
  br label %823

823:                                              ; preds = %820, %754, %751, %710, %642, %638, %598, %530, %526, %485, %468, %396, %381, %309, %294, %222, %212, %136
  br i1 %104, label %824, label %3989

824:                                              ; preds = %823
  %825 = sext i8 %101 to i16
  %826 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %827 = load i32*, i32** %826, align 4
  %828 = icmp eq i32* %827, null
  br i1 %828, label %846, label %829

829:                                              ; preds = %824
  %830 = lshr i16 %825, 5
  %831 = zext i16 %830 to i32
  %832 = shl i32 %831, 25
  %833 = load i8, i8* %137, align 1
  %834 = zext i8 %833 to i32
  %835 = shl nuw nsw i32 %834, 20
  %836 = shl nsw i16 %825, 7
  %837 = and i16 %836, 3968
  %838 = zext i16 %837 to i32
  %839 = or i32 %832, %838
  %840 = or i32 %839, %835
  %841 = or i32 %840, 270371
  %842 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %843 = load i32, i32* %842, align 4
  %844 = getelementptr i32, i32* %827, i32 %843
  store i32 %841, i32* %844, align 4
  %845 = load i32*, i32** %826, align 4
  br label %846

846:                                              ; preds = %829, %824
  %847 = phi i32* [ null, %824 ], [ %845, %829 ]
  %848 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %849 = load i32, i32* %848, align 4
  %850 = add i32 %849, 1
  store i32 %850, i32* %848, align 4
  %851 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %852 = load i8, i8* %851, align 1
  %853 = sext i8 %852 to i16
  %854 = icmp eq i32* %847, null
  br i1 %854, label %871, label %855

855:                                              ; preds = %846
  %856 = lshr i16 %853, 5
  %857 = zext i16 %856 to i32
  %858 = shl i32 %857, 25
  %859 = getelementptr i8, i8* %137, i32 1
  %860 = load i8, i8* %859, align 1
  %861 = zext i8 %860 to i32
  %862 = shl nuw nsw i32 %861, 20
  %863 = shl nsw i16 %853, 7
  %864 = and i16 %863, 3968
  %865 = zext i16 %864 to i32
  %866 = or i32 %858, %865
  %867 = or i32 %866, %862
  %868 = or i32 %867, 270371
  %869 = getelementptr i32, i32* %847, i32 %850
  store i32 %868, i32* %869, align 4
  %870 = load i32, i32* %848, align 4
  br label %871

871:                                              ; preds = %855, %846
  %872 = phi i32 [ %850, %846 ], [ %870, %855 ]
  %873 = add i32 %872, 1
  store i32 %873, i32* %848, align 4
  br label %3989

874:                                              ; preds = %3
  %875 = icmp eq i32 %21, 1
  br i1 %875, label %876, label %1043

876:                                              ; preds = %874
  %877 = load i8, i8* %26, align 1
  %878 = lshr i32 3008, %25
  %879 = and i32 %878, 1
  %880 = icmp ne i32 %879, 0
  br i1 %880, label %881, label %912

881:                                              ; preds = %876
  %882 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %883 = load i32*, i32** %882, align 4
  %884 = icmp eq i32* %883, null
  br i1 %884, label %885, label %889

885:                                              ; preds = %881
  %886 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %887 = load i32, i32* %886, align 4
  %888 = add i32 %887, 1
  store i32 %888, i32* %886, align 4
  br label %908

889:                                              ; preds = %881
  %890 = sext i8 %877 to i32
  %891 = shl nsw i32 %890, 20
  %892 = or i32 %891, 273923
  %893 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %894 = load i32, i32* %893, align 4
  %895 = getelementptr i32, i32* %883, i32 %894
  store i32 %892, i32* %895, align 4
  %896 = load i32*, i32** %882, align 4
  %897 = load i32, i32* %893, align 4
  %898 = add i32 %897, 1
  store i32 %898, i32* %893, align 4
  %899 = icmp eq i32* %896, null
  br i1 %899, label %908, label %900

900:                                              ; preds = %889
  %901 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %902 = load i8, i8* %901, align 1
  %903 = sext i8 %902 to i32
  %904 = shl nsw i32 %903, 20
  %905 = or i32 %904, 271235
  %906 = getelementptr i32, i32* %896, i32 %898
  store i32 %905, i32* %906, align 4
  %907 = load i32, i32* %893, align 4
  br label %908

908:                                              ; preds = %900, %889, %885
  %909 = phi i32* [ %893, %889 ], [ %893, %900 ], [ %886, %885 ]
  %910 = phi i32 [ %898, %889 ], [ %907, %900 ], [ %888, %885 ]
  %911 = add i32 %910, 1
  store i32 %911, i32* %909, align 4
  br label %912

912:                                              ; preds = %908, %876
  %913 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %908 ], [ %26, %876 ]
  %914 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %915 = load i32*, i32** %914, align 4
  %916 = icmp eq i32* %915, null
  br i1 %916, label %925, label %917

917:                                              ; preds = %912
  %918 = load i8, i8* %913, align 1
  %919 = zext i8 %918 to i32
  %920 = shl nuw nsw i32 %919, 7
  %921 = or i32 %920, 19
  %922 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %923 = load i32, i32* %922, align 4
  %924 = getelementptr i32, i32* %915, i32 %923
  store i32 %921, i32* %924, align 4
  br label %925

925:                                              ; preds = %917, %912
  %926 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %927 = load i32, i32* %926, align 4
  %928 = add i32 %927, 1
  store i32 %928, i32* %926, align 4
  br i1 %880, label %929, label %3989

929:                                              ; preds = %925
  %930 = sext i8 %877 to i16
  %931 = load i32*, i32** %914, align 4
  %932 = icmp eq i32* %931, null
  br i1 %932, label %933, label %935

933:                                              ; preds = %929
  %934 = add i32 %927, 2
  store i32 %934, i32* %926, align 4
  br label %972

935:                                              ; preds = %929
  %936 = lshr i16 %930, 5
  %937 = zext i16 %936 to i32
  %938 = shl i32 %937, 25
  %939 = load i8, i8* %913, align 1
  %940 = zext i8 %939 to i32
  %941 = shl nuw nsw i32 %940, 20
  %942 = shl nsw i16 %930, 7
  %943 = and i16 %942, 3968
  %944 = zext i16 %943 to i32
  %945 = or i32 %938, %944
  %946 = or i32 %945, %941
  %947 = or i32 %946, 270371
  %948 = getelementptr i32, i32* %931, i32 %928
  store i32 %947, i32* %948, align 4
  %949 = load i32*, i32** %914, align 4
  %950 = load i32, i32* %926, align 4
  %951 = add i32 %950, 1
  store i32 %951, i32* %926, align 4
  %952 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %953 = load i8, i8* %952, align 1
  %954 = sext i8 %953 to i16
  %955 = icmp eq i32* %949, null
  br i1 %955, label %972, label %956

956:                                              ; preds = %935
  %957 = lshr i16 %954, 5
  %958 = zext i16 %957 to i32
  %959 = shl i32 %958, 25
  %960 = getelementptr i8, i8* %913, i32 1
  %961 = load i8, i8* %960, align 1
  %962 = zext i8 %961 to i32
  %963 = shl nuw nsw i32 %962, 20
  %964 = shl nsw i16 %954, 7
  %965 = and i16 %964, 3968
  %966 = zext i16 %965 to i32
  %967 = or i32 %959, %966
  %968 = or i32 %967, %963
  %969 = or i32 %968, 270371
  %970 = getelementptr i32, i32* %949, i32 %951
  store i32 %969, i32* %970, align 4
  %971 = load i32, i32* %926, align 4
  br label %972

972:                                              ; preds = %956, %935, %933
  %973 = phi i32 [ %951, %935 ], [ %971, %956 ], [ %934, %933 ]
  %974 = add i32 %973, 1
  store i32 %974, i32* %926, align 4
  br label %3989

975:                                              ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3
  %976 = and i32 %30, 8
  %977 = icmp eq i32 %976, 0
  br i1 %977, label %978, label %1043

978:                                              ; preds = %975
  %979 = add i32 %21, 2048
  %980 = and i32 %21, 4095
  %981 = icmp ult i32 %979, 4096
  %982 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %983 = load i32*, i32** %982, align 4
  %984 = icmp eq i32* %983, null
  br i1 %981, label %1009, label %985

985:                                              ; preds = %978
  br i1 %984, label %986, label %990

986:                                              ; preds = %985
  %987 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %988 = load i32, i32* %987, align 4
  %989 = add i32 %988, 1
  store i32 %989, i32* %987, align 4
  br label %1005

990:                                              ; preds = %985
  %991 = and i32 %979, -4096
  %992 = or i32 %991, 3767
  %993 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %994 = load i32, i32* %993, align 4
  %995 = getelementptr i32, i32* %983, i32 %994
  store i32 %992, i32* %995, align 4
  %996 = load i32*, i32** %982, align 4
  %997 = load i32, i32* %993, align 4
  %998 = add i32 %997, 1
  store i32 %998, i32* %993, align 4
  %999 = icmp eq i32* %996, null
  br i1 %999, label %1005, label %1000

1000:                                             ; preds = %990
  %1001 = shl nuw i32 %980, 20
  %1002 = or i32 %1001, 954003
  %1003 = getelementptr i32, i32* %996, i32 %998
  store i32 %1002, i32* %1003, align 4
  %1004 = load i32, i32* %993, align 4
  br label %1005

1005:                                             ; preds = %1000, %990, %986
  %1006 = phi i32* [ %993, %990 ], [ %993, %1000 ], [ %987, %986 ]
  %1007 = phi i32 [ %998, %990 ], [ %1004, %1000 ], [ %989, %986 ]
  %1008 = add i32 %1007, 1
  store i32 %1008, i32* %1006, align 4
  br label %1020

1009:                                             ; preds = %978
  br i1 %984, label %1016, label %1010

1010:                                             ; preds = %1009
  %1011 = shl nuw i32 %980, 20
  %1012 = or i32 %1011, 3731
  %1013 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1014 = load i32, i32* %1013, align 4
  %1015 = getelementptr i32, i32* %983, i32 %1014
  store i32 %1012, i32* %1015, align 4
  br label %1016

1016:                                             ; preds = %1010, %1009
  %1017 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1018 = load i32, i32* %1017, align 4
  %1019 = add i32 %1018, 1
  store i32 %1019, i32* %1017, align 4
  br label %1020

1020:                                             ; preds = %1005, %1016
  %1021 = phi i32 [ %1008, %1005 ], [ %1019, %1016 ]
  %1022 = icmp sgt i32 %21, -1
  %1023 = load i32*, i32** %982, align 4
  %1024 = icmp eq i32* %1023, null
  br i1 %1022, label %1025, label %1034

1025:                                             ; preds = %1020
  br i1 %1024, label %1030, label %1026

1026:                                             ; preds = %1025
  %1027 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1028 = getelementptr i32, i32* %1023, i32 %1021
  store i32 3859, i32* %1028, align 4
  %1029 = load i32, i32* %1027, align 4
  br label %1030

1030:                                             ; preds = %1026, %1025
  %1031 = phi i32 [ %1029, %1026 ], [ %1021, %1025 ]
  %1032 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1033 = add i32 %1031, 1
  store i32 %1033, i32* %1032, align 4
  br label %1043

1034:                                             ; preds = %1020
  br i1 %1024, label %1039, label %1035

1035:                                             ; preds = %1034
  %1036 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1037 = getelementptr i32, i32* %1023, i32 %1021
  store i32 -1044717, i32* %1037, align 4
  %1038 = load i32, i32* %1036, align 4
  br label %1039

1039:                                             ; preds = %1035, %1034
  %1040 = phi i32 [ %1038, %1035 ], [ %1021, %1034 ]
  %1041 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1042 = add i32 %1040, 1
  store i32 %1042, i32* %1041, align 4
  br label %1043

1043:                                             ; preds = %874, %1039, %1030, %975
  %1044 = phi i8* [ %29, %975 ], [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %1030 ], [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %1039 ], [ %29, %874 ]
  %1045 = and i8 %7, -16
  call fastcc void @emit_alu_r32(i8* %26, i8* %1044, %struct.rv_jit_context* %1, i8 zeroext %1045)
  br label %3989

1046:                                             ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3
  %1047 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %1048 = load i8, i8* %1047, align 1
  %1049 = lshr i32 3008, %25
  %1050 = and i32 %1049, 1
  %1051 = icmp eq i32 %1050, 0
  br i1 %1051, label %1067, label %1052

1052:                                             ; preds = %1046
  %1053 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1054 = load i32*, i32** %1053, align 4
  %1055 = icmp eq i32* %1054, null
  br i1 %1055, label %1063, label %1056

1056:                                             ; preds = %1052
  %1057 = sext i8 %1048 to i32
  %1058 = shl nsw i32 %1057, 20
  %1059 = or i32 %1058, 271235
  %1060 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1061 = load i32, i32* %1060, align 4
  %1062 = getelementptr i32, i32* %1054, i32 %1061
  store i32 %1059, i32* %1062, align 4
  br label %1063

1063:                                             ; preds = %1056, %1052
  %1064 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1065 = load i32, i32* %1064, align 4
  %1066 = add i32 %1065, 1
  store i32 %1066, i32* %1064, align 4
  br label %1067

1067:                                             ; preds = %1046, %1063
  %1068 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %1063 ], [ %26, %1046 ]
  %1069 = lshr i8 %7, 4
  %1070 = zext i8 %1069 to i32
  switch i32 %1070, label %1672 [
    i32 11, label %1071
    i32 0, label %1122
    i32 1, label %1188
    i32 5, label %1272
    i32 4, label %1338
    i32 10, label %1404
    i32 6, label %1470
    i32 7, label %1536
    i32 12, label %1602
  ]

1071:                                             ; preds = %1067
  %1072 = getelementptr i8, i8* %1068, i32 1
  %1073 = load i8, i8* %1072, align 1
  %1074 = add i32 %21, 2048
  %1075 = and i32 %21, 4095
  %1076 = icmp ult i32 %1074, 4096
  br i1 %1076, label %1106, label %1077

1077:                                             ; preds = %1071
  %1078 = zext i8 %1073 to i32
  %1079 = shl nuw nsw i32 %1078, 7
  %1080 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1081 = load i32*, i32** %1080, align 4
  %1082 = icmp eq i32* %1081, null
  br i1 %1082, label %1083, label %1087

1083:                                             ; preds = %1077
  %1084 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1085 = load i32, i32* %1084, align 4
  %1086 = add i32 %1085, 1
  store i32 %1086, i32* %1084, align 4
  br label %1668

1087:                                             ; preds = %1077
  %1088 = and i32 %1074, -4096
  %1089 = or i32 %1088, %1079
  %1090 = or i32 %1089, 55
  %1091 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1092 = load i32, i32* %1091, align 4
  %1093 = getelementptr i32, i32* %1081, i32 %1092
  store i32 %1090, i32* %1093, align 4
  %1094 = load i32*, i32** %1080, align 4
  %1095 = load i32, i32* %1091, align 4
  %1096 = add i32 %1095, 1
  store i32 %1096, i32* %1091, align 4
  %1097 = icmp eq i32* %1094, null
  br i1 %1097, label %1668, label %1098

1098:                                             ; preds = %1087
  %1099 = shl nuw nsw i32 %1078, 15
  %1100 = shl nuw i32 %1075, 20
  %1101 = or i32 %1100, %1079
  %1102 = or i32 %1101, %1099
  %1103 = or i32 %1102, 19
  %1104 = getelementptr i32, i32* %1094, i32 %1096
  store i32 %1103, i32* %1104, align 4
  %1105 = load i32, i32* %1091, align 4
  br label %1668

1106:                                             ; preds = %1071
  %1107 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1108 = load i32*, i32** %1107, align 4
  %1109 = icmp eq i32* %1108, null
  br i1 %1109, label %1119, label %1110

1110:                                             ; preds = %1106
  %1111 = zext i8 %1073 to i32
  %1112 = shl nuw nsw i32 %1111, 7
  %1113 = shl nuw i32 %1075, 20
  %1114 = or i32 %1113, %1112
  %1115 = or i32 %1114, 19
  %1116 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1117 = load i32, i32* %1116, align 4
  %1118 = getelementptr i32, i32* %1108, i32 %1117
  store i32 %1115, i32* %1118, align 4
  br label %1119

1119:                                             ; preds = %1110, %1106
  %1120 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1121 = load i32, i32* %1120, align 4
  br label %1668

1122:                                             ; preds = %1067
  %1123 = add i32 %21, 2048
  %1124 = icmp ult i32 %1123, 4096
  br i1 %1124, label %1125, label %1145

1125:                                             ; preds = %1122
  %1126 = getelementptr i8, i8* %1068, i32 1
  %1127 = load i8, i8* %1126, align 1
  %1128 = zext i8 %1127 to i32
  %1129 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1130 = load i32*, i32** %1129, align 4
  %1131 = icmp eq i32* %1130, null
  br i1 %1131, label %1142, label %1132

1132:                                             ; preds = %1125
  %1133 = shl nuw nsw i32 %1128, 7
  %1134 = shl nuw nsw i32 %1128, 15
  %1135 = shl nsw i32 %21, 20
  %1136 = or i32 %1135, %1134
  %1137 = or i32 %1136, %1133
  %1138 = or i32 %1137, 19
  %1139 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1140 = load i32, i32* %1139, align 4
  %1141 = getelementptr i32, i32* %1130, i32 %1140
  store i32 %1138, i32* %1141, align 4
  br label %1142

1142:                                             ; preds = %1132, %1125
  %1143 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1144 = load i32, i32* %1143, align 4
  br label %1668

1145:                                             ; preds = %1122
  %1146 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1147 = load i32*, i32** %1146, align 4
  %1148 = icmp eq i32* %1147, null
  br i1 %1148, label %1149, label %1153

1149:                                             ; preds = %1145
  %1150 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1151 = load i32, i32* %1150, align 4
  %1152 = add i32 %1151, 1
  store i32 %1152, i32* %1150, align 4
  br label %1163

1153:                                             ; preds = %1145
  %1154 = and i32 %1123, -4096
  %1155 = or i32 %1154, 695
  %1156 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1157 = load i32, i32* %1156, align 4
  %1158 = getelementptr i32, i32* %1147, i32 %1157
  store i32 %1155, i32* %1158, align 4
  %1159 = load i32*, i32** %1146, align 4
  %1160 = load i32, i32* %1156, align 4
  %1161 = add i32 %1160, 1
  store i32 %1161, i32* %1156, align 4
  %1162 = icmp eq i32* %1159, null
  br i1 %1162, label %1163, label %1167

1163:                                             ; preds = %1153, %1149
  %1164 = phi i32* [ %1150, %1149 ], [ %1156, %1153 ]
  %1165 = phi i32 [ %1152, %1149 ], [ %1161, %1153 ]
  %1166 = add i32 %1165, 1
  store i32 %1166, i32* %1164, align 4
  br label %1185

1167:                                             ; preds = %1153
  %1168 = shl i32 %21, 20
  %1169 = or i32 %1168, 164499
  %1170 = getelementptr i32, i32* %1159, i32 %1161
  store i32 %1169, i32* %1170, align 4
  %1171 = load i32, i32* %1156, align 4
  %1172 = load i32*, i32** %1146, align 4
  %1173 = add i32 %1171, 1
  store i32 %1173, i32* %1156, align 4
  %1174 = getelementptr i8, i8* %1068, i32 1
  %1175 = load i8, i8* %1174, align 1
  %1176 = zext i8 %1175 to i32
  %1177 = icmp eq i32* %1172, null
  br i1 %1177, label %1185, label %1178

1178:                                             ; preds = %1167
  %1179 = shl nuw nsw i32 %1176, 7
  %1180 = shl nuw nsw i32 %1176, 15
  %1181 = or i32 %1179, %1180
  %1182 = or i32 %1181, 5242931
  %1183 = getelementptr i32, i32* %1172, i32 %1173
  store i32 %1182, i32* %1183, align 4
  %1184 = load i32, i32* %1156, align 4
  br label %1185

1185:                                             ; preds = %1178, %1167, %1163
  %1186 = phi i32 [ %1173, %1167 ], [ %1184, %1178 ], [ %1166, %1163 ]
  %1187 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1188:                                             ; preds = %1067
  %1189 = sub i32 2048, %21
  %1190 = icmp ult i32 %1189, 4096
  br i1 %1190, label %1191, label %1212

1191:                                             ; preds = %1188
  %1192 = getelementptr i8, i8* %1068, i32 1
  %1193 = load i8, i8* %1192, align 1
  %1194 = zext i8 %1193 to i32
  %1195 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1196 = load i32*, i32** %1195, align 4
  %1197 = icmp eq i32* %1196, null
  br i1 %1197, label %1209, label %1198

1198:                                             ; preds = %1191
  %1199 = shl nuw nsw i32 %1194, 7
  %1200 = shl nuw nsw i32 %1194, 15
  %1201 = shl i32 %21, 20
  %1202 = sub i32 0, %1201
  %1203 = or i32 %1200, %1202
  %1204 = or i32 %1203, %1199
  %1205 = or i32 %1204, 19
  %1206 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1207 = load i32, i32* %1206, align 4
  %1208 = getelementptr i32, i32* %1196, i32 %1207
  store i32 %1205, i32* %1208, align 4
  br label %1209

1209:                                             ; preds = %1198, %1191
  %1210 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1211 = load i32, i32* %1210, align 4
  br label %1668

1212:                                             ; preds = %1188
  %1213 = add i32 %21, 2048
  %1214 = and i32 %21, 4095
  %1215 = icmp ult i32 %1213, 4096
  %1216 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1217 = load i32*, i32** %1216, align 4
  %1218 = icmp eq i32* %1217, null
  br i1 %1215, label %1243, label %1219

1219:                                             ; preds = %1212
  br i1 %1218, label %1220, label %1224

1220:                                             ; preds = %1219
  %1221 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1222 = load i32, i32* %1221, align 4
  %1223 = add i32 %1222, 1
  store i32 %1223, i32* %1221, align 4
  br label %1239

1224:                                             ; preds = %1219
  %1225 = and i32 %1213, -4096
  %1226 = or i32 %1225, 695
  %1227 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1228 = load i32, i32* %1227, align 4
  %1229 = getelementptr i32, i32* %1217, i32 %1228
  store i32 %1226, i32* %1229, align 4
  %1230 = load i32*, i32** %1216, align 4
  %1231 = load i32, i32* %1227, align 4
  %1232 = add i32 %1231, 1
  store i32 %1232, i32* %1227, align 4
  %1233 = icmp eq i32* %1230, null
  br i1 %1233, label %1239, label %1234

1234:                                             ; preds = %1224
  %1235 = shl nuw i32 %1214, 20
  %1236 = or i32 %1235, 164499
  %1237 = getelementptr i32, i32* %1230, i32 %1232
  store i32 %1236, i32* %1237, align 4
  %1238 = load i32, i32* %1227, align 4
  br label %1239

1239:                                             ; preds = %1234, %1224, %1220
  %1240 = phi i32* [ %1227, %1224 ], [ %1227, %1234 ], [ %1221, %1220 ]
  %1241 = phi i32 [ %1232, %1224 ], [ %1238, %1234 ], [ %1223, %1220 ]
  %1242 = add i32 %1241, 1
  store i32 %1242, i32* %1240, align 4
  br label %1254

1243:                                             ; preds = %1212
  br i1 %1218, label %1250, label %1244

1244:                                             ; preds = %1243
  %1245 = shl nuw i32 %1214, 20
  %1246 = or i32 %1245, 659
  %1247 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1248 = load i32, i32* %1247, align 4
  %1249 = getelementptr i32, i32* %1217, i32 %1248
  store i32 %1246, i32* %1249, align 4
  br label %1250

1250:                                             ; preds = %1244, %1243
  %1251 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1252 = load i32, i32* %1251, align 4
  %1253 = add i32 %1252, 1
  store i32 %1253, i32* %1251, align 4
  br label %1254

1254:                                             ; preds = %1250, %1239
  %1255 = phi i32 [ %1242, %1239 ], [ %1253, %1250 ]
  %1256 = getelementptr i8, i8* %1068, i32 1
  %1257 = load i8, i8* %1256, align 1
  %1258 = zext i8 %1257 to i32
  %1259 = load i32*, i32** %1216, align 4
  %1260 = icmp eq i32* %1259, null
  br i1 %1260, label %1269, label %1261

1261:                                             ; preds = %1254
  %1262 = shl nuw nsw i32 %1258, 7
  %1263 = shl nuw nsw i32 %1258, 15
  %1264 = or i32 %1262, %1263
  %1265 = or i32 %1264, 1078984755
  %1266 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1267 = getelementptr i32, i32* %1259, i32 %1255
  store i32 %1265, i32* %1267, align 4
  %1268 = load i32, i32* %1266, align 4
  br label %1269

1269:                                             ; preds = %1261, %1254
  %1270 = phi i32 [ %1255, %1254 ], [ %1268, %1261 ]
  %1271 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1272:                                             ; preds = %1067
  %1273 = add i32 %21, 2048
  %1274 = icmp ult i32 %1273, 4096
  br i1 %1274, label %1275, label %1295

1275:                                             ; preds = %1272
  %1276 = getelementptr i8, i8* %1068, i32 1
  %1277 = load i8, i8* %1276, align 1
  %1278 = zext i8 %1277 to i32
  %1279 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1280 = load i32*, i32** %1279, align 4
  %1281 = icmp eq i32* %1280, null
  br i1 %1281, label %1292, label %1282

1282:                                             ; preds = %1275
  %1283 = shl nuw nsw i32 %1278, 7
  %1284 = shl nuw nsw i32 %1278, 15
  %1285 = shl nsw i32 %21, 20
  %1286 = or i32 %1285, %1284
  %1287 = or i32 %1286, %1283
  %1288 = or i32 %1287, 28691
  %1289 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1290 = load i32, i32* %1289, align 4
  %1291 = getelementptr i32, i32* %1280, i32 %1290
  store i32 %1288, i32* %1291, align 4
  br label %1292

1292:                                             ; preds = %1282, %1275
  %1293 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1294 = load i32, i32* %1293, align 4
  br label %1668

1295:                                             ; preds = %1272
  %1296 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1297 = load i32*, i32** %1296, align 4
  %1298 = icmp eq i32* %1297, null
  br i1 %1298, label %1299, label %1303

1299:                                             ; preds = %1295
  %1300 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1301 = load i32, i32* %1300, align 4
  %1302 = add i32 %1301, 1
  store i32 %1302, i32* %1300, align 4
  br label %1313

1303:                                             ; preds = %1295
  %1304 = and i32 %1273, -4096
  %1305 = or i32 %1304, 695
  %1306 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1307 = load i32, i32* %1306, align 4
  %1308 = getelementptr i32, i32* %1297, i32 %1307
  store i32 %1305, i32* %1308, align 4
  %1309 = load i32*, i32** %1296, align 4
  %1310 = load i32, i32* %1306, align 4
  %1311 = add i32 %1310, 1
  store i32 %1311, i32* %1306, align 4
  %1312 = icmp eq i32* %1309, null
  br i1 %1312, label %1313, label %1317

1313:                                             ; preds = %1303, %1299
  %1314 = phi i32* [ %1300, %1299 ], [ %1306, %1303 ]
  %1315 = phi i32 [ %1302, %1299 ], [ %1311, %1303 ]
  %1316 = add i32 %1315, 1
  store i32 %1316, i32* %1314, align 4
  br label %1335

1317:                                             ; preds = %1303
  %1318 = shl i32 %21, 20
  %1319 = or i32 %1318, 164499
  %1320 = getelementptr i32, i32* %1309, i32 %1311
  store i32 %1319, i32* %1320, align 4
  %1321 = load i32, i32* %1306, align 4
  %1322 = load i32*, i32** %1296, align 4
  %1323 = add i32 %1321, 1
  store i32 %1323, i32* %1306, align 4
  %1324 = getelementptr i8, i8* %1068, i32 1
  %1325 = load i8, i8* %1324, align 1
  %1326 = zext i8 %1325 to i32
  %1327 = icmp eq i32* %1322, null
  br i1 %1327, label %1335, label %1328

1328:                                             ; preds = %1317
  %1329 = shl nuw nsw i32 %1326, 7
  %1330 = shl nuw nsw i32 %1326, 15
  %1331 = or i32 %1329, %1330
  %1332 = or i32 %1331, 5271603
  %1333 = getelementptr i32, i32* %1322, i32 %1323
  store i32 %1332, i32* %1333, align 4
  %1334 = load i32, i32* %1306, align 4
  br label %1335

1335:                                             ; preds = %1328, %1317, %1313
  %1336 = phi i32 [ %1323, %1317 ], [ %1334, %1328 ], [ %1316, %1313 ]
  %1337 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1338:                                             ; preds = %1067
  %1339 = add i32 %21, 2048
  %1340 = icmp ult i32 %1339, 4096
  br i1 %1340, label %1341, label %1361

1341:                                             ; preds = %1338
  %1342 = getelementptr i8, i8* %1068, i32 1
  %1343 = load i8, i8* %1342, align 1
  %1344 = zext i8 %1343 to i32
  %1345 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1346 = load i32*, i32** %1345, align 4
  %1347 = icmp eq i32* %1346, null
  br i1 %1347, label %1358, label %1348

1348:                                             ; preds = %1341
  %1349 = shl nuw nsw i32 %1344, 7
  %1350 = shl nuw nsw i32 %1344, 15
  %1351 = shl nsw i32 %21, 20
  %1352 = or i32 %1351, %1350
  %1353 = or i32 %1352, %1349
  %1354 = or i32 %1353, 24595
  %1355 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1356 = load i32, i32* %1355, align 4
  %1357 = getelementptr i32, i32* %1346, i32 %1356
  store i32 %1354, i32* %1357, align 4
  br label %1358

1358:                                             ; preds = %1348, %1341
  %1359 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1360 = load i32, i32* %1359, align 4
  br label %1668

1361:                                             ; preds = %1338
  %1362 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1363 = load i32*, i32** %1362, align 4
  %1364 = icmp eq i32* %1363, null
  br i1 %1364, label %1365, label %1369

1365:                                             ; preds = %1361
  %1366 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1367 = load i32, i32* %1366, align 4
  %1368 = add i32 %1367, 1
  store i32 %1368, i32* %1366, align 4
  br label %1379

1369:                                             ; preds = %1361
  %1370 = and i32 %1339, -4096
  %1371 = or i32 %1370, 695
  %1372 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1373 = load i32, i32* %1372, align 4
  %1374 = getelementptr i32, i32* %1363, i32 %1373
  store i32 %1371, i32* %1374, align 4
  %1375 = load i32*, i32** %1362, align 4
  %1376 = load i32, i32* %1372, align 4
  %1377 = add i32 %1376, 1
  store i32 %1377, i32* %1372, align 4
  %1378 = icmp eq i32* %1375, null
  br i1 %1378, label %1379, label %1383

1379:                                             ; preds = %1369, %1365
  %1380 = phi i32* [ %1366, %1365 ], [ %1372, %1369 ]
  %1381 = phi i32 [ %1368, %1365 ], [ %1377, %1369 ]
  %1382 = add i32 %1381, 1
  store i32 %1382, i32* %1380, align 4
  br label %1401

1383:                                             ; preds = %1369
  %1384 = shl i32 %21, 20
  %1385 = or i32 %1384, 164499
  %1386 = getelementptr i32, i32* %1375, i32 %1377
  store i32 %1385, i32* %1386, align 4
  %1387 = load i32, i32* %1372, align 4
  %1388 = load i32*, i32** %1362, align 4
  %1389 = add i32 %1387, 1
  store i32 %1389, i32* %1372, align 4
  %1390 = getelementptr i8, i8* %1068, i32 1
  %1391 = load i8, i8* %1390, align 1
  %1392 = zext i8 %1391 to i32
  %1393 = icmp eq i32* %1388, null
  br i1 %1393, label %1401, label %1394

1394:                                             ; preds = %1383
  %1395 = shl nuw nsw i32 %1392, 7
  %1396 = shl nuw nsw i32 %1392, 15
  %1397 = or i32 %1395, %1396
  %1398 = or i32 %1397, 5267507
  %1399 = getelementptr i32, i32* %1388, i32 %1389
  store i32 %1398, i32* %1399, align 4
  %1400 = load i32, i32* %1372, align 4
  br label %1401

1401:                                             ; preds = %1394, %1383, %1379
  %1402 = phi i32 [ %1389, %1383 ], [ %1400, %1394 ], [ %1382, %1379 ]
  %1403 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1404:                                             ; preds = %1067
  %1405 = add i32 %21, 2048
  %1406 = icmp ult i32 %1405, 4096
  br i1 %1406, label %1407, label %1427

1407:                                             ; preds = %1404
  %1408 = getelementptr i8, i8* %1068, i32 1
  %1409 = load i8, i8* %1408, align 1
  %1410 = zext i8 %1409 to i32
  %1411 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1412 = load i32*, i32** %1411, align 4
  %1413 = icmp eq i32* %1412, null
  br i1 %1413, label %1424, label %1414

1414:                                             ; preds = %1407
  %1415 = shl nuw nsw i32 %1410, 7
  %1416 = shl nuw nsw i32 %1410, 15
  %1417 = shl nsw i32 %21, 20
  %1418 = or i32 %1417, %1416
  %1419 = or i32 %1418, %1415
  %1420 = or i32 %1419, 16403
  %1421 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1422 = load i32, i32* %1421, align 4
  %1423 = getelementptr i32, i32* %1412, i32 %1422
  store i32 %1420, i32* %1423, align 4
  br label %1424

1424:                                             ; preds = %1414, %1407
  %1425 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1426 = load i32, i32* %1425, align 4
  br label %1668

1427:                                             ; preds = %1404
  %1428 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1429 = load i32*, i32** %1428, align 4
  %1430 = icmp eq i32* %1429, null
  br i1 %1430, label %1431, label %1435

1431:                                             ; preds = %1427
  %1432 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1433 = load i32, i32* %1432, align 4
  %1434 = add i32 %1433, 1
  store i32 %1434, i32* %1432, align 4
  br label %1445

1435:                                             ; preds = %1427
  %1436 = and i32 %1405, -4096
  %1437 = or i32 %1436, 695
  %1438 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1439 = load i32, i32* %1438, align 4
  %1440 = getelementptr i32, i32* %1429, i32 %1439
  store i32 %1437, i32* %1440, align 4
  %1441 = load i32*, i32** %1428, align 4
  %1442 = load i32, i32* %1438, align 4
  %1443 = add i32 %1442, 1
  store i32 %1443, i32* %1438, align 4
  %1444 = icmp eq i32* %1441, null
  br i1 %1444, label %1445, label %1449

1445:                                             ; preds = %1435, %1431
  %1446 = phi i32* [ %1432, %1431 ], [ %1438, %1435 ]
  %1447 = phi i32 [ %1434, %1431 ], [ %1443, %1435 ]
  %1448 = add i32 %1447, 1
  store i32 %1448, i32* %1446, align 4
  br label %1467

1449:                                             ; preds = %1435
  %1450 = shl i32 %21, 20
  %1451 = or i32 %1450, 164499
  %1452 = getelementptr i32, i32* %1441, i32 %1443
  store i32 %1451, i32* %1452, align 4
  %1453 = load i32, i32* %1438, align 4
  %1454 = load i32*, i32** %1428, align 4
  %1455 = add i32 %1453, 1
  store i32 %1455, i32* %1438, align 4
  %1456 = getelementptr i8, i8* %1068, i32 1
  %1457 = load i8, i8* %1456, align 1
  %1458 = zext i8 %1457 to i32
  %1459 = icmp eq i32* %1454, null
  br i1 %1459, label %1467, label %1460

1460:                                             ; preds = %1449
  %1461 = shl nuw nsw i32 %1458, 7
  %1462 = shl nuw nsw i32 %1458, 15
  %1463 = or i32 %1461, %1462
  %1464 = or i32 %1463, 5259315
  %1465 = getelementptr i32, i32* %1454, i32 %1455
  store i32 %1464, i32* %1465, align 4
  %1466 = load i32, i32* %1438, align 4
  br label %1467

1467:                                             ; preds = %1460, %1449, %1445
  %1468 = phi i32 [ %1455, %1449 ], [ %1466, %1460 ], [ %1448, %1445 ]
  %1469 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1470:                                             ; preds = %1067
  %1471 = add i32 %21, 2048
  %1472 = icmp ult i32 %1471, 4096
  br i1 %1472, label %1473, label %1493

1473:                                             ; preds = %1470
  %1474 = getelementptr i8, i8* %1068, i32 1
  %1475 = load i8, i8* %1474, align 1
  %1476 = zext i8 %1475 to i32
  %1477 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1478 = load i32*, i32** %1477, align 4
  %1479 = icmp eq i32* %1478, null
  br i1 %1479, label %1490, label %1480

1480:                                             ; preds = %1473
  %1481 = shl nuw nsw i32 %1476, 7
  %1482 = shl nuw nsw i32 %1476, 15
  %1483 = shl nsw i32 %21, 20
  %1484 = or i32 %1483, %1482
  %1485 = or i32 %1484, %1481
  %1486 = or i32 %1485, 4115
  %1487 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1488 = load i32, i32* %1487, align 4
  %1489 = getelementptr i32, i32* %1478, i32 %1488
  store i32 %1486, i32* %1489, align 4
  br label %1490

1490:                                             ; preds = %1480, %1473
  %1491 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1492 = load i32, i32* %1491, align 4
  br label %1668

1493:                                             ; preds = %1470
  %1494 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1495 = load i32*, i32** %1494, align 4
  %1496 = icmp eq i32* %1495, null
  br i1 %1496, label %1497, label %1501

1497:                                             ; preds = %1493
  %1498 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1499 = load i32, i32* %1498, align 4
  %1500 = add i32 %1499, 1
  store i32 %1500, i32* %1498, align 4
  br label %1511

1501:                                             ; preds = %1493
  %1502 = and i32 %1471, -4096
  %1503 = or i32 %1502, 695
  %1504 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1505 = load i32, i32* %1504, align 4
  %1506 = getelementptr i32, i32* %1495, i32 %1505
  store i32 %1503, i32* %1506, align 4
  %1507 = load i32*, i32** %1494, align 4
  %1508 = load i32, i32* %1504, align 4
  %1509 = add i32 %1508, 1
  store i32 %1509, i32* %1504, align 4
  %1510 = icmp eq i32* %1507, null
  br i1 %1510, label %1511, label %1515

1511:                                             ; preds = %1501, %1497
  %1512 = phi i32* [ %1498, %1497 ], [ %1504, %1501 ]
  %1513 = phi i32 [ %1500, %1497 ], [ %1509, %1501 ]
  %1514 = add i32 %1513, 1
  store i32 %1514, i32* %1512, align 4
  br label %1533

1515:                                             ; preds = %1501
  %1516 = shl i32 %21, 20
  %1517 = or i32 %1516, 164499
  %1518 = getelementptr i32, i32* %1507, i32 %1509
  store i32 %1517, i32* %1518, align 4
  %1519 = load i32, i32* %1504, align 4
  %1520 = load i32*, i32** %1494, align 4
  %1521 = add i32 %1519, 1
  store i32 %1521, i32* %1504, align 4
  %1522 = getelementptr i8, i8* %1068, i32 1
  %1523 = load i8, i8* %1522, align 1
  %1524 = zext i8 %1523 to i32
  %1525 = icmp eq i32* %1520, null
  br i1 %1525, label %1533, label %1526

1526:                                             ; preds = %1515
  %1527 = shl nuw nsw i32 %1524, 7
  %1528 = shl nuw nsw i32 %1524, 15
  %1529 = or i32 %1527, %1528
  %1530 = or i32 %1529, 5247027
  %1531 = getelementptr i32, i32* %1520, i32 %1521
  store i32 %1530, i32* %1531, align 4
  %1532 = load i32, i32* %1504, align 4
  br label %1533

1533:                                             ; preds = %1526, %1515, %1511
  %1534 = phi i32 [ %1521, %1515 ], [ %1532, %1526 ], [ %1514, %1511 ]
  %1535 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1536:                                             ; preds = %1067
  %1537 = add i32 %21, 2048
  %1538 = icmp ult i32 %1537, 4096
  br i1 %1538, label %1539, label %1559

1539:                                             ; preds = %1536
  %1540 = getelementptr i8, i8* %1068, i32 1
  %1541 = load i8, i8* %1540, align 1
  %1542 = zext i8 %1541 to i32
  %1543 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1544 = load i32*, i32** %1543, align 4
  %1545 = icmp eq i32* %1544, null
  br i1 %1545, label %1556, label %1546

1546:                                             ; preds = %1539
  %1547 = shl nuw nsw i32 %1542, 7
  %1548 = shl nuw nsw i32 %1542, 15
  %1549 = shl nsw i32 %21, 20
  %1550 = or i32 %1549, %1548
  %1551 = or i32 %1550, %1547
  %1552 = or i32 %1551, 20499
  %1553 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1554 = load i32, i32* %1553, align 4
  %1555 = getelementptr i32, i32* %1544, i32 %1554
  store i32 %1552, i32* %1555, align 4
  br label %1556

1556:                                             ; preds = %1546, %1539
  %1557 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1558 = load i32, i32* %1557, align 4
  br label %1668

1559:                                             ; preds = %1536
  %1560 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1561 = load i32*, i32** %1560, align 4
  %1562 = icmp eq i32* %1561, null
  br i1 %1562, label %1563, label %1567

1563:                                             ; preds = %1559
  %1564 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1565 = load i32, i32* %1564, align 4
  %1566 = add i32 %1565, 1
  store i32 %1566, i32* %1564, align 4
  br label %1577

1567:                                             ; preds = %1559
  %1568 = and i32 %1537, -4096
  %1569 = or i32 %1568, 695
  %1570 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1571 = load i32, i32* %1570, align 4
  %1572 = getelementptr i32, i32* %1561, i32 %1571
  store i32 %1569, i32* %1572, align 4
  %1573 = load i32*, i32** %1560, align 4
  %1574 = load i32, i32* %1570, align 4
  %1575 = add i32 %1574, 1
  store i32 %1575, i32* %1570, align 4
  %1576 = icmp eq i32* %1573, null
  br i1 %1576, label %1577, label %1581

1577:                                             ; preds = %1567, %1563
  %1578 = phi i32* [ %1564, %1563 ], [ %1570, %1567 ]
  %1579 = phi i32 [ %1566, %1563 ], [ %1575, %1567 ]
  %1580 = add i32 %1579, 1
  store i32 %1580, i32* %1578, align 4
  br label %1599

1581:                                             ; preds = %1567
  %1582 = shl i32 %21, 20
  %1583 = or i32 %1582, 164499
  %1584 = getelementptr i32, i32* %1573, i32 %1575
  store i32 %1583, i32* %1584, align 4
  %1585 = load i32, i32* %1570, align 4
  %1586 = load i32*, i32** %1560, align 4
  %1587 = add i32 %1585, 1
  store i32 %1587, i32* %1570, align 4
  %1588 = getelementptr i8, i8* %1068, i32 1
  %1589 = load i8, i8* %1588, align 1
  %1590 = zext i8 %1589 to i32
  %1591 = icmp eq i32* %1586, null
  br i1 %1591, label %1599, label %1592

1592:                                             ; preds = %1581
  %1593 = shl nuw nsw i32 %1590, 7
  %1594 = shl nuw nsw i32 %1590, 15
  %1595 = or i32 %1593, %1594
  %1596 = or i32 %1595, 5263411
  %1597 = getelementptr i32, i32* %1586, i32 %1587
  store i32 %1596, i32* %1597, align 4
  %1598 = load i32, i32* %1570, align 4
  br label %1599

1599:                                             ; preds = %1592, %1581, %1577
  %1600 = phi i32 [ %1587, %1581 ], [ %1598, %1592 ], [ %1580, %1577 ]
  %1601 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1602:                                             ; preds = %1067
  %1603 = add i32 %21, 2048
  %1604 = icmp ult i32 %1603, 4096
  br i1 %1604, label %1605, label %1625

1605:                                             ; preds = %1602
  %1606 = getelementptr i8, i8* %1068, i32 1
  %1607 = load i8, i8* %1606, align 1
  %1608 = zext i8 %1607 to i32
  %1609 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1610 = load i32*, i32** %1609, align 4
  %1611 = icmp eq i32* %1610, null
  br i1 %1611, label %1622, label %1612

1612:                                             ; preds = %1605
  %1613 = shl nuw nsw i32 %1608, 7
  %1614 = shl nuw nsw i32 %1608, 15
  %1615 = shl nsw i32 %21, 20
  %1616 = or i32 %1615, %1614
  %1617 = or i32 %1616, %1613
  %1618 = or i32 %1617, 1073762323
  %1619 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1620 = load i32, i32* %1619, align 4
  %1621 = getelementptr i32, i32* %1610, i32 %1620
  store i32 %1618, i32* %1621, align 4
  br label %1622

1622:                                             ; preds = %1612, %1605
  %1623 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1624 = load i32, i32* %1623, align 4
  br label %1668

1625:                                             ; preds = %1602
  %1626 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1627 = load i32*, i32** %1626, align 4
  %1628 = icmp eq i32* %1627, null
  br i1 %1628, label %1629, label %1633

1629:                                             ; preds = %1625
  %1630 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1631 = load i32, i32* %1630, align 4
  %1632 = add i32 %1631, 1
  store i32 %1632, i32* %1630, align 4
  br label %1643

1633:                                             ; preds = %1625
  %1634 = and i32 %1603, -4096
  %1635 = or i32 %1634, 695
  %1636 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1637 = load i32, i32* %1636, align 4
  %1638 = getelementptr i32, i32* %1627, i32 %1637
  store i32 %1635, i32* %1638, align 4
  %1639 = load i32*, i32** %1626, align 4
  %1640 = load i32, i32* %1636, align 4
  %1641 = add i32 %1640, 1
  store i32 %1641, i32* %1636, align 4
  %1642 = icmp eq i32* %1639, null
  br i1 %1642, label %1643, label %1647

1643:                                             ; preds = %1633, %1629
  %1644 = phi i32* [ %1630, %1629 ], [ %1636, %1633 ]
  %1645 = phi i32 [ %1632, %1629 ], [ %1641, %1633 ]
  %1646 = add i32 %1645, 1
  store i32 %1646, i32* %1644, align 4
  br label %1665

1647:                                             ; preds = %1633
  %1648 = shl i32 %21, 20
  %1649 = or i32 %1648, 164499
  %1650 = getelementptr i32, i32* %1639, i32 %1641
  store i32 %1649, i32* %1650, align 4
  %1651 = load i32, i32* %1636, align 4
  %1652 = load i32*, i32** %1626, align 4
  %1653 = add i32 %1651, 1
  store i32 %1653, i32* %1636, align 4
  %1654 = getelementptr i8, i8* %1068, i32 1
  %1655 = load i8, i8* %1654, align 1
  %1656 = zext i8 %1655 to i32
  %1657 = icmp eq i32* %1652, null
  br i1 %1657, label %1665, label %1658

1658:                                             ; preds = %1647
  %1659 = shl nuw nsw i32 %1656, 7
  %1660 = shl nuw nsw i32 %1656, 15
  %1661 = or i32 %1659, %1660
  %1662 = or i32 %1661, 1079005235
  %1663 = getelementptr i32, i32* %1652, i32 %1653
  store i32 %1662, i32* %1663, align 4
  %1664 = load i32, i32* %1636, align 4
  br label %1665

1665:                                             ; preds = %1658, %1647, %1643
  %1666 = phi i32 [ %1653, %1647 ], [ %1664, %1658 ], [ %1646, %1643 ]
  %1667 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br label %1668

1668:                                             ; preds = %1083, %1087, %1098, %1665, %1622, %1599, %1556, %1533, %1490, %1467, %1424, %1401, %1358, %1335, %1292, %1269, %1209, %1185, %1142, %1119
  %1669 = phi i32 [ %1121, %1119 ], [ %1144, %1142 ], [ %1186, %1185 ], [ %1211, %1209 ], [ %1270, %1269 ], [ %1294, %1292 ], [ %1336, %1335 ], [ %1360, %1358 ], [ %1402, %1401 ], [ %1426, %1424 ], [ %1468, %1467 ], [ %1492, %1490 ], [ %1534, %1533 ], [ %1558, %1556 ], [ %1600, %1599 ], [ %1624, %1622 ], [ %1666, %1665 ], [ %1096, %1087 ], [ %1105, %1098 ], [ %1086, %1083 ]
  %1670 = phi i32* [ %1120, %1119 ], [ %1143, %1142 ], [ %1187, %1185 ], [ %1210, %1209 ], [ %1271, %1269 ], [ %1293, %1292 ], [ %1337, %1335 ], [ %1359, %1358 ], [ %1403, %1401 ], [ %1425, %1424 ], [ %1469, %1467 ], [ %1491, %1490 ], [ %1535, %1533 ], [ %1557, %1556 ], [ %1601, %1599 ], [ %1623, %1622 ], [ %1667, %1665 ], [ %1091, %1087 ], [ %1091, %1098 ], [ %1084, %1083 ]
  %1671 = add i32 %1669, 1
  store i32 %1671, i32* %1670, align 4
  br label %1672

1672:                                             ; preds = %1668, %1067
  call fastcc void @bpf_put_reg32(i8* %26, i8* %1068, %struct.rv_jit_context* %1) #5
  br label %3989

1673:                                             ; preds = %3
  call fastcc void @emit_alu_r32(i8* %26, i8* getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %struct.rv_jit_context* %1, i8 zeroext -128)
  br label %3989

1674:                                             ; preds = %3
  %1675 = load i8, i8* %26, align 1
  %1676 = lshr i32 3008, %25
  %1677 = and i32 %1676, 1
  %1678 = icmp ne i32 %1677, 0
  br i1 %1678, label %1679, label %1710

1679:                                             ; preds = %1674
  %1680 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1681 = load i32*, i32** %1680, align 4
  %1682 = icmp eq i32* %1681, null
  br i1 %1682, label %1683, label %1687

1683:                                             ; preds = %1679
  %1684 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1685 = load i32, i32* %1684, align 4
  %1686 = add i32 %1685, 1
  store i32 %1686, i32* %1684, align 4
  br label %1706

1687:                                             ; preds = %1679
  %1688 = sext i8 %1675 to i32
  %1689 = shl nsw i32 %1688, 20
  %1690 = or i32 %1689, 273923
  %1691 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1692 = load i32, i32* %1691, align 4
  %1693 = getelementptr i32, i32* %1681, i32 %1692
  store i32 %1690, i32* %1693, align 4
  %1694 = load i32*, i32** %1680, align 4
  %1695 = load i32, i32* %1691, align 4
  %1696 = add i32 %1695, 1
  store i32 %1696, i32* %1691, align 4
  %1697 = icmp eq i32* %1694, null
  br i1 %1697, label %1706, label %1698

1698:                                             ; preds = %1687
  %1699 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %1700 = load i8, i8* %1699, align 1
  %1701 = sext i8 %1700 to i32
  %1702 = shl nsw i32 %1701, 20
  %1703 = or i32 %1702, 271235
  %1704 = getelementptr i32, i32* %1694, i32 %1696
  store i32 %1703, i32* %1704, align 4
  %1705 = load i32, i32* %1691, align 4
  br label %1706

1706:                                             ; preds = %1698, %1687, %1683
  %1707 = phi i32* [ %1691, %1687 ], [ %1691, %1698 ], [ %1684, %1683 ]
  %1708 = phi i32 [ %1696, %1687 ], [ %1705, %1698 ], [ %1686, %1683 ]
  %1709 = add i32 %1708, 1
  store i32 %1709, i32* %1707, align 4
  br label %1710

1710:                                             ; preds = %1674, %1706
  %1711 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %1706 ], [ %26, %1674 ]
  switch i32 %21, label %1769 [
    i32 16, label %1712
    i32 32, label %1746
    i32 64, label %1771
  ]

1712:                                             ; preds = %1710
  %1713 = getelementptr i8, i8* %1711, i32 1
  %1714 = load i8, i8* %1713, align 1
  %1715 = zext i8 %1714 to i32
  %1716 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1717 = load i32*, i32** %1716, align 4
  %1718 = icmp eq i32* %1717, null
  br i1 %1718, label %1728, label %1719

1719:                                             ; preds = %1712
  %1720 = shl nuw nsw i32 %1715, 7
  %1721 = shl nuw nsw i32 %1715, 15
  %1722 = or i32 %1721, %1720
  %1723 = or i32 %1722, 16781331
  %1724 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1725 = load i32, i32* %1724, align 4
  %1726 = getelementptr i32, i32* %1717, i32 %1725
  store i32 %1723, i32* %1726, align 4
  %1727 = load i32*, i32** %1716, align 4
  br label %1728

1728:                                             ; preds = %1712, %1719
  %1729 = phi i32* [ null, %1712 ], [ %1727, %1719 ]
  %1730 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1731 = load i32, i32* %1730, align 4
  %1732 = add i32 %1731, 1
  store i32 %1732, i32* %1730, align 4
  %1733 = load i8, i8* %1713, align 1
  %1734 = zext i8 %1733 to i32
  %1735 = icmp eq i32* %1729, null
  br i1 %1735, label %1743, label %1736

1736:                                             ; preds = %1728
  %1737 = shl nuw nsw i32 %1734, 7
  %1738 = shl nuw nsw i32 %1734, 15
  %1739 = or i32 %1738, %1737
  %1740 = or i32 %1739, 16797715
  %1741 = getelementptr i32, i32* %1729, i32 %1732
  store i32 %1740, i32* %1741, align 4
  %1742 = load i32, i32* %1730, align 4
  br label %1743

1743:                                             ; preds = %1728, %1736
  %1744 = phi i32 [ %1732, %1728 ], [ %1742, %1736 ]
  %1745 = add i32 %1744, 1
  store i32 %1745, i32* %1730, align 4
  br label %1746

1746:                                             ; preds = %1710, %1743
  %1747 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %1748 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %1747, i32 0, i32 7
  %1749 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %1748, align 4
  %1750 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1749, i32 0, i32 13
  %1751 = load i8, i8* %1750, align 8, !range !4
  %1752 = icmp eq i8 %1751, 0
  br i1 %1752, label %1753, label %1771

1753:                                             ; preds = %1746
  %1754 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1755 = load i32*, i32** %1754, align 4
  %1756 = icmp eq i32* %1755, null
  br i1 %1756, label %1765, label %1757

1757:                                             ; preds = %1753
  %1758 = load i8, i8* %1711, align 1
  %1759 = zext i8 %1758 to i32
  %1760 = shl nuw nsw i32 %1759, 7
  %1761 = or i32 %1760, 19
  %1762 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1763 = load i32, i32* %1762, align 4
  %1764 = getelementptr i32, i32* %1755, i32 %1763
  store i32 %1761, i32* %1764, align 4
  br label %1765

1765:                                             ; preds = %1753, %1757
  %1766 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1767 = load i32, i32* %1766, align 4
  %1768 = add i32 %1767, 1
  store i32 %1768, i32* %1766, align 4
  br label %1771

1769:                                             ; preds = %1710
  %1770 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %21) #6
  br label %3989

1771:                                             ; preds = %1746, %1765, %1710
  br i1 %1678, label %1772, label %3989

1772:                                             ; preds = %1771
  %1773 = sext i8 %1675 to i16
  %1774 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1775 = load i32*, i32** %1774, align 4
  %1776 = icmp eq i32* %1775, null
  br i1 %1776, label %1794, label %1777

1777:                                             ; preds = %1772
  %1778 = lshr i16 %1773, 5
  %1779 = zext i16 %1778 to i32
  %1780 = shl i32 %1779, 25
  %1781 = load i8, i8* %1711, align 1
  %1782 = zext i8 %1781 to i32
  %1783 = shl nuw nsw i32 %1782, 20
  %1784 = shl nsw i16 %1773, 7
  %1785 = and i16 %1784, 3968
  %1786 = zext i16 %1785 to i32
  %1787 = or i32 %1780, %1786
  %1788 = or i32 %1787, %1783
  %1789 = or i32 %1788, 270371
  %1790 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1791 = load i32, i32* %1790, align 4
  %1792 = getelementptr i32, i32* %1775, i32 %1791
  store i32 %1789, i32* %1792, align 4
  %1793 = load i32*, i32** %1774, align 4
  br label %1794

1794:                                             ; preds = %1777, %1772
  %1795 = phi i32* [ null, %1772 ], [ %1793, %1777 ]
  %1796 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1797 = load i32, i32* %1796, align 4
  %1798 = add i32 %1797, 1
  store i32 %1798, i32* %1796, align 4
  %1799 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %1800 = load i8, i8* %1799, align 1
  %1801 = sext i8 %1800 to i16
  %1802 = icmp eq i32* %1795, null
  br i1 %1802, label %1819, label %1803

1803:                                             ; preds = %1794
  %1804 = lshr i16 %1801, 5
  %1805 = zext i16 %1804 to i32
  %1806 = shl i32 %1805, 25
  %1807 = getelementptr i8, i8* %1711, i32 1
  %1808 = load i8, i8* %1807, align 1
  %1809 = zext i8 %1808 to i32
  %1810 = shl nuw nsw i32 %1809, 20
  %1811 = shl nsw i16 %1801, 7
  %1812 = and i16 %1811, 3968
  %1813 = zext i16 %1812 to i32
  %1814 = or i32 %1806, %1813
  %1815 = or i32 %1814, %1810
  %1816 = or i32 %1815, 270371
  %1817 = getelementptr i32, i32* %1795, i32 %1798
  store i32 %1816, i32* %1817, align 4
  %1818 = load i32, i32* %1796, align 4
  br label %1819

1819:                                             ; preds = %1803, %1794
  %1820 = phi i32 [ %1798, %1794 ], [ %1818, %1803 ]
  %1821 = add i32 %1820, 1
  store i32 %1821, i32* %1796, align 4
  br label %3989

1822:                                             ; preds = %3
  %1823 = load i8, i8* %26, align 1
  %1824 = lshr i32 3008, %25
  %1825 = and i32 %1824, 1
  %1826 = icmp ne i32 %1825, 0
  br i1 %1826, label %1827, label %1858

1827:                                             ; preds = %1822
  %1828 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1829 = load i32*, i32** %1828, align 4
  %1830 = icmp eq i32* %1829, null
  br i1 %1830, label %1831, label %1835

1831:                                             ; preds = %1827
  %1832 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1833 = load i32, i32* %1832, align 4
  %1834 = add i32 %1833, 1
  store i32 %1834, i32* %1832, align 4
  br label %1854

1835:                                             ; preds = %1827
  %1836 = sext i8 %1823 to i32
  %1837 = shl nsw i32 %1836, 20
  %1838 = or i32 %1837, 273923
  %1839 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1840 = load i32, i32* %1839, align 4
  %1841 = getelementptr i32, i32* %1829, i32 %1840
  store i32 %1838, i32* %1841, align 4
  %1842 = load i32*, i32** %1828, align 4
  %1843 = load i32, i32* %1839, align 4
  %1844 = add i32 %1843, 1
  store i32 %1844, i32* %1839, align 4
  %1845 = icmp eq i32* %1842, null
  br i1 %1845, label %1854, label %1846

1846:                                             ; preds = %1835
  %1847 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %1848 = load i8, i8* %1847, align 1
  %1849 = sext i8 %1848 to i32
  %1850 = shl nsw i32 %1849, 20
  %1851 = or i32 %1850, 271235
  %1852 = getelementptr i32, i32* %1842, i32 %1844
  store i32 %1851, i32* %1852, align 4
  %1853 = load i32, i32* %1839, align 4
  br label %1854

1854:                                             ; preds = %1846, %1835, %1831
  %1855 = phi i32* [ %1839, %1835 ], [ %1839, %1846 ], [ %1832, %1831 ]
  %1856 = phi i32 [ %1844, %1835 ], [ %1853, %1846 ], [ %1834, %1831 ]
  %1857 = add i32 %1856, 1
  store i32 %1857, i32* %1855, align 4
  br label %1858

1858:                                             ; preds = %1822, %1854
  %1859 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %1854 ], [ %26, %1822 ]
  switch i32 %21, label %2023 [
    i32 16, label %1860
    i32 32, label %1945
    i32 64, label %1970
  ]

1860:                                             ; preds = %1858
  %1861 = getelementptr i8, i8* %1859, i32 1
  %1862 = load i8, i8* %1861, align 1
  %1863 = zext i8 %1862 to i32
  %1864 = shl nuw nsw i32 %1863, 15
  %1865 = shl nuw nsw i32 %1863, 7
  %1866 = or i32 %1865, %1864
  %1867 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1868 = load i32*, i32** %1867, align 4
  %1869 = icmp eq i32* %1868, null
  br i1 %1869, label %1870, label %1874

1870:                                             ; preds = %1860
  %1871 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1872 = load i32, i32* %1871, align 4
  %1873 = add i32 %1872, 1
  store i32 %1873, i32* %1871, align 4
  br label %1883

1874:                                             ; preds = %1860
  %1875 = or i32 %1866, 16781331
  %1876 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1877 = load i32, i32* %1876, align 4
  %1878 = getelementptr i32, i32* %1868, i32 %1877
  store i32 %1875, i32* %1878, align 4
  %1879 = load i32*, i32** %1867, align 4
  %1880 = load i32, i32* %1876, align 4
  %1881 = add i32 %1880, 1
  store i32 %1881, i32* %1876, align 4
  %1882 = icmp eq i32* %1879, null
  br i1 %1882, label %1883, label %1887

1883:                                             ; preds = %1874, %1870
  %1884 = phi i32 [ %1872, %1870 ], [ %1880, %1874 ]
  %1885 = phi i32* [ %1871, %1870 ], [ %1876, %1874 ]
  %1886 = add i32 %1884, 2
  store i32 %1886, i32* %1885, align 4
  br label %1894

1887:                                             ; preds = %1874
  %1888 = or i32 %1864, 8393491
  %1889 = getelementptr i32, i32* %1879, i32 %1881
  store i32 %1888, i32* %1889, align 4
  %1890 = load i32*, i32** %1867, align 4
  %1891 = load i32, i32* %1876, align 4
  %1892 = add i32 %1891, 1
  store i32 %1892, i32* %1876, align 4
  %1893 = icmp eq i32* %1890, null
  br i1 %1893, label %1894, label %1898

1894:                                             ; preds = %1887, %1883
  %1895 = phi i32* [ %1876, %1887 ], [ %1885, %1883 ]
  %1896 = phi i32 [ %1892, %1887 ], [ %1886, %1883 ]
  %1897 = add i32 %1896, 1
  store i32 %1897, i32* %1895, align 4
  br label %1905

1898:                                             ; preds = %1887
  %1899 = or i32 %1866, 8409107
  %1900 = getelementptr i32, i32* %1890, i32 %1892
  store i32 %1899, i32* %1900, align 4
  %1901 = load i32, i32* %1876, align 4
  %1902 = load i32*, i32** %1867, align 4
  %1903 = add i32 %1901, 1
  store i32 %1903, i32* %1876, align 4
  %1904 = icmp eq i32* %1902, null
  br i1 %1904, label %1905, label %1909

1905:                                             ; preds = %1898, %1894
  %1906 = phi i32* [ %1895, %1894 ], [ %1876, %1898 ]
  %1907 = phi i32 [ %1897, %1894 ], [ %1903, %1898 ]
  %1908 = add i32 %1907, 1
  store i32 %1908, i32* %1906, align 4
  br label %1920

1909:                                             ; preds = %1898
  %1910 = or i32 %1864, 6292275
  %1911 = getelementptr i32, i32* %1902, i32 %1903
  store i32 %1910, i32* %1911, align 4
  %1912 = load i32*, i32** %1867, align 4
  %1913 = load i32, i32* %1876, align 4
  %1914 = add i32 %1913, 1
  store i32 %1914, i32* %1876, align 4
  %1915 = icmp eq i32* %1912, null
  br i1 %1915, label %1920, label %1916

1916:                                             ; preds = %1909
  %1917 = or i32 %1865, 16994323
  %1918 = getelementptr i32, i32* %1912, i32 %1914
  store i32 %1917, i32* %1918, align 4
  %1919 = load i32, i32* %1876, align 4
  br label %1920

1920:                                             ; preds = %1905, %1909, %1916
  %1921 = phi i32* [ %1876, %1909 ], [ %1876, %1916 ], [ %1906, %1905 ]
  %1922 = phi i32 [ %1914, %1909 ], [ %1919, %1916 ], [ %1908, %1905 ]
  %1923 = add i32 %1922, 1
  store i32 %1923, i32* %1921, align 4
  %1924 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %1925 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %1924, i32 0, i32 7
  %1926 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %1925, align 4
  %1927 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1926, i32 0, i32 13
  %1928 = load i8, i8* %1927, align 8, !range !4
  %1929 = icmp eq i8 %1928, 0
  br i1 %1929, label %1930, label %2025

1930:                                             ; preds = %1920
  %1931 = load i32*, i32** %1867, align 4
  %1932 = icmp eq i32* %1931, null
  br i1 %1932, label %1941, label %1933

1933:                                             ; preds = %1930
  %1934 = load i8, i8* %1859, align 1
  %1935 = zext i8 %1934 to i32
  %1936 = shl nuw nsw i32 %1935, 7
  %1937 = or i32 %1936, 19
  %1938 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1939 = getelementptr i32, i32* %1931, i32 %1923
  store i32 %1937, i32* %1939, align 4
  %1940 = load i32, i32* %1938, align 4
  br label %1941

1941:                                             ; preds = %1930, %1933
  %1942 = phi i32 [ %1923, %1930 ], [ %1940, %1933 ]
  %1943 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1944 = add i32 %1942, 1
  store i32 %1944, i32* %1943, align 4
  br label %2025

1945:                                             ; preds = %1858
  %1946 = getelementptr i8, i8* %1859, i32 1
  %1947 = load i8, i8* %1946, align 1
  call fastcc void @emit_rev32(i8 signext %1947, %struct.rv_jit_context* %1)
  %1948 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %1949 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %1948, i32 0, i32 7
  %1950 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %1949, align 4
  %1951 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1950, i32 0, i32 13
  %1952 = load i8, i8* %1951, align 8, !range !4
  %1953 = icmp eq i8 %1952, 0
  br i1 %1953, label %1954, label %2025

1954:                                             ; preds = %1945
  %1955 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1956 = load i32*, i32** %1955, align 4
  %1957 = icmp eq i32* %1956, null
  br i1 %1957, label %1966, label %1958

1958:                                             ; preds = %1954
  %1959 = load i8, i8* %1859, align 1
  %1960 = zext i8 %1959 to i32
  %1961 = shl nuw nsw i32 %1960, 7
  %1962 = or i32 %1961, 19
  %1963 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1964 = load i32, i32* %1963, align 4
  %1965 = getelementptr i32, i32* %1956, i32 %1964
  store i32 %1962, i32* %1965, align 4
  br label %1966

1966:                                             ; preds = %1954, %1958
  %1967 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1968 = load i32, i32* %1967, align 4
  %1969 = add i32 %1968, 1
  store i32 %1969, i32* %1967, align 4
  br label %2025

1970:                                             ; preds = %1858
  %1971 = getelementptr i8, i8* %1859, i32 1
  %1972 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %1973 = load i32*, i32** %1972, align 4
  %1974 = icmp eq i32* %1973, null
  br i1 %1974, label %1975, label %1979

1975:                                             ; preds = %1970
  %1976 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1977 = load i32, i32* %1976, align 4
  %1978 = add i32 %1977, 1
  store i32 %1978, i32* %1976, align 4
  br label %1992

1979:                                             ; preds = %1970
  %1980 = load i8, i8* %1971, align 1
  %1981 = zext i8 %1980 to i32
  %1982 = shl nuw nsw i32 %1981, 15
  %1983 = or i32 %1982, 659
  %1984 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1985 = load i32, i32* %1984, align 4
  %1986 = getelementptr i32, i32* %1973, i32 %1985
  store i32 %1983, i32* %1986, align 4
  %1987 = load i32*, i32** %1972, align 4
  %1988 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %1989 = load i32, i32* %1988, align 4
  %1990 = add i32 %1989, 1
  store i32 %1990, i32* %1988, align 4
  %1991 = icmp eq i32* %1987, null
  br i1 %1991, label %1992, label %1996

1992:                                             ; preds = %1979, %1975
  %1993 = phi i32* [ %1976, %1975 ], [ %1988, %1979 ]
  %1994 = phi i32 [ %1978, %1975 ], [ %1990, %1979 ]
  %1995 = add i32 %1994, 1
  store i32 %1995, i32* %1993, align 4
  br label %2017

1996:                                             ; preds = %1979
  %1997 = load i8, i8* %1971, align 1
  %1998 = zext i8 %1997 to i32
  %1999 = shl nuw nsw i32 %1998, 7
  %2000 = load i8, i8* %1859, align 1
  %2001 = zext i8 %2000 to i32
  %2002 = shl nuw nsw i32 %2001, 15
  %2003 = or i32 %1999, %2002
  %2004 = or i32 %2003, 19
  %2005 = getelementptr i32, i32* %1987, i32 %1990
  store i32 %2004, i32* %2005, align 4
  %2006 = load i32, i32* %1988, align 4
  %2007 = load i32*, i32** %1972, align 4
  %2008 = add i32 %2006, 1
  store i32 %2008, i32* %1988, align 4
  %2009 = icmp eq i32* %2007, null
  br i1 %2009, label %2017, label %2010

2010:                                             ; preds = %1996
  %2011 = load i8, i8* %1859, align 1
  %2012 = zext i8 %2011 to i32
  %2013 = shl nuw nsw i32 %2012, 7
  %2014 = or i32 %2013, 163859
  %2015 = getelementptr i32, i32* %2007, i32 %2008
  store i32 %2014, i32* %2015, align 4
  %2016 = load i32, i32* %1988, align 4
  br label %2017

2017:                                             ; preds = %1992, %1996, %2010
  %2018 = phi i32* [ %1988, %1996 ], [ %1988, %2010 ], [ %1993, %1992 ]
  %2019 = phi i32 [ %2008, %1996 ], [ %2016, %2010 ], [ %1995, %1992 ]
  %2020 = add i32 %2019, 1
  store i32 %2020, i32* %2018, align 4
  %2021 = load i8, i8* %1971, align 1
  call fastcc void @emit_rev32(i8 signext %2021, %struct.rv_jit_context* %1)
  %2022 = load i8, i8* %1859, align 1
  call fastcc void @emit_rev32(i8 signext %2022, %struct.rv_jit_context* %1)
  br label %2025

2023:                                             ; preds = %1858
  %2024 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %21) #6
  br label %3989

2025:                                             ; preds = %1920, %1945, %1966, %1941, %2017
  br i1 %1826, label %2026, label %3989

2026:                                             ; preds = %2025
  %2027 = sext i8 %1823 to i16
  %2028 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2029 = load i32*, i32** %2028, align 4
  %2030 = icmp eq i32* %2029, null
  br i1 %2030, label %2048, label %2031

2031:                                             ; preds = %2026
  %2032 = lshr i16 %2027, 5
  %2033 = zext i16 %2032 to i32
  %2034 = shl i32 %2033, 25
  %2035 = load i8, i8* %1859, align 1
  %2036 = zext i8 %2035 to i32
  %2037 = shl nuw nsw i32 %2036, 20
  %2038 = shl nsw i16 %2027, 7
  %2039 = and i16 %2038, 3968
  %2040 = zext i16 %2039 to i32
  %2041 = or i32 %2034, %2040
  %2042 = or i32 %2041, %2037
  %2043 = or i32 %2042, 270371
  %2044 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2045 = load i32, i32* %2044, align 4
  %2046 = getelementptr i32, i32* %2029, i32 %2045
  store i32 %2043, i32* %2046, align 4
  %2047 = load i32*, i32** %2028, align 4
  br label %2048

2048:                                             ; preds = %2031, %2026
  %2049 = phi i32* [ null, %2026 ], [ %2047, %2031 ]
  %2050 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2051 = load i32, i32* %2050, align 4
  %2052 = add i32 %2051, 1
  store i32 %2052, i32* %2050, align 4
  %2053 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %2054 = load i8, i8* %2053, align 1
  %2055 = sext i8 %2054 to i16
  %2056 = icmp eq i32* %2049, null
  br i1 %2056, label %2073, label %2057

2057:                                             ; preds = %2048
  %2058 = lshr i16 %2055, 5
  %2059 = zext i16 %2058 to i32
  %2060 = shl i32 %2059, 25
  %2061 = getelementptr i8, i8* %1859, i32 1
  %2062 = load i8, i8* %2061, align 1
  %2063 = zext i8 %2062 to i32
  %2064 = shl nuw nsw i32 %2063, 20
  %2065 = shl nsw i16 %2055, 7
  %2066 = and i16 %2065, 3968
  %2067 = zext i16 %2066 to i32
  %2068 = or i32 %2060, %2067
  %2069 = or i32 %2068, %2064
  %2070 = or i32 %2069, 270371
  %2071 = getelementptr i32, i32* %2049, i32 %2052
  store i32 %2070, i32* %2071, align 4
  %2072 = load i32, i32* %2050, align 4
  br label %2073

2073:                                             ; preds = %2057, %2048
  %2074 = phi i32 [ %2052, %2048 ], [ %2072, %2057 ]
  %2075 = add i32 %2074, 1
  store i32 %2075, i32* %2050, align 4
  br label %3989

2076:                                             ; preds = %3
  %2077 = sext i16 %19 to i32
  %2078 = icmp sgt i32 %16, 0
  br i1 %2078, label %2079, label %2085

2079:                                             ; preds = %2076
  %2080 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 4
  %2081 = load i32*, i32** %2080, align 4
  %2082 = add nsw i32 %17, -1
  %2083 = getelementptr i32, i32* %2081, i32 %2082
  %2084 = load i32, i32* %2083, align 4
  br label %2085

2085:                                             ; preds = %2079, %2076
  %2086 = phi i32 [ %2084, %2079 ], [ 0, %2076 ]
  %2087 = add nsw i32 %17, %2077
  %2088 = icmp sgt i32 %2087, -1
  br i1 %2088, label %2089, label %2094

2089:                                             ; preds = %2085
  %2090 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 4
  %2091 = load i32*, i32** %2090, align 4
  %2092 = getelementptr i32, i32* %2091, i32 %2087
  %2093 = load i32, i32* %2092, align 4
  br label %2094

2094:                                             ; preds = %2085, %2089
  %2095 = phi i32 [ %2093, %2089 ], [ 0, %2085 ]
  %2096 = sub i32 %2095, %2086
  %2097 = shl i32 %2096, 2
  %2098 = icmp eq i32 %2097, 0
  %2099 = add i32 %2097, 1048576
  %2100 = icmp ugt i32 %2099, 2097151
  %2101 = or i1 %2098, %2100
  br i1 %2101, label %2127, label %2102

2102:                                             ; preds = %2094
  %2103 = ashr exact i32 %2097, 1
  %2104 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2105 = load i32*, i32** %2104, align 4
  %2106 = icmp eq i32* %2105, null
  br i1 %2106, label %2123, label %2107

2107:                                             ; preds = %2102
  %2108 = shl i32 %2096, 10
  %2109 = and i32 %2108, 523264
  %2110 = and i32 %2103, 524288
  %2111 = or i32 %2110, %2109
  %2112 = lshr i32 %2103, 2
  %2113 = and i32 %2112, 256
  %2114 = or i32 %2111, %2113
  %2115 = lshr i32 %2103, 11
  %2116 = and i32 %2115, 255
  %2117 = or i32 %2114, %2116
  %2118 = shl nuw i32 %2117, 12
  %2119 = or i32 %2118, 111
  %2120 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2121 = load i32, i32* %2120, align 4
  %2122 = getelementptr i32, i32* %2105, i32 %2121
  store i32 %2119, i32* %2122, align 4
  br label %2123

2123:                                             ; preds = %2107, %2102
  %2124 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2125 = load i32, i32* %2124, align 4
  %2126 = add i32 %2125, 1
  store i32 %2126, i32* %2124, align 4
  br label %3989

2127:                                             ; preds = %2094
  %2128 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2129 = load i32*, i32** %2128, align 4
  %2130 = icmp eq i32* %2129, null
  br i1 %2130, label %2131, label %2135

2131:                                             ; preds = %2127
  %2132 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2133 = load i32, i32* %2132, align 4
  %2134 = add i32 %2133, 1
  store i32 %2134, i32* %2132, align 4
  br label %2151

2135:                                             ; preds = %2127
  %2136 = add nuw i32 %2097, 2048
  %2137 = and i32 %2136, -4096
  %2138 = or i32 %2137, 791
  %2139 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2140 = load i32, i32* %2139, align 4
  %2141 = getelementptr i32, i32* %2129, i32 %2140
  store i32 %2138, i32* %2141, align 4
  %2142 = load i32*, i32** %2128, align 4
  %2143 = load i32, i32* %2139, align 4
  %2144 = add i32 %2143, 1
  store i32 %2144, i32* %2139, align 4
  %2145 = icmp eq i32* %2142, null
  br i1 %2145, label %2151, label %2146

2146:                                             ; preds = %2135
  %2147 = shl i32 %2096, 22
  %2148 = or i32 %2147, 196711
  %2149 = getelementptr i32, i32* %2142, i32 %2144
  store i32 %2148, i32* %2149, align 4
  %2150 = load i32, i32* %2139, align 4
  br label %2151

2151:                                             ; preds = %2146, %2135, %2131
  %2152 = phi i32* [ %2139, %2135 ], [ %2139, %2146 ], [ %2132, %2131 ]
  %2153 = phi i32 [ %2144, %2135 ], [ %2150, %2146 ], [ %2134, %2131 ]
  %2154 = add i32 %2153, 1
  store i32 %2154, i32* %2152, align 4
  br label %3989

2155:                                             ; preds = %3
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %4) #5
  %2156 = bitcast i64* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2156) #5
  %2157 = call i32 @bpf_jit_get_func_addr(%struct.bpf_prog* %12, %struct.bpf_insn* %0, i1 zeroext %2, i64* nonnull %5, i8* nonnull %4) #5
  %2158 = icmp slt i32 %2157, 0
  br i1 %2158, label %2259, label %2159

2159:                                             ; preds = %2155
  %2160 = load i64, i64* %5, align 8
  %2161 = trunc i64 %2160 to i32
  %2162 = add i32 %2161, 2048
  %2163 = and i32 %2162, -4096
  %2164 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2165 = load i32*, i32** %2164, align 4
  %2166 = icmp eq i32* %2165, null
  %2167 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2168 = load i32, i32* %2167, align 4
  br i1 %2166, label %2169, label %2171

2169:                                             ; preds = %2159
  %2170 = add i32 %2168, 1
  store i32 %2170, i32* %2167, align 4
  br label %2177

2171:                                             ; preds = %2159
  %2172 = getelementptr i32, i32* %2165, i32 %2168
  store i32 -16711405, i32* %2172, align 4
  %2173 = load i32*, i32** %2164, align 4
  %2174 = load i32, i32* %2167, align 4
  %2175 = add i32 %2174, 1
  store i32 %2175, i32* %2167, align 4
  %2176 = icmp eq i32* %2173, null
  br i1 %2176, label %2177, label %2180

2177:                                             ; preds = %2171, %2169
  %2178 = phi i32 [ %2175, %2171 ], [ %2170, %2169 ]
  %2179 = add i32 %2178, 1
  store i32 %2179, i32* %2167, align 4
  br label %2186

2180:                                             ; preds = %2171
  %2181 = getelementptr i32, i32* %2173, i32 %2175
  store i32 19996707, i32* %2181, align 4
  %2182 = load i32, i32* %2167, align 4
  %2183 = load i32*, i32** %2164, align 4
  %2184 = add i32 %2182, 1
  store i32 %2184, i32* %2167, align 4
  %2185 = icmp eq i32* %2183, null
  br i1 %2185, label %2186, label %2189

2186:                                             ; preds = %2180, %2177
  %2187 = phi i32 [ %2178, %2177 ], [ %2182, %2180 ]
  %2188 = add i32 %2187, 2
  store i32 %2188, i32* %2167, align 4
  br label %2195

2189:                                             ; preds = %2180
  %2190 = getelementptr i32, i32* %2183, i32 %2184
  store i32 21045795, i32* %2190, align 4
  %2191 = load i32*, i32** %2164, align 4
  %2192 = load i32, i32* %2167, align 4
  %2193 = add i32 %2192, 1
  store i32 %2193, i32* %2167, align 4
  %2194 = icmp eq i32* %2191, null
  br i1 %2194, label %2195, label %2198

2195:                                             ; preds = %2189, %2186
  %2196 = phi i32 [ %2188, %2186 ], [ %2193, %2189 ]
  %2197 = add i32 %2196, 1
  store i32 %2197, i32* %2167, align 4
  br label %2204

2198:                                             ; preds = %2189
  %2199 = getelementptr i32, i32* %2191, i32 %2193
  store i32 1018771, i32* %2199, align 4
  %2200 = load i32*, i32** %2164, align 4
  %2201 = load i32, i32* %2167, align 4
  %2202 = add i32 %2201, 1
  store i32 %2202, i32* %2167, align 4
  %2203 = icmp eq i32* %2200, null
  br i1 %2203, label %2204, label %2207

2204:                                             ; preds = %2198, %2195
  %2205 = phi i32 [ %2197, %2195 ], [ %2202, %2198 ]
  %2206 = add i32 %2205, 1
  store i32 %2206, i32* %2167, align 4
  br label %2214

2207:                                             ; preds = %2198
  %2208 = or i32 %2163, 823
  %2209 = getelementptr i32, i32* %2200, i32 %2202
  store i32 %2208, i32* %2209, align 4
  %2210 = load i32, i32* %2167, align 4
  %2211 = load i32*, i32** %2164, align 4
  %2212 = add i32 %2210, 1
  store i32 %2212, i32* %2167, align 4
  %2213 = icmp eq i32* %2211, null
  br i1 %2213, label %2214, label %2218

2214:                                             ; preds = %2207, %2204
  %2215 = phi i32 [ %2205, %2204 ], [ %2210, %2207 ]
  %2216 = add i32 %2215, 2
  %2217 = add i32 %2215, 3
  store i32 %2217, i32* %2167, align 4
  br label %2235

2218:                                             ; preds = %2207
  %2219 = shl i32 %2161, 20
  %2220 = or i32 %2219, 196839
  %2221 = getelementptr i32, i32* %2211, i32 %2212
  store i32 %2220, i32* %2221, align 4
  %2222 = load i32*, i32** %2164, align 4
  %2223 = load i32, i32* %2167, align 4
  %2224 = add i32 %2223, 1
  store i32 %2224, i32* %2167, align 4
  %2225 = icmp eq i32* %2222, null
  br i1 %2225, label %2226, label %2229

2226:                                             ; preds = %2218
  %2227 = add i32 %2223, 2
  %2228 = add i32 %2223, 3
  store i32 %2228, i32* %2167, align 4
  br label %2244

2229:                                             ; preds = %2218
  %2230 = getelementptr i32, i32* %2222, i32 %2224
  store i32 757651, i32* %2230, align 4
  %2231 = load i32*, i32** %2164, align 4
  %2232 = load i32, i32* %2167, align 4
  %2233 = add i32 %2232, 1
  store i32 %2233, i32* %2167, align 4
  %2234 = icmp eq i32* %2231, null
  br i1 %2234, label %2235, label %2238

2235:                                             ; preds = %2229, %2214
  %2236 = phi i32 [ %2216, %2214 ], [ %2232, %2229 ]
  %2237 = add i32 %2236, 3
  store i32 %2237, i32* %2167, align 4
  br label %2256

2238:                                             ; preds = %2229
  %2239 = getelementptr i32, i32* %2231, i32 %2233
  store i32 328851, i32* %2239, align 4
  %2240 = load i32*, i32** %2164, align 4
  %2241 = load i32, i32* %2167, align 4
  %2242 = add i32 %2241, 1
  store i32 %2242, i32* %2167, align 4
  %2243 = icmp eq i32* %2240, null
  br i1 %2243, label %2244, label %2247

2244:                                             ; preds = %2238, %2226
  %2245 = phi i32 [ %2227, %2226 ], [ %2241, %2238 ]
  %2246 = add i32 %2245, 2
  store i32 %2246, i32* %2167, align 4
  br label %2256

2247:                                             ; preds = %2238
  %2248 = getelementptr i32, i32* %2240, i32 %2242
  store i32 362771, i32* %2248, align 4
  %2249 = load i32*, i32** %2164, align 4
  %2250 = load i32, i32* %2167, align 4
  %2251 = add i32 %2250, 1
  store i32 %2251, i32* %2167, align 4
  %2252 = icmp eq i32* %2249, null
  br i1 %2252, label %2256, label %2253

2253:                                             ; preds = %2247
  %2254 = getelementptr i32, i32* %2249, i32 %2251
  store i32 16843027, i32* %2254, align 4
  %2255 = load i32, i32* %2167, align 4
  br label %2256

2256:                                             ; preds = %2235, %2244, %2247, %2253
  %2257 = phi i32 [ %2246, %2244 ], [ %2251, %2247 ], [ %2255, %2253 ], [ %2237, %2235 ]
  %2258 = add i32 %2257, 1
  store i32 %2258, i32* %2167, align 4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2156) #5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #5
  br label %3989

2259:                                             ; preds = %2155
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2156) #5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #5
  br label %3989

2260:                                             ; preds = %3
  %2261 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2262 = load i32, i32* %2261, align 4
  %2263 = icmp eq i32 %16, 0
  %2264 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 4
  %2265 = load i32*, i32** %2264, align 4
  br i1 %2263, label %2273, label %2266

2266:                                             ; preds = %2260
  %2267 = getelementptr i32, i32* %2265, i32 %17
  %2268 = load i32, i32* %2267, align 4
  %2269 = add nsw i32 %17, -1
  %2270 = getelementptr i32, i32* %2265, i32 %2269
  %2271 = load i32, i32* %2270, align 4
  %2272 = sub i32 %2268, %2271
  br label %2275

2273:                                             ; preds = %2260
  %2274 = load i32, i32* %2265, align 4
  br label %2275

2275:                                             ; preds = %2273, %2266
  %2276 = phi i32 [ %2272, %2266 ], [ %2274, %2273 ]
  %2277 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2278 = load i32*, i32** %2277, align 4
  %2279 = icmp eq i32* %2278, null
  br i1 %2279, label %2283, label %2280

2280:                                             ; preds = %2275
  %2281 = getelementptr i32, i32* %2278, i32 %2262
  store i32 21373699, i32* %2281, align 4
  %2282 = load i32, i32* %2261, align 4
  br label %2283

2283:                                             ; preds = %2280, %2275
  %2284 = phi i32 [ %2262, %2275 ], [ %2282, %2280 ]
  %2285 = add i32 %2284, 1
  store i32 %2285, i32* %2261, align 4
  %2286 = xor i32 %2284, 1073741823
  %2287 = add i32 %2276, %2262
  %2288 = add i32 %2286, %2287
  %2289 = shl i32 %2288, 2
  call fastcc void @emit_bcc(i8 zeroext 48, i8 zeroext 14, i8 zeroext 6, i32 %2289, %struct.rv_jit_context* %1) #5
  %2290 = load i32*, i32** %2277, align 4
  %2291 = icmp eq i32* %2290, null
  br i1 %2291, label %2295, label %2292

2292:                                             ; preds = %2283
  %2293 = load i32, i32* %2261, align 4
  %2294 = getelementptr i32, i32* %2290, i32 %2293
  store i32 -31981, i32* %2294, align 4
  br label %2295

2295:                                             ; preds = %2292, %2283
  %2296 = load i32, i32* %2261, align 4
  %2297 = add i32 %2296, 1
  store i32 %2297, i32* %2261, align 4
  %2298 = xor i32 %2296, 1073741823
  %2299 = add i32 %2298, %2287
  %2300 = shl i32 %2299, 2
  call fastcc void @emit_bcc(i8 zeroext -64, i8 zeroext 31, i8 zeroext 0, i32 %2300, %struct.rv_jit_context* %1) #5
  %2301 = load i32*, i32** %2277, align 4
  %2302 = icmp eq i32* %2301, null
  %2303 = load i32, i32* %2261, align 4
  br i1 %2302, label %2304, label %2306

2304:                                             ; preds = %2295
  %2305 = add i32 %2303, 2
  store i32 %2305, i32* %2261, align 4
  br label %2323

2306:                                             ; preds = %2295
  %2307 = getelementptr i32, i32* %2301, i32 %2303
  store i32 2560659, i32* %2307, align 4
  %2308 = load i32*, i32** %2277, align 4
  %2309 = load i32, i32* %2261, align 4
  %2310 = add i32 %2309, 1
  store i32 %2310, i32* %2261, align 4
  %2311 = icmp eq i32* %2308, null
  br i1 %2311, label %2312, label %2314

2312:                                             ; preds = %2306
  %2313 = add i32 %2309, 2
  store i32 %2313, i32* %2261, align 4
  br label %2323

2314:                                             ; preds = %2306
  %2315 = getelementptr i32, i32* %2308, i32 %2310
  store i32 12747443, i32* %2315, align 4
  %2316 = load i32*, i32** %2277, align 4
  %2317 = load i32, i32* %2261, align 4
  %2318 = add i32 %2317, 1
  store i32 %2318, i32* %2261, align 4
  %2319 = icmp eq i32* %2316, null
  br i1 %2319, label %2323, label %2320

2320:                                             ; preds = %2314
  %2321 = getelementptr i32, i32* %2316, i32 %2318
  store i32 285385347, i32* %2321, align 4
  %2322 = load i32, i32* %2261, align 4
  br label %2323

2323:                                             ; preds = %2320, %2314, %2312, %2304
  %2324 = phi i32 [ %2322, %2320 ], [ %2318, %2314 ], [ %2313, %2312 ], [ %2305, %2304 ]
  %2325 = add i32 %2324, 1
  store i32 %2325, i32* %2261, align 4
  %2326 = xor i32 %2324, 1073741823
  %2327 = add i32 %2326, %2287
  %2328 = shl i32 %2327, 2
  call fastcc void @emit_bcc(i8 zeroext 16, i8 zeroext 5, i8 zeroext 0, i32 %2328, %struct.rv_jit_context* %1) #5
  %2329 = load i32*, i32** %2277, align 4
  %2330 = icmp eq i32* %2329, null
  %2331 = load i32, i32* %2261, align 4
  br i1 %2330, label %2332, label %2334

2332:                                             ; preds = %2323
  %2333 = add i32 %2331, 1
  store i32 %2333, i32* %2261, align 4
  br label %2343

2334:                                             ; preds = %2323
  %2335 = getelementptr i32, i32* %2329, i32 %2331
  store i32 37921411, i32* %2335, align 4
  %2336 = load i32*, i32** %2277, align 4
  %2337 = load i32, i32* %2261, align 4
  %2338 = add i32 %2337, 1
  store i32 %2338, i32* %2261, align 4
  %2339 = icmp eq i32* %2336, null
  br i1 %2339, label %2343, label %2340

2340:                                             ; preds = %2334
  %2341 = getelementptr i32, i32* %2336, i32 %2338
  store i32 200595, i32* %2341, align 4
  %2342 = load i32, i32* %2261, align 4
  br label %2343

2343:                                             ; preds = %2332, %2334, %2340
  %2344 = phi i32 [ %2342, %2340 ], [ %2338, %2334 ], [ %2333, %2332 ]
  %2345 = add i32 %2344, 1
  store i32 %2345, i32* %2261, align 4
  call fastcc void @__build_epilogue(i1 zeroext true, %struct.rv_jit_context* %1) #5
  br label %3989

2346:                                             ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3, %3
  %2347 = sext i16 %19 to i32
  %2348 = icmp sgt i32 %16, 0
  br i1 %2348, label %2349, label %2355

2349:                                             ; preds = %2346
  %2350 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 4
  %2351 = load i32*, i32** %2350, align 4
  %2352 = add nsw i32 %17, -1
  %2353 = getelementptr i32, i32* %2351, i32 %2352
  %2354 = load i32, i32* %2353, align 4
  br label %2355

2355:                                             ; preds = %2349, %2346
  %2356 = phi i32 [ %2354, %2349 ], [ 0, %2346 ]
  %2357 = add nsw i32 %17, %2347
  %2358 = icmp sgt i32 %2357, -1
  br i1 %2358, label %2359, label %2364

2359:                                             ; preds = %2355
  %2360 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 4
  %2361 = load i32*, i32** %2360, align 4
  %2362 = getelementptr i32, i32* %2361, i32 %2357
  %2363 = load i32, i32* %2362, align 4
  br label %2364

2364:                                             ; preds = %2355, %2359
  %2365 = phi i32 [ %2363, %2359 ], [ 0, %2355 ]
  %2366 = sub i32 %2365, %2356
  %2367 = shl i32 %2366, 2
  %2368 = and i32 %30, 8
  %2369 = icmp eq i32 %2368, 0
  %2370 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %2371 = load i32, i32* %2370, align 4
  br i1 %2369, label %2372, label %2422

2372:                                             ; preds = %2364
  %2373 = add i32 %21, 2048
  %2374 = and i32 %21, 4095
  %2375 = icmp ult i32 %2373, 4096
  %2376 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2377 = load i32*, i32** %2376, align 4
  %2378 = icmp eq i32* %2377, null
  br i1 %2375, label %2395, label %2379

2379:                                             ; preds = %2372
  br i1 %2378, label %2380, label %2382

2380:                                             ; preds = %2379
  %2381 = add i32 %2371, 1
  store i32 %2381, i32* %2370, align 4
  br label %2401

2382:                                             ; preds = %2379
  %2383 = and i32 %2373, -4096
  %2384 = or i32 %2383, 3767
  %2385 = getelementptr i32, i32* %2377, i32 %2371
  store i32 %2384, i32* %2385, align 4
  %2386 = load i32*, i32** %2376, align 4
  %2387 = load i32, i32* %2370, align 4
  %2388 = add i32 %2387, 1
  store i32 %2388, i32* %2370, align 4
  %2389 = icmp eq i32* %2386, null
  br i1 %2389, label %2404, label %2390

2390:                                             ; preds = %2382
  %2391 = shl nuw i32 %2374, 20
  %2392 = or i32 %2391, 954003
  %2393 = getelementptr i32, i32* %2386, i32 %2388
  store i32 %2392, i32* %2393, align 4
  %2394 = load i32, i32* %2370, align 4
  br label %2401

2395:                                             ; preds = %2372
  br i1 %2378, label %2404, label %2396

2396:                                             ; preds = %2395
  %2397 = shl nuw i32 %2374, 20
  %2398 = or i32 %2397, 3731
  %2399 = getelementptr i32, i32* %2377, i32 %2371
  store i32 %2398, i32* %2399, align 4
  %2400 = load i32, i32* %2370, align 4
  br label %2401

2401:                                             ; preds = %2390, %2380, %2396
  %2402 = phi i32 [ %2400, %2396 ], [ %2381, %2380 ], [ %2394, %2390 ]
  %2403 = load i32*, i32** %2376, align 4
  br label %2404

2404:                                             ; preds = %2401, %2395, %2382
  %2405 = phi i32* [ %2403, %2401 ], [ null, %2395 ], [ null, %2382 ]
  %2406 = phi i32 [ %2402, %2401 ], [ %2371, %2395 ], [ %2388, %2382 ]
  %2407 = add i32 %2406, 1
  store i32 %2407, i32* %2370, align 4
  %2408 = icmp sgt i32 %21, -1
  %2409 = icmp eq i32* %2405, null
  br i1 %2408, label %2410, label %2413

2410:                                             ; preds = %2404
  br i1 %2409, label %2416, label %2411

2411:                                             ; preds = %2410
  %2412 = getelementptr i32, i32* %2405, i32 %2407
  store i32 3859, i32* %2412, align 4
  br label %2416

2413:                                             ; preds = %2404
  br i1 %2409, label %2416, label %2414

2414:                                             ; preds = %2413
  %2415 = getelementptr i32, i32* %2405, i32 %2407
  store i32 -1044717, i32* %2415, align 4
  br label %2416

2416:                                             ; preds = %2413, %2414, %2410, %2411
  %2417 = load i32, i32* %2370, align 4
  %2418 = add i32 %2417, 1
  store i32 %2418, i32* %2370, align 4
  %2419 = sub i32 %2418, %2371
  %2420 = shl i32 %2419, 2
  %2421 = sub i32 %2367, %2420
  br label %2422

2422:                                             ; preds = %2364, %2416
  %2423 = phi i32 [ %2418, %2416 ], [ %2371, %2364 ]
  %2424 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %2416 ], [ %29, %2364 ]
  %2425 = phi i32 [ %2421, %2416 ], [ %2367, %2364 ]
  %2426 = and i8 %7, -16
  %2427 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  br i1 %10, label %2428, label %3075

2428:                                             ; preds = %2422
  %2429 = load i8, i8* %26, align 1
  %2430 = lshr i32 3008, %25
  %2431 = and i32 %2430, 1
  %2432 = icmp eq i32 %2431, 0
  br i1 %2432, label %2459, label %2433

2433:                                             ; preds = %2428
  %2434 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2435 = load i32*, i32** %2434, align 4
  %2436 = icmp eq i32* %2435, null
  br i1 %2436, label %2437, label %2439

2437:                                             ; preds = %2433
  %2438 = add i32 %2423, 1
  store i32 %2438, i32* %2427, align 4
  br label %2456

2439:                                             ; preds = %2433
  %2440 = sext i8 %2429 to i32
  %2441 = shl nsw i32 %2440, 20
  %2442 = or i32 %2441, 273923
  %2443 = getelementptr i32, i32* %2435, i32 %2423
  store i32 %2442, i32* %2443, align 4
  %2444 = load i32*, i32** %2434, align 4
  %2445 = load i32, i32* %2427, align 4
  %2446 = add i32 %2445, 1
  store i32 %2446, i32* %2427, align 4
  %2447 = icmp eq i32* %2444, null
  br i1 %2447, label %2456, label %2448

2448:                                             ; preds = %2439
  %2449 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %2450 = load i8, i8* %2449, align 1
  %2451 = sext i8 %2450 to i32
  %2452 = shl nsw i32 %2451, 20
  %2453 = or i32 %2452, 271235
  %2454 = getelementptr i32, i32* %2444, i32 %2446
  store i32 %2453, i32* %2454, align 4
  %2455 = load i32, i32* %2427, align 4
  br label %2456

2456:                                             ; preds = %2448, %2439, %2437
  %2457 = phi i32 [ %2446, %2439 ], [ %2455, %2448 ], [ %2438, %2437 ]
  %2458 = add i32 %2457, 1
  store i32 %2458, i32* %2427, align 4
  br label %2459

2459:                                             ; preds = %2428, %2456
  %2460 = phi i32 [ %2458, %2456 ], [ %2423, %2428 ]
  %2461 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %2456 ], [ %26, %2428 ]
  %2462 = load i8, i8* %2424, align 1
  %2463 = icmp slt i8 %2462, 0
  br i1 %2463, label %2464, label %2490

2464:                                             ; preds = %2459
  %2465 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2466 = load i32*, i32** %2465, align 4
  %2467 = icmp eq i32* %2466, null
  br i1 %2467, label %2468, label %2470

2468:                                             ; preds = %2464
  %2469 = add i32 %2460, 1
  store i32 %2469, i32* %2427, align 4
  br label %2487

2470:                                             ; preds = %2464
  %2471 = sext i8 %2462 to i32
  %2472 = shl nsw i32 %2471, 20
  %2473 = or i32 %2472, 274179
  %2474 = getelementptr i32, i32* %2466, i32 %2460
  store i32 %2473, i32* %2474, align 4
  %2475 = load i32*, i32** %2465, align 4
  %2476 = load i32, i32* %2427, align 4
  %2477 = add i32 %2476, 1
  store i32 %2477, i32* %2427, align 4
  %2478 = icmp eq i32* %2475, null
  br i1 %2478, label %2487, label %2479

2479:                                             ; preds = %2470
  %2480 = getelementptr i8, i8* %2424, i32 1
  %2481 = load i8, i8* %2480, align 1
  %2482 = sext i8 %2481 to i32
  %2483 = shl nsw i32 %2482, 20
  %2484 = or i32 %2483, 274051
  %2485 = getelementptr i32, i32* %2475, i32 %2477
  store i32 %2484, i32* %2485, align 4
  %2486 = load i32, i32* %2427, align 4
  br label %2487

2487:                                             ; preds = %2479, %2470, %2468
  %2488 = phi i32 [ %2477, %2470 ], [ %2486, %2479 ], [ %2469, %2468 ]
  %2489 = add i32 %2488, 1
  store i32 %2489, i32* %2427, align 4
  br label %2490

2490:                                             ; preds = %2487, %2459
  %2491 = phi i32 [ %2489, %2487 ], [ %2460, %2459 ]
  %2492 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %2487 ], [ %2424, %2459 ]
  %2493 = zext i8 %2426 to i32
  %2494 = add nsw i32 %2493, -16
  %2495 = lshr exact i32 %2494, 4
  switch i32 %2495, label %3048 [
    i32 0, label %2496
    i32 1, label %2532
    i32 9, label %2585
    i32 2, label %2638
    i32 10, label %2691
    i32 4, label %2744
    i32 5, label %2780
    i32 11, label %2833
    i32 6, label %2886
    i32 12, label %2939
    i32 3, label %2992
  ]

2496:                                             ; preds = %2490
  %2497 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2498 = load i32*, i32** %2497, align 4
  %2499 = icmp eq i32* %2498, null
  br i1 %2499, label %2500, label %2502

2500:                                             ; preds = %2496
  %2501 = add i32 %2491, 1
  store i32 %2501, i32* %2427, align 4
  br label %2529

2502:                                             ; preds = %2496
  %2503 = load i8, i8* %2461, align 1
  %2504 = zext i8 %2503 to i32
  %2505 = shl nuw nsw i32 %2504, 15
  %2506 = load i8, i8* %2492, align 1
  %2507 = zext i8 %2506 to i32
  %2508 = shl nuw nsw i32 %2507, 20
  %2509 = or i32 %2505, %2508
  %2510 = or i32 %2509, 6243
  %2511 = getelementptr i32, i32* %2498, i32 %2491
  store i32 %2510, i32* %2511, align 4
  %2512 = load i32, i32* %2427, align 4
  %2513 = load i32*, i32** %2497, align 4
  %2514 = add i32 %2512, 1
  store i32 %2514, i32* %2427, align 4
  %2515 = icmp eq i32* %2513, null
  br i1 %2515, label %2529, label %2516

2516:                                             ; preds = %2502
  %2517 = getelementptr i8, i8* %2461, i32 1
  %2518 = load i8, i8* %2517, align 1
  %2519 = zext i8 %2518 to i32
  %2520 = shl nuw nsw i32 %2519, 15
  %2521 = getelementptr i8, i8* %2492, i32 1
  %2522 = load i8, i8* %2521, align 1
  %2523 = zext i8 %2522 to i32
  %2524 = shl nuw nsw i32 %2523, 20
  %2525 = or i32 %2520, %2524
  %2526 = or i32 %2525, 5731
  %2527 = getelementptr i32, i32* %2513, i32 %2514
  store i32 %2526, i32* %2527, align 4
  %2528 = load i32, i32* %2427, align 4
  br label %2529

2529:                                             ; preds = %2516, %2502, %2500
  %2530 = phi i32 [ %2514, %2502 ], [ %2528, %2516 ], [ %2501, %2500 ]
  %2531 = add i32 %2530, 1
  br label %3046

2532:                                             ; preds = %2490
  %2533 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2534 = load i32*, i32** %2533, align 4
  %2535 = icmp eq i32* %2534, null
  br i1 %2535, label %2536, label %2538

2536:                                             ; preds = %2532
  %2537 = add i32 %2491, 1
  store i32 %2537, i32* %2427, align 4
  br label %2552

2538:                                             ; preds = %2532
  %2539 = load i8, i8* %2461, align 1
  %2540 = zext i8 %2539 to i32
  %2541 = shl nuw nsw i32 %2540, 20
  %2542 = load i8, i8* %2492, align 1
  %2543 = zext i8 %2542 to i32
  %2544 = shl nuw nsw i32 %2543, 15
  %2545 = or i32 %2541, %2544
  %2546 = or i32 %2545, 26211
  %2547 = getelementptr i32, i32* %2534, i32 %2491
  store i32 %2546, i32* %2547, align 4
  %2548 = load i32, i32* %2427, align 4
  %2549 = load i32*, i32** %2533, align 4
  %2550 = add i32 %2548, 1
  store i32 %2550, i32* %2427, align 4
  %2551 = icmp eq i32* %2549, null
  br i1 %2551, label %2552, label %2555

2552:                                             ; preds = %2538, %2536
  %2553 = phi i32 [ %2537, %2536 ], [ %2550, %2538 ]
  %2554 = add i32 %2553, 1
  store i32 %2554, i32* %2427, align 4
  br label %2582

2555:                                             ; preds = %2538
  %2556 = load i8, i8* %2461, align 1
  %2557 = zext i8 %2556 to i32
  %2558 = shl nuw nsw i32 %2557, 15
  %2559 = load i8, i8* %2492, align 1
  %2560 = zext i8 %2559 to i32
  %2561 = shl nuw nsw i32 %2560, 20
  %2562 = or i32 %2558, %2561
  %2563 = or i32 %2562, 26723
  %2564 = getelementptr i32, i32* %2549, i32 %2550
  store i32 %2563, i32* %2564, align 4
  %2565 = load i32, i32* %2427, align 4
  %2566 = load i32*, i32** %2533, align 4
  %2567 = add i32 %2565, 1
  store i32 %2567, i32* %2427, align 4
  %2568 = icmp eq i32* %2566, null
  br i1 %2568, label %2582, label %2569

2569:                                             ; preds = %2555
  %2570 = getelementptr i8, i8* %2461, i32 1
  %2571 = load i8, i8* %2570, align 1
  %2572 = zext i8 %2571 to i32
  %2573 = shl nuw nsw i32 %2572, 20
  %2574 = getelementptr i8, i8* %2492, i32 1
  %2575 = load i8, i8* %2574, align 1
  %2576 = zext i8 %2575 to i32
  %2577 = shl nuw nsw i32 %2576, 15
  %2578 = or i32 %2573, %2577
  %2579 = or i32 %2578, 30307
  %2580 = getelementptr i32, i32* %2566, i32 %2567
  store i32 %2579, i32* %2580, align 4
  %2581 = load i32, i32* %2427, align 4
  br label %2582

2582:                                             ; preds = %2569, %2555, %2552
  %2583 = phi i32 [ %2567, %2555 ], [ %2581, %2569 ], [ %2554, %2552 ]
  %2584 = add i32 %2583, 1
  br label %3046

2585:                                             ; preds = %2490
  %2586 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2587 = load i32*, i32** %2586, align 4
  %2588 = icmp eq i32* %2587, null
  br i1 %2588, label %2589, label %2591

2589:                                             ; preds = %2585
  %2590 = add i32 %2491, 1
  store i32 %2590, i32* %2427, align 4
  br label %2605

2591:                                             ; preds = %2585
  %2592 = load i8, i8* %2461, align 1
  %2593 = zext i8 %2592 to i32
  %2594 = shl nuw nsw i32 %2593, 15
  %2595 = load i8, i8* %2492, align 1
  %2596 = zext i8 %2595 to i32
  %2597 = shl nuw nsw i32 %2596, 20
  %2598 = or i32 %2594, %2597
  %2599 = or i32 %2598, 26211
  %2600 = getelementptr i32, i32* %2587, i32 %2491
  store i32 %2599, i32* %2600, align 4
  %2601 = load i32, i32* %2427, align 4
  %2602 = load i32*, i32** %2586, align 4
  %2603 = add i32 %2601, 1
  store i32 %2603, i32* %2427, align 4
  %2604 = icmp eq i32* %2602, null
  br i1 %2604, label %2605, label %2608

2605:                                             ; preds = %2591, %2589
  %2606 = phi i32 [ %2590, %2589 ], [ %2603, %2591 ]
  %2607 = add i32 %2606, 1
  store i32 %2607, i32* %2427, align 4
  br label %2635

2608:                                             ; preds = %2591
  %2609 = load i8, i8* %2461, align 1
  %2610 = zext i8 %2609 to i32
  %2611 = shl nuw nsw i32 %2610, 20
  %2612 = load i8, i8* %2492, align 1
  %2613 = zext i8 %2612 to i32
  %2614 = shl nuw nsw i32 %2613, 15
  %2615 = or i32 %2611, %2614
  %2616 = or i32 %2615, 26723
  %2617 = getelementptr i32, i32* %2602, i32 %2603
  store i32 %2616, i32* %2617, align 4
  %2618 = load i32, i32* %2427, align 4
  %2619 = load i32*, i32** %2586, align 4
  %2620 = add i32 %2618, 1
  store i32 %2620, i32* %2427, align 4
  %2621 = icmp eq i32* %2619, null
  br i1 %2621, label %2635, label %2622

2622:                                             ; preds = %2608
  %2623 = getelementptr i8, i8* %2461, i32 1
  %2624 = load i8, i8* %2623, align 1
  %2625 = zext i8 %2624 to i32
  %2626 = shl nuw nsw i32 %2625, 15
  %2627 = getelementptr i8, i8* %2492, i32 1
  %2628 = load i8, i8* %2627, align 1
  %2629 = zext i8 %2628 to i32
  %2630 = shl nuw nsw i32 %2629, 20
  %2631 = or i32 %2626, %2630
  %2632 = or i32 %2631, 30307
  %2633 = getelementptr i32, i32* %2619, i32 %2620
  store i32 %2632, i32* %2633, align 4
  %2634 = load i32, i32* %2427, align 4
  br label %2635

2635:                                             ; preds = %2622, %2608, %2605
  %2636 = phi i32 [ %2620, %2608 ], [ %2634, %2622 ], [ %2607, %2605 ]
  %2637 = add i32 %2636, 1
  br label %3046

2638:                                             ; preds = %2490
  %2639 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2640 = load i32*, i32** %2639, align 4
  %2641 = icmp eq i32* %2640, null
  br i1 %2641, label %2642, label %2644

2642:                                             ; preds = %2638
  %2643 = add i32 %2491, 1
  store i32 %2643, i32* %2427, align 4
  br label %2658

2644:                                             ; preds = %2638
  %2645 = load i8, i8* %2461, align 1
  %2646 = zext i8 %2645 to i32
  %2647 = shl nuw nsw i32 %2646, 20
  %2648 = load i8, i8* %2492, align 1
  %2649 = zext i8 %2648 to i32
  %2650 = shl nuw nsw i32 %2649, 15
  %2651 = or i32 %2647, %2650
  %2652 = or i32 %2651, 26211
  %2653 = getelementptr i32, i32* %2640, i32 %2491
  store i32 %2652, i32* %2653, align 4
  %2654 = load i32, i32* %2427, align 4
  %2655 = load i32*, i32** %2639, align 4
  %2656 = add i32 %2654, 1
  store i32 %2656, i32* %2427, align 4
  %2657 = icmp eq i32* %2655, null
  br i1 %2657, label %2658, label %2661

2658:                                             ; preds = %2644, %2642
  %2659 = phi i32 [ %2643, %2642 ], [ %2656, %2644 ]
  %2660 = add i32 %2659, 1
  store i32 %2660, i32* %2427, align 4
  br label %2688

2661:                                             ; preds = %2644
  %2662 = load i8, i8* %2461, align 1
  %2663 = zext i8 %2662 to i32
  %2664 = shl nuw nsw i32 %2663, 15
  %2665 = load i8, i8* %2492, align 1
  %2666 = zext i8 %2665 to i32
  %2667 = shl nuw nsw i32 %2666, 20
  %2668 = or i32 %2664, %2667
  %2669 = or i32 %2668, 26723
  %2670 = getelementptr i32, i32* %2655, i32 %2656
  store i32 %2669, i32* %2670, align 4
  %2671 = load i32, i32* %2427, align 4
  %2672 = load i32*, i32** %2639, align 4
  %2673 = add i32 %2671, 1
  store i32 %2673, i32* %2427, align 4
  %2674 = icmp eq i32* %2672, null
  br i1 %2674, label %2688, label %2675

2675:                                             ; preds = %2661
  %2676 = getelementptr i8, i8* %2461, i32 1
  %2677 = load i8, i8* %2676, align 1
  %2678 = zext i8 %2677 to i32
  %2679 = shl nuw nsw i32 %2678, 15
  %2680 = getelementptr i8, i8* %2492, i32 1
  %2681 = load i8, i8* %2680, align 1
  %2682 = zext i8 %2681 to i32
  %2683 = shl nuw nsw i32 %2682, 20
  %2684 = or i32 %2679, %2683
  %2685 = or i32 %2684, 26211
  %2686 = getelementptr i32, i32* %2672, i32 %2673
  store i32 %2685, i32* %2686, align 4
  %2687 = load i32, i32* %2427, align 4
  br label %2688

2688:                                             ; preds = %2675, %2661, %2658
  %2689 = phi i32 [ %2673, %2661 ], [ %2687, %2675 ], [ %2660, %2658 ]
  %2690 = add i32 %2689, 1
  br label %3046

2691:                                             ; preds = %2490
  %2692 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2693 = load i32*, i32** %2692, align 4
  %2694 = icmp eq i32* %2693, null
  br i1 %2694, label %2695, label %2697

2695:                                             ; preds = %2691
  %2696 = add i32 %2491, 1
  store i32 %2696, i32* %2427, align 4
  br label %2711

2697:                                             ; preds = %2691
  %2698 = load i8, i8* %2461, align 1
  %2699 = zext i8 %2698 to i32
  %2700 = shl nuw nsw i32 %2699, 15
  %2701 = load i8, i8* %2492, align 1
  %2702 = zext i8 %2701 to i32
  %2703 = shl nuw nsw i32 %2702, 20
  %2704 = or i32 %2700, %2703
  %2705 = or i32 %2704, 26211
  %2706 = getelementptr i32, i32* %2693, i32 %2491
  store i32 %2705, i32* %2706, align 4
  %2707 = load i32, i32* %2427, align 4
  %2708 = load i32*, i32** %2692, align 4
  %2709 = add i32 %2707, 1
  store i32 %2709, i32* %2427, align 4
  %2710 = icmp eq i32* %2708, null
  br i1 %2710, label %2711, label %2714

2711:                                             ; preds = %2697, %2695
  %2712 = phi i32 [ %2696, %2695 ], [ %2709, %2697 ]
  %2713 = add i32 %2712, 1
  store i32 %2713, i32* %2427, align 4
  br label %2741

2714:                                             ; preds = %2697
  %2715 = load i8, i8* %2461, align 1
  %2716 = zext i8 %2715 to i32
  %2717 = shl nuw nsw i32 %2716, 20
  %2718 = load i8, i8* %2492, align 1
  %2719 = zext i8 %2718 to i32
  %2720 = shl nuw nsw i32 %2719, 15
  %2721 = or i32 %2717, %2720
  %2722 = or i32 %2721, 26723
  %2723 = getelementptr i32, i32* %2708, i32 %2709
  store i32 %2722, i32* %2723, align 4
  %2724 = load i32, i32* %2427, align 4
  %2725 = load i32*, i32** %2692, align 4
  %2726 = add i32 %2724, 1
  store i32 %2726, i32* %2427, align 4
  %2727 = icmp eq i32* %2725, null
  br i1 %2727, label %2741, label %2728

2728:                                             ; preds = %2714
  %2729 = getelementptr i8, i8* %2461, i32 1
  %2730 = load i8, i8* %2729, align 1
  %2731 = zext i8 %2730 to i32
  %2732 = shl nuw nsw i32 %2731, 20
  %2733 = getelementptr i8, i8* %2492, i32 1
  %2734 = load i8, i8* %2733, align 1
  %2735 = zext i8 %2734 to i32
  %2736 = shl nuw nsw i32 %2735, 15
  %2737 = or i32 %2732, %2736
  %2738 = or i32 %2737, 26211
  %2739 = getelementptr i32, i32* %2725, i32 %2726
  store i32 %2738, i32* %2739, align 4
  %2740 = load i32, i32* %2427, align 4
  br label %2741

2741:                                             ; preds = %2728, %2714, %2711
  %2742 = phi i32 [ %2726, %2714 ], [ %2740, %2728 ], [ %2713, %2711 ]
  %2743 = add i32 %2742, 1
  br label %3046

2744:                                             ; preds = %2490
  %2745 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2746 = load i32*, i32** %2745, align 4
  %2747 = icmp eq i32* %2746, null
  br i1 %2747, label %2748, label %2750

2748:                                             ; preds = %2744
  %2749 = add i32 %2491, 1
  store i32 %2749, i32* %2427, align 4
  br label %2777

2750:                                             ; preds = %2744
  %2751 = load i8, i8* %2461, align 1
  %2752 = zext i8 %2751 to i32
  %2753 = shl nuw nsw i32 %2752, 15
  %2754 = load i8, i8* %2492, align 1
  %2755 = zext i8 %2754 to i32
  %2756 = shl nuw nsw i32 %2755, 20
  %2757 = or i32 %2753, %2756
  %2758 = or i32 %2757, 5219
  %2759 = getelementptr i32, i32* %2746, i32 %2491
  store i32 %2758, i32* %2759, align 4
  %2760 = load i32, i32* %2427, align 4
  %2761 = load i32*, i32** %2745, align 4
  %2762 = add i32 %2760, 1
  store i32 %2762, i32* %2427, align 4
  %2763 = icmp eq i32* %2761, null
  br i1 %2763, label %2777, label %2764

2764:                                             ; preds = %2750
  %2765 = getelementptr i8, i8* %2461, i32 1
  %2766 = load i8, i8* %2765, align 1
  %2767 = zext i8 %2766 to i32
  %2768 = shl nuw nsw i32 %2767, 15
  %2769 = getelementptr i8, i8* %2492, i32 1
  %2770 = load i8, i8* %2769, align 1
  %2771 = zext i8 %2770 to i32
  %2772 = shl nuw nsw i32 %2771, 20
  %2773 = or i32 %2768, %2772
  %2774 = or i32 %2773, 1635
  %2775 = getelementptr i32, i32* %2761, i32 %2762
  store i32 %2774, i32* %2775, align 4
  %2776 = load i32, i32* %2427, align 4
  br label %2777

2777:                                             ; preds = %2764, %2750, %2748
  %2778 = phi i32 [ %2762, %2750 ], [ %2776, %2764 ], [ %2749, %2748 ]
  %2779 = add i32 %2778, 1
  br label %3046

2780:                                             ; preds = %2490
  %2781 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2782 = load i32*, i32** %2781, align 4
  %2783 = icmp eq i32* %2782, null
  br i1 %2783, label %2784, label %2786

2784:                                             ; preds = %2780
  %2785 = add i32 %2491, 1
  store i32 %2785, i32* %2427, align 4
  br label %2800

2786:                                             ; preds = %2780
  %2787 = load i8, i8* %2461, align 1
  %2788 = zext i8 %2787 to i32
  %2789 = shl nuw nsw i32 %2788, 20
  %2790 = load i8, i8* %2492, align 1
  %2791 = zext i8 %2790 to i32
  %2792 = shl nuw nsw i32 %2791, 15
  %2793 = or i32 %2789, %2792
  %2794 = or i32 %2793, 18019
  %2795 = getelementptr i32, i32* %2782, i32 %2491
  store i32 %2794, i32* %2795, align 4
  %2796 = load i32, i32* %2427, align 4
  %2797 = load i32*, i32** %2781, align 4
  %2798 = add i32 %2796, 1
  store i32 %2798, i32* %2427, align 4
  %2799 = icmp eq i32* %2797, null
  br i1 %2799, label %2800, label %2803

2800:                                             ; preds = %2786, %2784
  %2801 = phi i32 [ %2785, %2784 ], [ %2798, %2786 ]
  %2802 = add i32 %2801, 1
  store i32 %2802, i32* %2427, align 4
  br label %2830

2803:                                             ; preds = %2786
  %2804 = load i8, i8* %2461, align 1
  %2805 = zext i8 %2804 to i32
  %2806 = shl nuw nsw i32 %2805, 15
  %2807 = load i8, i8* %2492, align 1
  %2808 = zext i8 %2807 to i32
  %2809 = shl nuw nsw i32 %2808, 20
  %2810 = or i32 %2806, %2809
  %2811 = or i32 %2810, 18531
  %2812 = getelementptr i32, i32* %2797, i32 %2798
  store i32 %2811, i32* %2812, align 4
  %2813 = load i32, i32* %2427, align 4
  %2814 = load i32*, i32** %2781, align 4
  %2815 = add i32 %2813, 1
  store i32 %2815, i32* %2427, align 4
  %2816 = icmp eq i32* %2814, null
  br i1 %2816, label %2830, label %2817

2817:                                             ; preds = %2803
  %2818 = getelementptr i8, i8* %2461, i32 1
  %2819 = load i8, i8* %2818, align 1
  %2820 = zext i8 %2819 to i32
  %2821 = shl nuw nsw i32 %2820, 20
  %2822 = getelementptr i8, i8* %2492, i32 1
  %2823 = load i8, i8* %2822, align 1
  %2824 = zext i8 %2823 to i32
  %2825 = shl nuw nsw i32 %2824, 15
  %2826 = or i32 %2821, %2825
  %2827 = or i32 %2826, 30307
  %2828 = getelementptr i32, i32* %2814, i32 %2815
  store i32 %2827, i32* %2828, align 4
  %2829 = load i32, i32* %2427, align 4
  br label %2830

2830:                                             ; preds = %2817, %2803, %2800
  %2831 = phi i32 [ %2815, %2803 ], [ %2829, %2817 ], [ %2802, %2800 ]
  %2832 = add i32 %2831, 1
  br label %3046

2833:                                             ; preds = %2490
  %2834 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2835 = load i32*, i32** %2834, align 4
  %2836 = icmp eq i32* %2835, null
  br i1 %2836, label %2837, label %2839

2837:                                             ; preds = %2833
  %2838 = add i32 %2491, 1
  store i32 %2838, i32* %2427, align 4
  br label %2853

2839:                                             ; preds = %2833
  %2840 = load i8, i8* %2461, align 1
  %2841 = zext i8 %2840 to i32
  %2842 = shl nuw nsw i32 %2841, 15
  %2843 = load i8, i8* %2492, align 1
  %2844 = zext i8 %2843 to i32
  %2845 = shl nuw nsw i32 %2844, 20
  %2846 = or i32 %2842, %2845
  %2847 = or i32 %2846, 18019
  %2848 = getelementptr i32, i32* %2835, i32 %2491
  store i32 %2847, i32* %2848, align 4
  %2849 = load i32, i32* %2427, align 4
  %2850 = load i32*, i32** %2834, align 4
  %2851 = add i32 %2849, 1
  store i32 %2851, i32* %2427, align 4
  %2852 = icmp eq i32* %2850, null
  br i1 %2852, label %2853, label %2856

2853:                                             ; preds = %2839, %2837
  %2854 = phi i32 [ %2838, %2837 ], [ %2851, %2839 ]
  %2855 = add i32 %2854, 1
  store i32 %2855, i32* %2427, align 4
  br label %2883

2856:                                             ; preds = %2839
  %2857 = load i8, i8* %2461, align 1
  %2858 = zext i8 %2857 to i32
  %2859 = shl nuw nsw i32 %2858, 20
  %2860 = load i8, i8* %2492, align 1
  %2861 = zext i8 %2860 to i32
  %2862 = shl nuw nsw i32 %2861, 15
  %2863 = or i32 %2859, %2862
  %2864 = or i32 %2863, 18531
  %2865 = getelementptr i32, i32* %2850, i32 %2851
  store i32 %2864, i32* %2865, align 4
  %2866 = load i32, i32* %2427, align 4
  %2867 = load i32*, i32** %2834, align 4
  %2868 = add i32 %2866, 1
  store i32 %2868, i32* %2427, align 4
  %2869 = icmp eq i32* %2867, null
  br i1 %2869, label %2883, label %2870

2870:                                             ; preds = %2856
  %2871 = getelementptr i8, i8* %2461, i32 1
  %2872 = load i8, i8* %2871, align 1
  %2873 = zext i8 %2872 to i32
  %2874 = shl nuw nsw i32 %2873, 15
  %2875 = getelementptr i8, i8* %2492, i32 1
  %2876 = load i8, i8* %2875, align 1
  %2877 = zext i8 %2876 to i32
  %2878 = shl nuw nsw i32 %2877, 20
  %2879 = or i32 %2874, %2878
  %2880 = or i32 %2879, 30307
  %2881 = getelementptr i32, i32* %2867, i32 %2868
  store i32 %2880, i32* %2881, align 4
  %2882 = load i32, i32* %2427, align 4
  br label %2883

2883:                                             ; preds = %2870, %2856, %2853
  %2884 = phi i32 [ %2868, %2856 ], [ %2882, %2870 ], [ %2855, %2853 ]
  %2885 = add i32 %2884, 1
  br label %3046

2886:                                             ; preds = %2490
  %2887 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2888 = load i32*, i32** %2887, align 4
  %2889 = icmp eq i32* %2888, null
  br i1 %2889, label %2890, label %2892

2890:                                             ; preds = %2886
  %2891 = add i32 %2491, 1
  store i32 %2891, i32* %2427, align 4
  br label %2906

2892:                                             ; preds = %2886
  %2893 = load i8, i8* %2461, align 1
  %2894 = zext i8 %2893 to i32
  %2895 = shl nuw nsw i32 %2894, 20
  %2896 = load i8, i8* %2492, align 1
  %2897 = zext i8 %2896 to i32
  %2898 = shl nuw nsw i32 %2897, 15
  %2899 = or i32 %2895, %2898
  %2900 = or i32 %2899, 18019
  %2901 = getelementptr i32, i32* %2888, i32 %2491
  store i32 %2900, i32* %2901, align 4
  %2902 = load i32, i32* %2427, align 4
  %2903 = load i32*, i32** %2887, align 4
  %2904 = add i32 %2902, 1
  store i32 %2904, i32* %2427, align 4
  %2905 = icmp eq i32* %2903, null
  br i1 %2905, label %2906, label %2909

2906:                                             ; preds = %2892, %2890
  %2907 = phi i32 [ %2891, %2890 ], [ %2904, %2892 ]
  %2908 = add i32 %2907, 1
  store i32 %2908, i32* %2427, align 4
  br label %2936

2909:                                             ; preds = %2892
  %2910 = load i8, i8* %2461, align 1
  %2911 = zext i8 %2910 to i32
  %2912 = shl nuw nsw i32 %2911, 15
  %2913 = load i8, i8* %2492, align 1
  %2914 = zext i8 %2913 to i32
  %2915 = shl nuw nsw i32 %2914, 20
  %2916 = or i32 %2912, %2915
  %2917 = or i32 %2916, 18531
  %2918 = getelementptr i32, i32* %2903, i32 %2904
  store i32 %2917, i32* %2918, align 4
  %2919 = load i32, i32* %2427, align 4
  %2920 = load i32*, i32** %2887, align 4
  %2921 = add i32 %2919, 1
  store i32 %2921, i32* %2427, align 4
  %2922 = icmp eq i32* %2920, null
  br i1 %2922, label %2936, label %2923

2923:                                             ; preds = %2909
  %2924 = getelementptr i8, i8* %2461, i32 1
  %2925 = load i8, i8* %2924, align 1
  %2926 = zext i8 %2925 to i32
  %2927 = shl nuw nsw i32 %2926, 15
  %2928 = getelementptr i8, i8* %2492, i32 1
  %2929 = load i8, i8* %2928, align 1
  %2930 = zext i8 %2929 to i32
  %2931 = shl nuw nsw i32 %2930, 20
  %2932 = or i32 %2927, %2931
  %2933 = or i32 %2932, 26211
  %2934 = getelementptr i32, i32* %2920, i32 %2921
  store i32 %2933, i32* %2934, align 4
  %2935 = load i32, i32* %2427, align 4
  br label %2936

2936:                                             ; preds = %2923, %2909, %2906
  %2937 = phi i32 [ %2921, %2909 ], [ %2935, %2923 ], [ %2908, %2906 ]
  %2938 = add i32 %2937, 1
  br label %3046

2939:                                             ; preds = %2490
  %2940 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2941 = load i32*, i32** %2940, align 4
  %2942 = icmp eq i32* %2941, null
  br i1 %2942, label %2943, label %2945

2943:                                             ; preds = %2939
  %2944 = add i32 %2491, 1
  store i32 %2944, i32* %2427, align 4
  br label %2959

2945:                                             ; preds = %2939
  %2946 = load i8, i8* %2461, align 1
  %2947 = zext i8 %2946 to i32
  %2948 = shl nuw nsw i32 %2947, 15
  %2949 = load i8, i8* %2492, align 1
  %2950 = zext i8 %2949 to i32
  %2951 = shl nuw nsw i32 %2950, 20
  %2952 = or i32 %2948, %2951
  %2953 = or i32 %2952, 18019
  %2954 = getelementptr i32, i32* %2941, i32 %2491
  store i32 %2953, i32* %2954, align 4
  %2955 = load i32, i32* %2427, align 4
  %2956 = load i32*, i32** %2940, align 4
  %2957 = add i32 %2955, 1
  store i32 %2957, i32* %2427, align 4
  %2958 = icmp eq i32* %2956, null
  br i1 %2958, label %2959, label %2962

2959:                                             ; preds = %2945, %2943
  %2960 = phi i32 [ %2944, %2943 ], [ %2957, %2945 ]
  %2961 = add i32 %2960, 1
  store i32 %2961, i32* %2427, align 4
  br label %2989

2962:                                             ; preds = %2945
  %2963 = load i8, i8* %2461, align 1
  %2964 = zext i8 %2963 to i32
  %2965 = shl nuw nsw i32 %2964, 20
  %2966 = load i8, i8* %2492, align 1
  %2967 = zext i8 %2966 to i32
  %2968 = shl nuw nsw i32 %2967, 15
  %2969 = or i32 %2965, %2968
  %2970 = or i32 %2969, 18531
  %2971 = getelementptr i32, i32* %2956, i32 %2957
  store i32 %2970, i32* %2971, align 4
  %2972 = load i32, i32* %2427, align 4
  %2973 = load i32*, i32** %2940, align 4
  %2974 = add i32 %2972, 1
  store i32 %2974, i32* %2427, align 4
  %2975 = icmp eq i32* %2973, null
  br i1 %2975, label %2989, label %2976

2976:                                             ; preds = %2962
  %2977 = getelementptr i8, i8* %2461, i32 1
  %2978 = load i8, i8* %2977, align 1
  %2979 = zext i8 %2978 to i32
  %2980 = shl nuw nsw i32 %2979, 20
  %2981 = getelementptr i8, i8* %2492, i32 1
  %2982 = load i8, i8* %2981, align 1
  %2983 = zext i8 %2982 to i32
  %2984 = shl nuw nsw i32 %2983, 15
  %2985 = or i32 %2980, %2984
  %2986 = or i32 %2985, 26211
  %2987 = getelementptr i32, i32* %2973, i32 %2974
  store i32 %2986, i32* %2987, align 4
  %2988 = load i32, i32* %2427, align 4
  br label %2989

2989:                                             ; preds = %2976, %2962, %2959
  %2990 = phi i32 [ %2974, %2962 ], [ %2988, %2976 ], [ %2961, %2959 ]
  %2991 = add i32 %2990, 1
  br label %3046

2992:                                             ; preds = %2490
  %2993 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %2994 = load i32*, i32** %2993, align 4
  %2995 = icmp eq i32* %2994, null
  br i1 %2995, label %2996, label %2998

2996:                                             ; preds = %2992
  %2997 = add i32 %2491, 1
  store i32 %2997, i32* %2427, align 4
  br label %3012

2998:                                             ; preds = %2992
  %2999 = load i8, i8* %2461, align 1
  %3000 = zext i8 %2999 to i32
  %3001 = shl nuw nsw i32 %3000, 15
  %3002 = load i8, i8* %2492, align 1
  %3003 = zext i8 %3002 to i32
  %3004 = shl nuw nsw i32 %3003, 20
  %3005 = or i32 %3001, %3004
  %3006 = or i32 %3005, 29363
  %3007 = getelementptr i32, i32* %2994, i32 %2491
  store i32 %3006, i32* %3007, align 4
  %3008 = load i32*, i32** %2993, align 4
  %3009 = load i32, i32* %2427, align 4
  %3010 = add i32 %3009, 1
  store i32 %3010, i32* %2427, align 4
  %3011 = icmp eq i32* %3008, null
  br i1 %3011, label %3012, label %3015

3012:                                             ; preds = %2998, %2996
  %3013 = phi i32 [ %3010, %2998 ], [ %2997, %2996 ]
  %3014 = add i32 %3013, 1
  store i32 %3014, i32* %2427, align 4
  br label %3021

3015:                                             ; preds = %2998
  %3016 = getelementptr i32, i32* %3008, i32 %3010
  store i32 169571, i32* %3016, align 4
  %3017 = load i32, i32* %2427, align 4
  %3018 = load i32*, i32** %2993, align 4
  %3019 = add i32 %3017, 1
  store i32 %3019, i32* %2427, align 4
  %3020 = icmp eq i32* %3018, null
  br i1 %3020, label %3021, label %3024

3021:                                             ; preds = %3015, %3012
  %3022 = phi i32 [ %3013, %3012 ], [ %3017, %3015 ]
  %3023 = add i32 %3022, 2
  store i32 %3023, i32* %2427, align 4
  br label %3043

3024:                                             ; preds = %3015
  %3025 = getelementptr i8, i8* %2461, i32 1
  %3026 = load i8, i8* %3025, align 1
  %3027 = zext i8 %3026 to i32
  %3028 = shl nuw nsw i32 %3027, 15
  %3029 = getelementptr i8, i8* %2492, i32 1
  %3030 = load i8, i8* %3029, align 1
  %3031 = zext i8 %3030 to i32
  %3032 = shl nuw nsw i32 %3031, 20
  %3033 = or i32 %3028, %3032
  %3034 = or i32 %3033, 29363
  %3035 = getelementptr i32, i32* %3018, i32 %3019
  store i32 %3034, i32* %3035, align 4
  %3036 = load i32*, i32** %2993, align 4
  %3037 = load i32, i32* %2427, align 4
  %3038 = add i32 %3037, 1
  store i32 %3038, i32* %2427, align 4
  %3039 = icmp eq i32* %3036, null
  br i1 %3039, label %3043, label %3040

3040:                                             ; preds = %3024
  %3041 = getelementptr i32, i32* %3036, i32 %3038
  store i32 165475, i32* %3041, align 4
  %3042 = load i32, i32* %2427, align 4
  br label %3043

3043:                                             ; preds = %3040, %3024, %3021
  %3044 = phi i32 [ %3023, %3021 ], [ %3038, %3024 ], [ %3042, %3040 ]
  %3045 = add i32 %3044, 1
  br label %3046

3046:                                             ; preds = %2529, %2582, %2635, %2688, %2741, %2777, %2830, %2883, %2936, %2989, %3043
  %3047 = phi i32 [ %3045, %3043 ], [ %2991, %2989 ], [ %2938, %2936 ], [ %2885, %2883 ], [ %2832, %2830 ], [ %2779, %2777 ], [ %2743, %2741 ], [ %2690, %2688 ], [ %2637, %2635 ], [ %2584, %2582 ], [ %2531, %2529 ]
  store i32 %3047, i32* %2427, align 4
  br label %3048

3048:                                             ; preds = %3046, %2490
  %3049 = phi i32 [ %2491, %2490 ], [ %3047, %3046 ]
  %3050 = sub i32 %3049, %2423
  %3051 = shl i32 %3050, 2
  %3052 = sub i32 %2425, %3051
  %3053 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3054 = load i32*, i32** %3053, align 4
  %3055 = icmp eq i32* %3054, null
  br i1 %3055, label %3056, label %3058

3056:                                             ; preds = %3048
  %3057 = add i32 %3049, 1
  store i32 %3057, i32* %2427, align 4
  br label %3072

3058:                                             ; preds = %3048
  %3059 = add i32 %3052, 2048
  %3060 = and i32 %3059, -4096
  %3061 = or i32 %3060, 791
  %3062 = getelementptr i32, i32* %3054, i32 %3049
  store i32 %3061, i32* %3062, align 4
  %3063 = load i32*, i32** %3053, align 4
  %3064 = load i32, i32* %2427, align 4
  %3065 = add i32 %3064, 1
  store i32 %3065, i32* %2427, align 4
  %3066 = icmp eq i32* %3063, null
  br i1 %3066, label %3072, label %3067

3067:                                             ; preds = %3058
  %3068 = shl i32 %3052, 20
  %3069 = or i32 %3068, 196711
  %3070 = getelementptr i32, i32* %3063, i32 %3065
  store i32 %3069, i32* %3070, align 4
  %3071 = load i32, i32* %2427, align 4
  br label %3072

3072:                                             ; preds = %3056, %3058, %3067
  %3073 = phi i32 [ %3065, %3058 ], [ %3071, %3067 ], [ %3057, %3056 ]
  %3074 = add i32 %3073, 1
  store i32 %3074, i32* %2427, align 4
  br label %3989

3075:                                             ; preds = %2422
  %3076 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %3077 = load i8, i8* %3076, align 1
  %3078 = lshr i32 3008, %25
  %3079 = and i32 %3078, 1
  %3080 = icmp eq i32 %3079, 0
  br i1 %3080, label %3094, label %3081

3081:                                             ; preds = %3075
  %3082 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3083 = load i32*, i32** %3082, align 4
  %3084 = icmp eq i32* %3083, null
  br i1 %3084, label %3091, label %3085

3085:                                             ; preds = %3081
  %3086 = sext i8 %3077 to i32
  %3087 = shl nsw i32 %3086, 20
  %3088 = or i32 %3087, 271235
  %3089 = getelementptr i32, i32* %3083, i32 %2423
  store i32 %3088, i32* %3089, align 4
  %3090 = load i32, i32* %2427, align 4
  br label %3091

3091:                                             ; preds = %3085, %3081
  %3092 = phi i32 [ %3090, %3085 ], [ %2423, %3081 ]
  %3093 = add i32 %3092, 1
  store i32 %3093, i32* %2427, align 4
  br label %3094

3094:                                             ; preds = %3075, %3091
  %3095 = phi i32 [ %3093, %3091 ], [ %2423, %3075 ]
  %3096 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %3091 ], [ %26, %3075 ]
  %3097 = getelementptr i8, i8* %2424, i32 1
  %3098 = load i8, i8* %3097, align 1
  %3099 = icmp slt i8 %3098, 0
  br i1 %3099, label %3100, label %3113

3100:                                             ; preds = %3094
  %3101 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3102 = load i32*, i32** %3101, align 4
  %3103 = icmp eq i32* %3102, null
  br i1 %3103, label %3110, label %3104

3104:                                             ; preds = %3100
  %3105 = sext i8 %3098 to i32
  %3106 = shl nsw i32 %3105, 20
  %3107 = or i32 %3106, 274051
  %3108 = getelementptr i32, i32* %3102, i32 %3095
  store i32 %3107, i32* %3108, align 4
  %3109 = load i32, i32* %2427, align 4
  br label %3110

3110:                                             ; preds = %3104, %3100
  %3111 = phi i32 [ %3109, %3104 ], [ %3095, %3100 ]
  %3112 = add i32 %3111, 1
  store i32 %3112, i32* %2427, align 4
  br label %3113

3113:                                             ; preds = %3094, %3110
  %3114 = phi i8 [ 29, %3110 ], [ %3098, %3094 ]
  %3115 = phi i32 [ %3112, %3110 ], [ %3095, %3094 ]
  %3116 = sub i32 %3115, %2423
  %3117 = shl i32 %3116, 2
  %3118 = sub i32 %2425, %3117
  %3119 = getelementptr i8, i8* %3096, i32 1
  %3120 = load i8, i8* %3119, align 1
  call fastcc void @emit_bcc(i8 zeroext %2426, i8 zeroext %3120, i8 zeroext %3114, i32 %3118, %struct.rv_jit_context* %1) #5
  br label %3989

3121:                                             ; preds = %3
  %3122 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %12, i32 0, i32 4
  %3123 = load i32, i32* %3122, align 4
  %3124 = add i32 %3123, -1
  %3125 = icmp eq i32 %17, %3124
  br i1 %3125, label %3989, label %3126

3126:                                             ; preds = %3121
  %3127 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 3
  %3128 = load i32, i32* %3127, align 4
  %3129 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3130 = load i32, i32* %3129, align 4
  %3131 = sub i32 %3128, %3130
  %3132 = shl i32 %3131, 2
  %3133 = icmp eq i32 %3132, 0
  %3134 = add i32 %3132, 1048576
  %3135 = icmp ugt i32 %3134, 2097151
  %3136 = or i1 %3133, %3135
  br i1 %3136, label %3160, label %3137

3137:                                             ; preds = %3126
  %3138 = ashr exact i32 %3132, 1
  %3139 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3140 = load i32*, i32** %3139, align 4
  %3141 = icmp eq i32* %3140, null
  br i1 %3141, label %3157, label %3142

3142:                                             ; preds = %3137
  %3143 = shl i32 %3131, 10
  %3144 = and i32 %3143, 523264
  %3145 = and i32 %3138, 524288
  %3146 = or i32 %3145, %3144
  %3147 = lshr i32 %3138, 2
  %3148 = and i32 %3147, 256
  %3149 = or i32 %3146, %3148
  %3150 = lshr i32 %3138, 11
  %3151 = and i32 %3150, 255
  %3152 = or i32 %3149, %3151
  %3153 = shl nuw i32 %3152, 12
  %3154 = or i32 %3153, 111
  %3155 = getelementptr i32, i32* %3140, i32 %3130
  store i32 %3154, i32* %3155, align 4
  %3156 = load i32, i32* %3129, align 4
  br label %3157

3157:                                             ; preds = %3142, %3137
  %3158 = phi i32 [ %3156, %3142 ], [ %3130, %3137 ]
  %3159 = add i32 %3158, 1
  store i32 %3159, i32* %3129, align 4
  br label %3989

3160:                                             ; preds = %3126
  %3161 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3162 = load i32*, i32** %3161, align 4
  %3163 = icmp eq i32* %3162, null
  br i1 %3163, label %3164, label %3166

3164:                                             ; preds = %3160
  %3165 = add i32 %3130, 1
  store i32 %3165, i32* %3129, align 4
  br label %3180

3166:                                             ; preds = %3160
  %3167 = add nuw i32 %3132, 2048
  %3168 = and i32 %3167, -4096
  %3169 = or i32 %3168, 791
  %3170 = getelementptr i32, i32* %3162, i32 %3130
  store i32 %3169, i32* %3170, align 4
  %3171 = load i32*, i32** %3161, align 4
  %3172 = load i32, i32* %3129, align 4
  %3173 = add i32 %3172, 1
  store i32 %3173, i32* %3129, align 4
  %3174 = icmp eq i32* %3171, null
  br i1 %3174, label %3180, label %3175

3175:                                             ; preds = %3166
  %3176 = shl i32 %3131, 22
  %3177 = or i32 %3176, 196711
  %3178 = getelementptr i32, i32* %3171, i32 %3173
  store i32 %3177, i32* %3178, align 4
  %3179 = load i32, i32* %3129, align 4
  br label %3180

3180:                                             ; preds = %3175, %3166, %3164
  %3181 = phi i32 [ %3173, %3166 ], [ %3179, %3175 ], [ %3165, %3164 ]
  %3182 = add i32 %3181, 1
  store i32 %3182, i32* %3129, align 4
  br label %3989

3183:                                             ; preds = %3
  %3184 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 1, i32 3
  %3185 = load i32, i32* %3184, align 4
  %3186 = load i8, i8* %26, align 1
  %3187 = lshr i32 3008, %25
  %3188 = and i32 %3187, 1
  %3189 = icmp ne i32 %3188, 0
  br i1 %3189, label %3190, label %3221

3190:                                             ; preds = %3183
  %3191 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3192 = load i32*, i32** %3191, align 4
  %3193 = icmp eq i32* %3192, null
  br i1 %3193, label %3194, label %3198

3194:                                             ; preds = %3190
  %3195 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3196 = load i32, i32* %3195, align 4
  %3197 = add i32 %3196, 1
  store i32 %3197, i32* %3195, align 4
  br label %3217

3198:                                             ; preds = %3190
  %3199 = sext i8 %3186 to i32
  %3200 = shl nsw i32 %3199, 20
  %3201 = or i32 %3200, 273923
  %3202 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3203 = load i32, i32* %3202, align 4
  %3204 = getelementptr i32, i32* %3192, i32 %3203
  store i32 %3201, i32* %3204, align 4
  %3205 = load i32*, i32** %3191, align 4
  %3206 = load i32, i32* %3202, align 4
  %3207 = add i32 %3206, 1
  store i32 %3207, i32* %3202, align 4
  %3208 = icmp eq i32* %3205, null
  br i1 %3208, label %3217, label %3209

3209:                                             ; preds = %3198
  %3210 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %3211 = load i8, i8* %3210, align 1
  %3212 = sext i8 %3211 to i32
  %3213 = shl nsw i32 %3212, 20
  %3214 = or i32 %3213, 271235
  %3215 = getelementptr i32, i32* %3205, i32 %3207
  store i32 %3214, i32* %3215, align 4
  %3216 = load i32, i32* %3202, align 4
  br label %3217

3217:                                             ; preds = %3209, %3198, %3194
  %3218 = phi i32* [ %3202, %3198 ], [ %3202, %3209 ], [ %3195, %3194 ]
  %3219 = phi i32 [ %3207, %3198 ], [ %3216, %3209 ], [ %3197, %3194 ]
  %3220 = add i32 %3219, 1
  store i32 %3220, i32* %3218, align 4
  br label %3221

3221:                                             ; preds = %3183, %3217
  %3222 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %3217 ], [ %26, %3183 ]
  %3223 = getelementptr i8, i8* %3222, i32 1
  %3224 = load i8, i8* %3223, align 1
  %3225 = add i32 %21, 2048
  %3226 = and i32 %21, 4095
  %3227 = icmp ult i32 %3225, 4096
  br i1 %3227, label %3261, label %3228

3228:                                             ; preds = %3221
  %3229 = zext i8 %3224 to i32
  %3230 = shl nuw nsw i32 %3229, 7
  %3231 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3232 = load i32*, i32** %3231, align 4
  %3233 = icmp eq i32* %3232, null
  br i1 %3233, label %3234, label %3238

3234:                                             ; preds = %3228
  %3235 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3236 = load i32, i32* %3235, align 4
  %3237 = add i32 %3236, 1
  store i32 %3237, i32* %3235, align 4
  br label %3257

3238:                                             ; preds = %3228
  %3239 = and i32 %3225, -4096
  %3240 = or i32 %3239, %3230
  %3241 = or i32 %3240, 55
  %3242 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3243 = load i32, i32* %3242, align 4
  %3244 = getelementptr i32, i32* %3232, i32 %3243
  store i32 %3241, i32* %3244, align 4
  %3245 = load i32*, i32** %3231, align 4
  %3246 = load i32, i32* %3242, align 4
  %3247 = add i32 %3246, 1
  store i32 %3247, i32* %3242, align 4
  %3248 = icmp eq i32* %3245, null
  br i1 %3248, label %3257, label %3249

3249:                                             ; preds = %3238
  %3250 = shl nuw nsw i32 %3229, 15
  %3251 = shl nuw i32 %3226, 20
  %3252 = or i32 %3251, %3230
  %3253 = or i32 %3252, %3250
  %3254 = or i32 %3253, 19
  %3255 = getelementptr i32, i32* %3245, i32 %3247
  store i32 %3254, i32* %3255, align 4
  %3256 = load i32, i32* %3242, align 4
  br label %3257

3257:                                             ; preds = %3249, %3238, %3234
  %3258 = phi i32* [ %3242, %3238 ], [ %3242, %3249 ], [ %3235, %3234 ]
  %3259 = phi i32 [ %3247, %3238 ], [ %3256, %3249 ], [ %3237, %3234 ]
  %3260 = add i32 %3259, 1
  store i32 %3260, i32* %3258, align 4
  br label %3278

3261:                                             ; preds = %3221
  %3262 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3263 = load i32*, i32** %3262, align 4
  %3264 = icmp eq i32* %3263, null
  br i1 %3264, label %3274, label %3265

3265:                                             ; preds = %3261
  %3266 = zext i8 %3224 to i32
  %3267 = shl nuw nsw i32 %3266, 7
  %3268 = shl nuw i32 %3226, 20
  %3269 = or i32 %3268, %3267
  %3270 = or i32 %3269, 19
  %3271 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3272 = load i32, i32* %3271, align 4
  %3273 = getelementptr i32, i32* %3263, i32 %3272
  store i32 %3270, i32* %3273, align 4
  br label %3274

3274:                                             ; preds = %3265, %3261
  %3275 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3276 = load i32, i32* %3275, align 4
  %3277 = add i32 %3276, 1
  store i32 %3277, i32* %3275, align 4
  br label %3278

3278:                                             ; preds = %3274, %3257
  %3279 = phi i32 [ %3260, %3257 ], [ %3277, %3274 ]
  %3280 = load i8, i8* %3222, align 1
  %3281 = add i32 %3185, 2048
  %3282 = and i32 %3185, 4095
  %3283 = icmp ult i32 %3281, 4096
  br i1 %3283, label %3315, label %3284

3284:                                             ; preds = %3278
  %3285 = zext i8 %3280 to i32
  %3286 = shl nuw nsw i32 %3285, 7
  %3287 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3288 = load i32*, i32** %3287, align 4
  %3289 = icmp eq i32* %3288, null
  br i1 %3289, label %3290, label %3293

3290:                                             ; preds = %3284
  %3291 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3292 = add i32 %3279, 1
  store i32 %3292, i32* %3291, align 4
  br label %3311

3293:                                             ; preds = %3284
  %3294 = and i32 %3281, -4096
  %3295 = or i32 %3294, %3286
  %3296 = or i32 %3295, 55
  %3297 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3298 = getelementptr i32, i32* %3288, i32 %3279
  store i32 %3296, i32* %3298, align 4
  %3299 = load i32*, i32** %3287, align 4
  %3300 = load i32, i32* %3297, align 4
  %3301 = add i32 %3300, 1
  store i32 %3301, i32* %3297, align 4
  %3302 = icmp eq i32* %3299, null
  br i1 %3302, label %3311, label %3303

3303:                                             ; preds = %3293
  %3304 = shl nuw nsw i32 %3285, 15
  %3305 = shl nuw i32 %3282, 20
  %3306 = or i32 %3305, %3286
  %3307 = or i32 %3306, %3304
  %3308 = or i32 %3307, 19
  %3309 = getelementptr i32, i32* %3299, i32 %3301
  store i32 %3308, i32* %3309, align 4
  %3310 = load i32, i32* %3297, align 4
  br label %3311

3311:                                             ; preds = %3303, %3293, %3290
  %3312 = phi i32* [ %3297, %3293 ], [ %3297, %3303 ], [ %3291, %3290 ]
  %3313 = phi i32 [ %3301, %3293 ], [ %3310, %3303 ], [ %3292, %3290 ]
  %3314 = add i32 %3313, 1
  store i32 %3314, i32* %3312, align 4
  br label %3332

3315:                                             ; preds = %3278
  %3316 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3317 = load i32*, i32** %3316, align 4
  %3318 = icmp eq i32* %3317, null
  br i1 %3318, label %3328, label %3319

3319:                                             ; preds = %3315
  %3320 = zext i8 %3280 to i32
  %3321 = shl nuw nsw i32 %3320, 7
  %3322 = shl nuw i32 %3282, 20
  %3323 = or i32 %3322, %3321
  %3324 = or i32 %3323, 19
  %3325 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3326 = getelementptr i32, i32* %3317, i32 %3279
  store i32 %3324, i32* %3326, align 4
  %3327 = load i32, i32* %3325, align 4
  br label %3328

3328:                                             ; preds = %3319, %3315
  %3329 = phi i32 [ %3327, %3319 ], [ %3279, %3315 ]
  %3330 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3331 = add i32 %3329, 1
  store i32 %3331, i32* %3330, align 4
  br label %3332

3332:                                             ; preds = %3311, %3328
  %3333 = phi i32 [ %3314, %3311 ], [ %3331, %3328 ]
  br i1 %3189, label %3334, label %3989

3334:                                             ; preds = %3332
  %3335 = sext i8 %3186 to i16
  %3336 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3337 = load i32*, i32** %3336, align 4
  %3338 = icmp eq i32* %3337, null
  br i1 %3338, label %3356, label %3339

3339:                                             ; preds = %3334
  %3340 = lshr i16 %3335, 5
  %3341 = zext i16 %3340 to i32
  %3342 = shl i32 %3341, 25
  %3343 = load i8, i8* %3222, align 1
  %3344 = zext i8 %3343 to i32
  %3345 = shl nuw nsw i32 %3344, 20
  %3346 = shl nsw i16 %3335, 7
  %3347 = and i16 %3346, 3968
  %3348 = zext i16 %3347 to i32
  %3349 = or i32 %3342, %3348
  %3350 = or i32 %3349, %3345
  %3351 = or i32 %3350, 270371
  %3352 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3353 = getelementptr i32, i32* %3337, i32 %3333
  store i32 %3351, i32* %3353, align 4
  %3354 = load i32*, i32** %3336, align 4
  %3355 = load i32, i32* %3352, align 4
  br label %3356

3356:                                             ; preds = %3339, %3334
  %3357 = phi i32 [ %3333, %3334 ], [ %3355, %3339 ]
  %3358 = phi i32* [ null, %3334 ], [ %3354, %3339 ]
  %3359 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3360 = add i32 %3357, 1
  store i32 %3360, i32* %3359, align 4
  %3361 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %3362 = load i8, i8* %3361, align 1
  %3363 = sext i8 %3362 to i16
  %3364 = icmp eq i32* %3358, null
  br i1 %3364, label %3380, label %3365

3365:                                             ; preds = %3356
  %3366 = lshr i16 %3363, 5
  %3367 = zext i16 %3366 to i32
  %3368 = shl i32 %3367, 25
  %3369 = load i8, i8* %3223, align 1
  %3370 = zext i8 %3369 to i32
  %3371 = shl nuw nsw i32 %3370, 20
  %3372 = shl nsw i16 %3363, 7
  %3373 = and i16 %3372, 3968
  %3374 = zext i16 %3373 to i32
  %3375 = or i32 %3368, %3374
  %3376 = or i32 %3375, %3371
  %3377 = or i32 %3376, 270371
  %3378 = getelementptr i32, i32* %3358, i32 %3360
  store i32 %3377, i32* %3378, align 4
  %3379 = load i32, i32* %3359, align 4
  br label %3380

3380:                                             ; preds = %3365, %3356
  %3381 = phi i32 [ %3360, %3356 ], [ %3379, %3365 ]
  %3382 = add i32 %3381, 1
  store i32 %3382, i32* %3359, align 4
  br label %3989

3383:                                             ; preds = %3, %3, %3, %3
  %3384 = load i8, i8* %26, align 1
  %3385 = lshr i32 3008, %25
  %3386 = and i32 %3385, 1
  %3387 = icmp ne i32 %3386, 0
  br i1 %3387, label %3388, label %3419

3388:                                             ; preds = %3383
  %3389 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3390 = load i32*, i32** %3389, align 4
  %3391 = icmp eq i32* %3390, null
  br i1 %3391, label %3392, label %3396

3392:                                             ; preds = %3388
  %3393 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3394 = load i32, i32* %3393, align 4
  %3395 = add i32 %3394, 1
  store i32 %3395, i32* %3393, align 4
  br label %3415

3396:                                             ; preds = %3388
  %3397 = sext i8 %3384 to i32
  %3398 = shl nsw i32 %3397, 20
  %3399 = or i32 %3398, 273923
  %3400 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3401 = load i32, i32* %3400, align 4
  %3402 = getelementptr i32, i32* %3390, i32 %3401
  store i32 %3399, i32* %3402, align 4
  %3403 = load i32*, i32** %3389, align 4
  %3404 = load i32, i32* %3400, align 4
  %3405 = add i32 %3404, 1
  store i32 %3405, i32* %3400, align 4
  %3406 = icmp eq i32* %3403, null
  br i1 %3406, label %3415, label %3407

3407:                                             ; preds = %3396
  %3408 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %3409 = load i8, i8* %3408, align 1
  %3410 = sext i8 %3409 to i32
  %3411 = shl nsw i32 %3410, 20
  %3412 = or i32 %3411, 271235
  %3413 = getelementptr i32, i32* %3403, i32 %3405
  store i32 %3412, i32* %3413, align 4
  %3414 = load i32, i32* %3400, align 4
  br label %3415

3415:                                             ; preds = %3407, %3396, %3392
  %3416 = phi i32* [ %3400, %3396 ], [ %3400, %3407 ], [ %3393, %3392 ]
  %3417 = phi i32 [ %3405, %3396 ], [ %3414, %3407 ], [ %3395, %3392 ]
  %3418 = add i32 %3417, 1
  store i32 %3418, i32* %3416, align 4
  br label %3419

3419:                                             ; preds = %3415, %3383
  %3420 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %3415 ], [ %26, %3383 ]
  %3421 = load i8, i8* %29, align 1
  %3422 = lshr i32 3008, %28
  %3423 = and i32 %3422, 1
  %3424 = icmp eq i32 %3423, 0
  br i1 %3424, label %3456, label %3425

3425:                                             ; preds = %3419
  %3426 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3427 = load i32*, i32** %3426, align 4
  %3428 = icmp eq i32* %3427, null
  br i1 %3428, label %3429, label %3433

3429:                                             ; preds = %3425
  %3430 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3431 = load i32, i32* %3430, align 4
  %3432 = add i32 %3431, 1
  store i32 %3432, i32* %3430, align 4
  br label %3452

3433:                                             ; preds = %3425
  %3434 = sext i8 %3421 to i32
  %3435 = shl nsw i32 %3434, 20
  %3436 = or i32 %3435, 274179
  %3437 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3438 = load i32, i32* %3437, align 4
  %3439 = getelementptr i32, i32* %3427, i32 %3438
  store i32 %3436, i32* %3439, align 4
  %3440 = load i32*, i32** %3426, align 4
  %3441 = load i32, i32* %3437, align 4
  %3442 = add i32 %3441, 1
  store i32 %3442, i32* %3437, align 4
  %3443 = icmp eq i32* %3440, null
  br i1 %3443, label %3452, label %3444

3444:                                             ; preds = %3433
  %3445 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %28, i32 1
  %3446 = load i8, i8* %3445, align 1
  %3447 = sext i8 %3446 to i32
  %3448 = shl nsw i32 %3447, 20
  %3449 = or i32 %3448, 274051
  %3450 = getelementptr i32, i32* %3440, i32 %3442
  store i32 %3449, i32* %3450, align 4
  %3451 = load i32, i32* %3437, align 4
  br label %3452

3452:                                             ; preds = %3444, %3433, %3429
  %3453 = phi i32* [ %3437, %3433 ], [ %3437, %3444 ], [ %3430, %3429 ]
  %3454 = phi i32 [ %3442, %3433 ], [ %3451, %3444 ], [ %3432, %3429 ]
  %3455 = add i32 %3454, 1
  store i32 %3455, i32* %3453, align 4
  br label %3456

3456:                                             ; preds = %3419, %3452
  %3457 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %3452 ], [ %29, %3419 ]
  %3458 = sext i16 %19 to i32
  %3459 = add nsw i32 %3458, 2048
  %3460 = and i32 %3458, 4095
  %3461 = icmp ult i32 %3459, 4096
  %3462 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3463 = load i32*, i32** %3462, align 4
  %3464 = icmp eq i32* %3463, null
  br i1 %3461, label %3489, label %3465

3465:                                             ; preds = %3456
  br i1 %3464, label %3466, label %3470

3466:                                             ; preds = %3465
  %3467 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3468 = load i32, i32* %3467, align 4
  %3469 = add i32 %3468, 1
  store i32 %3469, i32* %3467, align 4
  br label %3485

3470:                                             ; preds = %3465
  %3471 = and i32 %3459, -4096
  %3472 = or i32 %3471, 695
  %3473 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3474 = load i32, i32* %3473, align 4
  %3475 = getelementptr i32, i32* %3463, i32 %3474
  store i32 %3472, i32* %3475, align 4
  %3476 = load i32*, i32** %3462, align 4
  %3477 = load i32, i32* %3473, align 4
  %3478 = add i32 %3477, 1
  store i32 %3478, i32* %3473, align 4
  %3479 = icmp eq i32* %3476, null
  br i1 %3479, label %3485, label %3480

3480:                                             ; preds = %3470
  %3481 = shl nuw i32 %3460, 20
  %3482 = or i32 %3481, 164499
  %3483 = getelementptr i32, i32* %3476, i32 %3478
  store i32 %3482, i32* %3483, align 4
  %3484 = load i32, i32* %3473, align 4
  br label %3485

3485:                                             ; preds = %3480, %3470, %3466
  %3486 = phi i32* [ %3473, %3470 ], [ %3473, %3480 ], [ %3467, %3466 ]
  %3487 = phi i32 [ %3478, %3470 ], [ %3484, %3480 ], [ %3469, %3466 ]
  %3488 = add i32 %3487, 1
  store i32 %3488, i32* %3486, align 4
  br label %3500

3489:                                             ; preds = %3456
  br i1 %3464, label %3496, label %3490

3490:                                             ; preds = %3489
  %3491 = shl nuw i32 %3460, 20
  %3492 = or i32 %3491, 659
  %3493 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3494 = load i32, i32* %3493, align 4
  %3495 = getelementptr i32, i32* %3463, i32 %3494
  store i32 %3492, i32* %3495, align 4
  br label %3496

3496:                                             ; preds = %3490, %3489
  %3497 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3498 = load i32, i32* %3497, align 4
  %3499 = add i32 %3498, 1
  store i32 %3499, i32* %3497, align 4
  br label %3500

3500:                                             ; preds = %3496, %3485
  %3501 = phi i32 [ %3488, %3485 ], [ %3499, %3496 ]
  %3502 = load i32*, i32** %3462, align 4
  %3503 = icmp eq i32* %3502, null
  br i1 %3503, label %3513, label %3504

3504:                                             ; preds = %3500
  %3505 = getelementptr i8, i8* %3457, i32 1
  %3506 = load i8, i8* %3505, align 1
  %3507 = zext i8 %3506 to i32
  %3508 = shl nuw nsw i32 %3507, 20
  %3509 = or i32 %3508, 164531
  %3510 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3511 = getelementptr i32, i32* %3502, i32 %3501
  store i32 %3509, i32* %3511, align 4
  %3512 = load i32, i32* %3510, align 4
  br label %3513

3513:                                             ; preds = %3504, %3500
  %3514 = phi i32 [ %3501, %3500 ], [ %3512, %3504 ]
  %3515 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3516 = add i32 %3514, 1
  store i32 %3516, i32* %3515, align 4
  %3517 = lshr i8 %7, 3
  %3518 = and i8 %3517, 3
  %3519 = zext i8 %3518 to i32
  switch i32 %3519, label %3645 [
    i32 2, label %3520
    i32 1, label %3553
    i32 0, label %3586
    i32 3, label %3619
  ]

3520:                                             ; preds = %3513
  %3521 = load i32*, i32** %3462, align 4
  %3522 = icmp eq i32* %3521, null
  br i1 %3522, label %3531, label %3523

3523:                                             ; preds = %3520
  %3524 = getelementptr i8, i8* %3420, i32 1
  %3525 = load i8, i8* %3524, align 1
  %3526 = zext i8 %3525 to i32
  %3527 = shl nuw nsw i32 %3526, 7
  %3528 = or i32 %3527, 180227
  %3529 = getelementptr i32, i32* %3521, i32 %3516
  store i32 %3528, i32* %3529, align 4
  %3530 = load i32, i32* %3515, align 4
  br label %3531

3531:                                             ; preds = %3523, %3520
  %3532 = phi i32 [ %3516, %3520 ], [ %3530, %3523 ]
  %3533 = add i32 %3532, 1
  store i32 %3533, i32* %3515, align 4
  %3534 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %3535 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %3534, i32 0, i32 7
  %3536 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %3535, align 4
  %3537 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %3536, i32 0, i32 13
  %3538 = load i8, i8* %3537, align 8, !range !4
  %3539 = icmp eq i8 %3538, 0
  br i1 %3539, label %3540, label %3646

3540:                                             ; preds = %3531
  %3541 = load i32*, i32** %3462, align 4
  %3542 = icmp eq i32* %3541, null
  br i1 %3542, label %3550, label %3543

3543:                                             ; preds = %3540
  %3544 = load i8, i8* %3420, align 1
  %3545 = zext i8 %3544 to i32
  %3546 = shl nuw nsw i32 %3545, 7
  %3547 = or i32 %3546, 19
  %3548 = getelementptr i32, i32* %3541, i32 %3533
  store i32 %3547, i32* %3548, align 4
  %3549 = load i32, i32* %3515, align 4
  br label %3550

3550:                                             ; preds = %3543, %3540
  %3551 = phi i32 [ %3533, %3540 ], [ %3549, %3543 ]
  %3552 = add i32 %3551, 1
  store i32 %3552, i32* %3515, align 4
  br label %3646

3553:                                             ; preds = %3513
  %3554 = load i32*, i32** %3462, align 4
  %3555 = icmp eq i32* %3554, null
  br i1 %3555, label %3564, label %3556

3556:                                             ; preds = %3553
  %3557 = getelementptr i8, i8* %3420, i32 1
  %3558 = load i8, i8* %3557, align 1
  %3559 = zext i8 %3558 to i32
  %3560 = shl nuw nsw i32 %3559, 7
  %3561 = or i32 %3560, 184323
  %3562 = getelementptr i32, i32* %3554, i32 %3516
  store i32 %3561, i32* %3562, align 4
  %3563 = load i32, i32* %3515, align 4
  br label %3564

3564:                                             ; preds = %3556, %3553
  %3565 = phi i32 [ %3516, %3553 ], [ %3563, %3556 ]
  %3566 = add i32 %3565, 1
  store i32 %3566, i32* %3515, align 4
  %3567 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %3568 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %3567, i32 0, i32 7
  %3569 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %3568, align 4
  %3570 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %3569, i32 0, i32 13
  %3571 = load i8, i8* %3570, align 8, !range !4
  %3572 = icmp eq i8 %3571, 0
  br i1 %3572, label %3573, label %3646

3573:                                             ; preds = %3564
  %3574 = load i32*, i32** %3462, align 4
  %3575 = icmp eq i32* %3574, null
  br i1 %3575, label %3583, label %3576

3576:                                             ; preds = %3573
  %3577 = load i8, i8* %3420, align 1
  %3578 = zext i8 %3577 to i32
  %3579 = shl nuw nsw i32 %3578, 7
  %3580 = or i32 %3579, 19
  %3581 = getelementptr i32, i32* %3574, i32 %3566
  store i32 %3580, i32* %3581, align 4
  %3582 = load i32, i32* %3515, align 4
  br label %3583

3583:                                             ; preds = %3576, %3573
  %3584 = phi i32 [ %3566, %3573 ], [ %3582, %3576 ]
  %3585 = add i32 %3584, 1
  store i32 %3585, i32* %3515, align 4
  br label %3646

3586:                                             ; preds = %3513
  %3587 = load i32*, i32** %3462, align 4
  %3588 = icmp eq i32* %3587, null
  br i1 %3588, label %3597, label %3589

3589:                                             ; preds = %3586
  %3590 = getelementptr i8, i8* %3420, i32 1
  %3591 = load i8, i8* %3590, align 1
  %3592 = zext i8 %3591 to i32
  %3593 = shl nuw nsw i32 %3592, 7
  %3594 = or i32 %3593, 172035
  %3595 = getelementptr i32, i32* %3587, i32 %3516
  store i32 %3594, i32* %3595, align 4
  %3596 = load i32, i32* %3515, align 4
  br label %3597

3597:                                             ; preds = %3589, %3586
  %3598 = phi i32 [ %3516, %3586 ], [ %3596, %3589 ]
  %3599 = add i32 %3598, 1
  store i32 %3599, i32* %3515, align 4
  %3600 = load %struct.bpf_prog*, %struct.bpf_prog** %11, align 4
  %3601 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %3600, i32 0, i32 7
  %3602 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %3601, align 4
  %3603 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %3602, i32 0, i32 13
  %3604 = load i8, i8* %3603, align 8, !range !4
  %3605 = icmp eq i8 %3604, 0
  br i1 %3605, label %3606, label %3646

3606:                                             ; preds = %3597
  %3607 = load i32*, i32** %3462, align 4
  %3608 = icmp eq i32* %3607, null
  br i1 %3608, label %3616, label %3609

3609:                                             ; preds = %3606
  %3610 = load i8, i8* %3420, align 1
  %3611 = zext i8 %3610 to i32
  %3612 = shl nuw nsw i32 %3611, 7
  %3613 = or i32 %3612, 19
  %3614 = getelementptr i32, i32* %3607, i32 %3599
  store i32 %3613, i32* %3614, align 4
  %3615 = load i32, i32* %3515, align 4
  br label %3616

3616:                                             ; preds = %3609, %3606
  %3617 = phi i32 [ %3599, %3606 ], [ %3615, %3609 ]
  %3618 = add i32 %3617, 1
  store i32 %3618, i32* %3515, align 4
  br label %3646

3619:                                             ; preds = %3513
  %3620 = load i32*, i32** %3462, align 4
  %3621 = icmp eq i32* %3620, null
  br i1 %3621, label %3622, label %3624

3622:                                             ; preds = %3619
  %3623 = add i32 %3514, 2
  store i32 %3623, i32* %3515, align 4
  br label %3642

3624:                                             ; preds = %3619
  %3625 = getelementptr i8, i8* %3420, i32 1
  %3626 = load i8, i8* %3625, align 1
  %3627 = zext i8 %3626 to i32
  %3628 = shl nuw nsw i32 %3627, 7
  %3629 = or i32 %3628, 172035
  %3630 = getelementptr i32, i32* %3620, i32 %3516
  store i32 %3629, i32* %3630, align 4
  %3631 = load i32, i32* %3515, align 4
  %3632 = load i32*, i32** %3462, align 4
  %3633 = add i32 %3631, 1
  store i32 %3633, i32* %3515, align 4
  %3634 = icmp eq i32* %3632, null
  br i1 %3634, label %3642, label %3635

3635:                                             ; preds = %3624
  %3636 = load i8, i8* %3420, align 1
  %3637 = zext i8 %3636 to i32
  %3638 = shl nuw nsw i32 %3637, 7
  %3639 = or i32 %3638, 4366339
  %3640 = getelementptr i32, i32* %3632, i32 %3633
  store i32 %3639, i32* %3640, align 4
  %3641 = load i32, i32* %3515, align 4
  br label %3642

3642:                                             ; preds = %3635, %3624, %3622
  %3643 = phi i32 [ %3633, %3624 ], [ %3641, %3635 ], [ %3623, %3622 ]
  %3644 = add i32 %3643, 1
  store i32 %3644, i32* %3515, align 4
  br label %3646

3645:                                             ; preds = %3513
  unreachable

3646:                                             ; preds = %3642, %3616, %3597, %3583, %3564, %3550, %3531
  %3647 = phi i32 [ %3533, %3531 ], [ %3566, %3564 ], [ %3599, %3597 ], [ %3618, %3616 ], [ %3585, %3583 ], [ %3552, %3550 ], [ %3644, %3642 ]
  br i1 %3387, label %3648, label %3989

3648:                                             ; preds = %3646
  %3649 = sext i8 %3384 to i16
  %3650 = load i32*, i32** %3462, align 4
  %3651 = icmp eq i32* %3650, null
  br i1 %3651, label %3652, label %3654

3652:                                             ; preds = %3648
  %3653 = add i32 %3647, 1
  store i32 %3653, i32* %3515, align 4
  br label %3691

3654:                                             ; preds = %3648
  %3655 = lshr i16 %3649, 5
  %3656 = zext i16 %3655 to i32
  %3657 = shl i32 %3656, 25
  %3658 = load i8, i8* %3420, align 1
  %3659 = zext i8 %3658 to i32
  %3660 = shl nuw nsw i32 %3659, 20
  %3661 = shl nsw i16 %3649, 7
  %3662 = and i16 %3661, 3968
  %3663 = zext i16 %3662 to i32
  %3664 = or i32 %3657, %3663
  %3665 = or i32 %3664, %3660
  %3666 = or i32 %3665, 270371
  %3667 = getelementptr i32, i32* %3650, i32 %3647
  store i32 %3666, i32* %3667, align 4
  %3668 = load i32*, i32** %3462, align 4
  %3669 = load i32, i32* %3515, align 4
  %3670 = add i32 %3669, 1
  store i32 %3670, i32* %3515, align 4
  %3671 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %3672 = load i8, i8* %3671, align 1
  %3673 = sext i8 %3672 to i16
  %3674 = icmp eq i32* %3668, null
  br i1 %3674, label %3691, label %3675

3675:                                             ; preds = %3654
  %3676 = lshr i16 %3673, 5
  %3677 = zext i16 %3676 to i32
  %3678 = shl i32 %3677, 25
  %3679 = getelementptr i8, i8* %3420, i32 1
  %3680 = load i8, i8* %3679, align 1
  %3681 = zext i8 %3680 to i32
  %3682 = shl nuw nsw i32 %3681, 20
  %3683 = shl nsw i16 %3673, 7
  %3684 = and i16 %3683, 3968
  %3685 = zext i16 %3684 to i32
  %3686 = or i32 %3678, %3685
  %3687 = or i32 %3686, %3682
  %3688 = or i32 %3687, 270371
  %3689 = getelementptr i32, i32* %3668, i32 %3670
  store i32 %3688, i32* %3689, align 4
  %3690 = load i32, i32* %3515, align 4
  br label %3691

3691:                                             ; preds = %3675, %3654, %3652
  %3692 = phi i32 [ %3670, %3654 ], [ %3690, %3675 ], [ %3653, %3652 ]
  %3693 = add i32 %3692, 1
  store i32 %3693, i32* %3515, align 4
  br label %3989

3694:                                             ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3
  %3695 = and i32 %30, 7
  %3696 = icmp eq i32 %3695, 2
  br i1 %3696, label %3697, label %3758

3697:                                             ; preds = %3694
  %3698 = add i32 %21, 2048
  %3699 = and i32 %21, 4095
  %3700 = icmp ult i32 %3698, 4096
  %3701 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3702 = load i32*, i32** %3701, align 4
  %3703 = icmp eq i32* %3702, null
  br i1 %3700, label %3728, label %3704

3704:                                             ; preds = %3697
  br i1 %3703, label %3705, label %3709

3705:                                             ; preds = %3704
  %3706 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3707 = load i32, i32* %3706, align 4
  %3708 = add i32 %3707, 1
  store i32 %3708, i32* %3706, align 4
  br label %3724

3709:                                             ; preds = %3704
  %3710 = and i32 %3698, -4096
  %3711 = or i32 %3710, 3767
  %3712 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3713 = load i32, i32* %3712, align 4
  %3714 = getelementptr i32, i32* %3702, i32 %3713
  store i32 %3711, i32* %3714, align 4
  %3715 = load i32*, i32** %3701, align 4
  %3716 = load i32, i32* %3712, align 4
  %3717 = add i32 %3716, 1
  store i32 %3717, i32* %3712, align 4
  %3718 = icmp eq i32* %3715, null
  br i1 %3718, label %3724, label %3719

3719:                                             ; preds = %3709
  %3720 = shl nuw i32 %3699, 20
  %3721 = or i32 %3720, 954003
  %3722 = getelementptr i32, i32* %3715, i32 %3717
  store i32 %3721, i32* %3722, align 4
  %3723 = load i32, i32* %3712, align 4
  br label %3724

3724:                                             ; preds = %3719, %3709, %3705
  %3725 = phi i32* [ %3712, %3709 ], [ %3712, %3719 ], [ %3706, %3705 ]
  %3726 = phi i32 [ %3717, %3709 ], [ %3723, %3719 ], [ %3708, %3705 ]
  %3727 = add i32 %3726, 1
  store i32 %3727, i32* %3725, align 4
  br label %3739

3728:                                             ; preds = %3697
  br i1 %3703, label %3735, label %3729

3729:                                             ; preds = %3728
  %3730 = shl nuw i32 %3699, 20
  %3731 = or i32 %3730, 3731
  %3732 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3733 = load i32, i32* %3732, align 4
  %3734 = getelementptr i32, i32* %3702, i32 %3733
  store i32 %3731, i32* %3734, align 4
  br label %3735

3735:                                             ; preds = %3729, %3728
  %3736 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3737 = load i32, i32* %3736, align 4
  %3738 = add i32 %3737, 1
  store i32 %3738, i32* %3736, align 4
  br label %3739

3739:                                             ; preds = %3724, %3735
  %3740 = phi i32 [ %3727, %3724 ], [ %3738, %3735 ]
  %3741 = icmp sgt i32 %21, -1
  %3742 = load i32*, i32** %3701, align 4
  %3743 = icmp eq i32* %3742, null
  br i1 %3741, label %3744, label %3749

3744:                                             ; preds = %3739
  br i1 %3743, label %3754, label %3745

3745:                                             ; preds = %3744
  %3746 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3747 = getelementptr i32, i32* %3742, i32 %3740
  store i32 3859, i32* %3747, align 4
  %3748 = load i32, i32* %3746, align 4
  br label %3754

3749:                                             ; preds = %3739
  br i1 %3743, label %3754, label %3750

3750:                                             ; preds = %3749
  %3751 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3752 = getelementptr i32, i32* %3742, i32 %3740
  store i32 -1044717, i32* %3752, align 4
  %3753 = load i32, i32* %3751, align 4
  br label %3754

3754:                                             ; preds = %3749, %3750, %3744, %3745
  %3755 = phi i32 [ %3748, %3745 ], [ %3740, %3744 ], [ %3753, %3750 ], [ %3740, %3749 ]
  %3756 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3757 = add i32 %3755, 1
  store i32 %3757, i32* %3756, align 4
  br label %3758

3758:                                             ; preds = %3754, %3694
  %3759 = phi i8* [ %29, %3694 ], [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %3754 ]
  %3760 = and i8 %7, 24
  %3761 = and i8 %7, -32
  %3762 = load i8, i8* %26, align 1
  %3763 = lshr i32 3008, %25
  %3764 = and i32 %3763, 1
  %3765 = icmp eq i32 %3764, 0
  br i1 %3765, label %3797, label %3766

3766:                                             ; preds = %3758
  %3767 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3768 = load i32*, i32** %3767, align 4
  %3769 = icmp eq i32* %3768, null
  br i1 %3769, label %3770, label %3774

3770:                                             ; preds = %3766
  %3771 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3772 = load i32, i32* %3771, align 4
  %3773 = add i32 %3772, 1
  store i32 %3773, i32* %3771, align 4
  br label %3793

3774:                                             ; preds = %3766
  %3775 = sext i8 %3762 to i32
  %3776 = shl nsw i32 %3775, 20
  %3777 = or i32 %3776, 273923
  %3778 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3779 = load i32, i32* %3778, align 4
  %3780 = getelementptr i32, i32* %3768, i32 %3779
  store i32 %3777, i32* %3780, align 4
  %3781 = load i32*, i32** %3767, align 4
  %3782 = load i32, i32* %3778, align 4
  %3783 = add i32 %3782, 1
  store i32 %3783, i32* %3778, align 4
  %3784 = icmp eq i32* %3781, null
  br i1 %3784, label %3793, label %3785

3785:                                             ; preds = %3774
  %3786 = getelementptr [14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 %25, i32 1
  %3787 = load i8, i8* %3786, align 1
  %3788 = sext i8 %3787 to i32
  %3789 = shl nsw i32 %3788, 20
  %3790 = or i32 %3789, 271235
  %3791 = getelementptr i32, i32* %3781, i32 %3783
  store i32 %3790, i32* %3791, align 4
  %3792 = load i32, i32* %3778, align 4
  br label %3793

3793:                                             ; preds = %3785, %3774, %3770
  %3794 = phi i32* [ %3778, %3774 ], [ %3778, %3785 ], [ %3771, %3770 ]
  %3795 = phi i32 [ %3783, %3774 ], [ %3792, %3785 ], [ %3773, %3770 ]
  %3796 = add i32 %3795, 1
  store i32 %3796, i32* %3794, align 4
  br label %3797

3797:                                             ; preds = %3758, %3793
  %3798 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %3793 ], [ %26, %3758 ]
  %3799 = load i8, i8* %3759, align 1
  %3800 = icmp slt i8 %3799, 0
  br i1 %3800, label %3801, label %3832

3801:                                             ; preds = %3797
  %3802 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3803 = load i32*, i32** %3802, align 4
  %3804 = icmp eq i32* %3803, null
  br i1 %3804, label %3805, label %3809

3805:                                             ; preds = %3801
  %3806 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3807 = load i32, i32* %3806, align 4
  %3808 = add i32 %3807, 1
  store i32 %3808, i32* %3806, align 4
  br label %3828

3809:                                             ; preds = %3801
  %3810 = sext i8 %3799 to i32
  %3811 = shl nsw i32 %3810, 20
  %3812 = or i32 %3811, 274179
  %3813 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3814 = load i32, i32* %3813, align 4
  %3815 = getelementptr i32, i32* %3803, i32 %3814
  store i32 %3812, i32* %3815, align 4
  %3816 = load i32*, i32** %3802, align 4
  %3817 = load i32, i32* %3813, align 4
  %3818 = add i32 %3817, 1
  store i32 %3818, i32* %3813, align 4
  %3819 = icmp eq i32* %3816, null
  br i1 %3819, label %3828, label %3820

3820:                                             ; preds = %3809
  %3821 = getelementptr i8, i8* %3759, i32 1
  %3822 = load i8, i8* %3821, align 1
  %3823 = sext i8 %3822 to i32
  %3824 = shl nsw i32 %3823, 20
  %3825 = or i32 %3824, 274051
  %3826 = getelementptr i32, i32* %3816, i32 %3818
  store i32 %3825, i32* %3826, align 4
  %3827 = load i32, i32* %3813, align 4
  br label %3828

3828:                                             ; preds = %3820, %3809, %3805
  %3829 = phi i32* [ %3813, %3809 ], [ %3813, %3820 ], [ %3806, %3805 ]
  %3830 = phi i32 [ %3818, %3809 ], [ %3827, %3820 ], [ %3808, %3805 ]
  %3831 = add i32 %3830, 1
  store i32 %3831, i32* %3829, align 4
  br label %3832

3832:                                             ; preds = %3828, %3797
  %3833 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %3828 ], [ %3759, %3797 ]
  %3834 = icmp ne i8 %3761, -64
  %3835 = icmp eq i8 %3760, 0
  %3836 = or i1 %3835, %3834
  br i1 %3836, label %3837, label %3989

3837:                                             ; preds = %3832
  %3838 = sext i16 %19 to i32
  %3839 = add nsw i32 %3838, 2048
  %3840 = and i32 %3838, 4095
  %3841 = icmp ult i32 %3839, 4096
  %3842 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %3843 = load i32*, i32** %3842, align 4
  %3844 = icmp eq i32* %3843, null
  br i1 %3841, label %3869, label %3845

3845:                                             ; preds = %3837
  br i1 %3844, label %3846, label %3850

3846:                                             ; preds = %3845
  %3847 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3848 = load i32, i32* %3847, align 4
  %3849 = add i32 %3848, 1
  store i32 %3849, i32* %3847, align 4
  br label %3865

3850:                                             ; preds = %3845
  %3851 = and i32 %3839, -4096
  %3852 = or i32 %3851, 695
  %3853 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3854 = load i32, i32* %3853, align 4
  %3855 = getelementptr i32, i32* %3843, i32 %3854
  store i32 %3852, i32* %3855, align 4
  %3856 = load i32*, i32** %3842, align 4
  %3857 = load i32, i32* %3853, align 4
  %3858 = add i32 %3857, 1
  store i32 %3858, i32* %3853, align 4
  %3859 = icmp eq i32* %3856, null
  br i1 %3859, label %3865, label %3860

3860:                                             ; preds = %3850
  %3861 = shl nuw i32 %3840, 20
  %3862 = or i32 %3861, 164499
  %3863 = getelementptr i32, i32* %3856, i32 %3858
  store i32 %3862, i32* %3863, align 4
  %3864 = load i32, i32* %3853, align 4
  br label %3865

3865:                                             ; preds = %3860, %3850, %3846
  %3866 = phi i32* [ %3853, %3850 ], [ %3853, %3860 ], [ %3847, %3846 ]
  %3867 = phi i32 [ %3858, %3850 ], [ %3864, %3860 ], [ %3849, %3846 ]
  %3868 = add i32 %3867, 1
  store i32 %3868, i32* %3866, align 4
  br label %3880

3869:                                             ; preds = %3837
  br i1 %3844, label %3876, label %3870

3870:                                             ; preds = %3869
  %3871 = shl nuw i32 %3840, 20
  %3872 = or i32 %3871, 659
  %3873 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3874 = load i32, i32* %3873, align 4
  %3875 = getelementptr i32, i32* %3843, i32 %3874
  store i32 %3872, i32* %3875, align 4
  br label %3876

3876:                                             ; preds = %3870, %3869
  %3877 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3878 = load i32, i32* %3877, align 4
  %3879 = add i32 %3878, 1
  store i32 %3879, i32* %3877, align 4
  br label %3880

3880:                                             ; preds = %3876, %3865
  %3881 = phi i32 [ %3868, %3865 ], [ %3879, %3876 ]
  %3882 = load i32*, i32** %3842, align 4
  %3883 = icmp eq i32* %3882, null
  br i1 %3883, label %3893, label %3884

3884:                                             ; preds = %3880
  %3885 = getelementptr i8, i8* %3798, i32 1
  %3886 = load i8, i8* %3885, align 1
  %3887 = zext i8 %3886 to i32
  %3888 = shl nuw nsw i32 %3887, 20
  %3889 = or i32 %3888, 164531
  %3890 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3891 = getelementptr i32, i32* %3882, i32 %3881
  store i32 %3889, i32* %3891, align 4
  %3892 = load i32, i32* %3890, align 4
  br label %3893

3893:                                             ; preds = %3884, %3880
  %3894 = phi i32 [ %3881, %3880 ], [ %3892, %3884 ]
  %3895 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %3896 = add i32 %3894, 1
  store i32 %3896, i32* %3895, align 4
  %3897 = lshr exact i8 %3760, 3
  %3898 = zext i8 %3897 to i32
  switch i32 %3898, label %3988 [
    i32 2, label %3899
    i32 1, label %3913
    i32 0, label %3927
    i32 3, label %3956
  ]

3899:                                             ; preds = %3893
  %3900 = load i32*, i32** %3842, align 4
  %3901 = icmp eq i32* %3900, null
  br i1 %3901, label %3910, label %3902

3902:                                             ; preds = %3899
  %3903 = getelementptr i8, i8* %3833, i32 1
  %3904 = load i8, i8* %3903, align 1
  %3905 = zext i8 %3904 to i32
  %3906 = shl nuw nsw i32 %3905, 20
  %3907 = or i32 %3906, 163875
  %3908 = getelementptr i32, i32* %3900, i32 %3896
  store i32 %3907, i32* %3908, align 4
  %3909 = load i32, i32* %3895, align 4
  br label %3910

3910:                                             ; preds = %3902, %3899
  %3911 = phi i32 [ %3896, %3899 ], [ %3909, %3902 ]
  %3912 = add i32 %3911, 1
  store i32 %3912, i32* %3895, align 4
  br label %3989

3913:                                             ; preds = %3893
  %3914 = load i32*, i32** %3842, align 4
  %3915 = icmp eq i32* %3914, null
  br i1 %3915, label %3924, label %3916

3916:                                             ; preds = %3913
  %3917 = getelementptr i8, i8* %3833, i32 1
  %3918 = load i8, i8* %3917, align 1
  %3919 = zext i8 %3918 to i32
  %3920 = shl nuw nsw i32 %3919, 20
  %3921 = or i32 %3920, 167971
  %3922 = getelementptr i32, i32* %3914, i32 %3896
  store i32 %3921, i32* %3922, align 4
  %3923 = load i32, i32* %3895, align 4
  br label %3924

3924:                                             ; preds = %3916, %3913
  %3925 = phi i32 [ %3896, %3913 ], [ %3923, %3916 ]
  %3926 = add i32 %3925, 1
  store i32 %3926, i32* %3895, align 4
  br label %3989

3927:                                             ; preds = %3893
  switch i8 %3761, label %3989 [
    i8 96, label %3928
    i8 -64, label %3942
  ]

3928:                                             ; preds = %3927
  %3929 = load i32*, i32** %3842, align 4
  %3930 = icmp eq i32* %3929, null
  br i1 %3930, label %3939, label %3931

3931:                                             ; preds = %3928
  %3932 = getelementptr i8, i8* %3833, i32 1
  %3933 = load i8, i8* %3932, align 1
  %3934 = zext i8 %3933 to i32
  %3935 = shl nuw nsw i32 %3934, 20
  %3936 = or i32 %3935, 172067
  %3937 = getelementptr i32, i32* %3929, i32 %3896
  store i32 %3936, i32* %3937, align 4
  %3938 = load i32, i32* %3895, align 4
  br label %3939

3939:                                             ; preds = %3931, %3928
  %3940 = phi i32 [ %3896, %3928 ], [ %3938, %3931 ]
  %3941 = add i32 %3940, 1
  store i32 %3941, i32* %3895, align 4
  br label %3989

3942:                                             ; preds = %3927
  %3943 = load i32*, i32** %3842, align 4
  %3944 = icmp eq i32* %3943, null
  br i1 %3944, label %3953, label %3945

3945:                                             ; preds = %3942
  %3946 = getelementptr i8, i8* %3833, i32 1
  %3947 = load i8, i8* %3946, align 1
  %3948 = zext i8 %3947 to i32
  %3949 = shl nuw nsw i32 %3948, 20
  %3950 = or i32 %3949, 172079
  %3951 = getelementptr i32, i32* %3943, i32 %3896
  store i32 %3950, i32* %3951, align 4
  %3952 = load i32, i32* %3895, align 4
  br label %3953

3953:                                             ; preds = %3945, %3942
  %3954 = phi i32 [ %3896, %3942 ], [ %3952, %3945 ]
  %3955 = add i32 %3954, 1
  store i32 %3955, i32* %3895, align 4
  br label %3989

3956:                                             ; preds = %3893
  %3957 = load i32*, i32** %3842, align 4
  %3958 = icmp eq i32* %3957, null
  br i1 %3958, label %3959, label %3961

3959:                                             ; preds = %3956
  %3960 = add i32 %3894, 2
  store i32 %3960, i32* %3895, align 4
  br label %3979

3961:                                             ; preds = %3956
  %3962 = getelementptr i8, i8* %3833, i32 1
  %3963 = load i8, i8* %3962, align 1
  %3964 = zext i8 %3963 to i32
  %3965 = shl nuw nsw i32 %3964, 20
  %3966 = or i32 %3965, 172067
  %3967 = getelementptr i32, i32* %3957, i32 %3896
  store i32 %3966, i32* %3967, align 4
  %3968 = load i32, i32* %3895, align 4
  %3969 = load i32*, i32** %3842, align 4
  %3970 = add i32 %3968, 1
  store i32 %3970, i32* %3895, align 4
  %3971 = icmp eq i32* %3969, null
  br i1 %3971, label %3979, label %3972

3972:                                             ; preds = %3961
  %3973 = load i8, i8* %3833, align 1
  %3974 = zext i8 %3973 to i32
  %3975 = shl nuw nsw i32 %3974, 20
  %3976 = or i32 %3975, 172579
  %3977 = getelementptr i32, i32* %3969, i32 %3970
  store i32 %3976, i32* %3977, align 4
  %3978 = load i32, i32* %3895, align 4
  br label %3979

3979:                                             ; preds = %3972, %3961, %3959
  %3980 = phi i32 [ %3970, %3961 ], [ %3978, %3972 ], [ %3960, %3959 ]
  %3981 = add i32 %3980, 1
  store i32 %3981, i32* %3895, align 4
  br label %3989

3982:                                             ; preds = %3, %3, %3, %3, %3
  %3983 = load i1, i1* @bpf_jit_emit_insn.__print_once, align 1
  br i1 %3983, label %3989, label %3984

3984:                                             ; preds = %3982
  store i1 true, i1* @bpf_jit_emit_insn.__print_once, align 1
  %3985 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i32 0, i32 0), i32 %30) #6
  br label %3989

3986:                                             ; preds = %3
  %3987 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0), i32 %30) #6
  br label %3989

3988:                                             ; preds = %3893
  unreachable

3989:                                             ; preds = %3910, %3924, %3979, %3927, %3953, %3939, %95, %98, %1043, %1672, %1673, %3113, %3072, %3121, %2256, %823, %871, %925, %972, %1771, %1819, %2025, %2073, %2123, %2151, %2343, %3157, %3180, %3646, %3691, %3832, %3380, %3332, %3982, %3984, %2259, %2023, %1769, %3986
  %3990 = phi i32 [ -22, %3986 ], [ %2157, %2259 ], [ -1, %1769 ], [ -1, %2023 ], [ -14, %3984 ], [ -14, %3982 ], [ 1, %3332 ], [ 1, %3380 ], [ -1, %3832 ], [ 0, %3691 ], [ 0, %3646 ], [ 0, %3180 ], [ 0, %3157 ], [ 0, %2343 ], [ 0, %2151 ], [ 0, %2123 ], [ 0, %2073 ], [ 0, %2025 ], [ 0, %1819 ], [ 0, %1771 ], [ 0, %972 ], [ 0, %925 ], [ 0, %871 ], [ 0, %823 ], [ 0, %2256 ], [ 0, %3121 ], [ 0, %3072 ], [ 0, %3113 ], [ 0, %1673 ], [ 0, %1672 ], [ 0, %1043 ], [ 0, %98 ], [ 0, %95 ], [ 0, %3939 ], [ 0, %3953 ], [ 0, %3927 ], [ 0, %3979 ], [ 0, %3924 ], [ 0, %3910 ]
  ret i32 %3990
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @emit_alu_r64(i8* readonly %0, i8* readonly %1, %struct.rv_jit_context* %2, i8 zeroext %3) unnamed_addr #2 {
  %5 = load i8, i8* %0, align 1
  %6 = icmp slt i8 %5, 0
  br i1 %6, label %7, label %38

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %9 = load i32*, i32** %8, align 4
  %10 = icmp eq i32* %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %12, align 4
  br label %34

15:                                               ; preds = %7
  %16 = sext i8 %5 to i32
  %17 = shl nsw i32 %16, 20
  %18 = or i32 %17, 273923
  %19 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr i32, i32* %9, i32 %20
  store i32 %18, i32* %21, align 4
  %22 = load i32*, i32** %8, align 4
  %23 = load i32, i32* %19, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %19, align 4
  %25 = icmp eq i32* %22, null
  br i1 %25, label %34, label %26

26:                                               ; preds = %15
  %27 = getelementptr i8, i8* %0, i32 1
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = shl nsw i32 %29, 20
  %31 = or i32 %30, 271235
  %32 = getelementptr i32, i32* %22, i32 %24
  store i32 %31, i32* %32, align 4
  %33 = load i32, i32* %19, align 4
  br label %34

34:                                               ; preds = %26, %15, %11
  %35 = phi i32* [ %19, %15 ], [ %19, %26 ], [ %12, %11 ]
  %36 = phi i32 [ %24, %15 ], [ %33, %26 ], [ %14, %11 ]
  %37 = add i32 %36, 1
  store i32 %37, i32* %35, align 4
  br label %38

38:                                               ; preds = %4, %34
  %39 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %34 ], [ %0, %4 ]
  %40 = load i8, i8* %1, align 1
  %41 = icmp slt i8 %40, 0
  br i1 %41, label %42, label %73

42:                                               ; preds = %38
  %43 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %44 = load i32*, i32** %43, align 4
  %45 = icmp eq i32* %44, null
  br i1 %45, label %46, label %50

46:                                               ; preds = %42
  %47 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %48 = load i32, i32* %47, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %47, align 4
  br label %69

50:                                               ; preds = %42
  %51 = sext i8 %40 to i32
  %52 = shl nsw i32 %51, 20
  %53 = or i32 %52, 274179
  %54 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %55 = load i32, i32* %54, align 4
  %56 = getelementptr i32, i32* %44, i32 %55
  store i32 %53, i32* %56, align 4
  %57 = load i32*, i32** %43, align 4
  %58 = load i32, i32* %54, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %54, align 4
  %60 = icmp eq i32* %57, null
  br i1 %60, label %69, label %61

61:                                               ; preds = %50
  %62 = getelementptr i8, i8* %1, i32 1
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = shl nsw i32 %64, 20
  %66 = or i32 %65, 274051
  %67 = getelementptr i32, i32* %57, i32 %59
  store i32 %66, i32* %67, align 4
  %68 = load i32, i32* %54, align 4
  br label %69

69:                                               ; preds = %61, %50, %46
  %70 = phi i32* [ %54, %50 ], [ %54, %61 ], [ %47, %46 ]
  %71 = phi i32 [ %59, %50 ], [ %68, %61 ], [ %49, %46 ]
  %72 = add i32 %71, 1
  store i32 %72, i32* %70, align 4
  br label %73

73:                                               ; preds = %38, %69
  %74 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %69 ], [ %1, %38 ]
  %75 = zext i8 %3 to i32
  %76 = lshr i32 %75, 4
  %77 = shl i32 %75, 28
  %78 = or i32 %76, %77
  switch i32 %78, label %1090 [
    i32 11, label %79
    i32 0, label %117
    i32 1, label %251
    i32 5, label %318
    i32 4, label %358
    i32 10, label %398
    i32 2, label %438
    i32 6, label %541
    i32 7, label %701
    i32 12, label %861
    i32 8, label %1023
  ]

79:                                               ; preds = %73
  %80 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %81 = load i32*, i32** %80, align 4
  %82 = icmp eq i32* %81, null
  br i1 %82, label %83, label %87

83:                                               ; preds = %79
  %84 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %85 = load i32, i32* %84, align 4
  %86 = add i32 %85, 1
  store i32 %86, i32* %84, align 4
  br label %1086

87:                                               ; preds = %79
  %88 = getelementptr i8, i8* %39, i32 1
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = shl nuw nsw i32 %90, 7
  %92 = getelementptr i8, i8* %74, i32 1
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = shl nuw nsw i32 %94, 15
  %96 = or i32 %91, %95
  %97 = or i32 %96, 19
  %98 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr i32, i32* %81, i32 %99
  store i32 %97, i32* %100, align 4
  %101 = load i32*, i32** %80, align 4
  %102 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %103 = load i32, i32* %102, align 4
  %104 = add i32 %103, 1
  store i32 %104, i32* %102, align 4
  %105 = icmp eq i32* %101, null
  br i1 %105, label %1086, label %106

106:                                              ; preds = %87
  %107 = load i8, i8* %39, align 1
  %108 = zext i8 %107 to i32
  %109 = shl nuw nsw i32 %108, 7
  %110 = load i8, i8* %74, align 1
  %111 = zext i8 %110 to i32
  %112 = shl nuw nsw i32 %111, 15
  %113 = or i32 %109, %112
  %114 = or i32 %113, 19
  %115 = getelementptr i32, i32* %101, i32 %104
  store i32 %114, i32* %115, align 4
  %116 = load i32, i32* %102, align 4
  br label %1086

117:                                              ; preds = %73
  %118 = icmp eq i8* %39, %74
  %119 = getelementptr i8, i8* %39, i32 1
  %120 = load i8, i8* %119, align 1
  br i1 %118, label %121, label %177

121:                                              ; preds = %117
  %122 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %123 = load i32*, i32** %122, align 4
  %124 = icmp eq i32* %123, null
  br i1 %124, label %133, label %125

125:                                              ; preds = %121
  %126 = zext i8 %120 to i32
  %127 = shl nuw nsw i32 %126, 15
  %128 = or i32 %127, 32526995
  %129 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %130 = load i32, i32* %129, align 4
  %131 = getelementptr i32, i32* %123, i32 %130
  store i32 %128, i32* %131, align 4
  %132 = load i32*, i32** %122, align 4
  br label %133

133:                                              ; preds = %121, %125
  %134 = phi i32* [ null, %121 ], [ %132, %125 ]
  %135 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %136 = load i32, i32* %135, align 4
  %137 = add i32 %136, 1
  store i32 %137, i32* %135, align 4
  %138 = load i8, i8* %39, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32* %134, null
  br i1 %140, label %141, label %143

141:                                              ; preds = %133
  %142 = add i32 %136, 2
  store i32 %142, i32* %135, align 4
  br label %155

143:                                              ; preds = %133
  %144 = shl nuw nsw i32 %139, 7
  %145 = shl nuw nsw i32 %139, 15
  %146 = or i32 %145, %144
  %147 = or i32 %146, 1052691
  %148 = getelementptr i32, i32* %134, i32 %137
  store i32 %147, i32* %148, align 4
  %149 = load i32, i32* %135, align 4
  %150 = load i32*, i32** %122, align 4
  %151 = add i32 %149, 1
  store i32 %151, i32* %135, align 4
  %152 = load i8, i8* %39, align 1
  %153 = zext i8 %152 to i32
  %154 = icmp eq i32* %150, null
  br i1 %154, label %155, label %158

155:                                              ; preds = %143, %141
  %156 = phi i32 [ %142, %141 ], [ %151, %143 ]
  %157 = add i32 %156, 1
  store i32 %157, i32* %135, align 4
  br label %1086

158:                                              ; preds = %143
  %159 = shl nuw nsw i32 %153, 7
  %160 = shl nuw nsw i32 %153, 20
  %161 = or i32 %160, %159
  %162 = or i32 %161, 188467
  %163 = getelementptr i32, i32* %150, i32 %151
  store i32 %162, i32* %163, align 4
  %164 = load i32, i32* %135, align 4
  %165 = load i32*, i32** %122, align 4
  %166 = add i32 %164, 1
  store i32 %166, i32* %135, align 4
  %167 = load i8, i8* %119, align 1
  %168 = zext i8 %167 to i32
  %169 = icmp eq i32* %165, null
  br i1 %169, label %1086, label %170

170:                                              ; preds = %158
  %171 = shl nuw nsw i32 %168, 7
  %172 = shl nuw nsw i32 %168, 15
  %173 = or i32 %172, %171
  %174 = or i32 %173, 1052691
  %175 = getelementptr i32, i32* %165, i32 %166
  store i32 %174, i32* %175, align 4
  %176 = load i32, i32* %135, align 4
  br label %1086

177:                                              ; preds = %117
  %178 = getelementptr i8, i8* %74, i32 1
  %179 = zext i8 %120 to i32
  %180 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %181 = load i32*, i32** %180, align 4
  %182 = icmp eq i32* %181, null
  br i1 %182, label %183, label %187

183:                                              ; preds = %177
  %184 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %185 = load i32, i32* %184, align 4
  %186 = add i32 %185, 1
  store i32 %186, i32* %184, align 4
  br label %204

187:                                              ; preds = %177
  %188 = shl nuw nsw i32 %179, 7
  %189 = shl nuw nsw i32 %179, 15
  %190 = load i8, i8* %178, align 1
  %191 = zext i8 %190 to i32
  %192 = shl nuw nsw i32 %191, 20
  %193 = or i32 %189, %188
  %194 = or i32 %193, %192
  %195 = or i32 %194, 51
  %196 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %197 = load i32, i32* %196, align 4
  %198 = getelementptr i32, i32* %181, i32 %197
  store i32 %195, i32* %198, align 4
  %199 = load i32*, i32** %180, align 4
  %200 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %201 = load i32, i32* %200, align 4
  %202 = add i32 %201, 1
  store i32 %202, i32* %200, align 4
  %203 = icmp eq i32* %199, null
  br i1 %203, label %204, label %208

204:                                              ; preds = %187, %183
  %205 = phi i32* [ %184, %183 ], [ %200, %187 ]
  %206 = phi i32 [ %186, %183 ], [ %202, %187 ]
  %207 = add i32 %206, 1
  store i32 %207, i32* %205, align 4
  br label %224

208:                                              ; preds = %187
  %209 = load i8, i8* %119, align 1
  %210 = zext i8 %209 to i32
  %211 = shl nuw nsw i32 %210, 15
  %212 = load i8, i8* %178, align 1
  %213 = zext i8 %212 to i32
  %214 = shl nuw nsw i32 %213, 20
  %215 = or i32 %211, %214
  %216 = or i32 %215, 12979
  %217 = getelementptr i32, i32* %199, i32 %202
  store i32 %216, i32* %217, align 4
  %218 = load i32, i32* %200, align 4
  %219 = load i32*, i32** %180, align 4
  %220 = add i32 %218, 1
  store i32 %220, i32* %200, align 4
  %221 = load i8, i8* %39, align 1
  %222 = zext i8 %221 to i32
  %223 = icmp eq i32* %219, null
  br i1 %223, label %224, label %228

224:                                              ; preds = %208, %204
  %225 = phi i32* [ %205, %204 ], [ %200, %208 ]
  %226 = phi i32 [ %207, %204 ], [ %220, %208 ]
  %227 = add i32 %226, 1
  store i32 %227, i32* %225, align 4
  br label %1086

228:                                              ; preds = %208
  %229 = shl nuw nsw i32 %222, 7
  %230 = shl nuw nsw i32 %222, 15
  %231 = load i8, i8* %74, align 1
  %232 = zext i8 %231 to i32
  %233 = shl nuw nsw i32 %232, 20
  %234 = or i32 %230, %229
  %235 = or i32 %234, %233
  %236 = or i32 %235, 51
  %237 = getelementptr i32, i32* %219, i32 %220
  store i32 %236, i32* %237, align 4
  %238 = load i32, i32* %200, align 4
  %239 = load i32*, i32** %180, align 4
  %240 = add i32 %238, 1
  store i32 %240, i32* %200, align 4
  %241 = load i8, i8* %39, align 1
  %242 = zext i8 %241 to i32
  %243 = icmp eq i32* %239, null
  br i1 %243, label %1086, label %244

244:                                              ; preds = %228
  %245 = shl nuw nsw i32 %242, 7
  %246 = shl nuw nsw i32 %242, 15
  %247 = or i32 %246, %245
  %248 = or i32 %247, 5242931
  %249 = getelementptr i32, i32* %239, i32 %240
  store i32 %248, i32* %249, align 4
  %250 = load i32, i32* %200, align 4
  br label %1086

251:                                              ; preds = %73
  %252 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %253 = load i32*, i32** %252, align 4
  %254 = icmp eq i32* %253, null
  br i1 %254, label %268, label %255

255:                                              ; preds = %251
  %256 = load i8, i8* %39, align 1
  %257 = zext i8 %256 to i32
  %258 = shl nuw nsw i32 %257, 15
  %259 = load i8, i8* %74, align 1
  %260 = zext i8 %259 to i32
  %261 = shl nuw nsw i32 %260, 20
  %262 = or i32 %258, %261
  %263 = or i32 %262, 1073742643
  %264 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %265 = load i32, i32* %264, align 4
  %266 = getelementptr i32, i32* %253, i32 %265
  store i32 %263, i32* %266, align 4
  %267 = load i32*, i32** %252, align 4
  br label %268

268:                                              ; preds = %251, %255
  %269 = phi i32* [ null, %251 ], [ %267, %255 ]
  %270 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %271 = load i32, i32* %270, align 4
  %272 = add i32 %271, 1
  store i32 %272, i32* %270, align 4
  %273 = getelementptr i8, i8* %39, i32 1
  %274 = getelementptr i8, i8* %74, i32 1
  %275 = icmp eq i32* %269, null
  br i1 %275, label %276, label %278

276:                                              ; preds = %268
  %277 = add i32 %271, 2
  store i32 %277, i32* %270, align 4
  br label %292

278:                                              ; preds = %268
  %279 = load i8, i8* %273, align 1
  %280 = zext i8 %279 to i32
  %281 = shl nuw nsw i32 %280, 15
  %282 = load i8, i8* %274, align 1
  %283 = zext i8 %282 to i32
  %284 = shl nuw nsw i32 %283, 20
  %285 = or i32 %281, %284
  %286 = or i32 %285, 12979
  %287 = getelementptr i32, i32* %269, i32 %272
  store i32 %286, i32* %287, align 4
  %288 = load i32, i32* %270, align 4
  %289 = load i32*, i32** %252, align 4
  %290 = add i32 %288, 1
  store i32 %290, i32* %270, align 4
  %291 = icmp eq i32* %289, null
  br i1 %291, label %292, label %295

292:                                              ; preds = %278, %276
  %293 = phi i32 [ %277, %276 ], [ %290, %278 ]
  %294 = add i32 %293, 1
  store i32 %294, i32* %270, align 4
  br label %1086

295:                                              ; preds = %278
  %296 = load i8, i8* %39, align 1
  %297 = zext i8 %296 to i32
  %298 = shl nuw nsw i32 %297, 7
  %299 = or i32 %298, 1079181363
  %300 = getelementptr i32, i32* %289, i32 %290
  store i32 %299, i32* %300, align 4
  %301 = load i32, i32* %270, align 4
  %302 = load i32*, i32** %252, align 4
  %303 = add i32 %301, 1
  store i32 %303, i32* %270, align 4
  %304 = load i8, i8* %273, align 1
  %305 = zext i8 %304 to i32
  %306 = icmp eq i32* %302, null
  br i1 %306, label %1086, label %307

307:                                              ; preds = %295
  %308 = shl nuw nsw i32 %305, 7
  %309 = shl nuw nsw i32 %305, 15
  %310 = load i8, i8* %274, align 1
  %311 = zext i8 %310 to i32
  %312 = shl nuw nsw i32 %311, 20
  %313 = or i32 %309, %308
  %314 = or i32 %313, %312
  %315 = or i32 %314, 1073741875
  %316 = getelementptr i32, i32* %302, i32 %303
  store i32 %315, i32* %316, align 4
  %317 = load i32, i32* %270, align 4
  br label %1086

318:                                              ; preds = %73
  %319 = getelementptr i8, i8* %39, i32 1
  %320 = load i8, i8* %319, align 1
  %321 = zext i8 %320 to i32
  %322 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %323 = load i32*, i32** %322, align 4
  %324 = icmp eq i32* %323, null
  br i1 %324, label %339, label %325

325:                                              ; preds = %318
  %326 = shl nuw nsw i32 %321, 7
  %327 = shl nuw nsw i32 %321, 15
  %328 = getelementptr i8, i8* %74, i32 1
  %329 = load i8, i8* %328, align 1
  %330 = zext i8 %329 to i32
  %331 = shl nuw nsw i32 %330, 20
  %332 = or i32 %327, %326
  %333 = or i32 %332, %331
  %334 = or i32 %333, 28723
  %335 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %336 = load i32, i32* %335, align 4
  %337 = getelementptr i32, i32* %323, i32 %336
  store i32 %334, i32* %337, align 4
  %338 = load i32*, i32** %322, align 4
  br label %339

339:                                              ; preds = %318, %325
  %340 = phi i32* [ null, %318 ], [ %338, %325 ]
  %341 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %342 = load i32, i32* %341, align 4
  %343 = add i32 %342, 1
  store i32 %343, i32* %341, align 4
  %344 = load i8, i8* %39, align 1
  %345 = zext i8 %344 to i32
  %346 = icmp eq i32* %340, null
  br i1 %346, label %1086, label %347

347:                                              ; preds = %339
  %348 = shl nuw nsw i32 %345, 7
  %349 = shl nuw nsw i32 %345, 15
  %350 = load i8, i8* %74, align 1
  %351 = zext i8 %350 to i32
  %352 = shl nuw nsw i32 %351, 20
  %353 = or i32 %349, %348
  %354 = or i32 %353, %352
  %355 = or i32 %354, 28723
  %356 = getelementptr i32, i32* %340, i32 %343
  store i32 %355, i32* %356, align 4
  %357 = load i32, i32* %341, align 4
  br label %1086

358:                                              ; preds = %73
  %359 = getelementptr i8, i8* %39, i32 1
  %360 = load i8, i8* %359, align 1
  %361 = zext i8 %360 to i32
  %362 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %363 = load i32*, i32** %362, align 4
  %364 = icmp eq i32* %363, null
  br i1 %364, label %379, label %365

365:                                              ; preds = %358
  %366 = shl nuw nsw i32 %361, 7
  %367 = shl nuw nsw i32 %361, 15
  %368 = getelementptr i8, i8* %74, i32 1
  %369 = load i8, i8* %368, align 1
  %370 = zext i8 %369 to i32
  %371 = shl nuw nsw i32 %370, 20
  %372 = or i32 %367, %366
  %373 = or i32 %372, %371
  %374 = or i32 %373, 24627
  %375 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %376 = load i32, i32* %375, align 4
  %377 = getelementptr i32, i32* %363, i32 %376
  store i32 %374, i32* %377, align 4
  %378 = load i32*, i32** %362, align 4
  br label %379

379:                                              ; preds = %358, %365
  %380 = phi i32* [ null, %358 ], [ %378, %365 ]
  %381 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %382 = load i32, i32* %381, align 4
  %383 = add i32 %382, 1
  store i32 %383, i32* %381, align 4
  %384 = load i8, i8* %39, align 1
  %385 = zext i8 %384 to i32
  %386 = icmp eq i32* %380, null
  br i1 %386, label %1086, label %387

387:                                              ; preds = %379
  %388 = shl nuw nsw i32 %385, 7
  %389 = shl nuw nsw i32 %385, 15
  %390 = load i8, i8* %74, align 1
  %391 = zext i8 %390 to i32
  %392 = shl nuw nsw i32 %391, 20
  %393 = or i32 %389, %388
  %394 = or i32 %393, %392
  %395 = or i32 %394, 24627
  %396 = getelementptr i32, i32* %380, i32 %383
  store i32 %395, i32* %396, align 4
  %397 = load i32, i32* %381, align 4
  br label %1086

398:                                              ; preds = %73
  %399 = getelementptr i8, i8* %39, i32 1
  %400 = load i8, i8* %399, align 1
  %401 = zext i8 %400 to i32
  %402 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %403 = load i32*, i32** %402, align 4
  %404 = icmp eq i32* %403, null
  br i1 %404, label %419, label %405

405:                                              ; preds = %398
  %406 = shl nuw nsw i32 %401, 7
  %407 = shl nuw nsw i32 %401, 15
  %408 = getelementptr i8, i8* %74, i32 1
  %409 = load i8, i8* %408, align 1
  %410 = zext i8 %409 to i32
  %411 = shl nuw nsw i32 %410, 20
  %412 = or i32 %407, %406
  %413 = or i32 %412, %411
  %414 = or i32 %413, 16435
  %415 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %416 = load i32, i32* %415, align 4
  %417 = getelementptr i32, i32* %403, i32 %416
  store i32 %414, i32* %417, align 4
  %418 = load i32*, i32** %402, align 4
  br label %419

419:                                              ; preds = %398, %405
  %420 = phi i32* [ null, %398 ], [ %418, %405 ]
  %421 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %422 = load i32, i32* %421, align 4
  %423 = add i32 %422, 1
  store i32 %423, i32* %421, align 4
  %424 = load i8, i8* %39, align 1
  %425 = zext i8 %424 to i32
  %426 = icmp eq i32* %420, null
  br i1 %426, label %1086, label %427

427:                                              ; preds = %419
  %428 = shl nuw nsw i32 %425, 7
  %429 = shl nuw nsw i32 %425, 15
  %430 = load i8, i8* %74, align 1
  %431 = zext i8 %430 to i32
  %432 = shl nuw nsw i32 %431, 20
  %433 = or i32 %429, %428
  %434 = or i32 %433, %432
  %435 = or i32 %434, 16435
  %436 = getelementptr i32, i32* %420, i32 %423
  store i32 %435, i32* %436, align 4
  %437 = load i32, i32* %421, align 4
  br label %1086

438:                                              ; preds = %73
  %439 = getelementptr i8, i8* %39, i32 1
  %440 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %441 = load i32*, i32** %440, align 4
  %442 = icmp eq i32* %441, null
  br i1 %442, label %456, label %443

443:                                              ; preds = %438
  %444 = load i8, i8* %74, align 1
  %445 = zext i8 %444 to i32
  %446 = shl nuw nsw i32 %445, 15
  %447 = load i8, i8* %439, align 1
  %448 = zext i8 %447 to i32
  %449 = shl nuw nsw i32 %448, 20
  %450 = or i32 %446, %449
  %451 = or i32 %450, 33555123
  %452 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %453 = load i32, i32* %452, align 4
  %454 = getelementptr i32, i32* %441, i32 %453
  store i32 %451, i32* %454, align 4
  %455 = load i32*, i32** %440, align 4
  br label %456

456:                                              ; preds = %438, %443
  %457 = phi i32* [ null, %438 ], [ %455, %443 ]
  %458 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %459 = load i32, i32* %458, align 4
  %460 = add i32 %459, 1
  store i32 %460, i32* %458, align 4
  %461 = load i8, i8* %39, align 1
  %462 = getelementptr i8, i8* %74, i32 1
  %463 = zext i8 %461 to i32
  %464 = icmp eq i32* %457, null
  br i1 %464, label %465, label %467

465:                                              ; preds = %456
  %466 = add i32 %459, 2
  store i32 %466, i32* %458, align 4
  br label %481

467:                                              ; preds = %456
  %468 = shl nuw nsw i32 %463, 7
  %469 = shl nuw nsw i32 %463, 15
  %470 = load i8, i8* %462, align 1
  %471 = zext i8 %470 to i32
  %472 = shl nuw nsw i32 %471, 20
  %473 = or i32 %469, %468
  %474 = or i32 %473, %472
  %475 = or i32 %474, 33554483
  %476 = getelementptr i32, i32* %457, i32 %460
  store i32 %475, i32* %476, align 4
  %477 = load i32, i32* %458, align 4
  %478 = load i32*, i32** %440, align 4
  %479 = add i32 %477, 1
  store i32 %479, i32* %458, align 4
  %480 = icmp eq i32* %478, null
  br i1 %480, label %481, label %484

481:                                              ; preds = %467, %465
  %482 = phi i32 [ %466, %465 ], [ %479, %467 ]
  %483 = add i32 %482, 1
  store i32 %483, i32* %458, align 4
  br label %500

484:                                              ; preds = %467
  %485 = load i8, i8* %439, align 1
  %486 = zext i8 %485 to i32
  %487 = shl nuw nsw i32 %486, 15
  %488 = load i8, i8* %462, align 1
  %489 = zext i8 %488 to i32
  %490 = shl nuw nsw i32 %489, 20
  %491 = or i32 %487, %490
  %492 = or i32 %491, 33567539
  %493 = getelementptr i32, i32* %478, i32 %479
  store i32 %492, i32* %493, align 4
  %494 = load i32, i32* %458, align 4
  %495 = load i32*, i32** %440, align 4
  %496 = add i32 %494, 1
  store i32 %496, i32* %458, align 4
  %497 = load i8, i8* %39, align 1
  %498 = zext i8 %497 to i32
  %499 = icmp eq i32* %495, null
  br i1 %499, label %500, label %503

500:                                              ; preds = %484, %481
  %501 = phi i32 [ %483, %481 ], [ %496, %484 ]
  %502 = add i32 %501, 1
  store i32 %502, i32* %458, align 4
  br label %515

503:                                              ; preds = %484
  %504 = shl nuw nsw i32 %498, 7
  %505 = shl nuw nsw i32 %498, 15
  %506 = or i32 %505, %504
  %507 = or i32 %506, 5242931
  %508 = getelementptr i32, i32* %495, i32 %496
  store i32 %507, i32* %508, align 4
  %509 = load i32, i32* %458, align 4
  %510 = load i32*, i32** %440, align 4
  %511 = add i32 %509, 1
  store i32 %511, i32* %458, align 4
  %512 = load i8, i8* %439, align 1
  %513 = zext i8 %512 to i32
  %514 = icmp eq i32* %510, null
  br i1 %514, label %515, label %518

515:                                              ; preds = %503, %500
  %516 = phi i32 [ %502, %500 ], [ %511, %503 ]
  %517 = add i32 %516, 1
  store i32 %517, i32* %458, align 4
  br label %1086

518:                                              ; preds = %503
  %519 = shl nuw nsw i32 %513, 7
  %520 = shl nuw nsw i32 %513, 15
  %521 = load i8, i8* %462, align 1
  %522 = zext i8 %521 to i32
  %523 = shl nuw nsw i32 %522, 20
  %524 = or i32 %520, %519
  %525 = or i32 %524, %523
  %526 = or i32 %525, 33554483
  %527 = getelementptr i32, i32* %510, i32 %511
  store i32 %526, i32* %527, align 4
  %528 = load i32, i32* %458, align 4
  %529 = load i32*, i32** %440, align 4
  %530 = add i32 %528, 1
  store i32 %530, i32* %458, align 4
  %531 = load i8, i8* %39, align 1
  %532 = zext i8 %531 to i32
  %533 = icmp eq i32* %529, null
  br i1 %533, label %1086, label %534

534:                                              ; preds = %518
  %535 = shl nuw nsw i32 %532, 7
  %536 = shl nuw nsw i32 %532, 15
  %537 = or i32 %536, %535
  %538 = or i32 %537, 6291507
  %539 = getelementptr i32, i32* %529, i32 %530
  store i32 %538, i32* %539, align 4
  %540 = load i32, i32* %458, align 4
  br label %1086

541:                                              ; preds = %73
  %542 = getelementptr i8, i8* %74, i32 1
  %543 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %544 = load i32*, i32** %543, align 4
  %545 = icmp eq i32* %544, null
  %546 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %547 = load i32, i32* %546, align 4
  br i1 %545, label %548, label %550

548:                                              ; preds = %541
  %549 = add i32 %547, 1
  store i32 %549, i32* %546, align 4
  br label %560

550:                                              ; preds = %541
  %551 = load i8, i8* %542, align 1
  %552 = zext i8 %551 to i32
  %553 = shl nuw nsw i32 %552, 15
  %554 = or i32 %553, -33553773
  %555 = getelementptr i32, i32* %544, i32 %547
  store i32 %554, i32* %555, align 4
  %556 = load i32*, i32** %543, align 4
  %557 = load i32, i32* %546, align 4
  %558 = add i32 %557, 1
  store i32 %558, i32* %546, align 4
  %559 = icmp eq i32* %556, null
  br i1 %559, label %560, label %563

560:                                              ; preds = %548, %550
  %561 = phi i32 [ %558, %550 ], [ %549, %548 ]
  %562 = add i32 %561, 1
  store i32 %562, i32* %546, align 4
  br label %570

563:                                              ; preds = %550
  %564 = getelementptr i32, i32* %556, i32 %558
  store i32 182371, i32* %564, align 4
  %565 = load i32, i32* %546, align 4
  %566 = load i32*, i32** %543, align 4
  %567 = add i32 %565, 1
  store i32 %567, i32* %546, align 4
  %568 = getelementptr i8, i8* %39, i32 1
  %569 = icmp eq i32* %566, null
  br i1 %569, label %570, label %573

570:                                              ; preds = %563, %560
  %571 = phi i32 [ %562, %560 ], [ %567, %563 ]
  %572 = add i32 %571, 1
  store i32 %572, i32* %546, align 4
  br label %587

573:                                              ; preds = %563
  %574 = load i8, i8* %39, align 1
  %575 = zext i8 %574 to i32
  %576 = shl nuw nsw i32 %575, 7
  %577 = load i8, i8* %568, align 1
  %578 = zext i8 %577 to i32
  %579 = shl nuw nsw i32 %578, 15
  %580 = or i32 %576, %579
  %581 = or i32 %580, 5247027
  %582 = getelementptr i32, i32* %566, i32 %567
  store i32 %581, i32* %582, align 4
  %583 = load i32, i32* %546, align 4
  %584 = load i32*, i32** %543, align 4
  %585 = add i32 %583, 1
  store i32 %585, i32* %546, align 4
  %586 = icmp eq i32* %584, null
  br i1 %586, label %587, label %590

587:                                              ; preds = %573, %570
  %588 = phi i32 [ %571, %570 ], [ %583, %573 ]
  %589 = add i32 %588, 3
  br label %608

590:                                              ; preds = %573
  %591 = load i8, i8* %568, align 1
  %592 = zext i8 %591 to i32
  %593 = shl nuw nsw i32 %592, 7
  %594 = or i32 %593, 19
  %595 = getelementptr i32, i32* %584, i32 %585
  store i32 %594, i32* %595, align 4
  %596 = load i32*, i32** %543, align 4
  %597 = load i32, i32* %546, align 4
  %598 = add i32 %597, 1
  store i32 %598, i32* %546, align 4
  %599 = icmp eq i32* %596, null
  br i1 %599, label %600, label %602

600:                                              ; preds = %590
  %601 = add i32 %597, 2
  br label %608

602:                                              ; preds = %590
  %603 = getelementptr i32, i32* %596, i32 %598
  store i32 33554543, i32* %603, align 4
  %604 = load i32*, i32** %543, align 4
  %605 = load i32, i32* %546, align 4
  %606 = add i32 %605, 1
  store i32 %606, i32* %546, align 4
  %607 = icmp eq i32* %604, null
  br i1 %607, label %610, label %613

608:                                              ; preds = %587, %600
  %609 = phi i32 [ %601, %600 ], [ %589, %587 ]
  store i32 %609, i32* %546, align 4
  br label %610

610:                                              ; preds = %608, %602
  %611 = phi i32 [ %606, %602 ], [ %609, %608 ]
  %612 = add i32 %611, 1
  store i32 %612, i32* %546, align 4
  br label %619

613:                                              ; preds = %602
  %614 = getelementptr i32, i32* %604, i32 %606
  store i32 32506643, i32* %614, align 4
  %615 = load i32, i32* %546, align 4
  %616 = load i32*, i32** %543, align 4
  %617 = add i32 %615, 1
  store i32 %617, i32* %546, align 4
  %618 = icmp eq i32* %616, null
  br i1 %618, label %619, label %622

619:                                              ; preds = %613, %610
  %620 = phi i32 [ %612, %610 ], [ %617, %613 ]
  %621 = add i32 %620, 1
  store i32 %621, i32* %546, align 4
  br label %632

622:                                              ; preds = %613
  %623 = load i8, i8* %568, align 1
  %624 = zext i8 %623 to i32
  %625 = shl nuw nsw i32 %624, 15
  %626 = or i32 %625, 1069715
  %627 = getelementptr i32, i32* %616, i32 %617
  store i32 %626, i32* %627, align 4
  %628 = load i32, i32* %546, align 4
  %629 = load i32*, i32** %543, align 4
  %630 = add i32 %628, 1
  store i32 %630, i32* %546, align 4
  %631 = icmp eq i32* %629, null
  br i1 %631, label %632, label %635

632:                                              ; preds = %619, %622
  %633 = phi i32 [ %620, %619 ], [ %628, %622 ]
  %634 = add i32 %633, 2
  store i32 %634, i32* %546, align 4
  br label %645

635:                                              ; preds = %622
  %636 = load i8, i8* %542, align 1
  %637 = zext i8 %636 to i32
  %638 = shl nuw nsw i32 %637, 20
  %639 = or i32 %638, 1073939251
  %640 = getelementptr i32, i32* %629, i32 %630
  store i32 %639, i32* %640, align 4
  %641 = load i32*, i32** %543, align 4
  %642 = load i32, i32* %546, align 4
  %643 = add i32 %642, 1
  store i32 %643, i32* %546, align 4
  %644 = icmp eq i32* %641, null
  br i1 %644, label %645, label %648

645:                                              ; preds = %632, %635
  %646 = phi i32 [ %643, %635 ], [ %634, %632 ]
  %647 = add i32 %646, 1
  store i32 %647, i32* %546, align 4
  br label %656

648:                                              ; preds = %635
  %649 = getelementptr i32, i32* %641, i32 %643
  store i32 6476467, i32* %649, align 4
  %650 = load i32, i32* %546, align 4
  %651 = load i32*, i32** %543, align 4
  %652 = add i32 %650, 1
  store i32 %652, i32* %546, align 4
  %653 = load i8, i8* %39, align 1
  %654 = zext i8 %653 to i32
  %655 = icmp eq i32* %651, null
  br i1 %655, label %656, label %659

656:                                              ; preds = %648, %645
  %657 = phi i32 [ %647, %645 ], [ %652, %648 ]
  %658 = add i32 %657, 1
  store i32 %658, i32* %546, align 4
  br label %675

659:                                              ; preds = %648
  %660 = shl nuw nsw i32 %654, 7
  %661 = shl nuw nsw i32 %654, 15
  %662 = load i8, i8* %542, align 1
  %663 = zext i8 %662 to i32
  %664 = shl nuw nsw i32 %663, 20
  %665 = or i32 %661, %660
  %666 = or i32 %665, %664
  %667 = or i32 %666, 4147
  %668 = getelementptr i32, i32* %651, i32 %652
  store i32 %667, i32* %668, align 4
  %669 = load i32, i32* %546, align 4
  %670 = load i32*, i32** %543, align 4
  %671 = add i32 %669, 1
  store i32 %671, i32* %546, align 4
  %672 = load i8, i8* %39, align 1
  %673 = zext i8 %672 to i32
  %674 = icmp eq i32* %670, null
  br i1 %674, label %675, label %678

675:                                              ; preds = %659, %656
  %676 = phi i32 [ %658, %656 ], [ %671, %659 ]
  %677 = add i32 %676, 1
  store i32 %677, i32* %546, align 4
  br label %1086

678:                                              ; preds = %659
  %679 = shl nuw nsw i32 %673, 7
  %680 = shl nuw nsw i32 %673, 20
  %681 = or i32 %680, %679
  %682 = or i32 %681, 188467
  %683 = getelementptr i32, i32* %670, i32 %671
  store i32 %682, i32* %683, align 4
  %684 = load i32, i32* %546, align 4
  %685 = load i32*, i32** %543, align 4
  %686 = add i32 %684, 1
  store i32 %686, i32* %546, align 4
  %687 = load i8, i8* %568, align 1
  %688 = zext i8 %687 to i32
  %689 = icmp eq i32* %685, null
  br i1 %689, label %1086, label %690

690:                                              ; preds = %678
  %691 = shl nuw nsw i32 %688, 7
  %692 = shl nuw nsw i32 %688, 15
  %693 = load i8, i8* %542, align 1
  %694 = zext i8 %693 to i32
  %695 = shl nuw nsw i32 %694, 20
  %696 = or i32 %692, %691
  %697 = or i32 %696, %695
  %698 = or i32 %697, 4147
  %699 = getelementptr i32, i32* %685, i32 %686
  store i32 %698, i32* %699, align 4
  %700 = load i32, i32* %546, align 4
  br label %1086

701:                                              ; preds = %73
  %702 = getelementptr i8, i8* %74, i32 1
  %703 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %704 = load i32*, i32** %703, align 4
  %705 = icmp eq i32* %704, null
  %706 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %707 = load i32, i32* %706, align 4
  br i1 %705, label %708, label %710

708:                                              ; preds = %701
  %709 = add i32 %707, 1
  store i32 %709, i32* %706, align 4
  br label %720

710:                                              ; preds = %701
  %711 = load i8, i8* %702, align 1
  %712 = zext i8 %711 to i32
  %713 = shl nuw nsw i32 %712, 15
  %714 = or i32 %713, -33553773
  %715 = getelementptr i32, i32* %704, i32 %707
  store i32 %714, i32* %715, align 4
  %716 = load i32*, i32** %703, align 4
  %717 = load i32, i32* %706, align 4
  %718 = add i32 %717, 1
  store i32 %718, i32* %706, align 4
  %719 = icmp eq i32* %716, null
  br i1 %719, label %720, label %723

720:                                              ; preds = %708, %710
  %721 = phi i32 [ %718, %710 ], [ %709, %708 ]
  %722 = add i32 %721, 1
  store i32 %722, i32* %706, align 4
  br label %730

723:                                              ; preds = %710
  %724 = getelementptr i32, i32* %716, i32 %718
  store i32 182371, i32* %724, align 4
  %725 = load i32, i32* %706, align 4
  %726 = load i32*, i32** %703, align 4
  %727 = add i32 %725, 1
  store i32 %727, i32* %706, align 4
  %728 = getelementptr i8, i8* %39, i32 1
  %729 = icmp eq i32* %726, null
  br i1 %729, label %730, label %733

730:                                              ; preds = %723, %720
  %731 = phi i32 [ %722, %720 ], [ %727, %723 ]
  %732 = add i32 %731, 1
  store i32 %732, i32* %706, align 4
  br label %747

733:                                              ; preds = %723
  %734 = load i8, i8* %728, align 1
  %735 = zext i8 %734 to i32
  %736 = shl nuw nsw i32 %735, 7
  %737 = load i8, i8* %39, align 1
  %738 = zext i8 %737 to i32
  %739 = shl nuw nsw i32 %738, 15
  %740 = or i32 %736, %739
  %741 = or i32 %740, 5263411
  %742 = getelementptr i32, i32* %726, i32 %727
  store i32 %741, i32* %742, align 4
  %743 = load i32, i32* %706, align 4
  %744 = load i32*, i32** %703, align 4
  %745 = add i32 %743, 1
  store i32 %745, i32* %706, align 4
  %746 = icmp eq i32* %744, null
  br i1 %746, label %747, label %750

747:                                              ; preds = %733, %730
  %748 = phi i32 [ %731, %730 ], [ %743, %733 ]
  %749 = add i32 %748, 3
  br label %768

750:                                              ; preds = %733
  %751 = load i8, i8* %39, align 1
  %752 = zext i8 %751 to i32
  %753 = shl nuw nsw i32 %752, 7
  %754 = or i32 %753, 19
  %755 = getelementptr i32, i32* %744, i32 %745
  store i32 %754, i32* %755, align 4
  %756 = load i32*, i32** %703, align 4
  %757 = load i32, i32* %706, align 4
  %758 = add i32 %757, 1
  store i32 %758, i32* %706, align 4
  %759 = icmp eq i32* %756, null
  br i1 %759, label %760, label %762

760:                                              ; preds = %750
  %761 = add i32 %757, 2
  br label %768

762:                                              ; preds = %750
  %763 = getelementptr i32, i32* %756, i32 %758
  store i32 33554543, i32* %763, align 4
  %764 = load i32*, i32** %703, align 4
  %765 = load i32, i32* %706, align 4
  %766 = add i32 %765, 1
  store i32 %766, i32* %706, align 4
  %767 = icmp eq i32* %764, null
  br i1 %767, label %770, label %773

768:                                              ; preds = %747, %760
  %769 = phi i32 [ %761, %760 ], [ %749, %747 ]
  store i32 %769, i32* %706, align 4
  br label %770

770:                                              ; preds = %768, %762
  %771 = phi i32 [ %766, %762 ], [ %769, %768 ]
  %772 = add i32 %771, 1
  store i32 %772, i32* %706, align 4
  br label %779

773:                                              ; preds = %762
  %774 = getelementptr i32, i32* %764, i32 %766
  store i32 32506643, i32* %774, align 4
  %775 = load i32, i32* %706, align 4
  %776 = load i32*, i32** %703, align 4
  %777 = add i32 %775, 1
  store i32 %777, i32* %706, align 4
  %778 = icmp eq i32* %776, null
  br i1 %778, label %779, label %782

779:                                              ; preds = %773, %770
  %780 = phi i32 [ %772, %770 ], [ %777, %773 ]
  %781 = add i32 %780, 1
  store i32 %781, i32* %706, align 4
  br label %792

782:                                              ; preds = %773
  %783 = load i8, i8* %39, align 1
  %784 = zext i8 %783 to i32
  %785 = shl nuw nsw i32 %784, 15
  %786 = or i32 %785, 1053331
  %787 = getelementptr i32, i32* %776, i32 %777
  store i32 %786, i32* %787, align 4
  %788 = load i32, i32* %706, align 4
  %789 = load i32*, i32** %703, align 4
  %790 = add i32 %788, 1
  store i32 %790, i32* %706, align 4
  %791 = icmp eq i32* %789, null
  br i1 %791, label %792, label %795

792:                                              ; preds = %779, %782
  %793 = phi i32 [ %780, %779 ], [ %788, %782 ]
  %794 = add i32 %793, 2
  store i32 %794, i32* %706, align 4
  br label %805

795:                                              ; preds = %782
  %796 = load i8, i8* %702, align 1
  %797 = zext i8 %796 to i32
  %798 = shl nuw nsw i32 %797, 20
  %799 = or i32 %798, 1073939251
  %800 = getelementptr i32, i32* %789, i32 %790
  store i32 %799, i32* %800, align 4
  %801 = load i32*, i32** %703, align 4
  %802 = load i32, i32* %706, align 4
  %803 = add i32 %802, 1
  store i32 %803, i32* %706, align 4
  %804 = icmp eq i32* %801, null
  br i1 %804, label %805, label %808

805:                                              ; preds = %792, %795
  %806 = phi i32 [ %803, %795 ], [ %794, %792 ]
  %807 = add i32 %806, 1
  store i32 %807, i32* %706, align 4
  br label %816

808:                                              ; preds = %795
  %809 = getelementptr i32, i32* %801, i32 %803
  store i32 6460083, i32* %809, align 4
  %810 = load i32, i32* %706, align 4
  %811 = load i32*, i32** %703, align 4
  %812 = add i32 %810, 1
  store i32 %812, i32* %706, align 4
  %813 = load i8, i8* %728, align 1
  %814 = zext i8 %813 to i32
  %815 = icmp eq i32* %811, null
  br i1 %815, label %816, label %819

816:                                              ; preds = %808, %805
  %817 = phi i32 [ %807, %805 ], [ %812, %808 ]
  %818 = add i32 %817, 1
  store i32 %818, i32* %706, align 4
  br label %835

819:                                              ; preds = %808
  %820 = shl nuw nsw i32 %814, 7
  %821 = shl nuw nsw i32 %814, 15
  %822 = load i8, i8* %702, align 1
  %823 = zext i8 %822 to i32
  %824 = shl nuw nsw i32 %823, 20
  %825 = or i32 %821, %820
  %826 = or i32 %825, %824
  %827 = or i32 %826, 20531
  %828 = getelementptr i32, i32* %811, i32 %812
  store i32 %827, i32* %828, align 4
  %829 = load i32, i32* %706, align 4
  %830 = load i32*, i32** %703, align 4
  %831 = add i32 %829, 1
  store i32 %831, i32* %706, align 4
  %832 = load i8, i8* %728, align 1
  %833 = zext i8 %832 to i32
  %834 = icmp eq i32* %830, null
  br i1 %834, label %835, label %838

835:                                              ; preds = %819, %816
  %836 = phi i32 [ %818, %816 ], [ %831, %819 ]
  %837 = add i32 %836, 1
  store i32 %837, i32* %706, align 4
  br label %1086

838:                                              ; preds = %819
  %839 = shl nuw nsw i32 %833, 7
  %840 = shl nuw nsw i32 %833, 20
  %841 = or i32 %840, %839
  %842 = or i32 %841, 188467
  %843 = getelementptr i32, i32* %830, i32 %831
  store i32 %842, i32* %843, align 4
  %844 = load i32, i32* %706, align 4
  %845 = load i32*, i32** %703, align 4
  %846 = add i32 %844, 1
  store i32 %846, i32* %706, align 4
  %847 = load i8, i8* %39, align 1
  %848 = zext i8 %847 to i32
  %849 = icmp eq i32* %845, null
  br i1 %849, label %1086, label %850

850:                                              ; preds = %838
  %851 = shl nuw nsw i32 %848, 7
  %852 = shl nuw nsw i32 %848, 15
  %853 = load i8, i8* %702, align 1
  %854 = zext i8 %853 to i32
  %855 = shl nuw nsw i32 %854, 20
  %856 = or i32 %852, %851
  %857 = or i32 %856, %855
  %858 = or i32 %857, 20531
  %859 = getelementptr i32, i32* %845, i32 %846
  store i32 %858, i32* %859, align 4
  %860 = load i32, i32* %706, align 4
  br label %1086

861:                                              ; preds = %73
  %862 = getelementptr i8, i8* %74, i32 1
  %863 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %864 = load i32*, i32** %863, align 4
  %865 = icmp eq i32* %864, null
  %866 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %867 = load i32, i32* %866, align 4
  br i1 %865, label %868, label %870

868:                                              ; preds = %861
  %869 = add i32 %867, 1
  store i32 %869, i32* %866, align 4
  br label %880

870:                                              ; preds = %861
  %871 = load i8, i8* %862, align 1
  %872 = zext i8 %871 to i32
  %873 = shl nuw nsw i32 %872, 15
  %874 = or i32 %873, -33553773
  %875 = getelementptr i32, i32* %864, i32 %867
  store i32 %874, i32* %875, align 4
  %876 = load i32*, i32** %863, align 4
  %877 = load i32, i32* %866, align 4
  %878 = add i32 %877, 1
  store i32 %878, i32* %866, align 4
  %879 = icmp eq i32* %876, null
  br i1 %879, label %880, label %883

880:                                              ; preds = %868, %870
  %881 = phi i32 [ %878, %870 ], [ %869, %868 ]
  %882 = add i32 %881, 1
  store i32 %882, i32* %866, align 4
  br label %890

883:                                              ; preds = %870
  %884 = getelementptr i32, i32* %876, i32 %878
  store i32 182371, i32* %884, align 4
  %885 = load i32, i32* %866, align 4
  %886 = load i32*, i32** %863, align 4
  %887 = add i32 %885, 1
  store i32 %887, i32* %866, align 4
  %888 = getelementptr i8, i8* %39, i32 1
  %889 = icmp eq i32* %886, null
  br i1 %889, label %890, label %893

890:                                              ; preds = %883, %880
  %891 = phi i32 [ %882, %880 ], [ %887, %883 ]
  %892 = add i32 %891, 1
  store i32 %892, i32* %866, align 4
  br label %909

893:                                              ; preds = %883
  %894 = load i8, i8* %888, align 1
  %895 = zext i8 %894 to i32
  %896 = shl nuw nsw i32 %895, 7
  %897 = load i8, i8* %39, align 1
  %898 = zext i8 %897 to i32
  %899 = shl nuw nsw i32 %898, 15
  %900 = or i32 %896, %899
  %901 = or i32 %900, 1079005235
  %902 = getelementptr i32, i32* %886, i32 %887
  store i32 %901, i32* %902, align 4
  %903 = load i32, i32* %866, align 4
  %904 = load i32*, i32** %863, align 4
  %905 = add i32 %903, 1
  store i32 %905, i32* %866, align 4
  %906 = load i8, i8* %39, align 1
  %907 = zext i8 %906 to i32
  %908 = icmp eq i32* %904, null
  br i1 %908, label %909, label %912

909:                                              ; preds = %893, %890
  %910 = phi i32 [ %891, %890 ], [ %903, %893 ]
  %911 = add i32 %910, 3
  br label %930

912:                                              ; preds = %893
  %913 = shl nuw nsw i32 %907, 7
  %914 = shl nuw nsw i32 %907, 15
  %915 = or i32 %914, %913
  %916 = or i32 %915, 1106268179
  %917 = getelementptr i32, i32* %904, i32 %905
  store i32 %916, i32* %917, align 4
  %918 = load i32*, i32** %863, align 4
  %919 = load i32, i32* %866, align 4
  %920 = add i32 %919, 1
  store i32 %920, i32* %866, align 4
  %921 = icmp eq i32* %918, null
  br i1 %921, label %922, label %924

922:                                              ; preds = %912
  %923 = add i32 %919, 2
  br label %930

924:                                              ; preds = %912
  %925 = getelementptr i32, i32* %918, i32 %920
  store i32 33554543, i32* %925, align 4
  %926 = load i32*, i32** %863, align 4
  %927 = load i32, i32* %866, align 4
  %928 = add i32 %927, 1
  store i32 %928, i32* %866, align 4
  %929 = icmp eq i32* %926, null
  br i1 %929, label %932, label %935

930:                                              ; preds = %909, %922
  %931 = phi i32 [ %923, %922 ], [ %911, %909 ]
  store i32 %931, i32* %866, align 4
  br label %932

932:                                              ; preds = %930, %924
  %933 = phi i32 [ %928, %924 ], [ %931, %930 ]
  %934 = add i32 %933, 1
  store i32 %934, i32* %866, align 4
  br label %941

935:                                              ; preds = %924
  %936 = getelementptr i32, i32* %926, i32 %928
  store i32 32506643, i32* %936, align 4
  %937 = load i32, i32* %866, align 4
  %938 = load i32*, i32** %863, align 4
  %939 = add i32 %937, 1
  store i32 %939, i32* %866, align 4
  %940 = icmp eq i32* %938, null
  br i1 %940, label %941, label %944

941:                                              ; preds = %935, %932
  %942 = phi i32 [ %934, %932 ], [ %939, %935 ]
  %943 = add i32 %942, 1
  store i32 %943, i32* %866, align 4
  br label %954

944:                                              ; preds = %935
  %945 = load i8, i8* %39, align 1
  %946 = zext i8 %945 to i32
  %947 = shl nuw nsw i32 %946, 15
  %948 = or i32 %947, 1053331
  %949 = getelementptr i32, i32* %938, i32 %939
  store i32 %948, i32* %949, align 4
  %950 = load i32, i32* %866, align 4
  %951 = load i32*, i32** %863, align 4
  %952 = add i32 %950, 1
  store i32 %952, i32* %866, align 4
  %953 = icmp eq i32* %951, null
  br i1 %953, label %954, label %957

954:                                              ; preds = %941, %944
  %955 = phi i32 [ %942, %941 ], [ %950, %944 ]
  %956 = add i32 %955, 2
  store i32 %956, i32* %866, align 4
  br label %967

957:                                              ; preds = %944
  %958 = load i8, i8* %862, align 1
  %959 = zext i8 %958 to i32
  %960 = shl nuw nsw i32 %959, 20
  %961 = or i32 %960, 1073939251
  %962 = getelementptr i32, i32* %951, i32 %952
  store i32 %961, i32* %962, align 4
  %963 = load i32*, i32** %863, align 4
  %964 = load i32, i32* %866, align 4
  %965 = add i32 %964, 1
  store i32 %965, i32* %866, align 4
  %966 = icmp eq i32* %963, null
  br i1 %966, label %967, label %970

967:                                              ; preds = %954, %957
  %968 = phi i32 [ %965, %957 ], [ %956, %954 ]
  %969 = add i32 %968, 1
  store i32 %969, i32* %866, align 4
  br label %978

970:                                              ; preds = %957
  %971 = getelementptr i32, i32* %963, i32 %965
  store i32 6460083, i32* %971, align 4
  %972 = load i32, i32* %866, align 4
  %973 = load i32*, i32** %863, align 4
  %974 = add i32 %972, 1
  store i32 %974, i32* %866, align 4
  %975 = load i8, i8* %888, align 1
  %976 = zext i8 %975 to i32
  %977 = icmp eq i32* %973, null
  br i1 %977, label %978, label %981

978:                                              ; preds = %970, %967
  %979 = phi i32 [ %969, %967 ], [ %974, %970 ]
  %980 = add i32 %979, 1
  store i32 %980, i32* %866, align 4
  br label %997

981:                                              ; preds = %970
  %982 = shl nuw nsw i32 %976, 7
  %983 = shl nuw nsw i32 %976, 15
  %984 = load i8, i8* %862, align 1
  %985 = zext i8 %984 to i32
  %986 = shl nuw nsw i32 %985, 20
  %987 = or i32 %983, %982
  %988 = or i32 %987, %986
  %989 = or i32 %988, 20531
  %990 = getelementptr i32, i32* %973, i32 %974
  store i32 %989, i32* %990, align 4
  %991 = load i32, i32* %866, align 4
  %992 = load i32*, i32** %863, align 4
  %993 = add i32 %991, 1
  store i32 %993, i32* %866, align 4
  %994 = load i8, i8* %888, align 1
  %995 = zext i8 %994 to i32
  %996 = icmp eq i32* %992, null
  br i1 %996, label %997, label %1000

997:                                              ; preds = %981, %978
  %998 = phi i32 [ %980, %978 ], [ %993, %981 ]
  %999 = add i32 %998, 1
  store i32 %999, i32* %866, align 4
  br label %1086

1000:                                             ; preds = %981
  %1001 = shl nuw nsw i32 %995, 7
  %1002 = shl nuw nsw i32 %995, 20
  %1003 = or i32 %1002, %1001
  %1004 = or i32 %1003, 188467
  %1005 = getelementptr i32, i32* %992, i32 %993
  store i32 %1004, i32* %1005, align 4
  %1006 = load i32, i32* %866, align 4
  %1007 = load i32*, i32** %863, align 4
  %1008 = add i32 %1006, 1
  store i32 %1008, i32* %866, align 4
  %1009 = load i8, i8* %39, align 1
  %1010 = zext i8 %1009 to i32
  %1011 = icmp eq i32* %1007, null
  br i1 %1011, label %1086, label %1012

1012:                                             ; preds = %1000
  %1013 = shl nuw nsw i32 %1010, 7
  %1014 = shl nuw nsw i32 %1010, 15
  %1015 = load i8, i8* %862, align 1
  %1016 = zext i8 %1015 to i32
  %1017 = shl nuw nsw i32 %1016, 20
  %1018 = or i32 %1014, %1013
  %1019 = or i32 %1018, %1017
  %1020 = or i32 %1019, 1073762355
  %1021 = getelementptr i32, i32* %1007, i32 %1008
  store i32 %1020, i32* %1021, align 4
  %1022 = load i32, i32* %866, align 4
  br label %1086

1023:                                             ; preds = %73
  %1024 = getelementptr i8, i8* %39, i32 1
  %1025 = load i8, i8* %1024, align 1
  %1026 = zext i8 %1025 to i32
  %1027 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %1028 = load i32*, i32** %1027, align 4
  %1029 = icmp eq i32* %1028, null
  br i1 %1029, label %1030, label %1034

1030:                                             ; preds = %1023
  %1031 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %1032 = load i32, i32* %1031, align 4
  %1033 = add i32 %1032, 1
  store i32 %1033, i32* %1031, align 4
  br label %1047

1034:                                             ; preds = %1023
  %1035 = shl nuw nsw i32 %1026, 7
  %1036 = shl nuw nsw i32 %1026, 20
  %1037 = or i32 %1036, %1035
  %1038 = or i32 %1037, 1073741875
  %1039 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %1040 = load i32, i32* %1039, align 4
  %1041 = getelementptr i32, i32* %1028, i32 %1040
  store i32 %1038, i32* %1041, align 4
  %1042 = load i32*, i32** %1027, align 4
  %1043 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %1044 = load i32, i32* %1043, align 4
  %1045 = add i32 %1044, 1
  store i32 %1045, i32* %1043, align 4
  %1046 = icmp eq i32* %1042, null
  br i1 %1046, label %1047, label %1051

1047:                                             ; preds = %1034, %1030
  %1048 = phi i32* [ %1031, %1030 ], [ %1043, %1034 ]
  %1049 = phi i32 [ %1033, %1030 ], [ %1045, %1034 ]
  %1050 = add i32 %1049, 1
  store i32 %1050, i32* %1048, align 4
  br label %1063

1051:                                             ; preds = %1034
  %1052 = load i8, i8* %1024, align 1
  %1053 = zext i8 %1052 to i32
  %1054 = shl nuw nsw i32 %1053, 20
  %1055 = or i32 %1054, 12979
  %1056 = getelementptr i32, i32* %1042, i32 %1045
  store i32 %1055, i32* %1056, align 4
  %1057 = load i32, i32* %1043, align 4
  %1058 = load i32*, i32** %1027, align 4
  %1059 = add i32 %1057, 1
  store i32 %1059, i32* %1043, align 4
  %1060 = load i8, i8* %39, align 1
  %1061 = zext i8 %1060 to i32
  %1062 = icmp eq i32* %1058, null
  br i1 %1062, label %1063, label %1067

1063:                                             ; preds = %1051, %1047
  %1064 = phi i32* [ %1048, %1047 ], [ %1043, %1051 ]
  %1065 = phi i32 [ %1050, %1047 ], [ %1059, %1051 ]
  %1066 = add i32 %1065, 1
  store i32 %1066, i32* %1064, align 4
  br label %1086

1067:                                             ; preds = %1051
  %1068 = shl nuw nsw i32 %1061, 7
  %1069 = shl nuw nsw i32 %1061, 20
  %1070 = or i32 %1069, %1068
  %1071 = or i32 %1070, 1073741875
  %1072 = getelementptr i32, i32* %1058, i32 %1059
  store i32 %1071, i32* %1072, align 4
  %1073 = load i32, i32* %1043, align 4
  %1074 = load i32*, i32** %1027, align 4
  %1075 = add i32 %1073, 1
  store i32 %1075, i32* %1043, align 4
  %1076 = load i8, i8* %39, align 1
  %1077 = zext i8 %1076 to i32
  %1078 = icmp eq i32* %1074, null
  br i1 %1078, label %1086, label %1079

1079:                                             ; preds = %1067
  %1080 = shl nuw nsw i32 %1077, 7
  %1081 = shl nuw nsw i32 %1077, 15
  %1082 = or i32 %1081, %1080
  %1083 = or i32 %1082, 1078984755
  %1084 = getelementptr i32, i32* %1074, i32 %1075
  store i32 %1083, i32* %1084, align 4
  %1085 = load i32, i32* %1043, align 4
  br label %1086

1086:                                             ; preds = %1079, %1067, %1063, %1012, %1000, %997, %850, %838, %835, %690, %678, %675, %534, %518, %515, %427, %419, %387, %379, %347, %339, %307, %295, %292, %244, %228, %224, %170, %158, %155, %106, %87, %83
  %1087 = phi i32 [ %104, %87 ], [ %116, %106 ], [ %86, %83 ], [ %166, %158 ], [ %176, %170 ], [ %157, %155 ], [ %240, %228 ], [ %250, %244 ], [ %227, %224 ], [ %303, %295 ], [ %317, %307 ], [ %294, %292 ], [ %343, %339 ], [ %357, %347 ], [ %383, %379 ], [ %397, %387 ], [ %423, %419 ], [ %437, %427 ], [ %530, %518 ], [ %540, %534 ], [ %517, %515 ], [ %686, %678 ], [ %700, %690 ], [ %677, %675 ], [ %846, %838 ], [ %860, %850 ], [ %837, %835 ], [ %1008, %1000 ], [ %1022, %1012 ], [ %999, %997 ], [ %1075, %1067 ], [ %1085, %1079 ], [ %1066, %1063 ]
  %1088 = phi i32* [ %102, %87 ], [ %102, %106 ], [ %84, %83 ], [ %135, %158 ], [ %135, %170 ], [ %135, %155 ], [ %200, %228 ], [ %200, %244 ], [ %225, %224 ], [ %270, %295 ], [ %270, %307 ], [ %270, %292 ], [ %341, %339 ], [ %341, %347 ], [ %381, %379 ], [ %381, %387 ], [ %421, %419 ], [ %421, %427 ], [ %458, %518 ], [ %458, %534 ], [ %458, %515 ], [ %546, %678 ], [ %546, %690 ], [ %546, %675 ], [ %706, %838 ], [ %706, %850 ], [ %706, %835 ], [ %866, %1000 ], [ %866, %1012 ], [ %866, %997 ], [ %1043, %1067 ], [ %1043, %1079 ], [ %1064, %1063 ]
  %1089 = add i32 %1087, 1
  store i32 %1089, i32* %1088, align 4
  br label %1090

1090:                                             ; preds = %1086, %73
  %1091 = load i8, i8* %0, align 1
  %1092 = icmp slt i8 %1091, 0
  br i1 %1092, label %1093, label %1143

1093:                                             ; preds = %1090
  %1094 = sext i8 %1091 to i16
  %1095 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %1096 = load i32*, i32** %1095, align 4
  %1097 = icmp eq i32* %1096, null
  br i1 %1097, label %1115, label %1098

1098:                                             ; preds = %1093
  %1099 = lshr i16 %1094, 5
  %1100 = zext i16 %1099 to i32
  %1101 = shl i32 %1100, 25
  %1102 = load i8, i8* %39, align 1
  %1103 = zext i8 %1102 to i32
  %1104 = shl nuw nsw i32 %1103, 20
  %1105 = shl nsw i16 %1094, 7
  %1106 = and i16 %1105, 3968
  %1107 = zext i16 %1106 to i32
  %1108 = or i32 %1101, %1107
  %1109 = or i32 %1108, %1104
  %1110 = or i32 %1109, 270371
  %1111 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %1112 = load i32, i32* %1111, align 4
  %1113 = getelementptr i32, i32* %1096, i32 %1112
  store i32 %1110, i32* %1113, align 4
  %1114 = load i32*, i32** %1095, align 4
  br label %1115

1115:                                             ; preds = %1098, %1093
  %1116 = phi i32* [ null, %1093 ], [ %1114, %1098 ]
  %1117 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %1118 = load i32, i32* %1117, align 4
  %1119 = add i32 %1118, 1
  store i32 %1119, i32* %1117, align 4
  %1120 = getelementptr i8, i8* %0, i32 1
  %1121 = load i8, i8* %1120, align 1
  %1122 = sext i8 %1121 to i16
  %1123 = icmp eq i32* %1116, null
  br i1 %1123, label %1140, label %1124

1124:                                             ; preds = %1115
  %1125 = lshr i16 %1122, 5
  %1126 = zext i16 %1125 to i32
  %1127 = shl i32 %1126, 25
  %1128 = getelementptr i8, i8* %39, i32 1
  %1129 = load i8, i8* %1128, align 1
  %1130 = zext i8 %1129 to i32
  %1131 = shl nuw nsw i32 %1130, 20
  %1132 = shl nsw i16 %1122, 7
  %1133 = and i16 %1132, 3968
  %1134 = zext i16 %1133 to i32
  %1135 = or i32 %1127, %1134
  %1136 = or i32 %1135, %1131
  %1137 = or i32 %1136, 270371
  %1138 = getelementptr i32, i32* %1116, i32 %1119
  store i32 %1137, i32* %1138, align 4
  %1139 = load i32, i32* %1117, align 4
  br label %1140

1140:                                             ; preds = %1124, %1115
  %1141 = phi i32 [ %1119, %1115 ], [ %1139, %1124 ]
  %1142 = add i32 %1141, 1
  store i32 %1142, i32* %1117, align 4
  br label %1143

1143:                                             ; preds = %1090, %1140
  ret void
}

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @emit_alu_r32(i8* readonly %0, i8* nocapture readonly %1, %struct.rv_jit_context* %2, i8 zeroext %3) unnamed_addr #2 {
  %5 = getelementptr i8, i8* %0, i32 1
  %6 = load i8, i8* %5, align 1
  %7 = icmp slt i8 %6, 0
  br i1 %7, label %8, label %23

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %10 = load i32*, i32** %9, align 4
  %11 = icmp eq i32* %10, null
  br i1 %11, label %19, label %12

12:                                               ; preds = %8
  %13 = sext i8 %6 to i32
  %14 = shl nsw i32 %13, 20
  %15 = or i32 %14, 271235
  %16 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr i32, i32* %10, i32 %17
  store i32 %15, i32* %18, align 4
  br label %19

19:                                               ; preds = %12, %8
  %20 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %21 = load i32, i32* %20, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %20, align 4
  br label %23

23:                                               ; preds = %4, %19
  %24 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 12, i32 0), %19 ], [ %0, %4 ]
  %25 = getelementptr i8, i8* %1, i32 1
  %26 = load i8, i8* %25, align 1
  %27 = icmp slt i8 %26, 0
  br i1 %27, label %28, label %43

28:                                               ; preds = %23
  %29 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %30 = load i32*, i32** %29, align 4
  %31 = icmp eq i32* %30, null
  br i1 %31, label %39, label %32

32:                                               ; preds = %28
  %33 = sext i8 %26 to i32
  %34 = shl nsw i32 %33, 20
  %35 = or i32 %34, 274051
  %36 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr i32, i32* %30, i32 %37
  store i32 %35, i32* %38, align 4
  br label %39

39:                                               ; preds = %32, %28
  %40 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %41 = load i32, i32* %40, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %40, align 4
  br label %43

43:                                               ; preds = %23, %39
  %44 = phi i8* [ getelementptr inbounds ([14 x [2 x i8]], [14 x [2 x i8]]* @bpf2rv32, i32 0, i32 13, i32 0), %39 ], [ %1, %23 ]
  %45 = zext i8 %3 to i32
  %46 = lshr i32 %45, 4
  %47 = shl i32 %45, 28
  %48 = or i32 %46, %47
  switch i32 %48, label %306 [
    i32 11, label %49
    i32 0, label %67
    i32 1, label %87
    i32 5, label %107
    i32 4, label %127
    i32 10, label %147
    i32 2, label %167
    i32 3, label %187
    i32 9, label %207
    i32 6, label %227
    i32 7, label %247
    i32 12, label %267
    i32 8, label %287
  ]

49:                                               ; preds = %43
  %50 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %51 = load i32*, i32** %50, align 4
  %52 = icmp eq i32* %51, null
  br i1 %52, label %302, label %53

53:                                               ; preds = %49
  %54 = getelementptr i8, i8* %24, i32 1
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = shl nuw nsw i32 %56, 7
  %58 = getelementptr i8, i8* %44, i32 1
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = shl nuw nsw i32 %60, 15
  %62 = or i32 %57, %61
  %63 = or i32 %62, 19
  %64 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %65 = load i32, i32* %64, align 4
  %66 = getelementptr i32, i32* %51, i32 %65
  store i32 %63, i32* %66, align 4
  br label %302

67:                                               ; preds = %43
  %68 = getelementptr i8, i8* %24, i32 1
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %72 = load i32*, i32** %71, align 4
  %73 = icmp eq i32* %72, null
  br i1 %73, label %302, label %74

74:                                               ; preds = %67
  %75 = shl nuw nsw i32 %70, 7
  %76 = shl nuw nsw i32 %70, 15
  %77 = getelementptr i8, i8* %44, i32 1
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = shl nuw nsw i32 %79, 20
  %81 = or i32 %76, %75
  %82 = or i32 %81, %80
  %83 = or i32 %82, 51
  %84 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %85 = load i32, i32* %84, align 4
  %86 = getelementptr i32, i32* %72, i32 %85
  store i32 %83, i32* %86, align 4
  br label %302

87:                                               ; preds = %43
  %88 = getelementptr i8, i8* %24, i32 1
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %92 = load i32*, i32** %91, align 4
  %93 = icmp eq i32* %92, null
  br i1 %93, label %302, label %94

94:                                               ; preds = %87
  %95 = shl nuw nsw i32 %90, 7
  %96 = shl nuw nsw i32 %90, 15
  %97 = getelementptr i8, i8* %44, i32 1
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = shl nuw nsw i32 %99, 20
  %101 = or i32 %96, %95
  %102 = or i32 %101, %100
  %103 = or i32 %102, 1073741875
  %104 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %105 = load i32, i32* %104, align 4
  %106 = getelementptr i32, i32* %92, i32 %105
  store i32 %103, i32* %106, align 4
  br label %302

107:                                              ; preds = %43
  %108 = getelementptr i8, i8* %24, i32 1
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %112 = load i32*, i32** %111, align 4
  %113 = icmp eq i32* %112, null
  br i1 %113, label %302, label %114

114:                                              ; preds = %107
  %115 = shl nuw nsw i32 %110, 7
  %116 = shl nuw nsw i32 %110, 15
  %117 = getelementptr i8, i8* %44, i32 1
  %118 = load i8, i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = shl nuw nsw i32 %119, 20
  %121 = or i32 %116, %115
  %122 = or i32 %121, %120
  %123 = or i32 %122, 28723
  %124 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %125 = load i32, i32* %124, align 4
  %126 = getelementptr i32, i32* %112, i32 %125
  store i32 %123, i32* %126, align 4
  br label %302

127:                                              ; preds = %43
  %128 = getelementptr i8, i8* %24, i32 1
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %132 = load i32*, i32** %131, align 4
  %133 = icmp eq i32* %132, null
  br i1 %133, label %302, label %134

134:                                              ; preds = %127
  %135 = shl nuw nsw i32 %130, 7
  %136 = shl nuw nsw i32 %130, 15
  %137 = getelementptr i8, i8* %44, i32 1
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = shl nuw nsw i32 %139, 20
  %141 = or i32 %136, %135
  %142 = or i32 %141, %140
  %143 = or i32 %142, 24627
  %144 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %145 = load i32, i32* %144, align 4
  %146 = getelementptr i32, i32* %132, i32 %145
  store i32 %143, i32* %146, align 4
  br label %302

147:                                              ; preds = %43
  %148 = getelementptr i8, i8* %24, i32 1
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %152 = load i32*, i32** %151, align 4
  %153 = icmp eq i32* %152, null
  br i1 %153, label %302, label %154

154:                                              ; preds = %147
  %155 = shl nuw nsw i32 %150, 7
  %156 = shl nuw nsw i32 %150, 15
  %157 = getelementptr i8, i8* %44, i32 1
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = shl nuw nsw i32 %159, 20
  %161 = or i32 %156, %155
  %162 = or i32 %161, %160
  %163 = or i32 %162, 16435
  %164 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %165 = load i32, i32* %164, align 4
  %166 = getelementptr i32, i32* %152, i32 %165
  store i32 %163, i32* %166, align 4
  br label %302

167:                                              ; preds = %43
  %168 = getelementptr i8, i8* %24, i32 1
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %172 = load i32*, i32** %171, align 4
  %173 = icmp eq i32* %172, null
  br i1 %173, label %302, label %174

174:                                              ; preds = %167
  %175 = shl nuw nsw i32 %170, 7
  %176 = shl nuw nsw i32 %170, 15
  %177 = getelementptr i8, i8* %44, i32 1
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = shl nuw nsw i32 %179, 20
  %181 = or i32 %176, %175
  %182 = or i32 %181, %180
  %183 = or i32 %182, 33554483
  %184 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %185 = load i32, i32* %184, align 4
  %186 = getelementptr i32, i32* %172, i32 %185
  store i32 %183, i32* %186, align 4
  br label %302

187:                                              ; preds = %43
  %188 = getelementptr i8, i8* %24, i32 1
  %189 = load i8, i8* %188, align 1
  %190 = zext i8 %189 to i32
  %191 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %192 = load i32*, i32** %191, align 4
  %193 = icmp eq i32* %192, null
  br i1 %193, label %302, label %194

194:                                              ; preds = %187
  %195 = shl nuw nsw i32 %190, 7
  %196 = shl nuw nsw i32 %190, 15
  %197 = getelementptr i8, i8* %44, i32 1
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = shl nuw nsw i32 %199, 20
  %201 = or i32 %196, %195
  %202 = or i32 %201, %200
  %203 = or i32 %202, 33574963
  %204 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %205 = load i32, i32* %204, align 4
  %206 = getelementptr i32, i32* %192, i32 %205
  store i32 %203, i32* %206, align 4
  br label %302

207:                                              ; preds = %43
  %208 = getelementptr i8, i8* %24, i32 1
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %212 = load i32*, i32** %211, align 4
  %213 = icmp eq i32* %212, null
  br i1 %213, label %302, label %214

214:                                              ; preds = %207
  %215 = shl nuw nsw i32 %210, 7
  %216 = shl nuw nsw i32 %210, 15
  %217 = getelementptr i8, i8* %44, i32 1
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = shl nuw nsw i32 %219, 20
  %221 = or i32 %216, %215
  %222 = or i32 %221, %220
  %223 = or i32 %222, 33583155
  %224 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %225 = load i32, i32* %224, align 4
  %226 = getelementptr i32, i32* %212, i32 %225
  store i32 %223, i32* %226, align 4
  br label %302

227:                                              ; preds = %43
  %228 = getelementptr i8, i8* %24, i32 1
  %229 = load i8, i8* %228, align 1
  %230 = zext i8 %229 to i32
  %231 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %232 = load i32*, i32** %231, align 4
  %233 = icmp eq i32* %232, null
  br i1 %233, label %302, label %234

234:                                              ; preds = %227
  %235 = shl nuw nsw i32 %230, 7
  %236 = shl nuw nsw i32 %230, 15
  %237 = getelementptr i8, i8* %44, i32 1
  %238 = load i8, i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = shl nuw nsw i32 %239, 20
  %241 = or i32 %236, %235
  %242 = or i32 %241, %240
  %243 = or i32 %242, 4147
  %244 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %245 = load i32, i32* %244, align 4
  %246 = getelementptr i32, i32* %232, i32 %245
  store i32 %243, i32* %246, align 4
  br label %302

247:                                              ; preds = %43
  %248 = getelementptr i8, i8* %24, i32 1
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %252 = load i32*, i32** %251, align 4
  %253 = icmp eq i32* %252, null
  br i1 %253, label %302, label %254

254:                                              ; preds = %247
  %255 = shl nuw nsw i32 %250, 7
  %256 = shl nuw nsw i32 %250, 15
  %257 = getelementptr i8, i8* %44, i32 1
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = shl nuw nsw i32 %259, 20
  %261 = or i32 %256, %255
  %262 = or i32 %261, %260
  %263 = or i32 %262, 20531
  %264 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %265 = load i32, i32* %264, align 4
  %266 = getelementptr i32, i32* %252, i32 %265
  store i32 %263, i32* %266, align 4
  br label %302

267:                                              ; preds = %43
  %268 = getelementptr i8, i8* %24, i32 1
  %269 = load i8, i8* %268, align 1
  %270 = zext i8 %269 to i32
  %271 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %272 = load i32*, i32** %271, align 4
  %273 = icmp eq i32* %272, null
  br i1 %273, label %302, label %274

274:                                              ; preds = %267
  %275 = shl nuw nsw i32 %270, 7
  %276 = shl nuw nsw i32 %270, 15
  %277 = getelementptr i8, i8* %44, i32 1
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = shl nuw nsw i32 %279, 20
  %281 = or i32 %276, %275
  %282 = or i32 %281, %280
  %283 = or i32 %282, 1073762355
  %284 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %285 = load i32, i32* %284, align 4
  %286 = getelementptr i32, i32* %272, i32 %285
  store i32 %283, i32* %286, align 4
  br label %302

287:                                              ; preds = %43
  %288 = getelementptr i8, i8* %24, i32 1
  %289 = load i8, i8* %288, align 1
  %290 = zext i8 %289 to i32
  %291 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %292 = load i32*, i32** %291, align 4
  %293 = icmp eq i32* %292, null
  br i1 %293, label %302, label %294

294:                                              ; preds = %287
  %295 = shl nuw nsw i32 %290, 7
  %296 = shl nuw nsw i32 %290, 20
  %297 = or i32 %296, %295
  %298 = or i32 %297, 1073741875
  %299 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %300 = load i32, i32* %299, align 4
  %301 = getelementptr i32, i32* %292, i32 %300
  store i32 %298, i32* %301, align 4
  br label %302

302:                                              ; preds = %294, %287, %274, %267, %254, %247, %234, %227, %214, %207, %194, %187, %174, %167, %154, %147, %134, %127, %114, %107, %94, %87, %74, %67, %53, %49
  %303 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %304 = load i32, i32* %303, align 4
  %305 = add i32 %304, 1
  store i32 %305, i32* %303, align 4
  br label %306

306:                                              ; preds = %302, %43
  call fastcc void @bpf_put_reg32(i8* %0, i8* %24, %struct.rv_jit_context* %2)
  ret void
}

; Function Attrs: cold
declare dso_local i32 @printk(i8*, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @emit_rev32(i8 signext %0, %struct.rv_jit_context* %1) unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %4 = load i32*, i32** %3, align 4
  %5 = icmp eq i32* %4, null
  br i1 %5, label %11, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr i32, i32* %4, i32 %8
  store i32 787, i32* %9, align 4
  %10 = load i32*, i32** %3, align 4
  br label %11

11:                                               ; preds = %2, %6
  %12 = phi i32* [ null, %2 ], [ %10, %6 ]
  %13 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %14 = load i32, i32* %13, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %13, align 4
  %16 = zext i8 %0 to i32
  %17 = shl nuw nsw i32 %16, 15
  %18 = or i32 %17, 267416211
  %19 = icmp eq i32* %12, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %11
  %21 = add i32 %14, 3
  br label %36

22:                                               ; preds = %11
  %23 = getelementptr i32, i32* %12, i32 %15
  store i32 %18, i32* %23, align 4
  %24 = load i32*, i32** %3, align 4
  %25 = load i32, i32* %13, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %13, align 4
  %27 = icmp eq i32* %24, null
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = add i32 %25, 2
  br label %36

30:                                               ; preds = %22
  %31 = getelementptr i32, i32* %24, i32 %26
  store i32 5440307, i32* %31, align 4
  %32 = load i32*, i32** %3, align 4
  %33 = load i32, i32* %13, align 4
  %34 = add i32 %33, 1
  store i32 %34, i32* %13, align 4
  %35 = icmp eq i32* %32, null
  br i1 %35, label %38, label %41

36:                                               ; preds = %20, %28
  %37 = phi i32 [ %29, %28 ], [ %21, %20 ]
  store i32 %37, i32* %13, align 4
  br label %38

38:                                               ; preds = %36, %30
  %39 = phi i32 [ %34, %30 ], [ %37, %36 ]
  %40 = add i32 %39, 1
  store i32 %40, i32* %13, align 4
  br label %50

41:                                               ; preds = %30
  %42 = getelementptr i32, i32* %32, i32 %34
  store i32 8590099, i32* %42, align 4
  %43 = load i32, i32* %13, align 4
  %44 = load i32*, i32** %3, align 4
  %45 = add i32 %43, 1
  store i32 %45, i32* %13, align 4
  %46 = shl nuw nsw i32 %16, 7
  %47 = or i32 %17, %46
  %48 = or i32 %47, 8409107
  %49 = icmp eq i32* %44, null
  br i1 %49, label %50, label %54

50:                                               ; preds = %41, %38
  %51 = phi i32 [ %39, %38 ], [ %43, %41 ]
  %52 = add i32 %51, 2
  %53 = add i32 %51, 3
  store i32 %53, i32* %13, align 4
  br label %69

54:                                               ; preds = %41
  %55 = getelementptr i32, i32* %44, i32 %45
  store i32 %48, i32* %55, align 4
  %56 = load i32*, i32** %3, align 4
  %57 = load i32, i32* %13, align 4
  %58 = add i32 %57, 1
  store i32 %58, i32* %13, align 4
  %59 = icmp eq i32* %56, null
  br i1 %59, label %60, label %63

60:                                               ; preds = %54
  %61 = add i32 %57, 2
  %62 = add i32 %57, 3
  store i32 %62, i32* %13, align 4
  br label %79

63:                                               ; preds = %54
  %64 = getelementptr i32, i32* %56, i32 %58
  store i32 %18, i32* %64, align 4
  %65 = load i32*, i32** %3, align 4
  %66 = load i32, i32* %13, align 4
  %67 = add i32 %66, 1
  store i32 %67, i32* %13, align 4
  %68 = icmp eq i32* %65, null
  br i1 %68, label %69, label %73

69:                                               ; preds = %63, %50
  %70 = phi i32 [ %52, %50 ], [ %66, %63 ]
  %71 = add i32 %70, 2
  %72 = add i32 %70, 3
  store i32 %72, i32* %13, align 4
  br label %89

73:                                               ; preds = %63
  %74 = getelementptr i32, i32* %65, i32 %67
  store i32 5440307, i32* %74, align 4
  %75 = load i32*, i32** %3, align 4
  %76 = load i32, i32* %13, align 4
  %77 = add i32 %76, 1
  store i32 %77, i32* %13, align 4
  %78 = icmp eq i32* %75, null
  br i1 %78, label %79, label %83

79:                                               ; preds = %73, %60
  %80 = phi i32 [ %61, %60 ], [ %76, %73 ]
  %81 = add i32 %80, 2
  %82 = add i32 %80, 3
  store i32 %82, i32* %13, align 4
  br label %99

83:                                               ; preds = %73
  %84 = getelementptr i32, i32* %75, i32 %77
  store i32 8590099, i32* %84, align 4
  %85 = load i32*, i32** %3, align 4
  %86 = load i32, i32* %13, align 4
  %87 = add i32 %86, 1
  store i32 %87, i32* %13, align 4
  %88 = icmp eq i32* %85, null
  br i1 %88, label %89, label %93

89:                                               ; preds = %83, %69
  %90 = phi i32 [ %71, %69 ], [ %86, %83 ]
  %91 = add i32 %90, 2
  %92 = add i32 %90, 3
  store i32 %92, i32* %13, align 4
  br label %109

93:                                               ; preds = %83
  %94 = getelementptr i32, i32* %85, i32 %87
  store i32 %48, i32* %94, align 4
  %95 = load i32*, i32** %3, align 4
  %96 = load i32, i32* %13, align 4
  %97 = add i32 %96, 1
  store i32 %97, i32* %13, align 4
  %98 = icmp eq i32* %95, null
  br i1 %98, label %99, label %103

99:                                               ; preds = %93, %79
  %100 = phi i32 [ %81, %79 ], [ %96, %93 ]
  %101 = add i32 %100, 2
  %102 = add i32 %100, 3
  store i32 %102, i32* %13, align 4
  br label %119

103:                                              ; preds = %93
  %104 = getelementptr i32, i32* %95, i32 %97
  store i32 %18, i32* %104, align 4
  %105 = load i32*, i32** %3, align 4
  %106 = load i32, i32* %13, align 4
  %107 = add i32 %106, 1
  store i32 %107, i32* %13, align 4
  %108 = icmp eq i32* %105, null
  br i1 %108, label %109, label %113

109:                                              ; preds = %103, %89
  %110 = phi i32 [ %91, %89 ], [ %106, %103 ]
  %111 = add i32 %110, 2
  %112 = add i32 %110, 3
  store i32 %112, i32* %13, align 4
  br label %129

113:                                              ; preds = %103
  %114 = getelementptr i32, i32* %105, i32 %107
  store i32 5440307, i32* %114, align 4
  %115 = load i32*, i32** %3, align 4
  %116 = load i32, i32* %13, align 4
  %117 = add i32 %116, 1
  store i32 %117, i32* %13, align 4
  %118 = icmp eq i32* %115, null
  br i1 %118, label %119, label %123

119:                                              ; preds = %113, %99
  %120 = phi i32 [ %101, %99 ], [ %116, %113 ]
  %121 = add i32 %120, 2
  %122 = add i32 %120, 3
  store i32 %122, i32* %13, align 4
  br label %139

123:                                              ; preds = %113
  %124 = getelementptr i32, i32* %115, i32 %117
  store i32 8590099, i32* %124, align 4
  %125 = load i32*, i32** %3, align 4
  %126 = load i32, i32* %13, align 4
  %127 = add i32 %126, 1
  store i32 %127, i32* %13, align 4
  %128 = icmp eq i32* %125, null
  br i1 %128, label %129, label %133

129:                                              ; preds = %123, %109
  %130 = phi i32 [ %111, %109 ], [ %126, %123 ]
  %131 = add i32 %130, 2
  %132 = add i32 %130, 3
  store i32 %132, i32* %13, align 4
  br label %148

133:                                              ; preds = %123
  %134 = getelementptr i32, i32* %125, i32 %127
  store i32 %48, i32* %134, align 4
  %135 = load i32*, i32** %3, align 4
  %136 = load i32, i32* %13, align 4
  %137 = add i32 %136, 1
  store i32 %137, i32* %13, align 4
  %138 = icmp eq i32* %135, null
  br i1 %138, label %139, label %142

139:                                              ; preds = %133, %119
  %140 = phi i32 [ %121, %119 ], [ %136, %133 ]
  %141 = add i32 %140, 3
  store i32 %141, i32* %13, align 4
  br label %161

142:                                              ; preds = %133
  %143 = getelementptr i32, i32* %135, i32 %137
  store i32 %18, i32* %143, align 4
  %144 = load i32*, i32** %3, align 4
  %145 = load i32, i32* %13, align 4
  %146 = add i32 %145, 1
  store i32 %146, i32* %13, align 4
  %147 = icmp eq i32* %144, null
  br i1 %147, label %148, label %151

148:                                              ; preds = %129, %142
  %149 = phi i32 [ %131, %129 ], [ %145, %142 ]
  %150 = add i32 %149, 2
  store i32 %150, i32* %13, align 4
  br label %161

151:                                              ; preds = %142
  %152 = getelementptr i32, i32* %144, i32 %146
  store i32 5440307, i32* %152, align 4
  %153 = load i32*, i32** %3, align 4
  %154 = load i32, i32* %13, align 4
  %155 = add i32 %154, 1
  store i32 %155, i32* %13, align 4
  %156 = icmp eq i32* %153, null
  br i1 %156, label %161, label %157

157:                                              ; preds = %151
  %158 = or i32 %46, 196627
  %159 = getelementptr i32, i32* %153, i32 %155
  store i32 %158, i32* %159, align 4
  %160 = load i32, i32* %13, align 4
  br label %161

161:                                              ; preds = %139, %148, %151, %157
  %162 = phi i32 [ %150, %148 ], [ %155, %151 ], [ %160, %157 ], [ %141, %139 ]
  %163 = add i32 %162, 1
  store i32 %163, i32* %13, align 4
  ret void
}

declare dso_local i32 @bpf_jit_get_func_addr(%struct.bpf_prog*, %struct.bpf_insn*, i1 zeroext, i64*, i8*) local_unnamed_addr #4

; Function Attrs: nofree norecurse nounwind
define dso_local void @bpf_jit_build_prologue(%struct.rv_jit_context* %0) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %0, i32 0, i32 0
  %3 = load %struct.bpf_prog*, %struct.bpf_prog** %2, align 4
  %4 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %3, i32 0, i32 7
  %5 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %4, align 4
  %6 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %5, i32 0, i32 5
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %9 = or i32 %8, 15
  %10 = add i32 %9, 76
  %11 = or i32 %10, 15
  %12 = add i32 %11, 1
  %13 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %0, i32 0, i32 1
  %14 = load i32*, i32** %13, align 4
  %15 = icmp eq i32* %14, null
  %16 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %0, i32 0, i32 2
  %17 = load i32, i32* %16, align 4
  br i1 %15, label %18, label %20

18:                                               ; preds = %1
  %19 = add i32 %17, 1
  store i32 %19, i32* %16, align 4
  br label %27

20:                                               ; preds = %1
  %21 = getelementptr i32, i32* %14, i32 %17
  store i32 33558419, i32* %21, align 4
  %22 = load i32*, i32** %13, align 4
  %23 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %0, i32 0, i32 2
  %24 = load i32, i32* %23, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %23, align 4
  %26 = icmp eq i32* %22, null
  br i1 %26, label %27, label %31

27:                                               ; preds = %20, %18
  %28 = phi i32* [ %16, %18 ], [ %23, %20 ]
  %29 = phi i32 [ %19, %18 ], [ %25, %20 ]
  %30 = add i32 %29, 1
  store i32 %30, i32* %28, align 4
  br label %42

31:                                               ; preds = %20
  %32 = shl i32 %10, 20
  %33 = and i32 %32, -16777216
  %34 = xor i32 %33, -16711405
  %35 = getelementptr i32, i32* %22, i32 %25
  store i32 %34, i32* %35, align 4
  %36 = load i32, i32* %23, align 4
  %37 = load i32*, i32** %13, align 4
  %38 = add i32 %36, 1
  store i32 %38, i32* %23, align 4
  %39 = trunc i32 %11 to i16
  %40 = add nsw i16 %39, -3
  %41 = icmp eq i32* %37, null
  br i1 %41, label %42, label %46

42:                                               ; preds = %31, %27
  %43 = phi i32* [ %28, %27 ], [ %23, %31 ]
  %44 = phi i32 [ %30, %27 ], [ %38, %31 ]
  %45 = add i32 %44, 1
  store i32 %45, i32* %43, align 4
  br label %61

46:                                               ; preds = %31
  %47 = lshr i16 %40, 5
  %48 = zext i16 %47 to i32
  %49 = shl i32 %48, 25
  %50 = shl i16 %40, 7
  %51 = and i16 %50, 3584
  %52 = zext i16 %51 to i32
  %53 = or i32 %49, %52
  %54 = or i32 %53, 1122339
  %55 = getelementptr i32, i32* %37, i32 %38
  store i32 %54, i32* %55, align 4
  %56 = load i32, i32* %23, align 4
  %57 = load i32*, i32** %13, align 4
  %58 = add i32 %56, 1
  store i32 %58, i32* %23, align 4
  %59 = add nsw i16 %39, -7
  %60 = icmp eq i32* %57, null
  br i1 %60, label %61, label %65

61:                                               ; preds = %46, %42
  %62 = phi i32* [ %43, %42 ], [ %23, %46 ]
  %63 = phi i32 [ %45, %42 ], [ %58, %46 ]
  %64 = add i32 %63, 1
  store i32 %64, i32* %62, align 4
  br label %80

65:                                               ; preds = %46
  %66 = lshr i16 %59, 5
  %67 = zext i16 %66 to i32
  %68 = shl i32 %67, 25
  %69 = shl i16 %59, 7
  %70 = and i16 %69, 3072
  %71 = zext i16 %70 to i32
  %72 = or i32 %68, %71
  %73 = or i32 %72, 8462371
  %74 = getelementptr i32, i32* %57, i32 %58
  store i32 %73, i32* %74, align 4
  %75 = load i32, i32* %23, align 4
  %76 = load i32*, i32** %13, align 4
  %77 = add i32 %75, 1
  store i32 %77, i32* %23, align 4
  %78 = add nsw i16 %39, -11
  %79 = icmp eq i32* %76, null
  br i1 %79, label %80, label %84

80:                                               ; preds = %65, %61
  %81 = phi i32* [ %62, %61 ], [ %23, %65 ]
  %82 = phi i32 [ %64, %61 ], [ %77, %65 ]
  %83 = add i32 %82, 1
  store i32 %83, i32* %81, align 4
  br label %98

84:                                               ; preds = %65
  %85 = lshr i16 %78, 5
  %86 = zext i16 %85 to i32
  %87 = shl i32 %86, 25
  %88 = shl i16 %78, 7
  %89 = and i16 %88, 2560
  %90 = zext i16 %89 to i32
  %91 = or i32 %87, %90
  %92 = or i32 %91, 9510947
  %93 = getelementptr i32, i32* %76, i32 %77
  store i32 %92, i32* %93, align 4
  %94 = load i32, i32* %23, align 4
  %95 = load i32*, i32** %13, align 4
  %96 = add i32 %94, 1
  store i32 %96, i32* %23, align 4
  %97 = icmp eq i32* %95, null
  br i1 %97, label %98, label %102

98:                                               ; preds = %84, %80
  %99 = phi i32* [ %81, %80 ], [ %23, %84 ]
  %100 = phi i32 [ %83, %80 ], [ %96, %84 ]
  %101 = add i32 %100, 1
  store i32 %101, i32* %99, align 4
  br label %115

102:                                              ; preds = %84
  %103 = lshr i32 %10, 5
  %104 = shl i32 %103, 25
  %105 = shl i32 %10, 7
  %106 = and i32 %105, 2048
  %107 = or i32 %106, %104
  %108 = or i32 %107, 18948131
  %109 = getelementptr i32, i32* %95, i32 %96
  store i32 %108, i32* %109, align 4
  %110 = load i32, i32* %23, align 4
  %111 = load i32*, i32** %13, align 4
  %112 = add i32 %110, 1
  store i32 %112, i32* %23, align 4
  %113 = add i16 %39, -19
  %114 = icmp eq i32* %111, null
  br i1 %114, label %115, label %119

115:                                              ; preds = %102, %98
  %116 = phi i32* [ %99, %98 ], [ %23, %102 ]
  %117 = phi i32 [ %101, %98 ], [ %112, %102 ]
  %118 = add i32 %117, 1
  store i32 %118, i32* %116, align 4
  br label %134

119:                                              ; preds = %102
  %120 = lshr i16 %113, 5
  %121 = zext i16 %120 to i32
  %122 = shl i32 %121, 25
  %123 = shl i16 %113, 7
  %124 = and i16 %123, 3584
  %125 = zext i16 %124 to i32
  %126 = or i32 %122, %125
  %127 = or i32 %126, 19996707
  %128 = getelementptr i32, i32* %111, i32 %112
  store i32 %127, i32* %128, align 4
  %129 = load i32, i32* %23, align 4
  %130 = load i32*, i32** %13, align 4
  %131 = add i32 %129, 1
  store i32 %131, i32* %23, align 4
  %132 = add i16 %39, -23
  %133 = icmp eq i32* %130, null
  br i1 %133, label %134, label %138

134:                                              ; preds = %119, %115
  %135 = phi i32* [ %116, %115 ], [ %23, %119 ]
  %136 = phi i32 [ %118, %115 ], [ %131, %119 ]
  %137 = add i32 %136, 1
  store i32 %137, i32* %135, align 4
  br label %153

138:                                              ; preds = %119
  %139 = lshr i16 %132, 5
  %140 = zext i16 %139 to i32
  %141 = shl i32 %140, 25
  %142 = shl i16 %132, 7
  %143 = and i16 %142, 3072
  %144 = zext i16 %143 to i32
  %145 = or i32 %141, %144
  %146 = or i32 %145, 21045283
  %147 = getelementptr i32, i32* %130, i32 %131
  store i32 %146, i32* %147, align 4
  %148 = load i32, i32* %23, align 4
  %149 = load i32*, i32** %13, align 4
  %150 = add i32 %148, 1
  store i32 %150, i32* %23, align 4
  %151 = add i16 %39, -27
  %152 = icmp eq i32* %149, null
  br i1 %152, label %153, label %157

153:                                              ; preds = %138, %134
  %154 = phi i32* [ %135, %134 ], [ %23, %138 ]
  %155 = phi i32 [ %137, %134 ], [ %150, %138 ]
  %156 = add i32 %155, 1
  store i32 %156, i32* %154, align 4
  br label %172

157:                                              ; preds = %138
  %158 = lshr i16 %151, 5
  %159 = zext i16 %158 to i32
  %160 = shl i32 %159, 25
  %161 = shl i16 %151, 7
  %162 = and i16 %161, 2560
  %163 = zext i16 %162 to i32
  %164 = or i32 %160, %163
  %165 = or i32 %164, 22093859
  %166 = getelementptr i32, i32* %149, i32 %150
  store i32 %165, i32* %166, align 4
  %167 = load i32, i32* %23, align 4
  %168 = load i32*, i32** %13, align 4
  %169 = add i32 %167, 1
  store i32 %169, i32* %23, align 4
  %170 = add i16 %39, -31
  %171 = icmp eq i32* %168, null
  br i1 %171, label %172, label %176

172:                                              ; preds = %157, %153
  %173 = phi i32* [ %154, %153 ], [ %23, %157 ]
  %174 = phi i32 [ %156, %153 ], [ %169, %157 ]
  %175 = add i32 %174, 1
  store i32 %175, i32* %173, align 4
  br label %191

176:                                              ; preds = %157
  %177 = lshr i16 %170, 5
  %178 = zext i16 %177 to i32
  %179 = shl i32 %178, 25
  %180 = shl i16 %170, 7
  %181 = and i16 %180, 2048
  %182 = zext i16 %181 to i32
  %183 = or i32 %179, %182
  %184 = or i32 %183, 23142435
  %185 = getelementptr i32, i32* %168, i32 %169
  store i32 %184, i32* %185, align 4
  %186 = load i32, i32* %23, align 4
  %187 = load i32*, i32** %13, align 4
  %188 = add i32 %186, 1
  store i32 %188, i32* %23, align 4
  %189 = add i16 %39, -35
  %190 = icmp eq i32* %187, null
  br i1 %190, label %191, label %195

191:                                              ; preds = %176, %172
  %192 = phi i32* [ %173, %172 ], [ %23, %176 ]
  %193 = phi i32 [ %175, %172 ], [ %188, %176 ]
  %194 = add i32 %193, 1
  store i32 %194, i32* %192, align 4
  br label %209

195:                                              ; preds = %176
  %196 = lshr i16 %189, 5
  %197 = zext i16 %196 to i32
  %198 = shl i32 %197, 25
  %199 = shl i16 %189, 7
  %200 = and i16 %199, 3584
  %201 = zext i16 %200 to i32
  %202 = or i32 %198, %201
  %203 = or i32 %202, 24191011
  %204 = getelementptr i32, i32* %187, i32 %188
  store i32 %203, i32* %204, align 4
  %205 = load i32, i32* %23, align 4
  %206 = load i32*, i32** %13, align 4
  %207 = add i32 %205, 1
  store i32 %207, i32* %23, align 4
  %208 = icmp eq i32* %206, null
  br i1 %208, label %209, label %213

209:                                              ; preds = %195, %191
  %210 = phi i32* [ %192, %191 ], [ %23, %195 ]
  %211 = phi i32 [ %194, %191 ], [ %207, %195 ]
  %212 = add i32 %211, 1
  store i32 %212, i32* %210, align 4
  br label %221

213:                                              ; preds = %195
  %214 = shl i32 %12, 20
  %215 = or i32 %214, 66579
  %216 = getelementptr i32, i32* %206, i32 %207
  store i32 %215, i32* %216, align 4
  %217 = load i32, i32* %23, align 4
  %218 = load i32*, i32** %13, align 4
  %219 = add i32 %217, 1
  store i32 %219, i32* %23, align 4
  %220 = icmp eq i32* %218, null
  br i1 %220, label %221, label %226

221:                                              ; preds = %213, %209
  %222 = phi i32 [ %211, %209 ], [ %217, %213 ]
  %223 = phi i32* [ %210, %209 ], [ %23, %213 ]
  %224 = add i32 %222, 2
  %225 = add i32 %222, 3
  store i32 %225, i32* %223, align 4
  br label %243

226:                                              ; preds = %213
  %227 = shl i32 %9, 20
  %228 = add i32 %227, 1048576
  %229 = or i32 %228, 68243
  %230 = getelementptr i32, i32* %218, i32 %219
  store i32 %229, i32* %230, align 4
  %231 = load i32*, i32** %13, align 4
  %232 = load i32, i32* %23, align 4
  %233 = add i32 %232, 1
  store i32 %233, i32* %23, align 4
  %234 = icmp eq i32* %231, null
  br i1 %234, label %235, label %237

235:                                              ; preds = %226
  %236 = add i32 %232, 3
  store i32 %236, i32* %23, align 4
  br label %256

237:                                              ; preds = %226
  %238 = getelementptr i32, i32* %231, i32 %233
  store i32 2835, i32* %238, align 4
  %239 = load i32*, i32** %13, align 4
  %240 = load i32, i32* %23, align 4
  %241 = add i32 %240, 1
  store i32 %241, i32* %23, align 4
  %242 = icmp eq i32* %239, null
  br i1 %242, label %243, label %247

243:                                              ; preds = %221, %237
  %244 = phi i32 [ %224, %221 ], [ %240, %237 ]
  %245 = phi i32* [ %223, %221 ], [ %23, %237 ]
  %246 = add i32 %244, 2
  store i32 %246, i32* %245, align 4
  br label %256

247:                                              ; preds = %237
  %248 = getelementptr i32, i32* %239, i32 %241
  store i32 328979, i32* %248, align 4
  %249 = load i32*, i32** %13, align 4
  %250 = load i32, i32* %23, align 4
  %251 = add i32 %250, 1
  store i32 %251, i32* %23, align 4
  %252 = icmp eq i32* %249, null
  br i1 %252, label %256, label %253

253:                                              ; preds = %247
  %254 = getelementptr i32, i32* %249, i32 %251
  store i32 1427, i32* %254, align 4
  %255 = load i32, i32* %23, align 4
  br label %256

256:                                              ; preds = %235, %243, %247, %253
  %257 = phi i32* [ %245, %243 ], [ %23, %247 ], [ %23, %253 ], [ %23, %235 ]
  %258 = phi i32 [ %246, %243 ], [ %251, %247 ], [ %255, %253 ], [ %236, %235 ]
  %259 = add i32 %258, 1
  store i32 %259, i32* %257, align 4
  %260 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %0, i32 0, i32 6
  store i32 %12, i32* %260, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind
define dso_local void @bpf_jit_build_epilogue(%struct.rv_jit_context* %0) local_unnamed_addr #2 {
  call fastcc void @__build_epilogue(i1 zeroext false, %struct.rv_jit_context* %0)
  ret void
}

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @__build_epilogue(i1 zeroext %0, %struct.rv_jit_context* %1) unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 6
  %4 = load i32, i32* %3, align 4
  br i1 %0, label %25, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %7 = load i32*, i32** %6, align 4
  %8 = icmp eq i32* %7, null
  %9 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  br i1 %8, label %11, label %13

11:                                               ; preds = %5
  %12 = add i32 %10, 1
  store i32 %12, i32* %9, align 4
  br label %22

13:                                               ; preds = %5
  %14 = getelementptr i32, i32* %7, i32 %10
  store i32 296211, i32* %14, align 4
  %15 = load i32*, i32** %6, align 4
  %16 = load i32, i32* %9, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* %9, align 4
  %18 = icmp eq i32* %15, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %13
  %20 = getelementptr i32, i32* %15, i32 %17
  store i32 591251, i32* %20, align 4
  %21 = load i32, i32* %9, align 4
  br label %22

22:                                               ; preds = %11, %13, %19
  %23 = phi i32 [ %12, %11 ], [ %17, %13 ], [ %21, %19 ]
  %24 = add i32 %23, 1
  store i32 %24, i32* %9, align 4
  br label %25

25:                                               ; preds = %22, %2
  %26 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 1
  %27 = load i32*, i32** %26, align 4
  %28 = icmp eq i32* %27, null
  br i1 %28, label %29, label %33

29:                                               ; preds = %25
  %30 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %30, align 4
  br label %45

33:                                               ; preds = %25
  %34 = shl i32 %4, 20
  %35 = add i32 %34, -4194304
  %36 = or i32 %35, 73859
  %37 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr i32, i32* %27, i32 %38
  store i32 %36, i32* %39, align 4
  %40 = load i32*, i32** %26, align 4
  %41 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %1, i32 0, i32 2
  %42 = load i32, i32* %41, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %41, align 4
  %44 = icmp eq i32* %40, null
  br i1 %44, label %45, label %49

45:                                               ; preds = %33, %29
  %46 = phi i32* [ %30, %29 ], [ %41, %33 ]
  %47 = phi i32 [ %32, %29 ], [ %43, %33 ]
  %48 = add i32 %47, 1
  store i32 %48, i32* %46, align 4
  br label %58

49:                                               ; preds = %33
  %50 = shl i32 %4, 20
  %51 = add i32 %50, -8388608
  %52 = or i32 %51, 74755
  %53 = getelementptr i32, i32* %40, i32 %43
  store i32 %52, i32* %53, align 4
  %54 = load i32, i32* %41, align 4
  %55 = load i32*, i32** %26, align 4
  %56 = add i32 %54, 1
  store i32 %56, i32* %41, align 4
  %57 = icmp eq i32* %55, null
  br i1 %57, label %58, label %62

58:                                               ; preds = %49, %45
  %59 = phi i32* [ %46, %45 ], [ %41, %49 ]
  %60 = phi i32 [ %48, %45 ], [ %56, %49 ]
  %61 = add i32 %60, 1
  store i32 %61, i32* %59, align 4
  br label %71

62:                                               ; preds = %49
  %63 = shl i32 %4, 20
  %64 = add i32 %63, -12582912
  %65 = or i32 %64, 74883
  %66 = getelementptr i32, i32* %55, i32 %56
  store i32 %65, i32* %66, align 4
  %67 = load i32, i32* %41, align 4
  %68 = load i32*, i32** %26, align 4
  %69 = add i32 %67, 1
  store i32 %69, i32* %41, align 4
  %70 = icmp eq i32* %68, null
  br i1 %70, label %71, label %75

71:                                               ; preds = %62, %58
  %72 = phi i32* [ %59, %58 ], [ %41, %62 ]
  %73 = phi i32 [ %61, %58 ], [ %69, %62 ]
  %74 = add i32 %73, 1
  store i32 %74, i32* %72, align 4
  br label %84

75:                                               ; preds = %62
  %76 = shl i32 %4, 20
  %77 = add i32 %76, -16777216
  %78 = or i32 %77, 76035
  %79 = getelementptr i32, i32* %68, i32 %69
  store i32 %78, i32* %79, align 4
  %80 = load i32, i32* %41, align 4
  %81 = load i32*, i32** %26, align 4
  %82 = add i32 %80, 1
  store i32 %82, i32* %41, align 4
  %83 = icmp eq i32* %81, null
  br i1 %83, label %84, label %88

84:                                               ; preds = %75, %71
  %85 = phi i32* [ %72, %71 ], [ %41, %75 ]
  %86 = phi i32 [ %74, %71 ], [ %82, %75 ]
  %87 = add i32 %86, 1
  store i32 %87, i32* %85, align 4
  br label %97

88:                                               ; preds = %75
  %89 = shl i32 %4, 20
  %90 = add i32 %89, -20971520
  %91 = or i32 %90, 76163
  %92 = getelementptr i32, i32* %81, i32 %82
  store i32 %91, i32* %92, align 4
  %93 = load i32, i32* %41, align 4
  %94 = load i32*, i32** %26, align 4
  %95 = add i32 %93, 1
  store i32 %95, i32* %41, align 4
  %96 = icmp eq i32* %94, null
  br i1 %96, label %97, label %101

97:                                               ; preds = %88, %84
  %98 = phi i32* [ %85, %84 ], [ %41, %88 ]
  %99 = phi i32 [ %87, %84 ], [ %95, %88 ]
  %100 = add i32 %99, 1
  store i32 %100, i32* %98, align 4
  br label %110

101:                                              ; preds = %88
  %102 = shl i32 %4, 20
  %103 = add i32 %102, -25165824
  %104 = or i32 %103, 76291
  %105 = getelementptr i32, i32* %94, i32 %95
  store i32 %104, i32* %105, align 4
  %106 = load i32, i32* %41, align 4
  %107 = load i32*, i32** %26, align 4
  %108 = add i32 %106, 1
  store i32 %108, i32* %41, align 4
  %109 = icmp eq i32* %107, null
  br i1 %109, label %110, label %114

110:                                              ; preds = %101, %97
  %111 = phi i32* [ %98, %97 ], [ %41, %101 ]
  %112 = phi i32 [ %100, %97 ], [ %108, %101 ]
  %113 = add i32 %112, 1
  store i32 %113, i32* %111, align 4
  br label %123

114:                                              ; preds = %101
  %115 = shl i32 %4, 20
  %116 = add i32 %115, -29360128
  %117 = or i32 %116, 76419
  %118 = getelementptr i32, i32* %107, i32 %108
  store i32 %117, i32* %118, align 4
  %119 = load i32, i32* %41, align 4
  %120 = load i32*, i32** %26, align 4
  %121 = add i32 %119, 1
  store i32 %121, i32* %41, align 4
  %122 = icmp eq i32* %120, null
  br i1 %122, label %123, label %127

123:                                              ; preds = %114, %110
  %124 = phi i32* [ %111, %110 ], [ %41, %114 ]
  %125 = phi i32 [ %113, %110 ], [ %121, %114 ]
  %126 = add i32 %125, 1
  store i32 %126, i32* %124, align 4
  br label %136

127:                                              ; preds = %114
  %128 = shl i32 %4, 20
  %129 = add i32 %128, -33554432
  %130 = or i32 %129, 76547
  %131 = getelementptr i32, i32* %120, i32 %121
  store i32 %130, i32* %131, align 4
  %132 = load i32, i32* %41, align 4
  %133 = load i32*, i32** %26, align 4
  %134 = add i32 %132, 1
  store i32 %134, i32* %41, align 4
  %135 = icmp eq i32* %133, null
  br i1 %135, label %136, label %140

136:                                              ; preds = %127, %123
  %137 = phi i32* [ %124, %123 ], [ %41, %127 ]
  %138 = phi i32 [ %126, %123 ], [ %134, %127 ]
  %139 = add i32 %138, 1
  store i32 %139, i32* %137, align 4
  br label %154

140:                                              ; preds = %127
  %141 = shl i32 %4, 20
  %142 = add i32 %141, -37748736
  %143 = or i32 %142, 76675
  %144 = getelementptr i32, i32* %133, i32 %134
  store i32 %143, i32* %144, align 4
  %145 = load i32, i32* %41, align 4
  %146 = load i32*, i32** %26, align 4
  %147 = add i32 %145, 1
  store i32 %147, i32* %41, align 4
  %148 = icmp eq i32* %146, null
  br i1 %148, label %154, label %149

149:                                              ; preds = %140
  %150 = or i32 %141, 65811
  %151 = getelementptr i32, i32* %146, i32 %147
  store i32 %150, i32* %151, align 4
  %152 = load i32, i32* %41, align 4
  %153 = load i32*, i32** %26, align 4
  br label %154

154:                                              ; preds = %136, %140, %149
  %155 = phi i32* [ %41, %140 ], [ %41, %149 ], [ %137, %136 ]
  %156 = phi i32* [ null, %140 ], [ %153, %149 ], [ null, %136 ]
  %157 = phi i32 [ %147, %140 ], [ %152, %149 ], [ %139, %136 ]
  %158 = add i32 %157, 1
  store i32 %158, i32* %155, align 4
  %159 = icmp eq i32* %156, null
  br i1 %0, label %160, label %163

160:                                              ; preds = %154
  br i1 %159, label %166, label %161

161:                                              ; preds = %160
  %162 = getelementptr i32, i32* %156, i32 %158
  store i32 4358247, i32* %162, align 4
  br label %166

163:                                              ; preds = %154
  br i1 %159, label %166, label %164

164:                                              ; preds = %163
  %165 = getelementptr i32, i32* %156, i32 %158
  store i32 32871, i32* %165, align 4
  br label %166

166:                                              ; preds = %164, %163, %161, %160
  %167 = load i32, i32* %155, align 4
  %168 = add i32 %167, 1
  store i32 %168, i32* %155, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @bpf_put_reg32(i8* nocapture readonly %0, i8* nocapture readonly %1, %struct.rv_jit_context* nocapture %2) unnamed_addr #2 {
  %4 = getelementptr i8, i8* %0, i32 1
  %5 = load i8, i8* %4, align 1
  %6 = icmp slt i8 %5, 0
  br i1 %6, label %7, label %59

7:                                                ; preds = %3
  %8 = sext i8 %5 to i16
  %9 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %10 = load i32*, i32** %9, align 4
  %11 = icmp eq i32* %10, null
  br i1 %11, label %29, label %12

12:                                               ; preds = %7
  %13 = lshr i16 %8, 5
  %14 = zext i16 %13 to i32
  %15 = shl i32 %14, 25
  %16 = getelementptr i8, i8* %1, i32 1
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = shl nuw nsw i32 %18, 20
  %20 = shl nsw i16 %8, 7
  %21 = and i16 %20, 3968
  %22 = zext i16 %21 to i32
  %23 = or i32 %15, %22
  %24 = or i32 %23, %19
  %25 = or i32 %24, 270371
  %26 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr i32, i32* %10, i32 %27
  store i32 %25, i32* %28, align 4
  br label %29

29:                                               ; preds = %7, %12
  %30 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %30, align 4
  %33 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 0
  %34 = load %struct.bpf_prog*, %struct.bpf_prog** %33, align 4
  %35 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %34, i32 0, i32 7
  %36 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %35, align 4
  %37 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %36, i32 0, i32 13
  %38 = load i8, i8* %37, align 8, !range !4
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %40, label %83

40:                                               ; preds = %29
  %41 = load i8, i8* %0, align 1
  %42 = sext i8 %41 to i16
  %43 = load i32*, i32** %9, align 4
  %44 = icmp eq i32* %43, null
  br i1 %44, label %56, label %45

45:                                               ; preds = %40
  %46 = lshr i16 %42, 5
  %47 = zext i16 %46 to i32
  %48 = shl i32 %47, 25
  %49 = shl nsw i16 %42, 7
  %50 = and i16 %49, 3968
  %51 = zext i16 %50 to i32
  %52 = or i32 %48, %51
  %53 = or i32 %52, 270371
  %54 = getelementptr i32, i32* %43, i32 %32
  store i32 %53, i32* %54, align 4
  %55 = load i32, i32* %30, align 4
  br label %56

56:                                               ; preds = %40, %45
  %57 = phi i32 [ %32, %40 ], [ %55, %45 ]
  %58 = add i32 %57, 1
  store i32 %58, i32* %30, align 4
  br label %83

59:                                               ; preds = %3
  %60 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 0
  %61 = load %struct.bpf_prog*, %struct.bpf_prog** %60, align 4
  %62 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %61, i32 0, i32 7
  %63 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %62, align 4
  %64 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %63, i32 0, i32 13
  %65 = load i8, i8* %64, align 8, !range !4
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %67, label %83

67:                                               ; preds = %59
  %68 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 1
  %69 = load i32*, i32** %68, align 4
  %70 = icmp eq i32* %69, null
  br i1 %70, label %79, label %71

71:                                               ; preds = %67
  %72 = load i8, i8* %0, align 1
  %73 = zext i8 %72 to i32
  %74 = shl nuw nsw i32 %73, 7
  %75 = or i32 %74, 19
  %76 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %77 = load i32, i32* %76, align 4
  %78 = getelementptr i32, i32* %69, i32 %77
  store i32 %75, i32* %78, align 4
  br label %79

79:                                               ; preds = %67, %71
  %80 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %2, i32 0, i32 2
  %81 = load i32, i32* %80, align 4
  %82 = add i32 %81, 1
  store i32 %82, i32* %80, align 4
  br label %83

83:                                               ; preds = %29, %59, %79, %56
  ret void
}

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @emit_bcc(i8 zeroext %0, i8 zeroext %1, i8 zeroext %2, i32 %3, %struct.rv_jit_context* %4) unnamed_addr #2 {
  %6 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 2
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i8 %0, 64
  br i1 %8, label %31, label %9

9:                                                ; preds = %5
  %10 = add i32 %3, 4096
  %11 = icmp ult i32 %10, 8192
  br i1 %11, label %28, label %12

12:                                               ; preds = %9
  %13 = zext i8 %0 to i32
  %14 = add nsw i32 %13, -16
  %15 = lshr i32 %14, 4
  %16 = shl i32 %14, 28
  %17 = or i32 %15, %16
  switch i32 %17, label %27 [
    i32 0, label %31
    i32 1, label %18
    i32 9, label %19
    i32 2, label %20
    i32 10, label %21
    i32 4, label %22
    i32 5, label %23
    i32 11, label %24
    i32 6, label %25
    i32 12, label %26
  ]

18:                                               ; preds = %12
  br label %31

19:                                               ; preds = %12
  br label %31

20:                                               ; preds = %12
  br label %31

21:                                               ; preds = %12
  br label %31

22:                                               ; preds = %12
  br label %31

23:                                               ; preds = %12
  br label %31

24:                                               ; preds = %12
  br label %31

25:                                               ; preds = %12
  br label %31

26:                                               ; preds = %12
  br label %31

27:                                               ; preds = %12
  br label %31

28:                                               ; preds = %9
  %29 = lshr i32 %3, 1
  %30 = and i32 %29, 65535
  br label %31

31:                                               ; preds = %27, %26, %25, %24, %23, %22, %21, %20, %19, %18, %12, %5, %28
  %32 = phi i8 [ %0, %28 ], [ 64, %5 ], [ -1, %27 ], [ 96, %26 ], [ -64, %25 ], [ 112, %24 ], [ -48, %23 ], [ 16, %22 ], [ 32, %21 ], [ -96, %20 ], [ 48, %19 ], [ -80, %18 ], [ 80, %12 ]
  %33 = phi i1 [ false, %28 ], [ true, %5 ], [ true, %27 ], [ true, %26 ], [ true, %25 ], [ true, %24 ], [ true, %23 ], [ true, %22 ], [ true, %21 ], [ true, %20 ], [ true, %19 ], [ true, %18 ], [ true, %12 ]
  %34 = phi i32 [ %30, %28 ], [ 6, %5 ], [ 6, %27 ], [ 6, %26 ], [ 6, %25 ], [ 6, %24 ], [ 6, %23 ], [ 6, %22 ], [ 6, %21 ], [ 6, %20 ], [ 6, %19 ], [ 6, %18 ], [ 6, %12 ]
  %35 = zext i8 %32 to i32
  %36 = add nsw i32 %35, -16
  %37 = lshr i32 %36, 4
  %38 = shl i32 %36, 28
  %39 = or i32 %37, %38
  switch i32 %39, label %380 [
    i32 0, label %40
    i32 1, label %70
    i32 9, label %100
    i32 2, label %130
    i32 10, label %160
    i32 4, label %190
    i32 5, label %220
    i32 11, label %250
    i32 6, label %280
    i32 12, label %310
    i32 3, label %340
  ]

40:                                               ; preds = %31
  %41 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %42 = load i32*, i32** %41, align 4
  %43 = icmp eq i32* %42, null
  br i1 %43, label %67, label %44

44:                                               ; preds = %40
  %45 = zext i8 %1 to i32
  %46 = shl nuw nsw i32 %45, 15
  %47 = zext i8 %2 to i32
  %48 = shl nuw nsw i32 %47, 20
  %49 = lshr i32 %34, 5
  %50 = and i32 %49, 64
  %51 = lshr i32 %34, 4
  %52 = and i32 %51, 63
  %53 = or i32 %50, %52
  %54 = shl nuw i32 %53, 25
  %55 = shl nuw nsw i32 %34, 1
  %56 = and i32 %55, 30
  %57 = lshr i32 %34, 10
  %58 = and i32 %57, 1
  %59 = or i32 %56, %58
  %60 = shl nuw nsw i32 %59, 7
  %61 = or i32 %46, %48
  %62 = or i32 %61, %54
  %63 = or i32 %62, %60
  %64 = or i32 %63, 99
  %65 = getelementptr i32, i32* %42, i32 %7
  store i32 %64, i32* %65, align 4
  %66 = load i32, i32* %6, align 4
  br label %67

67:                                               ; preds = %40, %44
  %68 = phi i32 [ %7, %40 ], [ %66, %44 ]
  %69 = add i32 %68, 1
  br label %378

70:                                               ; preds = %31
  %71 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %72 = load i32*, i32** %71, align 4
  %73 = icmp eq i32* %72, null
  br i1 %73, label %97, label %74

74:                                               ; preds = %70
  %75 = zext i8 %1 to i32
  %76 = shl nuw nsw i32 %75, 20
  %77 = zext i8 %2 to i32
  %78 = shl nuw nsw i32 %77, 15
  %79 = lshr i32 %34, 5
  %80 = and i32 %79, 64
  %81 = lshr i32 %34, 4
  %82 = and i32 %81, 63
  %83 = or i32 %80, %82
  %84 = shl nuw i32 %83, 25
  %85 = shl nuw nsw i32 %34, 1
  %86 = and i32 %85, 30
  %87 = lshr i32 %34, 10
  %88 = and i32 %87, 1
  %89 = or i32 %86, %88
  %90 = shl nuw nsw i32 %89, 7
  %91 = or i32 %76, %78
  %92 = or i32 %91, %84
  %93 = or i32 %92, %90
  %94 = or i32 %93, 24675
  %95 = getelementptr i32, i32* %72, i32 %7
  store i32 %94, i32* %95, align 4
  %96 = load i32, i32* %6, align 4
  br label %97

97:                                               ; preds = %70, %74
  %98 = phi i32 [ %7, %70 ], [ %96, %74 ]
  %99 = add i32 %98, 1
  br label %378

100:                                              ; preds = %31
  %101 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %102 = load i32*, i32** %101, align 4
  %103 = icmp eq i32* %102, null
  br i1 %103, label %127, label %104

104:                                              ; preds = %100
  %105 = zext i8 %1 to i32
  %106 = shl nuw nsw i32 %105, 15
  %107 = zext i8 %2 to i32
  %108 = shl nuw nsw i32 %107, 20
  %109 = lshr i32 %34, 5
  %110 = and i32 %109, 64
  %111 = lshr i32 %34, 4
  %112 = and i32 %111, 63
  %113 = or i32 %110, %112
  %114 = shl nuw i32 %113, 25
  %115 = shl nuw nsw i32 %34, 1
  %116 = and i32 %115, 30
  %117 = lshr i32 %34, 10
  %118 = and i32 %117, 1
  %119 = or i32 %116, %118
  %120 = shl nuw nsw i32 %119, 7
  %121 = or i32 %106, %108
  %122 = or i32 %121, %114
  %123 = or i32 %122, %120
  %124 = or i32 %123, 24675
  %125 = getelementptr i32, i32* %102, i32 %7
  store i32 %124, i32* %125, align 4
  %126 = load i32, i32* %6, align 4
  br label %127

127:                                              ; preds = %100, %104
  %128 = phi i32 [ %7, %100 ], [ %126, %104 ]
  %129 = add i32 %128, 1
  br label %378

130:                                              ; preds = %31
  %131 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %132 = load i32*, i32** %131, align 4
  %133 = icmp eq i32* %132, null
  br i1 %133, label %157, label %134

134:                                              ; preds = %130
  %135 = zext i8 %1 to i32
  %136 = shl nuw nsw i32 %135, 15
  %137 = zext i8 %2 to i32
  %138 = shl nuw nsw i32 %137, 20
  %139 = lshr i32 %34, 5
  %140 = and i32 %139, 64
  %141 = lshr i32 %34, 4
  %142 = and i32 %141, 63
  %143 = or i32 %140, %142
  %144 = shl nuw i32 %143, 25
  %145 = shl nuw nsw i32 %34, 1
  %146 = and i32 %145, 30
  %147 = lshr i32 %34, 10
  %148 = and i32 %147, 1
  %149 = or i32 %146, %148
  %150 = shl nuw nsw i32 %149, 7
  %151 = or i32 %136, %138
  %152 = or i32 %151, %144
  %153 = or i32 %152, %150
  %154 = or i32 %153, 28771
  %155 = getelementptr i32, i32* %132, i32 %7
  store i32 %154, i32* %155, align 4
  %156 = load i32, i32* %6, align 4
  br label %157

157:                                              ; preds = %130, %134
  %158 = phi i32 [ %7, %130 ], [ %156, %134 ]
  %159 = add i32 %158, 1
  br label %378

160:                                              ; preds = %31
  %161 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %162 = load i32*, i32** %161, align 4
  %163 = icmp eq i32* %162, null
  br i1 %163, label %187, label %164

164:                                              ; preds = %160
  %165 = zext i8 %1 to i32
  %166 = shl nuw nsw i32 %165, 20
  %167 = zext i8 %2 to i32
  %168 = shl nuw nsw i32 %167, 15
  %169 = lshr i32 %34, 5
  %170 = and i32 %169, 64
  %171 = lshr i32 %34, 4
  %172 = and i32 %171, 63
  %173 = or i32 %170, %172
  %174 = shl nuw i32 %173, 25
  %175 = shl nuw nsw i32 %34, 1
  %176 = and i32 %175, 30
  %177 = lshr i32 %34, 10
  %178 = and i32 %177, 1
  %179 = or i32 %176, %178
  %180 = shl nuw nsw i32 %179, 7
  %181 = or i32 %166, %168
  %182 = or i32 %181, %174
  %183 = or i32 %182, %180
  %184 = or i32 %183, 28771
  %185 = getelementptr i32, i32* %162, i32 %7
  store i32 %184, i32* %185, align 4
  %186 = load i32, i32* %6, align 4
  br label %187

187:                                              ; preds = %160, %164
  %188 = phi i32 [ %7, %160 ], [ %186, %164 ]
  %189 = add i32 %188, 1
  br label %378

190:                                              ; preds = %31
  %191 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %192 = load i32*, i32** %191, align 4
  %193 = icmp eq i32* %192, null
  br i1 %193, label %217, label %194

194:                                              ; preds = %190
  %195 = zext i8 %1 to i32
  %196 = shl nuw nsw i32 %195, 15
  %197 = zext i8 %2 to i32
  %198 = shl nuw nsw i32 %197, 20
  %199 = lshr i32 %34, 5
  %200 = and i32 %199, 64
  %201 = lshr i32 %34, 4
  %202 = and i32 %201, 63
  %203 = or i32 %200, %202
  %204 = shl nuw i32 %203, 25
  %205 = shl nuw nsw i32 %34, 1
  %206 = and i32 %205, 30
  %207 = lshr i32 %34, 10
  %208 = and i32 %207, 1
  %209 = or i32 %206, %208
  %210 = shl nuw nsw i32 %209, 7
  %211 = or i32 %196, %198
  %212 = or i32 %211, %204
  %213 = or i32 %212, %210
  %214 = or i32 %213, 4195
  %215 = getelementptr i32, i32* %192, i32 %7
  store i32 %214, i32* %215, align 4
  %216 = load i32, i32* %6, align 4
  br label %217

217:                                              ; preds = %190, %194
  %218 = phi i32 [ %7, %190 ], [ %216, %194 ]
  %219 = add i32 %218, 1
  br label %378

220:                                              ; preds = %31
  %221 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %222 = load i32*, i32** %221, align 4
  %223 = icmp eq i32* %222, null
  br i1 %223, label %247, label %224

224:                                              ; preds = %220
  %225 = zext i8 %1 to i32
  %226 = shl nuw nsw i32 %225, 20
  %227 = zext i8 %2 to i32
  %228 = shl nuw nsw i32 %227, 15
  %229 = lshr i32 %34, 5
  %230 = and i32 %229, 64
  %231 = lshr i32 %34, 4
  %232 = and i32 %231, 63
  %233 = or i32 %230, %232
  %234 = shl nuw i32 %233, 25
  %235 = shl nuw nsw i32 %34, 1
  %236 = and i32 %235, 30
  %237 = lshr i32 %34, 10
  %238 = and i32 %237, 1
  %239 = or i32 %236, %238
  %240 = shl nuw nsw i32 %239, 7
  %241 = or i32 %226, %228
  %242 = or i32 %241, %234
  %243 = or i32 %242, %240
  %244 = or i32 %243, 16483
  %245 = getelementptr i32, i32* %222, i32 %7
  store i32 %244, i32* %245, align 4
  %246 = load i32, i32* %6, align 4
  br label %247

247:                                              ; preds = %220, %224
  %248 = phi i32 [ %7, %220 ], [ %246, %224 ]
  %249 = add i32 %248, 1
  br label %378

250:                                              ; preds = %31
  %251 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %252 = load i32*, i32** %251, align 4
  %253 = icmp eq i32* %252, null
  br i1 %253, label %277, label %254

254:                                              ; preds = %250
  %255 = zext i8 %1 to i32
  %256 = shl nuw nsw i32 %255, 15
  %257 = zext i8 %2 to i32
  %258 = shl nuw nsw i32 %257, 20
  %259 = lshr i32 %34, 5
  %260 = and i32 %259, 64
  %261 = lshr i32 %34, 4
  %262 = and i32 %261, 63
  %263 = or i32 %260, %262
  %264 = shl nuw i32 %263, 25
  %265 = shl nuw nsw i32 %34, 1
  %266 = and i32 %265, 30
  %267 = lshr i32 %34, 10
  %268 = and i32 %267, 1
  %269 = or i32 %266, %268
  %270 = shl nuw nsw i32 %269, 7
  %271 = or i32 %256, %258
  %272 = or i32 %271, %264
  %273 = or i32 %272, %270
  %274 = or i32 %273, 16483
  %275 = getelementptr i32, i32* %252, i32 %7
  store i32 %274, i32* %275, align 4
  %276 = load i32, i32* %6, align 4
  br label %277

277:                                              ; preds = %250, %254
  %278 = phi i32 [ %7, %250 ], [ %276, %254 ]
  %279 = add i32 %278, 1
  br label %378

280:                                              ; preds = %31
  %281 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %282 = load i32*, i32** %281, align 4
  %283 = icmp eq i32* %282, null
  br i1 %283, label %307, label %284

284:                                              ; preds = %280
  %285 = zext i8 %1 to i32
  %286 = shl nuw nsw i32 %285, 15
  %287 = zext i8 %2 to i32
  %288 = shl nuw nsw i32 %287, 20
  %289 = lshr i32 %34, 5
  %290 = and i32 %289, 64
  %291 = lshr i32 %34, 4
  %292 = and i32 %291, 63
  %293 = or i32 %290, %292
  %294 = shl nuw i32 %293, 25
  %295 = shl nuw nsw i32 %34, 1
  %296 = and i32 %295, 30
  %297 = lshr i32 %34, 10
  %298 = and i32 %297, 1
  %299 = or i32 %296, %298
  %300 = shl nuw nsw i32 %299, 7
  %301 = or i32 %286, %288
  %302 = or i32 %301, %294
  %303 = or i32 %302, %300
  %304 = or i32 %303, 20579
  %305 = getelementptr i32, i32* %282, i32 %7
  store i32 %304, i32* %305, align 4
  %306 = load i32, i32* %6, align 4
  br label %307

307:                                              ; preds = %280, %284
  %308 = phi i32 [ %7, %280 ], [ %306, %284 ]
  %309 = add i32 %308, 1
  br label %378

310:                                              ; preds = %31
  %311 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %312 = load i32*, i32** %311, align 4
  %313 = icmp eq i32* %312, null
  br i1 %313, label %337, label %314

314:                                              ; preds = %310
  %315 = zext i8 %1 to i32
  %316 = shl nuw nsw i32 %315, 20
  %317 = zext i8 %2 to i32
  %318 = shl nuw nsw i32 %317, 15
  %319 = lshr i32 %34, 5
  %320 = and i32 %319, 64
  %321 = lshr i32 %34, 4
  %322 = and i32 %321, 63
  %323 = or i32 %320, %322
  %324 = shl nuw i32 %323, 25
  %325 = shl nuw nsw i32 %34, 1
  %326 = and i32 %325, 30
  %327 = lshr i32 %34, 10
  %328 = and i32 %327, 1
  %329 = or i32 %326, %328
  %330 = shl nuw nsw i32 %329, 7
  %331 = or i32 %316, %318
  %332 = or i32 %331, %324
  %333 = or i32 %332, %330
  %334 = or i32 %333, 20579
  %335 = getelementptr i32, i32* %312, i32 %7
  store i32 %334, i32* %335, align 4
  %336 = load i32, i32* %6, align 4
  br label %337

337:                                              ; preds = %310, %314
  %338 = phi i32 [ %7, %310 ], [ %336, %314 ]
  %339 = add i32 %338, 1
  br label %378

340:                                              ; preds = %31
  %341 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %342 = load i32*, i32** %341, align 4
  %343 = icmp eq i32* %342, null
  br i1 %343, label %344, label %346

344:                                              ; preds = %340
  %345 = add i32 %7, 1
  store i32 %345, i32* %6, align 4
  br label %375

346:                                              ; preds = %340
  %347 = zext i8 %1 to i32
  %348 = shl nuw nsw i32 %347, 15
  %349 = zext i8 %2 to i32
  %350 = shl nuw nsw i32 %349, 20
  %351 = or i32 %348, %350
  %352 = or i32 %351, 29363
  %353 = getelementptr i32, i32* %342, i32 %7
  store i32 %352, i32* %353, align 4
  %354 = load i32, i32* %6, align 4
  %355 = load i32*, i32** %341, align 4
  %356 = add i32 %354, 1
  store i32 %356, i32* %6, align 4
  %357 = icmp eq i32* %355, null
  br i1 %357, label %375, label %358

358:                                              ; preds = %346
  %359 = lshr i32 %34, 5
  %360 = and i32 %359, 64
  %361 = lshr i32 %34, 4
  %362 = and i32 %361, 63
  %363 = or i32 %360, %362
  %364 = shl nuw i32 %363, 25
  %365 = shl nuw nsw i32 %34, 1
  %366 = and i32 %365, 30
  %367 = lshr i32 %34, 10
  %368 = and i32 %367, 1
  %369 = or i32 %366, %368
  %370 = shl nuw nsw i32 %369, 7
  %371 = or i32 %370, %364
  %372 = or i32 %371, 163939
  %373 = getelementptr i32, i32* %355, i32 %356
  store i32 %372, i32* %373, align 4
  %374 = load i32, i32* %6, align 4
  br label %375

375:                                              ; preds = %344, %346, %358
  %376 = phi i32 [ %356, %346 ], [ %374, %358 ], [ %345, %344 ]
  %377 = add i32 %376, 1
  br label %378

378:                                              ; preds = %67, %97, %127, %157, %187, %217, %247, %277, %307, %337, %375
  %379 = phi i32 [ %377, %375 ], [ %339, %337 ], [ %309, %307 ], [ %279, %277 ], [ %249, %247 ], [ %219, %217 ], [ %189, %187 ], [ %159, %157 ], [ %129, %127 ], [ %99, %97 ], [ %69, %67 ]
  store i32 %379, i32* %6, align 4
  br label %380

380:                                              ; preds = %378, %31
  %381 = phi i32 [ %7, %31 ], [ %379, %378 ]
  br i1 %33, label %382, label %408

382:                                              ; preds = %380
  %383 = sub i32 %381, %7
  %384 = shl i32 %383, 2
  %385 = sub i32 %3, %384
  %386 = getelementptr inbounds %struct.rv_jit_context, %struct.rv_jit_context* %4, i32 0, i32 1
  %387 = load i32*, i32** %386, align 4
  %388 = icmp eq i32* %387, null
  br i1 %388, label %389, label %391

389:                                              ; preds = %382
  %390 = add i32 %381, 1
  store i32 %390, i32* %6, align 4
  br label %405

391:                                              ; preds = %382
  %392 = add i32 %385, 2048
  %393 = and i32 %392, -4096
  %394 = or i32 %393, 791
  %395 = getelementptr i32, i32* %387, i32 %381
  store i32 %394, i32* %395, align 4
  %396 = load i32*, i32** %386, align 4
  %397 = load i32, i32* %6, align 4
  %398 = add i32 %397, 1
  store i32 %398, i32* %6, align 4
  %399 = icmp eq i32* %396, null
  br i1 %399, label %405, label %400

400:                                              ; preds = %391
  %401 = shl i32 %385, 20
  %402 = or i32 %401, 196711
  %403 = getelementptr i32, i32* %396, i32 %398
  store i32 %402, i32* %403, align 4
  %404 = load i32, i32* %6, align 4
  br label %405

405:                                              ; preds = %389, %391, %400
  %406 = phi i32 [ %398, %391 ], [ %404, %400 ], [ %390, %389 ]
  %407 = add i32 %406, 1
  store i32 %407, i32* %6, align 4
  br label %408

408:                                              ; preds = %405, %380
  ret void
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax,-save-restore" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{i32 1, !"Code Model", i32 1}
!3 = !{!"clang version 10.0.0-4ubuntu1 "}
!4 = !{i8 0, i8 2}
