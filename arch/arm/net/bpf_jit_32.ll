; ModuleID = '/home/lukenels/repo/linux/arch/arm/net/bpf_jit_32.c'
source_filename = "/home/lukenels/repo/linux/arch/arm/net/bpf_jit_32.c"
target datalayout = "E-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armebv6k-unknown-linux-gnueabi"

module asm ".syntax unified"

%struct.cpu_cache_fns = type { void ()*, void ()*, void ()*, void ()*, void (i32, i32, i32)*, void (i32, i32)*, i32 (i32, i32)*, void (i8*, i32)*, void (i8*, i32, i32)*, void (i8*, i32, i32)*, void (i8*, i8*)* }
%struct.bpf_prog = type { i16, i16, i32, i32, i32, i32, [8 x i8], %struct.bpf_prog_aux*, %struct.sock_fprog_kern*, i32 (i8*, %struct.bpf_insn*)*, [0 x %struct.sock_filter], [0 x %struct.bpf_insn] }
%struct.bpf_prog_aux = type { %struct.atomic64_t, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.bpf_ctx_arg_aux*, %struct.bpf_prog*, i8, i8, i8, i8, i32, %struct.bpf_trampoline*, %struct.hlist_node, %struct.btf_type*, i8*, %struct.bpf_prog**, i8*, %struct.bpf_jit_poke_descriptor*, i32, %struct.bpf_ksym, %struct.bpf_prog_ops*, %struct.bpf_map**, %struct.bpf_prog*, %struct.user_struct*, i64, [2 x %struct.bpf_map*], [16 x i8], i8*, %struct.bpf_prog_offload*, %struct.btf*, %struct.bpf_func_info*, %struct.bpf_func_info_aux*, %struct.bpf_line_info*, i8**, i32, i32, i32, i32, %struct.exception_table_entry*, %struct.bpf_prog_stats*, %union.anon.138 }
%struct.atomic64_t = type { i64 }
%struct.bpf_ctx_arg_aux = type { i32, i32 }
%struct.bpf_trampoline = type { %struct.hlist_node, %struct.mutex, %struct.refcount_struct, i64, %struct.anon.2, %struct.bpf_prog*, [3 x %struct.hlist_head], [3 x i32], i8*, i64, %struct.bpf_ksym }
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.optimistic_spin_queue, %struct.list_head, i8*, %struct.lockdep_map }
%struct.atomic_t = type { i32 }
%struct.spinlock = type { %union.anon }
%union.anon = type { %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.arch_spinlock_t, i32, i32, i8*, %struct.lockdep_map }
%struct.arch_spinlock_t = type { %union.anon.0 }
%union.anon.0 = type { i32 }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.lockdep_map = type { %struct.lock_class_key*, [2 x %struct.lock_class*], i8*, i16, i16, i32, i32 }
%struct.lock_class_key = type { %union.anon.1 }
%union.anon.1 = type { %struct.hlist_node }
%struct.lock_class = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.lockdep_subclass_key*, i32, i32, i32, [9 x %struct.lock_trace*], i32, i8*, i16, i16, [4 x i32], [4 x i32] }
%struct.lockdep_subclass_key = type { i8 }
%struct.lock_trace = type opaque
%struct.refcount_struct = type { %struct.atomic_t }
%struct.anon.2 = type { %struct.btf_func_model, i8*, i8 }
%struct.btf_func_model = type { i8, i8, [12 x i8] }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.btf_type = type opaque
%struct.bpf_jit_poke_descriptor = type { i8*, %union.anon.3, i8, i8, i16 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { %struct.bpf_map*, i32 }
%struct.bpf_map = type { %struct.bpf_map_ops*, %struct.bpf_map*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.btf*, %struct.bpf_map_memory, [16 x i8], i32, i8, i8, [42 x i8], %struct.atomic64_t, %struct.atomic64_t, %struct.work_struct, %struct.mutex, i64, [96 x i8] }
%struct.bpf_map_ops = type { i32 (%union.bpf_attr*)*, %struct.bpf_map* (%union.bpf_attr*)*, void (%struct.bpf_map*, %struct.file*)*, void (%struct.bpf_map*)*, i32 (%struct.bpf_map*, i8*, i8*)*, void (%struct.bpf_map*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*)*, i8* (%struct.bpf_map*, %struct.file*, i32)*, void (i8*)*, i32 (%struct.bpf_map*, %struct.bpf_insn*)*, i32 (i8*)*, void (%struct.bpf_map*, i8*, %struct.seq_file*)*, i32 (%struct.bpf_map*, %struct.btf*, %struct.btf_type*, %struct.btf_type*)*, i32 (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, i32, %struct.bpf_prog*, %struct.bpf_prog*)*, i32 (%struct.bpf_map*, i64*, i32)*, i32 (%struct.bpf_map*, i64, i32*)*, i32 (%struct.bpf_map*, %struct.vm_area_struct*)*, i32 (%struct.bpf_map*, %struct.file*, %struct.poll_table_struct*)* }
%union.bpf_attr = type { %struct.anon.9 }
%struct.anon.9 = type { i32, i32, i64, i64, i32, i32, i64, i32, i32, [16 x i8], i32, i32, i32, i32, i64, i32, i32, i64, i32, i32, i32 }
%struct.file = type { %union.anon.24, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, i32, %struct.atomic_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.24 = type { %struct.callback_head }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.vfsmount = type opaque
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [36 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i32, i8*, %union.anon.117, %struct.list_head, %struct.list_head, %union.anon.118 }
%struct.seqcount = type { i32, %struct.lockdep_map }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.25, i8* }
%union.anon.25 = type { i64 }
%struct.lockref = type { %union.anon.115 }
%union.anon.115 = type { %struct.anon.116 }
%struct.anon.116 = type { %struct.spinlock, i32 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.path*, i1)*, %struct.dentry* (%struct.dentry*, %struct.inode*)*, [76 x i8] }
%struct.super_block = type { %struct.list_head, i32, i8, i32, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i32, i32, i32, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.fscrypt_operations*, %struct.key*, %struct.fsverity_operations*, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, i8*, i32, i64, i64, i32, %struct.fsnotify_mark_connector*, [32 x i8], %struct.uuid_t, i32, i32, %struct.mutex, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic_t, %struct.atomic_t, i32, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.user_namespace*, %struct.list_lru, %struct.list_lru, %struct.callback_head, %struct.work_struct, %struct.mutex, i32, [28 x i8], %struct.spinlock, %struct.list_head, %struct.spinlock, %struct.list_head, [24 x i8] }
%struct.file_system_type = type { i8*, i32, i32 (%struct.fs_context*)*, %struct.fs_parameter_spec*, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.fs_context = type opaque
%struct.fs_parameter_spec = type opaque
%struct.module = type { i32, %struct.list_head, [60 x i8], %struct.module_kobject, %struct.module_attribute*, i8*, i8*, %struct.kobject*, %struct.kernel_symbol*, i32*, i32, %struct.mutex, %struct.kernel_param*, i32, i32, %struct.kernel_symbol*, i32*, %struct.kernel_symbol*, i32*, i32, i32, %struct.kernel_symbol*, i32*, i8, i8, %struct.kernel_symbol*, i32*, i32, i32, %struct.exception_table_entry*, i32 ()*, [96 x i8], %struct.module_layout, %struct.module_layout, %struct.mod_arch_specific, i32, i32, %struct.list_head, %struct.bug_entry*, %struct.mod_kallsyms*, %struct.mod_kallsyms, %struct.module_sect_attrs*, %struct.module_notes_attrs*, i8*, i8*, i32, i8*, i32, i32, %struct.tracepoint**, i32, %struct.srcu_struct**, i32, %struct.bpf_raw_event_map*, %struct.jump_entry*, i32, i32, i8**, %struct.trace_event_call**, i32, %struct.trace_eval_map**, i32, i32, i32*, i8*, i32, i32*, i32, %struct.list_head, %struct.list_head, void ()*, %struct.atomic_t, void ()**, i32, [64 x i8] }
%struct.module_kobject = type { %struct.kobject, %struct.module*, %struct.kobject*, %struct.module_param_attrs*, %struct.completion* }
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, %struct.delayed_work, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [64 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.attribute_group**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)*, void (%struct.kobject*, %struct.kuid_t*, %struct.kgid_t*)* }
%struct.sysfs_ops = type { i32 (%struct.kobject*, %struct.attribute*, i8*)*, i32 (%struct.kobject*, %struct.attribute*, i8*, i32)* }
%struct.attribute = type { i8*, i16, i8, %struct.lock_class_key*, %struct.lock_class_key }
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, i16 (%struct.kobject*, %struct.bin_attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i32, i8*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i32)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i32)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.vm_area_struct = type { i32, i32, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i32, %struct.mm_struct*, i32, i32, %struct.anon.105, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i32, %struct.file*, i8*, %struct.atomic_t, %struct.vm_userfaultfd_ctx }
%struct.rb_node = type { i32, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.anon.27, [0 x i32] }
%struct.anon.27 = type { %struct.vm_area_struct*, %struct.rb_root, i64, i32 (%struct.file*, i32, i32, i32, i32)*, i32, i32, i32, i32, [2 x i32]*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i32, i32, i32, i32, %struct.atomic64_t, i32, i32, i32, i32, %struct.spinlock, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [42 x i32], %struct.mm_rss_stat, %struct.linux_binfmt*, %struct.mm_context_t, i32, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.task_struct*, %struct.user_namespace*, %struct.file*, %struct.mmu_notifier_subscriptions*, %struct.atomic_t, %struct.uprobes_state, %struct.work_struct }
%struct.rb_root = type { %struct.rb_node* }
%struct.mm_rss_stat = type { [4 x %struct.atomic_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { %struct.atomic64_t, i32, i32, i32, i32, i32 }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.swait_queue_head }
%struct.swait_queue_head = type { %struct.raw_spinlock, %struct.list_head }
%struct.kioctx_table = type opaque
%struct.task_struct = type { i32, i8*, %struct.refcount_struct, i32, i32, %struct.llist_node, i32, i32, i32, i32, %struct.task_struct*, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, [52 x i8], %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, [2 x %struct.uclamp_se], [2 x %struct.uclamp_se], i32, i32, i32, %struct.cpumask*, %struct.cpumask, i32, i8, i8, i32, %struct.list_head, i32, i32, %union.rcu_special, i8, %struct.list_head, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, %struct.vmacache, %struct.task_rss_stat, i32, i32, i32, i32, i32, i32, i8, [3 x i8], i8, i32, %struct.restart_block, i32, i32, i32, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.pid*, [4 x %struct.hlist_node], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, %struct.prev_cputime, i32, i32, i64, i64, i32, i32, %struct.posix_cputimers, %struct.cred*, %struct.cred*, %struct.cred*, %struct.key*, [16 x i8], %struct.nameidata*, %struct.sysv_sem, %struct.sysv_shm, i32, i32, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i32, i32, i32, %struct.callback_head*, %struct.kuid_t, i32, %struct.seccomp, i64, i64, %struct.spinlock, %struct.raw_spinlock, %struct.wake_q_node, %struct.rb_root_cached, %struct.task_struct*, %struct.rt_mutex_waiter*, %struct.mutex_waiter*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, [48 x %struct.held_lock], i32, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, %struct.capture_control*, i32, %struct.kernel_siginfo*, %struct.task_io_accounting, i32, i64, i64, i64, %struct.nodemask_t, %struct.seqcount, i32, i32, %struct.css_set*, %struct.list_head, %struct.robust_list_head*, %struct.list_head, %struct.futex_pi_state*, %struct.mutex, i32, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, %struct.rseq*, i32, i32, %struct.tlbflush_unmap_batch, %union.anon.101, %struct.pipe_inode_info*, %struct.page_frag, %struct.task_delay_info*, i32, i32, i32, i32, i32, i32, [32 x %struct.latency_record], i64, i64, i32, i32, i32, i32, i8*, %struct.kcov*, i64, i32, i32, %struct.mem_cgroup*, i32, i32, i32, %struct.mem_cgroup*, %struct.request_queue*, %struct.uprobe_task*, i32, i32, i32, i32, %struct.task_struct*, i8*, %struct.thread_struct, [32 x i8] }
%struct.llist_node = type { %struct.llist_node* }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, i32, [76 x i8], %struct.sched_avg }
%struct.load_weight = type { i32, i32 }
%struct.sched_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i64, i64, i64, i32, i32, i32, i32, i32, [4 x i8], %struct.util_est, [72 x i8] }
%struct.util_est = type { i32, i32 }
%struct.sched_rt_entity = type { %struct.list_head, i32, i32, i32, i16, i16, %struct.sched_rt_entity*, %struct.sched_rt_entity*, %struct.rt_rq*, %struct.rt_rq* }
%struct.rt_rq = type opaque
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i64, i32, i8, %struct.hrtimer, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, i64, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i8, i8, i8, i8 }
%struct.timerqueue_node = type { %struct.rb_node, i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.seqcount, %struct.hrtimer*, %struct.timerqueue_head, i64 ()*, i64 }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, i8, i32, i16, i16, i32, i64, %struct.hrtimer*, i64, %struct.hrtimer*, [8 x %struct.hrtimer_clock_base], [88 x i8] }
%struct.timerqueue_head = type { %struct.rb_root_cached }
%struct.uclamp_se = type { i16, [2 x i8] }
%struct.cpumask = type { [1 x i32] }
%union.rcu_special = type { i32 }
%struct.sched_info = type { i32, i64, i64, i64 }
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.vmacache = type { i64, [4 x %struct.vm_area_struct*] }
%struct.task_rss_stat = type { i32, [4 x i32] }
%struct.restart_block = type { i32 (%struct.restart_block*)*, %union.anon.29 }
%union.anon.29 = type { %struct.anon.30 }
%struct.anon.30 = type { i32*, i32, i32, i32, i64, i32* }
%struct.pid = type { %struct.refcount_struct, i32, %struct.spinlock, [4 x %struct.hlist_head], %struct.hlist_head, %struct.wait_queue_head, %struct.callback_head, [1 x %struct.upid] }
%struct.wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.upid = type { i32, %struct.pid_namespace* }
%struct.pid_namespace = type opaque
%struct.prev_cputime = type { i64, i64, %struct.raw_spinlock }
%struct.posix_cputimers = type { [3 x %struct.posix_cputimer_base], i32, i32 }
%struct.posix_cputimer_base = type { i64, %struct.timerqueue_head }
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
%struct.net = type { %struct.refcount_struct, %struct.refcount_struct, %struct.spinlock, i32, i32, i32, %struct.spinlock, %struct.atomic_t, %struct.list_head, %struct.list_head, %struct.llist_node, %struct.key_tag*, %struct.user_namespace*, %struct.ucounts*, %struct.idr, %struct.ns_common, %struct.list_head, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.ctl_table_set, %struct.sock*, %struct.sock*, %struct.uevent_sock*, %struct.hlist_head*, %struct.hlist_head*, %struct.raw_notifier_head, i32, %struct.net_device*, %struct.list_head, %struct.netns_core, %struct.netns_mib, %struct.netns_packet, %struct.netns_unix, %struct.netns_nexthop, [68 x i8], %struct.netns_ipv4, %struct.netns_ipv6, %struct.netns_ieee802154_lowpan, %struct.netns_sctp, %struct.netns_dccp, %struct.netns_nf, %struct.netns_xt, %struct.netns_ct, %struct.netns_nftables, %struct.netns_nf_frag, %struct.ctl_table_header*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.sk_buff_head, %struct.net_generic*, %struct.netns_bpf, [104 x i8], %struct.netns_xfrm, %struct.atomic64_t, %struct.netns_ipvs*, %struct.netns_mpls, %struct.netns_can, %struct.netns_xdp, %struct.sock*, %struct.sock*, [96 x i8] }
%struct.key_tag = type { %struct.callback_head, %struct.refcount_struct, i8 }
%struct.ucounts = type { %struct.hlist_node, %struct.user_namespace*, %struct.kuid_t, i32, [10 x %struct.atomic_t] }
%struct.idr = type { %struct.xarray, i32, i32 }
%struct.xarray = type { %struct.spinlock, i32, i8* }
%struct.ns_common = type { %struct.atomic_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.proc_dir_entry = type opaque
%struct.ctl_table_set = type { i32 (%struct.ctl_table_set*)*, %struct.ctl_dir }
%struct.ctl_dir = type { %struct.ctl_table_header, %struct.rb_root }
%struct.ctl_table_header = type { %union.anon.44, %struct.completion*, %struct.ctl_table*, %struct.ctl_table_root*, %struct.ctl_table_set*, %struct.ctl_dir*, %struct.ctl_node*, %struct.hlist_head }
%union.anon.44 = type { %struct.anon.45 }
%struct.anon.45 = type { %struct.ctl_table*, i32, i32, i32 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i32*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.wait_queue_head }
%struct.ctl_table_root = type { %struct.ctl_table_set, %struct.ctl_table_set* (%struct.ctl_table_root*)*, void (%struct.ctl_table_header*, %struct.ctl_table*, %struct.kuid_t*, %struct.kgid_t*)*, i32 (%struct.ctl_table_header*, %struct.ctl_table*)* }
%struct.kgid_t = type { i32 }
%struct.ctl_node = type { %struct.rb_node, %struct.ctl_table_header* }
%struct.uevent_sock = type opaque
%struct.raw_notifier_head = type { %struct.notifier_block* }
%struct.notifier_block = type { i32 (%struct.notifier_block*, i32, i8*)*, %struct.notifier_block*, i32 }
%struct.net_device = type { [16 x i8], %struct.netdev_name_node*, %struct.dev_ifalias*, i32, i32, i32, i32, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.anon.119, i64, i64, i64, i64, i64, i64, i64, i32, i32, %struct.net_device_stats, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.iw_handler_def*, %struct.iw_public_data*, %struct.net_device_ops*, %struct.ethtool_ops*, %struct.l3mdev_ops*, %struct.ndisc_ops*, %struct.xfrmdev_ops*, %struct.tlsdev_ops*, %struct.header_ops*, i32, i32, i16, i16, i8, i8, i8, i8, i32, i32, i32, i16, i16, i8, i16, i16, [32 x i8], i8, i8, i8, i8, i16, i16, i16, %struct.spinlock, i8, i8, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.kset*, i32, i32, %struct.vlan_info*, %struct.dsa_port*, %struct.tipc_bearer*, i8*, %struct.in_device*, %struct.dn_dev*, %struct.inet6_dev*, i8*, %struct.wireless_dev*, %struct.wpan_dev*, %struct.mpls_dev*, i8*, %struct.netdev_rx_queue*, i32, i32, %struct.bpf_prog*, i32, i32, i32 (%struct.sk_buff**)*, i8*, %struct.mini_Qdisc*, %struct.netdev_queue*, %struct.nf_hook_entries*, [32 x i8], %struct.cpu_rmap*, %struct.hlist_node, [4 x i8], %struct.netdev_queue*, i32, i32, %struct.Qdisc*, i32, %struct.spinlock, %struct.xdp_dev_bulk_queue*, %struct.xps_dev_maps*, %struct.xps_dev_maps*, %struct.mini_Qdisc*, [16 x %struct.hlist_head], %struct.timer_list, i32, %struct.list_head, i32*, %struct.list_head, i8, i8, i16, i8, void (%struct.net_device*)*, %struct.netpoll_info*, %struct.possible_net_t, %union.anon.135, %struct.garp_port*, %struct.mrp_port*, %struct.device, [4 x %struct.attribute_group*], %struct.attribute_group*, %struct.rtnl_link_ops*, i32, i16, %struct.dcbnl_rtnl_ops*, i16, [16 x %struct.netdev_tc_txq], [16 x i8], i32, %struct.netprio_map*, %struct.phy_device*, %struct.sfp_bus*, %struct.lock_class_key*, %struct.lock_class_key*, i8, i8, %struct.list_head, %struct.macsec_ops*, [72 x i8] }
%struct.netdev_name_node = type { %struct.hlist_node, %struct.list_head, %struct.net_device*, i8* }
%struct.dev_ifalias = type { %struct.callback_head, [0 x i8] }
%struct.anon.119 = type { %struct.list_head, %struct.list_head }
%struct.net_device_stats = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.iw_handler_def = type opaque
%struct.iw_public_data = type opaque
%struct.net_device_ops = type { i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.sk_buff*, %struct.net_device*, i64)*, i16 (%struct.net_device*, %struct.sk_buff*, %struct.net_device*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ifreq*, i32)*, i32 (%struct.net_device*, %struct.ifmap*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.neigh_parms*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.rtnl_link_stats64*)*, i1 (%struct.net_device*, i32)*, i32 (i32, %struct.net_device*, i8*)*, %struct.net_device_stats* (%struct.net_device*)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i16, i16)*, void (%struct.net_device*)*, i32 (%struct.net_device*, %struct.netpoll_info*)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i16, i8, i16)*, i32 (%struct.net_device*, i32, i32, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_info*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_stats*)*, i32 (%struct.net_device*, i32, %struct.nlattr**)*, i32 (%struct.net_device*, i32, %struct.sk_buff*)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_guid*, %struct.ifla_vf_guid*)*, i32 (%struct.net_device*, i32, i64, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, i16)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, %struct.netdev_fcoe_hbainfo*)*, i32 (%struct.net_device*, i64*, i32)*, i32 (%struct.net_device*, %struct.sk_buff*, i16, i32)*, i32 (%struct.net_device*, %struct.net_device*, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, %struct.net_device* (%struct.net_device*, %struct.sk_buff*, i1)*, i64 (%struct.net_device*, i64)*, i32 (%struct.net_device*, i64)*, i32 (%struct.net_device*, %struct.neighbour*)*, void (%struct.net_device*, %struct.neighbour*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16, i16, %struct.netlink_ext_ack*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16)*, i32 (%struct.sk_buff*, %struct.netlink_callback*, %struct.net_device*, %struct.net_device*, i32*)*, i32 (%struct.sk_buff*, %struct.nlattr**, %struct.net_device*, i8*, i16, i32, i32, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16, %struct.netlink_ext_ack*)*, i32 (%struct.sk_buff*, i32, i32, %struct.net_device*, i32, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, i8*, i32)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, i8* (%struct.net_device*, %struct.net_device*)*, void (%struct.net_device*, i8*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.sk_buff*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.netdev_bpf*)*, i32 (%struct.net_device*, i32, %struct.xdp_frame**, i32)*, i32 (%struct.net_device*, i32, i32)*, %struct.devlink_port* (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ip_tunnel_parm*, i32)* }
%struct.sk_buff = type <{ %union.anon.49, %union.anon.52, %union.anon.53, [48 x i8], %union.anon.54, i32, i32, i32, i16, i16, i16, [0 x i8], i8, i8, [0 x i32], [0 x i8], i16, [0 x i8], i24, i16, %union.anon.56, i32, i32, i32, i16, i16, %union.anon.58, i32, %union.anon.59, %union.anon.60, i16, i16, i16, i16, i16, i16, i16, [0 x i32], i8*, i8*, i8*, i8*, i32, %struct.refcount_struct, %struct.skb_ext* }>
%union.anon.49 = type { %struct.anon.50 }
%struct.anon.50 = type { %struct.sk_buff*, %struct.sk_buff*, %union.anon.51 }
%union.anon.51 = type { %struct.net_device* }
%union.anon.52 = type { %struct.sock* }
%union.anon.53 = type { i64 }
%union.anon.54 = type { %struct.anon.55 }
%struct.anon.55 = type { i32, void (%struct.sk_buff*)* }
%union.anon.56 = type { i32 }
%union.anon.58 = type { i32 }
%union.anon.59 = type { i32 }
%union.anon.60 = type { i16 }
%struct.skb_ext = type { %struct.refcount_struct, [4 x i8], i8, [7 x i8], [0 x i8] }
%struct.ifreq = type { %union.anon.120, %union.anon.121 }
%union.anon.120 = type { [16 x i8] }
%union.anon.121 = type { %struct.ifmap }
%struct.ifmap = type { i32, i32, i16, i8, i8, i8 }
%struct.neigh_parms = type opaque
%struct.rtnl_link_stats64 = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.ifla_vf_info = type { i32, [32 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i16 }
%struct.ifla_vf_stats = type { i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.nlattr = type { i16, i16 }
%struct.ifla_vf_guid = type { i32, i64 }
%struct.scatterlist = type { i32, i32, i32, i32, i32 }
%struct.netdev_fcoe_hbainfo = type { [64 x i8], [64 x i8], [64 x i8], [64 x i8], [64 x i8], [64 x i8], [256 x i8], [256 x i8] }
%struct.netlink_ext_ack = type { i8*, %struct.nlattr*, [20 x i8], i8 }
%struct.neighbour = type opaque
%struct.ndmsg = type { i8, i8, i16, i32, i16, i8, i8 }
%struct.netlink_callback = type { %struct.sk_buff*, %struct.nlmsghdr*, i32 (%struct.sk_buff*, %struct.netlink_callback*)*, i32 (%struct.netlink_callback*)*, i8*, %struct.module*, %struct.netlink_ext_ack*, i16, i16, i32, i32, i32, i8, %union.anon.123 }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%union.anon.123 = type { [6 x i32], [24 x i8] }
%struct.netdev_phys_item_id = type { [32 x i8], i8 }
%struct.udp_tunnel_info = type opaque
%struct.netdev_bpf = type { i32, %union.anon.124 }
%union.anon.124 = type { %struct.anon.125 }
%struct.anon.125 = type { i32, %struct.bpf_prog*, %struct.netlink_ext_ack* }
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
%struct.ethtool_rxnfc = type { i32, i32, i64, %struct.ethtool_rx_flow_spec, %union.anon.129, [0 x i32] }
%struct.ethtool_rx_flow_spec = type { i32, %union.ethtool_flow_union, %struct.ethtool_flow_ext, %union.ethtool_flow_union, %struct.ethtool_flow_ext, i64, i32 }
%union.ethtool_flow_union = type { %struct.ethtool_tcpip6_spec, [12 x i8] }
%struct.ethtool_tcpip6_spec = type { [4 x i32], [4 x i32], i16, i16, i8 }
%struct.ethtool_flow_ext = type { [2 x i8], [6 x i8], i16, i16, [2 x i32] }
%union.anon.129 = type { i32 }
%struct.ethtool_flash = type { i32, i32, [128 x i8] }
%struct.ethtool_channels = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_dump = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_ts_info = type { i32, i32, i32, i32, [3 x i32], i32, [3 x i32] }
%struct.ethtool_modinfo = type { i32, i32, i32, [8 x i32] }
%struct.ethtool_eeprom = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_eee = type { i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%struct.ethtool_tunable = type { i32, i32, i32, i32, [0 x i8*] }
%struct.ethtool_link_ksettings = type { %struct.ethtool_link_settings, %struct.anon.130 }
%struct.ethtool_link_settings = type { i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [1 x i8], [7 x i32], [0 x i32] }
%struct.anon.130 = type { [3 x i32], [3 x i32], [3 x i32] }
%struct.ethtool_fecparam = type { i32, i32, i32, i32 }
%struct.ethtool_stats = type { i32, i32, [0 x i64] }
%struct.l3mdev_ops = type opaque
%struct.ndisc_ops = type opaque
%struct.xfrmdev_ops = type { i32 (%struct.xfrm_state*)*, void (%struct.xfrm_state*)*, void (%struct.xfrm_state*)*, i1 (%struct.sk_buff*, %struct.xfrm_state*)*, void (%struct.xfrm_state*)* }
%struct.xfrm_state = type opaque
%struct.tlsdev_ops = type opaque
%struct.header_ops = type { i32 (%struct.sk_buff*, %struct.net_device*, i16, i8*, i8*, i32)*, i32 (%struct.sk_buff*, i8*)*, i32 (%struct.neighbour*, %struct.hh_cache*, i16)*, void (%struct.hh_cache*, %struct.net_device*, i8*)*, i1 (i8*, i32)*, i16 (%struct.sk_buff*)* }
%struct.hh_cache = type { i32, %struct.seqlock_t, [32 x i32] }
%struct.seqlock_t = type { %struct.seqcount, %struct.spinlock }
%struct.netdev_hw_addr_list = type { %struct.list_head, i32 }
%struct.vlan_info = type opaque
%struct.dsa_port = type opaque
%struct.tipc_bearer = type opaque
%struct.in_device = type opaque
%struct.dn_dev = type opaque
%struct.inet6_dev = type opaque
%struct.wireless_dev = type opaque
%struct.wpan_dev = type opaque
%struct.mpls_dev = type opaque
%struct.netdev_rx_queue = type { %struct.rps_map*, %struct.rps_dev_flow_table*, %struct.kobject, %struct.net_device*, [108 x i8], %struct.xdp_rxq_info, %struct.xdp_umem*, [124 x i8] }
%struct.rps_map = type { i32, %struct.callback_head, [0 x i16] }
%struct.rps_dev_flow_table = type { i32, %struct.callback_head, [0 x %struct.rps_dev_flow] }
%struct.rps_dev_flow = type { i16, i16, i32 }
%struct.xdp_rxq_info = type { %struct.net_device*, i32, i32, %struct.xdp_mem_info, [108 x i8] }
%struct.xdp_umem = type opaque
%struct.nf_hook_entries = type opaque
%struct.cpu_rmap = type opaque
%struct.netdev_queue = type { %struct.net_device*, %struct.Qdisc*, %struct.Qdisc*, %struct.kobject, i32, i32, %struct.net_device*, %struct.xdp_umem*, [92 x i8], %struct.spinlock, i32, i32, i32, [72 x i8], %struct.dql }
%struct.dql = type { i32, i32, i32, [116 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [88 x i8] }
%struct.Qdisc = type { i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, i32, i32, %struct.Qdisc_ops*, %struct.qdisc_size_table*, %struct.hlist_node, i32, i32, %struct.netdev_queue*, %struct.net_rate_estimator*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, i32, %struct.refcount_struct, [64 x i8], %struct.sk_buff_head, %struct.qdisc_skb_head, %struct.gnet_stats_basic_packed, %struct.seqcount, %struct.gnet_stats_queue, i32, %struct.Qdisc*, %struct.sk_buff_head, [12 x i8], %struct.spinlock, %struct.spinlock, i8, %struct.callback_head, [28 x i8] }
%struct.Qdisc_ops = type { %struct.Qdisc_ops*, %struct.Qdisc_class_ops*, [16 x i8], i32, i32, i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, %struct.sk_buff* (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, %struct.sk_buff*)*, i32 (%struct.Qdisc*, %struct.gnet_dump*)*, void (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*)*, i32 (%struct.Qdisc*)*, %struct.module* }
%struct.Qdisc_class_ops = type { i32, %struct.netdev_queue* (%struct.Qdisc*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i32, %struct.Qdisc*, %struct.Qdisc**, %struct.netlink_ext_ack*)*, %struct.Qdisc* (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, i32, %struct.nlattr**, i32*, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, %struct.qdisc_walker*)*, %struct.tcf_block* (%struct.Qdisc*, i32, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i32, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, %struct.sk_buff*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i32, %struct.gnet_dump*)* }
%struct.tcmsg = type { i8, i8, i16, i32, i32, i32, i32 }
%struct.qdisc_walker = type opaque
%struct.tcf_block = type { %struct.mutex, %struct.list_head, i32, i32, %struct.refcount_struct, %struct.net*, %struct.Qdisc*, %struct.rw_semaphore, %struct.flow_block, %struct.list_head, i8, %struct.atomic_t, i32, i32, %struct.anon.134, %struct.callback_head, [128 x %struct.hlist_head], %struct.mutex }
%struct.flow_block = type { %struct.list_head }
%struct.anon.134 = type { %struct.tcf_chain*, %struct.list_head }
%struct.tcf_chain = type { %struct.mutex, %struct.tcf_proto*, %struct.list_head, %struct.tcf_block*, i32, i32, i32, i8, i8, %struct.tcf_proto_ops*, i8*, %struct.callback_head }
%struct.tcf_proto = type { %struct.tcf_proto*, i8*, i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i16, i32, i8*, %struct.tcf_proto_ops*, %struct.tcf_chain*, %struct.spinlock, i8, %struct.refcount_struct, %struct.callback_head, %struct.hlist_node }
%struct.tcf_result = type { %union.anon.131 }
%union.anon.131 = type { %struct.anon.132 }
%struct.anon.132 = type { i32, i32 }
%struct.tcf_proto_ops = type { %struct.list_head, [16 x i8], i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i32 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, i1, %struct.netlink_ext_ack*)*, i8* (%struct.tcf_proto*, i32)*, void (%struct.tcf_proto*, i8*)*, i32 (%struct.net*, %struct.sk_buff*, %struct.tcf_proto*, i32, i32, %struct.nlattr**, i8**, i1, i1, %struct.netlink_ext_ack*)*, i32 (%struct.tcf_proto*, i8*, i8*, i1, %struct.netlink_ext_ack*)*, i1 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, %struct.tcf_walker*, i1)*, i32 (%struct.tcf_proto*, i1, i32 (i32, i8*, i8*)*, i8*, %struct.netlink_ext_ack*)*, void (%struct.tcf_proto*, i8*)*, void (%struct.tcf_proto*, i8*)*, void (i8*, i32, i32, i8*, i32)*, i8* (%struct.net*, %struct.tcf_chain*, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (i8*)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.sk_buff*, %struct.net*, i8*)*, %struct.module*, i32 }
%struct.tcf_walker = type opaque
%struct.gnet_dump = type { %struct.spinlock*, %struct.sk_buff*, %struct.nlattr*, i32, i32, i32, i8*, i32, %struct.tc_stats }
%struct.tc_stats = type { i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.qdisc_size_table = type { %struct.callback_head, %struct.list_head, %struct.tc_sizespec, i32, [0 x i16] }
%struct.tc_sizespec = type { i8, i8, i16, i32, i32, i32, i32, i32 }
%struct.net_rate_estimator = type opaque
%struct.gnet_stats_basic_cpu = type { %struct.gnet_stats_basic_packed, %struct.u64_stats_sync }
%struct.u64_stats_sync = type { %struct.seqcount }
%struct.qdisc_skb_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.gnet_stats_basic_packed = type { i64, i64 }
%struct.gnet_stats_queue = type { i32, i32, i32, i32, i32 }
%struct.xdp_dev_bulk_queue = type opaque
%struct.xps_dev_maps = type { %struct.callback_head, [0 x %struct.xps_map*] }
%struct.xps_map = type { i32, i32, %struct.callback_head, [0 x i16] }
%struct.mini_Qdisc = type { %struct.tcf_proto*, %struct.tcf_block*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, %struct.callback_head }
%struct.timer_list = type { %struct.hlist_node, i32, void (%struct.timer_list*)*, i32, %struct.lockdep_map }
%struct.netpoll_info = type opaque
%struct.possible_net_t = type { %struct.net* }
%union.anon.135 = type { i8* }
%struct.garp_port = type opaque
%struct.mrp_port = type opaque
%struct.device = type { %struct.kobject, %struct.device*, %struct.device_private*, i8*, %struct.device_type*, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.mutex, %struct.mutex, %struct.dev_links_info, %struct.dev_pm_info, %struct.dev_pm_domain*, %struct.irq_domain*, %struct.dev_pin_info*, %struct.list_head, %struct.dma_map_ops*, i64*, i64, i64, i32, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.cma*, %struct.dev_archdata, %struct.device_node*, %struct.fwnode_handle*, i32, i32, %struct.spinlock, %struct.list_head, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, %struct.dev_iommu*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, [1 x i32])*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key, i8 }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, i32, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, [1 x i32])*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.attribute_group**, %struct.dev_pm_ops*, void (%struct.device*)*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_links_info = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, i8, i32 }
%struct.dev_pm_info = type { %struct.pm_message, i16, i32, %struct.spinlock, %struct.list_head, %struct.completion, %struct.wakeup_source*, i8, %struct.hrtimer, i32, %struct.work_struct, %struct.wait_queue_head, %struct.wake_irq*, %struct.atomic_t, %struct.atomic_t, i16, i32, i32, i32, i32, i32, i64, i64, i64, i64, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.wakeup_source = type { i8*, i32, %struct.list_head, %struct.spinlock, %struct.wake_irq*, %struct.timer_list, i32, i64, i64, i64, i64, i64, i32, i32, i32, i32, i32, %struct.device*, i8 }
%struct.wake_irq = type opaque
%struct.pm_subsys_data = type { %struct.spinlock, i32, %struct.list_head, %struct.pm_domain_data* }
%struct.pm_domain_data = type opaque
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, i32 (%struct.device*)*, void (%struct.device*, i1)*, i32 (%struct.device*)*, void (%struct.device*)*, void (%struct.device*)* }
%struct.irq_domain = type opaque
%struct.dev_pin_info = type opaque
%struct.dma_map_ops = type { i8* (%struct.device*, i32, i32*, i32, i32)*, void (%struct.device*, i32, i8*, i32, i32)*, i32 (%struct.device*, %struct.vm_area_struct*, i8*, i32, i32, i32)*, i32 (%struct.device*, %struct.sg_table*, i8*, i32, i32, i32)*, i32 (%struct.device*, %struct.page*, i32, i32, i32, i32)*, void (%struct.device*, i32, i32, i32, i32)*, i32 (%struct.device*, %struct.scatterlist*, i32, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32, i32)*, i32 (%struct.device*, i32, i32, i32, i32)*, void (%struct.device*, i32, i32, i32, i32)*, void (%struct.device*, i32, i32, i32)*, void (%struct.device*, i32, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, i8*, i32, i32)*, i32 (%struct.device*, i64)*, i64 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.sg_table = type { %struct.scatterlist*, i32, i32 }
%struct.page = type { i32, %union.anon.68, %union.anon.84, %struct.atomic_t, %struct.mem_cgroup* }
%union.anon.68 = type { %struct.anon.69 }
%struct.anon.69 = type { %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.84 = type { %struct.atomic_t }
%struct.device_dma_parameters = type { i32, i32 }
%struct.dma_coherent_mem = type opaque
%struct.cma = type opaque
%struct.dev_archdata = type { i8*, %struct.dma_iommu_mapping*, i8 }
%struct.dma_iommu_mapping = type opaque
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
%struct.nla_policy = type { i8, i8, i16, %union.anon.136 }
%union.anon.136 = type { i32 }
%struct.dcbnl_rtnl_ops = type { i32 (%struct.net_device*, %struct.ieee_ets*)*, i32 (%struct.net_device*, %struct.ieee_ets*)*, i32 (%struct.net_device*, %struct.ieee_maxrate*)*, i32 (%struct.net_device*, %struct.ieee_maxrate*)*, i32 (%struct.net_device*, %struct.ieee_qcn*)*, i32 (%struct.net_device*, %struct.ieee_qcn*)*, i32 (%struct.net_device*, %struct.ieee_qcn_stats*)*, i32 (%struct.net_device*, %struct.ieee_pfc*)*, i32 (%struct.net_device*, %struct.ieee_pfc*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.ieee_ets*)*, i32 (%struct.net_device*, %struct.ieee_pfc*)*, i8 (%struct.net_device*)*, i8 (%struct.net_device*, i8)*, void (%struct.net_device*, i8*)*, void (%struct.net_device*, i32, i8, i8, i8, i8)*, void (%struct.net_device*, i32, i8)*, void (%struct.net_device*, i32, i8, i8, i8, i8)*, void (%struct.net_device*, i32, i8)*, void (%struct.net_device*, i32, i8*, i8*, i8*, i8*)*, void (%struct.net_device*, i32, i8*)*, void (%struct.net_device*, i32, i8*, i8*, i8*, i8*)*, void (%struct.net_device*, i32, i8*)*, void (%struct.net_device*, i32, i8)*, void (%struct.net_device*, i32, i8*)*, i8 (%struct.net_device*)*, i8 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i8)*, i8 (%struct.net_device*)*, void (%struct.net_device*, i8)*, void (%struct.net_device*, i32, i32*)*, void (%struct.net_device*, i32, i32)*, void (%struct.net_device*, i32, i8*)*, void (%struct.net_device*, i32, i8)*, i32 (%struct.net_device*, i8, i16, i8)*, i32 (%struct.net_device*, i8, i16)*, i8 (%struct.net_device*, i32, i8*)*, i8 (%struct.net_device*, i32, i8)*, i8 (%struct.net_device*)*, i8 (%struct.net_device*, i8)*, i32 (%struct.net_device*, %struct.dcb_peer_app_info*, i16*)*, i32 (%struct.net_device*, %struct.dcb_app*)*, i32 (%struct.net_device*, %struct.cee_pg*)*, i32 (%struct.net_device*, %struct.cee_pfc*)*, i32 (%struct.net_device*, %struct.dcbnl_buffer*)*, i32 (%struct.net_device*, %struct.dcbnl_buffer*)* }
%struct.ieee_maxrate = type { [8 x i64] }
%struct.ieee_qcn = type { [8 x i8], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32], [8 x i32] }
%struct.ieee_qcn_stats = type { [8 x i64], [8 x i32] }
%struct.ieee_ets = type { i8, i8, i8, [8 x i8], [8 x i8], [8 x i8], [8 x i8], [8 x i8], [8 x i8], [8 x i8] }
%struct.ieee_pfc = type { i8, i8, i8, i16, [8 x i64], [8 x i64] }
%struct.dcb_peer_app_info = type { i8, i8 }
%struct.dcb_app = type { i8, i8, i16 }
%struct.cee_pg = type { i8, i8, i8, i8, [8 x i8], [8 x i8] }
%struct.cee_pfc = type { i8, i8, i8, i8 }
%struct.dcbnl_buffer = type { [8 x i8], [8 x i32], i32 }
%struct.netdev_tc_txq = type { i16, i16 }
%struct.netprio_map = type { %struct.callback_head, i32, [0 x i32] }
%struct.phy_device = type opaque
%struct.sfp_bus = type opaque
%struct.macsec_ops = type opaque
%struct.netns_core = type { %struct.ctl_table_header*, i32, i32*, %struct.prot_inuse* }
%struct.prot_inuse = type opaque
%struct.netns_mib = type { %struct.tcp_mib*, %struct.ipstats_mib*, %struct.linux_mib*, %struct.udp_mib*, %struct.udp_mib*, %struct.icmp_mib*, %struct.icmpmsg_mib*, %struct.proc_dir_entry*, %struct.udp_mib*, %struct.udp_mib*, %struct.ipstats_mib*, %struct.icmpv6_mib*, %struct.icmpv6msg_mib*, %struct.linux_xfrm_mib*, %struct.linux_tls_mib*, %struct.mptcp_mib* }
%struct.tcp_mib = type { [16 x i32] }
%struct.linux_mib = type { [122 x i32] }
%struct.icmp_mib = type { [28 x i32] }
%struct.icmpmsg_mib = type { [512 x %struct.atomic_t] }
%struct.udp_mib = type { [9 x i32] }
%struct.ipstats_mib = type { [37 x i64], %struct.u64_stats_sync }
%struct.icmpv6_mib = type { [6 x i32] }
%struct.icmpv6msg_mib = type { [512 x %struct.atomic_t] }
%struct.linux_xfrm_mib = type { [29 x i32] }
%struct.linux_tls_mib = type { [11 x i32] }
%struct.mptcp_mib = type opaque
%struct.netns_packet = type { %struct.mutex, %struct.hlist_head }
%struct.netns_unix = type { i32, %struct.ctl_table_header* }
%struct.netns_nexthop = type { %struct.rb_root, %struct.hlist_head*, i32, i32, %struct.atomic_notifier_head }
%struct.atomic_notifier_head = type { %struct.spinlock, %struct.notifier_block* }
%struct.netns_ipv4 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ipv4_devconf*, %struct.ipv4_devconf*, %struct.ip_ra_chain*, %struct.mutex, %struct.fib_rules_ops*, i8, i32, %struct.fib_table*, %struct.fib_table*, i8, i32, %struct.hlist_head*, i8, %struct.sock*, %struct.sock**, %struct.sock*, %struct.inet_peer_base*, %struct.sock**, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, i32, i32, i32, i32, i32, i32, %struct.local_ports, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, [20 x i8], %struct.inet_timewait_death_row, i32, i32, %struct.tcp_congestion_ops*, %struct.tcp_fastopen_context*, %struct.spinlock, i32, %struct.atomic_t, i32, i32, i32, i32, i32, i32, i32, i32, %struct.ping_group_range, %struct.atomic_t, i32*, i32, %struct.list_head, %struct.fib_rules_ops*, i32, i32, %struct.fib_notifier_ops*, i32, %struct.fib_notifier_ops*, i32, %struct.atomic_t, %struct.siphash_key_t }
%struct.ipv4_devconf = type opaque
%struct.ip_ra_chain = type opaque
%struct.fib_table = type opaque
%struct.inet_peer_base = type opaque
%struct.fqdir = type { i32, i32, i32, i32, %struct.inet_frags*, %struct.net*, i8, [103 x i8], %struct.rhashtable, [28 x i8], %struct.atomic_t, %struct.work_struct, [80 x i8] }
%struct.inet_frags = type { i32, void (%struct.inet_frag_queue*, i8*)*, void (%struct.inet_frag_queue*)*, void (%struct.timer_list*)*, %struct.kmem_cache*, i8*, %struct.rhashtable_params, %struct.refcount_struct, %struct.completion }
%struct.inet_frag_queue = type { %struct.rhash_head, %union.anon.47, %struct.timer_list, %struct.spinlock, %struct.refcount_struct, %struct.rb_root, %struct.sk_buff*, %struct.sk_buff*, i64, i32, i32, i8, i16, %struct.fqdir*, %struct.callback_head }
%struct.rhash_head = type { %struct.rhash_head* }
%union.anon.47 = type { %struct.frag_v6_compare_key }
%struct.frag_v6_compare_key = type { %struct.in6_addr, %struct.in6_addr, i32, i32, i32 }
%struct.in6_addr = type { %union.anon.48 }
%union.anon.48 = type { [4 x i32] }
%struct.kmem_cache = type opaque
%struct.rhashtable_params = type { i16, i16, i16, i16, i32, i16, i8, i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)*, i32 (%struct.rhashtable_compare_arg*, i8*)* }
%struct.rhashtable_compare_arg = type { %struct.rhashtable*, i8* }
%struct.rhashtable = type { %struct.bucket_table*, i32, i32, %struct.rhashtable_params, i8, %struct.work_struct, %struct.mutex, %struct.spinlock, %struct.atomic_t }
%struct.bucket_table = type { i32, i32, i32, %struct.list_head, %struct.callback_head, %struct.bucket_table*, %struct.lockdep_map, [68 x i8], [0 x %struct.rhash_lock_head*] }
%struct.rhash_lock_head = type {}
%struct.xt_table = type opaque
%struct.local_ports = type { %struct.seqlock_t, [2 x i32], i8 }
%struct.inet_timewait_death_row = type { %struct.atomic_t, [124 x i8], %struct.inet_hashinfo*, i32, [120 x i8] }
%struct.inet_hashinfo = type opaque
%struct.tcp_congestion_ops = type opaque
%struct.tcp_fastopen_context = type opaque
%struct.ping_group_range = type { %struct.seqlock_t, [2 x %struct.kgid_t] }
%struct.fib_rules_ops = type opaque
%struct.fib_notifier_ops = type opaque
%struct.siphash_key_t = type { [2 x i64] }
%struct.netns_ipv6 = type { %struct.netns_sysctl_ipv6, %struct.ipv6_devconf*, %struct.ipv6_devconf*, %struct.inet_peer_base*, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.fib6_info*, %struct.rt6_info*, %struct.rt6_statistics*, %struct.timer_list, %struct.hlist_head*, %struct.fib6_table*, %struct.list_head, [100 x i8], %struct.dst_ops, %struct.rwlock_t, %struct.spinlock, i32, i32, i32, i8, i32, %struct.rt6_info*, %struct.rt6_info*, %struct.fib6_table*, %struct.fib_rules_ops*, %struct.sock**, %struct.sock*, %struct.sock*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.fib_rules_ops*, %struct.atomic_t, %struct.atomic_t, %struct.seg6_pernet_data*, %struct.fib_notifier_ops*, %struct.fib_notifier_ops*, i32, %struct.anon.61, [24 x i8] }
%struct.netns_sysctl_ipv6 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x i32], i32*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8 }
%struct.ipv6_devconf = type opaque
%struct.fib6_info = type opaque
%struct.rt6_statistics = type opaque
%struct.dst_ops = type { i16, i32, i32 (%struct.dst_ops*)*, %struct.dst_entry* (%struct.dst_entry*, i32)*, i32 (%struct.dst_entry*)*, i32 (%struct.dst_entry*)*, i32* (%struct.dst_entry*, i32)*, void (%struct.dst_entry*)*, void (%struct.dst_entry*, %struct.net_device*, i32)*, %struct.dst_entry* (%struct.dst_entry*)*, void (%struct.sk_buff*)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*, i32, i1)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*)*, i32 (%struct.net*, %struct.sock*, %struct.sk_buff*)*, %struct.neighbour* (%struct.dst_entry*, %struct.sk_buff*, i8*)*, void (%struct.dst_entry*, i8*)*, %struct.kmem_cache*, [60 x i8], %struct.percpu_counter, [56 x i8] }
%struct.dst_entry = type opaque
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.rwlock_t = type { %struct.arch_rwlock_t, i32, i32, i8*, %struct.lockdep_map }
%struct.arch_rwlock_t = type { i32 }
%struct.rt6_info = type opaque
%struct.fib6_table = type opaque
%struct.seg6_pernet_data = type opaque
%struct.anon.61 = type { %struct.hlist_head, %struct.spinlock, i32 }
%struct.netns_ieee802154_lowpan = type { %struct.netns_sysctl_lowpan, %struct.fqdir* }
%struct.netns_sysctl_lowpan = type { %struct.ctl_table_header* }
%struct.netns_sctp = type { %struct.sctp_mib*, %struct.proc_dir_entry*, %struct.ctl_table_header*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.timer_list, %struct.list_head, %struct.spinlock, %struct.spinlock, i32, i32, i32, i32, i32, i32, i32, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.sctp_mib = type opaque
%struct.netns_dccp = type { %struct.sock*, %struct.sock* }
%struct.netns_nf = type { %struct.proc_dir_entry*, %struct.nf_queue_handler*, [13 x %struct.nf_logger*], %struct.ctl_table_header*, [5 x %struct.nf_hook_entries*], [5 x %struct.nf_hook_entries*], [3 x %struct.nf_hook_entries*], [5 x %struct.nf_hook_entries*], [7 x %struct.nf_hook_entries*], i8, i8 }
%struct.nf_queue_handler = type opaque
%struct.nf_logger = type opaque
%struct.netns_xt = type { [13 x %struct.list_head], i8, i8, %struct.ebt_table*, %struct.ebt_table*, %struct.ebt_table* }
%struct.ebt_table = type opaque
%struct.netns_ct = type { %struct.atomic_t, i32, %struct.delayed_work, i8, i8, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, %struct.ct_pcpu*, %struct.ip_conntrack_stat*, %struct.nf_ct_event_notifier*, %struct.nf_exp_event_notifier*, %struct.nf_ip_net, i32 }
%struct.ct_pcpu = type { %struct.spinlock, %struct.hlist_nulls_head, %struct.hlist_nulls_head }
%struct.hlist_nulls_head = type { %struct.hlist_nulls_node* }
%struct.hlist_nulls_node = type { %struct.hlist_nulls_node*, %struct.hlist_nulls_node** }
%struct.ip_conntrack_stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.nf_ct_event_notifier = type opaque
%struct.nf_exp_event_notifier = type opaque
%struct.nf_ip_net = type { %struct.nf_generic_net, %struct.nf_tcp_net, %struct.nf_udp_net, %struct.nf_icmp_net, %struct.nf_icmp_net, %struct.nf_dccp_net, %struct.nf_sctp_net, %struct.nf_gre_net }
%struct.nf_generic_net = type { i32 }
%struct.nf_tcp_net = type { [14 x i32], i32, i32, i32 }
%struct.nf_udp_net = type { [2 x i32] }
%struct.nf_icmp_net = type { i32 }
%struct.nf_dccp_net = type { i32, [10 x i32] }
%struct.nf_sctp_net = type { [10 x i32] }
%struct.nf_gre_net = type { %struct.list_head, [2 x i32] }
%struct.netns_nftables = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, i32, i8, i8 }
%struct.netns_nf_frag = type { %struct.fqdir* }
%struct.sk_buff_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.net_generic = type opaque
%struct.netns_bpf = type { [1 x %struct.bpf_prog*], [1 x %struct.bpf_link*] }
%struct.bpf_link = type { %struct.atomic64_t, i32, i32, %struct.bpf_link_ops*, %struct.bpf_prog*, %struct.work_struct }
%struct.bpf_link_ops = type { void (%struct.bpf_link*)*, void (%struct.bpf_link*)*, i32 (%struct.bpf_link*, %struct.bpf_prog*, %struct.bpf_prog*)*, void (%struct.bpf_link*, %struct.seq_file*)*, i32 (%struct.bpf_link*, %struct.bpf_link_info*)* }
%struct.seq_file = type { i8*, i32, i32, i32, i32, i64, i64, %struct.mutex, %struct.seq_operations*, i32, %struct.file*, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.bpf_link_info = type { i32, i32, i32, %union.anon.62 }
%union.anon.62 = type { %struct.anon.63 }
%struct.anon.63 = type { i64, i32 }
%struct.netns_xfrm = type { %struct.list_head, %struct.hlist_head*, %struct.hlist_head*, %struct.hlist_head*, i32, i32, %struct.work_struct, %struct.list_head, %struct.hlist_head*, i32, [3 x %struct.hlist_head], [3 x %struct.xfrm_policy_hash], [6 x i32], %struct.work_struct, %struct.xfrm_policy_hthresh, %struct.list_head, %struct.sock*, %struct.sock*, i32, i32, i32, i32, %struct.ctl_table_header*, [20 x i8], %struct.dst_ops, %struct.dst_ops, %struct.spinlock, %struct.spinlock, %struct.mutex, [76 x i8] }
%struct.xfrm_policy_hash = type { %struct.hlist_head*, i32, i8, i8, i8, i8 }
%struct.xfrm_policy_hthresh = type { %struct.work_struct, %struct.seqlock_t, i8, i8, i8, i8 }
%struct.netns_ipvs = type opaque
%struct.netns_mpls = type { i32, i32, i32, %struct.mpls_route**, %struct.ctl_table_header* }
%struct.mpls_route = type opaque
%struct.netns_can = type { %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.can_dev_rcv_lists*, %struct.spinlock, %struct.timer_list, %struct.can_pkg_stats*, %struct.can_rcv_lists_stats*, %struct.hlist_head }
%struct.can_dev_rcv_lists = type opaque
%struct.can_pkg_stats = type opaque
%struct.can_rcv_lists_stats = type opaque
%struct.netns_xdp = type { %struct.mutex, %struct.hlist_head }
%struct.sock = type opaque
%struct.time_namespace = type opaque
%struct.cgroup_namespace = type { %struct.refcount_struct, %struct.ns_common, %struct.user_namespace*, %struct.ucounts*, %struct.css_set* }
%struct.signal_struct = type { %struct.refcount_struct, %struct.atomic_t, i32, %struct.list_head, %struct.wait_queue_head, %struct.task_struct*, %struct.sigpending, %struct.hlist_head, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, i64, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.posix_cputimers, [4 x %struct.pid*], %struct.pid*, i32, %struct.tty_struct*, %struct.autogroup*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.prev_cputime, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, %struct.tty_audit_buf*, i8, i16, i16, %struct.mm_struct*, %struct.mutex, %struct.mutex }
%struct.cpu_itimer = type { i64, i64 }
%struct.thread_group_cputimer = type { %struct.task_cputime_atomic }
%struct.task_cputime_atomic = type { %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t }
%struct.tty_struct = type opaque
%struct.autogroup = type opaque
%struct.rlimit = type { i32, i32 }
%struct.pacct_struct = type { i32, i32, i32, i64, i64, i32, i32 }
%struct.taskstats = type { i16, i32, i8, i8, i64, i64, i64, i64, i64, i64, i64, i64, [32 x i8], i8, [3 x i8], [4 x i8], i32, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.spinlock, %struct.refcount_struct, %struct.wait_queue_head, [64 x %struct.k_sigaction] }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i32, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [2 x i32] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.kuid_t = type { i32 }
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.wake_q_node = type { %struct.wake_q_node* }
%struct.rb_root_cached = type { %struct.rb_root, %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.mutex_waiter = type { %struct.list_head, %struct.task_struct*, %struct.ww_acquire_ctx*, i8* }
%struct.ww_acquire_ctx = type opaque
%struct.held_lock = type { i64, i32, %struct.lockdep_map*, %struct.lockdep_map*, i64, i64, i32, i32 }
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.io_context = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i16, i32, i32, %struct.xarray, %struct.io_cq*, %struct.hlist_head, %struct.work_struct }
%struct.io_cq = type { %struct.request_queue*, %struct.io_context*, %union.anon.86, %union.anon.87, i32 }
%union.anon.86 = type { %struct.list_head }
%union.anon.87 = type { %struct.hlist_node }
%struct.capture_control = type opaque
%struct.kernel_siginfo = type { %struct.anon.88 }
%struct.anon.88 = type { i32, i32, i32, %union.__sifields }
%union.__sifields = type { %struct.anon.92 }
%struct.anon.92 = type { i32, i32, i32, i32, i32 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i32] }
%struct.css_set = type { [13 x %struct.cgroup_subsys_state*], %struct.refcount_struct, %struct.css_set*, %struct.cgroup*, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, [13 x %struct.list_head], %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.cgroup*, %struct.cgroup*, %struct.css_set*, i8, %struct.callback_head }
%struct.cgroup_subsys_state = type { %struct.cgroup*, %struct.cgroup_subsys*, %struct.percpu_ref, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i64, %struct.atomic_t, %struct.work_struct, %struct.rcu_work, %struct.cgroup_subsys_state* }
%struct.cgroup_subsys = type { %struct.cgroup_subsys_state* (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*, i32)*, i32 (%struct.seq_file*, %struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void ()*, i32 (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.cgroup_subsys_state*)*, i8, i32, i8*, i8*, %struct.cgroup_root*, %struct.idr, %struct.list_head, %struct.cftype*, %struct.cftype*, i32 }
%struct.cgroup_taskset = type opaque
%struct.cgroup_root = type { %struct.kernfs_root*, i32, i32, %struct.cgroup, i64, %struct.atomic_t, %struct.list_head, i32, [4096 x i8], [64 x i8] }
%struct.kernfs_root = type { %struct.kernfs_node*, i32, %struct.idr, i32, i32, %struct.kernfs_syscall_ops*, %struct.list_head, %struct.wait_queue_head }
%struct.kernfs_syscall_ops = type { i32 (%struct.seq_file*, %struct.kernfs_root*)*, i32 (%struct.kernfs_node*, i8*, i16)*, i32 (%struct.kernfs_node*)*, i32 (%struct.kernfs_node*, %struct.kernfs_node*, i8*)*, i32 (%struct.seq_file*, %struct.kernfs_node*, %struct.kernfs_root*)* }
%struct.cgroup = type { %struct.cgroup_subsys_state, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.kernfs_node*, %struct.cgroup_file, %struct.cgroup_file, i16, i16, i16, i16, [13 x %struct.cgroup_subsys_state*], %struct.cgroup_root*, %struct.list_head, [13 x %struct.list_head], %struct.cgroup*, %struct.cgroup*, %struct.cgroup_rstat_cpu*, %struct.list_head, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.prev_cputime, %struct.list_head, %struct.mutex, %struct.wait_queue_head, %struct.work_struct, %struct.psi_group, %struct.cgroup_bpf, %struct.atomic_t, %struct.cgroup_freezer_state, [0 x i64] }
%struct.cgroup_file = type { %struct.kernfs_node*, i32, %struct.timer_list }
%struct.cgroup_rstat_cpu = type { %struct.u64_stats_sync, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.cgroup*, %struct.cgroup* }
%struct.cgroup_base_stat = type { %struct.task_cputime }
%struct.task_cputime = type { i64, i64, i64 }
%struct.psi_group = type { %struct.mutex, %struct.psi_group_cpu*, [5 x i64], i64, i64, %struct.delayed_work, [2 x [5 x i64]], [5 x [3 x i32]], %struct.atomic_t, %struct.kthread_worker*, %struct.kthread_delayed_work, %struct.mutex, %struct.list_head, [5 x i32], i32, i64, [5 x i64], i64, i64 }
%struct.psi_group_cpu = type { %struct.seqcount, [4 x i32], i32, [6 x i32], i64, [40 x i8], [2 x [6 x i32]], [80 x i8] }
%struct.kthread_worker = type { i32, %struct.raw_spinlock, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.kthread_work* }
%struct.kthread_work = type { %struct.list_head, void (%struct.kthread_work*)*, %struct.kthread_worker*, i32 }
%struct.kthread_delayed_work = type { %struct.kthread_work, %struct.timer_list }
%struct.cgroup_bpf = type { [34 x %struct.bpf_prog_array*], [34 x %struct.list_head], [34 x i32], %struct.bpf_prog_array*, %struct.percpu_ref, %struct.work_struct }
%struct.bpf_prog_array = type { %struct.callback_head, [0 x %struct.bpf_prog_array_item] }
%struct.bpf_prog_array_item = type { %struct.bpf_prog*, [2 x %struct.bpf_cgroup_storage*] }
%struct.bpf_cgroup_storage = type { %union.anon.85, %struct.bpf_cgroup_storage_map*, %struct.bpf_cgroup_storage_key, %struct.list_head, %struct.rb_node, %struct.callback_head }
%union.anon.85 = type { %struct.bpf_storage_buffer* }
%struct.bpf_storage_buffer = type { %struct.callback_head, [0 x i8] }
%struct.bpf_cgroup_storage_map = type opaque
%struct.bpf_cgroup_storage_key = type { i64, i32 }
%struct.cgroup_freezer_state = type { i8, i32, i32, i32 }
%struct.cftype = type { [64 x i8], i32, i32, i32, i32, %struct.cgroup_subsys*, %struct.list_head, %struct.kernfs_ops*, i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, %struct.lock_class_key }
%struct.kernfs_ops = type { i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32, i8, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)*, %struct.lock_class_key }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, %struct.seq_file*, i8*, %struct.mutex, %struct.mutex, i32, %struct.list_head, i8*, i32, i8, %struct.vm_operations_struct* }
%struct.poll_table_struct = type opaque
%struct.percpu_ref = type { %struct.atomic_t, i32, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head }
%struct.rcu_work = type { %struct.work_struct, %struct.callback_head, %struct.workqueue_struct* }
%struct.robust_list_head = type opaque
%struct.futex_pi_state = type opaque
%struct.perf_event_context = type opaque
%struct.rseq = type { i32, i32, %union.anon.99, i32, [12 x i8] }
%union.anon.99 = type { i64 }
%struct.tlbflush_unmap_batch = type {}
%union.anon.101 = type { %struct.callback_head }
%struct.pipe_inode_info = type { %struct.mutex, %struct.wait_queue_head, %struct.wait_queue_head, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer*, %struct.user_struct*, %struct.watch_queue* }
%struct.fasync_struct = type { %struct.rwlock_t, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i32 }
%struct.pipe_buf_operations = type { i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.watch_queue = type opaque
%struct.page_frag = type { %struct.page*, i16, i16 }
%struct.task_delay_info = type opaque
%struct.latency_record = type { [12 x i32], i32, i32, i32 }
%struct.kcov = type opaque
%struct.mem_cgroup = type opaque
%struct.request_queue = type opaque
%struct.uprobe_task = type { i32, %union.anon.102, %struct.uprobe*, i32, %struct.return_instance*, i32 }
%union.anon.102 = type { %struct.anon.103 }
%struct.anon.103 = type { %struct.arch_uprobe_task, i32 }
%struct.arch_uprobe_task = type { i32, i32 }
%struct.uprobe = type opaque
%struct.return_instance = type { %struct.uprobe*, i32, i32, i32, i8, %struct.return_instance* }
%struct.thread_struct = type { i32, i32, i32, %struct.debug_info }
%struct.debug_info = type { [32 x %struct.perf_event*] }
%struct.perf_event = type opaque
%struct.mmu_notifier_subscriptions = type opaque
%struct.uprobes_state = type { %struct.xol_area* }
%struct.xol_area = type opaque
%struct.anon.105 = type { %struct.rb_node, i32 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i32)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*, i32)*, void (%struct.vm_fault*, i32, i32)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i32, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, %struct.page* (%struct.vm_area_struct*, i32)* }
%struct.vm_fault = type { %struct.vm_area_struct*, i32, i32, i32, i32, i32*, %struct.pud_t*, i32, %struct.page*, %struct.page*, i32*, %struct.spinlock*, %struct.page* }
%struct.pud_t = type { %struct.p4d_t }
%struct.p4d_t = type { [2 x i32] }
%struct.vm_userfaultfd_ctx = type { %struct.userfaultfd_ctx* }
%struct.userfaultfd_ctx = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.lockdep_map, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.67, i8*, i64, i16, i16, %struct.kernfs_iattrs* }
%union.anon.67 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.refcount_struct }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i32 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i32 (%struct.module_attribute*, %struct.module_kobject*, i8*, i32)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.module*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.106 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.106 = type { i8* }
%struct.kernel_symbol = type { i32, i8*, i8* }
%struct.module_layout = type { i8*, i32, i32, i32, i32, %struct.mod_tree_node }
%struct.mod_tree_node = type { %struct.module*, %struct.latch_tree_node }
%struct.latch_tree_node = type { [2 x %struct.rb_node] }
%struct.mod_arch_specific = type { [7 x %struct.unwind_table*], %struct.mod_plt_sec, %struct.mod_plt_sec }
%struct.unwind_table = type opaque
%struct.mod_plt_sec = type { %struct.elf32_shdr*, i32 }
%struct.elf32_shdr = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.bug_entry = type { i32, i8*, i16, i16 }
%struct.mod_kallsyms = type { %struct.elf32_sym*, i32, i8*, i8* }
%struct.elf32_sym = type { i32, i32, i32, i8, i8, i16 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.tracepoint = type { i8*, %struct.static_key, i32 ()*, void ()*, %struct.tracepoint_func* }
%struct.static_key = type { %struct.atomic_t, %union.anon.107 }
%union.anon.107 = type { i32 }
%struct.tracepoint_func = type { i8*, i8*, i32 }
%struct.srcu_struct = type { [1 x %struct.srcu_node], [2 x %struct.srcu_node*], %struct.mutex, %struct.spinlock, %struct.mutex, i32, i32, i32, i32, i32, %struct.srcu_data*, i32, %struct.mutex, %struct.completion, %struct.atomic_t, %struct.delayed_work, %struct.lockdep_map }
%struct.srcu_node = type { %struct.spinlock, [4 x i32], [4 x i32], i32, %struct.srcu_node*, i32, i32 }
%struct.srcu_data = type { [2 x i32], [2 x i32], [112 x i8], %struct.spinlock, %struct.rcu_segcblist, i32, i32, i8, %struct.timer_list, %struct.work_struct, %struct.callback_head, %struct.srcu_node*, i32, i32, %struct.srcu_struct*, [40 x i8] }
%struct.rcu_segcblist = type { %struct.callback_head*, [4 x %struct.callback_head**], [4 x i32], %struct.atomic_t, i8, i8 }
%struct.bpf_raw_event_map = type { %struct.tracepoint*, i8*, i32, i32, [16 x i8] }
%struct.jump_entry = type { i32, i32, i32 }
%struct.trace_event_call = type opaque
%struct.trace_eval_map = type opaque
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.super_block*, i32, i8*, i32, i64)*, i32 (%struct.super_block*, i32, i8*, i32, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i32 (%struct.super_block*, %struct.shrink_control*)*, i32 (%struct.super_block*, %struct.shrink_control*)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.spinlock, %struct.atomic_t, %struct.super_block*, %struct.kqid, i64, i32, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.108, i32 }
%union.anon.108 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.shrink_control = type { i32, i32, i32, i32, %struct.mem_cgroup* }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)*, i32 (%struct.inode*, %struct.kprojid_t*)*, i32 (%struct.inode*, i64*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.kprojid_t = type { i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.qc_info*)*, i32 (%struct.super_block*, [2 x i32], %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.kqid*, %struct.qc_dqblk*)*, i32 (%struct.super_block*, [2 x i32], %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.qc_state*)*, i32 (%struct.super_block*, i32)* }
%struct.qc_info = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.qc_dqblk = type { i32, i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, i64, i32 }
%struct.qc_state = type { i32, [3 x %struct.qc_type_state] }
%struct.qc_type_state = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64 }
%struct.export_operations = type opaque
%struct.rw_semaphore = type { %struct.atomic_t, %struct.atomic_t, %struct.optimistic_spin_queue, %struct.raw_spinlock, %struct.list_head, i8*, %struct.lockdep_map }
%struct.xattr_handler = type opaque
%struct.fscrypt_operations = type opaque
%struct.key = type { %struct.refcount_struct, i32, %union.anon.34, %struct.watch_list*, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.35, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i16, i32, %union.anon.36, %union.anon.40, %struct.key_restriction* }
%union.anon.34 = type { %struct.rb_node }
%struct.watch_list = type opaque
%struct.key_user = type opaque
%union.anon.35 = type { i64 }
%union.anon.36 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { i32, %union.anon.37, %struct.key_type*, %struct.key_tag*, i8* }
%union.anon.37 = type { i32 }
%struct.key_type = type opaque
%union.anon.40 = type { %union.key_payload }
%union.key_payload = type { [4 x i8*] }
%struct.key_restriction = type { i32 (%struct.key*, %struct.key_type*, %union.key_payload*, %struct.key*)*, %struct.key*, %struct.key_type* }
%struct.fsverity_operations = type opaque
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
%struct.percpu_rw_semaphore = type { %struct.rcu_sync, i32*, %struct.rcuwait, %struct.wait_queue_head, %struct.atomic_t, %struct.lockdep_map }
%struct.rcu_sync = type { i32, i32, %struct.wait_queue_head, %struct.callback_head }
%struct.rcuwait = type { %struct.task_struct* }
%struct.fsnotify_mark_connector = type opaque
%struct.uuid_t = type { [16 x i8] }
%struct.shrinker = type { i32 (%struct.shrinker*, %struct.shrink_control*)*, i32 (%struct.shrinker*, %struct.shrink_control*)*, i32, i32, i32, %struct.list_head, i32, %struct.atomic_t* }
%struct.workqueue_struct = type opaque
%struct.user_namespace = type { %struct.uid_gid_map, %struct.uid_gid_map, %struct.uid_gid_map, %struct.atomic_t, %struct.user_namespace*, i32, %struct.kuid_t, %struct.kgid_t, %struct.ns_common, i32, %struct.list_head, %struct.key*, %struct.rw_semaphore, %struct.key*, %struct.work_struct, %struct.ctl_table_set, %struct.ctl_table_header*, %struct.ucounts*, [10 x i32] }
%struct.uid_gid_map = type { i32, %union.anon.42 }
%union.anon.42 = type { [5 x %struct.uid_gid_extent] }
%struct.uid_gid_extent = type { i32, i32, i32 }
%struct.list_lru = type { %struct.list_lru_node*, %struct.list_head, i32, i8 }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_lru_one, %struct.list_lru_memcg*, i32, [64 x i8] }
%struct.list_lru_one = type { %struct.list_head, i32 }
%struct.list_lru_memcg = type { %struct.callback_head, [0 x %struct.list_lru_one*] }
%union.anon.117 = type { %struct.list_head }
%union.anon.118 = type { %struct.hlist_node }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i32, %union.anon.109, i32, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.spinlock, i16, i8, i8, i64, %struct.seqcount, i32, %struct.rw_semaphore, i32, i32, %struct.hlist_node, %struct.list_head, %struct.bdi_writeback*, i32, i16, i16, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.110, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %union.anon.111, %struct.file_lock_context*, %struct.address_space, %struct.list_head, %union.anon.114, i32, i32, %struct.fsnotify_mark_connector*, %struct.fscrypt_info*, %struct.fsverity_info*, i8* }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.inode*, %struct.delayed_call*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.path*, %struct.kstat*, i32, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec64*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, [44 x i8] }
%struct.delayed_call = type { void (i8*)*, i8* }
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.file* }
%struct.kstat = type { i32, i16, i32, i32, i64, i64, i64, i32, i32, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.timespec64, i64, i64 }
%struct.fiemap_extent_info = type opaque
%union.anon.109 = type { i32 }
%struct.timespec64 = type { i64, i32 }
%struct.bdi_writeback = type opaque
%union.anon.110 = type { %struct.callback_head }
%union.anon.111 = type { %struct.file_operations* }
%struct.file_lock_context = type { %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head }
%struct.address_space = type { %struct.inode*, %struct.xarray, i32, %struct.atomic_t, %struct.rb_root_cached, %struct.rw_semaphore, i32, i32, i32, %struct.address_space_operations*, i32, i32, %struct.spinlock, %struct.list_head, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, void (%struct.readahead_control*)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i1 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.page*)*, i32 (%struct.page*, i32, i32)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.readahead_control = type opaque
%struct.kiocb = type { %struct.file*, i64, void (%struct.kiocb*, i32, i32)*, i8*, i32, i16, i16, i32 }
%struct.iov_iter = type { i32, i32, i32, %union.anon.70, %union.anon.71 }
%union.anon.70 = type { %struct.iovec* }
%struct.iovec = type { i8*, i32 }
%union.anon.71 = type { %struct.anon.72 }
%struct.anon.72 = type { i32, i32 }
%struct.swap_info_struct = type opaque
%union.anon.114 = type { %struct.pipe_inode_info* }
%struct.fscrypt_info = type opaque
%struct.fsverity_info = type opaque
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, i1)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.vm_area_struct*)*, i32, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.file*, %struct.page*, i32, i32, i64*, i32)*, i32 (%struct.file*, i32, i32, i32, i32)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.pipe_inode_info*, %struct.file*, i64*, i32, i32)*, i32 (%struct.file*, i64*, %struct.pipe_inode_info*, i32, i32)*, i32 (%struct.file*, i32, %struct.file_lock**, i8**)*, i32 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)*, i32 (%struct.file*, i64, %struct.file*, i64, i32, i32)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i32 (%struct.file*, i64, i64, i32)* }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, i8*, i32, i8, i32, i32, %struct.wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i32, i32, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.112 }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i8* (i8*)*, void (i8*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock*, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)*, i1 (%struct.file_lock*)* }
%union.anon.112 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.cred = type { %struct.atomic_t, %struct.atomic_t, i8*, i32, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %union.anon.46 }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.group_info = type { %struct.atomic_t, i32, [0 x %struct.kgid_t] }
%union.anon.46 = type { %struct.callback_head }
%struct.file_ra_state = type { i32, i32, i32, i32, i32, i64 }
%struct.bpf_insn = type { i8, i8, i16, i32 }
%struct.bpf_map_memory = type { i32, %struct.user_struct* }
%struct.work_struct = type { %struct.atomic_t, %struct.list_head, void (%struct.work_struct*)*, %struct.lockdep_map }
%struct.bpf_ksym = type { i32, i32, [128 x i8], %struct.list_head, %struct.latch_tree_node, i8 }
%struct.bpf_prog_ops = type { i32 (%struct.bpf_prog*, %union.bpf_attr*, %union.bpf_attr*)* }
%struct.user_struct = type { %struct.refcount_struct, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, i32, i32, %struct.atomic_t, %struct.hlist_node, %struct.kuid_t, %struct.atomic_t, %struct.ratelimit_state }
%struct.ratelimit_state = type { %struct.raw_spinlock, i32, i32, i32, i32, i32, i32 }
%struct.bpf_prog_offload = type { %struct.bpf_prog*, %struct.net_device*, %struct.bpf_offload_dev*, i8*, %struct.list_head, i8, i8, i8*, i32 }
%struct.bpf_offload_dev = type opaque
%struct.btf = type opaque
%struct.bpf_func_info = type { i32, i32 }
%struct.bpf_func_info_aux = type { i16, i8 }
%struct.bpf_line_info = type { i32, i32, i32, i32 }
%struct.exception_table_entry = type { i32, i32 }
%struct.bpf_prog_stats = type { i64, i64, %struct.u64_stats_sync }
%union.anon.138 = type { %struct.work_struct }
%struct.sock_fprog_kern = type { i16, %struct.sock_filter* }
%struct.sock_filter = type { i16, i8, i8, i32 }
%struct.jit_ctx = type { %struct.bpf_prog*, i32, i32, i32, i32, i32, i32*, i32*, i32, i16, i16, i32* }
%struct.bpf_binary_header = type { i32, [4 x i8], [0 x i8] }
%struct.thread_info = type { i32, i32, i32, %struct.task_struct*, i32, i32, %struct.cpu_context_save, i32, [16 x i8], [2 x i32], [4 x i8], %union.fp_state, %union.vfp_state, i32 }
%struct.cpu_context_save = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%union.fp_state = type { %struct.iwmmxt_struct }
%struct.iwmmxt_struct = type { [38 x i32] }
%union.vfp_state = type { %struct.vfp_hard_struct }
%struct.vfp_hard_struct = type { [32 x i64], i32, i32, i32, i32, i32 }
%struct.vm_struct = type { %struct.vm_struct*, i8*, i32, i32, %struct.page**, i32, i32, i8* }

@cpu_cache = external dso_local local_unnamed_addr global %struct.cpu_cache_fns, align 4
@bpf_jit_enable = external dso_local local_unnamed_addr global i32, align 4
@bpf2a32 = internal constant [15 x [2 x i8]] [[2 x i8] c"\01\00", [2 x i8] c"\03\02", [2 x i8] c"\FC\F8", [2 x i8] c"\F4\F0", [2 x i8] c"\EC\E8", [2 x i8] c"\E4\E0", [2 x i8] c"\05\04", [2 x i8] c"\DC\D8", [2 x i8] c"\D4\D0", [2 x i8] c"\CC\C8", [2 x i8] c"\C4\C0", [2 x i8] c"\B4\B0", [2 x i8] c"\07\06", [2 x i8] c"\09\08", [2 x i8] c"\BC\B8"], align 1
@.str = private unnamed_addr constant [35 x i8] c"\016[%2d] imm=%d(0x%x) out of range\0A\00", align 1
@build_insn.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"\016*** NOT YET: opcode %02x ***\0A\00", align 1
@build_insn.__print_once.2 = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"\013unknown opcode %02x\0A\00", align 1
@out_offset = internal unnamed_addr global i32 -1, align 4
@emit_bpf_tail_call.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.4 = private unnamed_addr constant [43 x i8] c"\013tail_call out_offset = %d, expected %d!\0A\00", align 1
@elf_hwcap = external dso_local local_unnamed_addr global i32, align 4
@.str.5 = private unnamed_addr constant [55 x i8] c"\013flen=%u proglen=%u pass=%u image=%pK from=%s pid=%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"\013\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"JIT code: \00", align 1
@switch.table.emit_str_r = private unnamed_addr constant [4 x i32] [i32 4095, i32 255, i32 4095, i32 4091], align 4
@__sancov_lowest_stack = external thread_local(initialexec) global i32
@__sancov_gen_cov_switch_values = internal global [117 x i64] [i64 115, i64 8, i64 4, i64 5, i64 7, i64 12, i64 15, i64 20, i64 21, i64 22, i64 23, i64 24, i64 28, i64 29, i64 30, i64 31, i64 36, i64 37, i64 38, i64 39, i64 44, i64 45, i64 46, i64 47, i64 52, i64 53, i64 54, i64 55, i64 60, i64 61, i64 62, i64 63, i64 68, i64 69, i64 70, i64 71, i64 76, i64 77, i64 78, i64 79, i64 84, i64 85, i64 86, i64 87, i64 92, i64 93, i64 94, i64 95, i64 97, i64 98, i64 99, i64 100, i64 101, i64 102, i64 103, i64 105, i64 106, i64 107, i64 108, i64 109, i64 110, i64 111, i64 113, i64 114, i64 115, i64 116, i64 117, i64 118, i64 119, i64 121, i64 122, i64 123, i64 124, i64 125, i64 126, i64 127, i64 132, i64 133, i64 135, i64 148, i64 149, i64 151, i64 156, i64 159, i64 164, i64 165, i64 166, i64 167, i64 172, i64 173, i64 174, i64 175, i64 180, i64 181, i64 182, i64 183, i64 188, i64 189, i64 190, i64 191, i64 195, i64 196, i64 197, i64 198, i64 199, i64 204, i64 205, i64 206, i64 207, i64 212, i64 213, i64 214, i64 219, i64 220, i64 221, i64 222, i64 245]
@__sancov_gen_cov_switch_values.8 = internal global [5 x i64] [i64 3, i64 32, i64 16, i64 32, i64 64]
@__sancov_gen_cov_switch_values.9 = internal global [4 x i64] [i64 2, i64 32, i64 16, i64 32]
@__sancov_gen_cov_switch_values.10 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]
@__sancov_gen_cov_switch_values.11 = internal global [13 x i64] [i64 11, i64 32, i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 9, i64 10, i64 11, i64 12]
@__sancov_gen_cov_switch_values.12 = internal global [13 x i64] [i64 11, i64 32, i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 9, i64 10, i64 11, i64 12]
@__sancov_gen_cov_switch_values.13 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 6]
@__sancov_gen_cov_switch_values.14 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]
@__sancov_gen_cov_switch_values.15 = internal global [11 x i64] [i64 9, i64 32, i64 0, i64 1, i64 2, i64 4, i64 5, i64 6, i64 7, i64 10, i64 12]

; Function Attrs: norecurse nounwind readnone sspstrong uwtable
define dso_local void @bpf_jit_compile(%struct.bpf_prog* nocapture %0) local_unnamed_addr #0 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  ret void
}

; Function Attrs: norecurse nounwind readnone sspstrong uwtable
define dso_local zeroext i1 @bpf_jit_needs_zext() local_unnamed_addr #0 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  ret i1 true
}

; Function Attrs: nounwind sspstrong uwtable
define dso_local %struct.bpf_prog* @bpf_int_jit_compile(%struct.bpf_prog* %0) local_unnamed_addr #1 {
  %2 = alloca %struct.jit_ctx, align 4
  %3 = alloca i8*, align 4
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %4 = bitcast %struct.jit_ctx* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 44, i8* nonnull %4) #12
  call void @llvm.memset.p0i8.i32(i8* nonnull align 4 dereferenceable(44) %4, i8 -1, i32 44, i1 false)
  %5 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #12
  store i8* inttoptr (i32 -1 to i8*), i8** %3, align 4
  %6 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %0, i32 0, i32 1
  %7 = load i16, i16* %6, align 2
  %8 = and i16 %7, 16384
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %8)
  %9 = icmp eq i16 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %261

11:                                               ; preds = %1
  %12 = tail call %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog* %0) #12
  %13 = icmp ugt %struct.bpf_prog* %12, inttoptr (i32 -4096 to %struct.bpf_prog*)
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %261

15:                                               ; preds = %11
  %16 = icmp eq %struct.bpf_prog* %12, %0
  %17 = call i8* @memset(i8* nonnull %4, i32 0, i32 44) #12
  %18 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 0
  store %struct.bpf_prog* %12, %struct.bpf_prog** %18, align 4
  %19 = call i32 @cpu_architecture() #11
  %20 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 4
  store i32 %19, i32* %20, align 4
  %21 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %12, i32 0, i32 4
  %22 = load i32, i32* %21, align 4
  %23 = call fastcc i8* @kcalloc(i32 %22)
  %24 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 6
  %25 = bitcast i32** %24 to i8**
  store i8* %23, i8** %25, align 4
  %26 = icmp eq i8* %23, null
  br i1 %26, label %27, label %28

27:                                               ; preds = %15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %255

28:                                               ; preds = %15
  %29 = load %struct.bpf_prog*, %struct.bpf_prog** %18, align 4
  %30 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %29, i32 0, i32 4
  %31 = load i32, i32* %30, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %31)
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %34

33:                                               ; preds = %28
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %70

34:                                               ; preds = %28
  %35 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %36 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  br label %37

37:                                               ; preds = %69, %34
  %38 = phi i32 [ 0, %34 ], [ %65, %69 ]
  %39 = getelementptr %struct.bpf_prog, %struct.bpf_prog* %29, i32 0, i32 11, i32 %38
  %40 = call fastcc i32 @build_insn(%struct.bpf_insn* %39, %struct.jit_ctx* nonnull %2) #12
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %40)
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %51

42:                                               ; preds = %37
  %43 = add nuw i32 %38, 1
  %44 = load i32*, i32** %35, align 4
  %45 = icmp eq i32* %44, null
  br i1 %45, label %47, label %46

46:                                               ; preds = %42
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %63

47:                                               ; preds = %42
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %48 = load i32, i32* %36, align 4
  %49 = load i32*, i32** %24, align 4
  %50 = getelementptr i32, i32* %49, i32 %43
  store i32 %48, i32* %50, align 4
  br label %63

51:                                               ; preds = %37
  %52 = load i32*, i32** %35, align 4
  %53 = icmp eq i32* %52, null
  br i1 %53, label %55, label %54

54:                                               ; preds = %51
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %59

55:                                               ; preds = %51
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %56 = load i32, i32* %36, align 4
  %57 = load i32*, i32** %24, align 4
  %58 = getelementptr i32, i32* %57, i32 %38
  store i32 %56, i32* %58, align 4
  br label %59

59:                                               ; preds = %54, %55
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %40)
  %60 = icmp eq i32 %40, 0
  br i1 %60, label %62, label %61

61:                                               ; preds = %59
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %252

62:                                               ; preds = %59
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %63

63:                                               ; preds = %62, %46, %47
  %64 = phi i32 [ %43, %46 ], [ %43, %47 ], [ %38, %62 ]
  %65 = add i32 %64, 1
  %66 = load i32, i32* %30, align 4
  %67 = icmp ult i32 %65, %66
  br i1 %67, label %69, label %68

68:                                               ; preds = %63
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %70

69:                                               ; preds = %63
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %37

70:                                               ; preds = %68, %33
  %71 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %72 = load i32, i32* %71, align 4
  call fastcc void @build_prologue(%struct.jit_ctx* nonnull %2)
  %73 = load i32, i32* %71, align 4
  %74 = sub i32 %73, %72
  %75 = shl i32 %74, 2
  %76 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 2
  store i32 %75, i32* %76, align 4
  %77 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 3
  store i32 %73, i32* %77, align 4
  %78 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %79 = load i32*, i32** %78, align 4
  %80 = icmp eq i32* %79, null
  br i1 %80, label %81, label %83

81:                                               ; preds = %70
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %82 = add i32 %73, 1
  store i32 %82, i32* %71, align 4
  br label %93

83:                                               ; preds = %70
  %84 = getelementptr i32, i32* %79, i32 %73
  store i32 198222049, i32* %84, align 4
  %85 = load i32*, i32** %78, align 4
  %86 = load i32, i32* %71, align 4
  %87 = add i32 %86, 1
  store i32 %87, i32* %71, align 4
  %88 = icmp eq i32* %85, null
  br i1 %88, label %89, label %90

89:                                               ; preds = %83
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %93

90:                                               ; preds = %83
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %91 = getelementptr i32, i32* %85, i32 %87
  store i32 -259277336, i32* %91, align 4
  %92 = load i32, i32* %71, align 4
  br label %93

93:                                               ; preds = %89, %81, %90
  %94 = phi i32 [ %82, %81 ], [ %87, %89 ], [ %92, %90 ]
  %95 = add i32 %94, 1
  %96 = sub i32 %95, %73
  %97 = trunc i32 %96 to i16
  %98 = shl i16 %97, 2
  %99 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 9
  store i16 %98, i16* %99, align 4
  %100 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 10
  %101 = load i16, i16* %100, align 2
  %102 = zext i16 %101 to i32
  %103 = add i32 %95, %102
  store i32 %103, i32* %71, align 4
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %101)
  %104 = icmp eq i16 %101, 0
  br i1 %104, label %105, label %106

105:                                              ; preds = %93
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %114

106:                                              ; preds = %93
  %107 = call fastcc i8* @kcalloc(i32 %102)
  %108 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 11
  %109 = bitcast i32** %108 to i8**
  store i8* %107, i8** %109, align 4
  %110 = icmp eq i8* %107, null
  br i1 %110, label %111, label %112

111:                                              ; preds = %106
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %252

112:                                              ; preds = %106
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %113 = load i32, i32* %71, align 4
  br label %114

114:                                              ; preds = %105, %112
  %115 = phi i32 [ %113, %112 ], [ %103, %105 ]
  %116 = shl i32 %115, 2
  %117 = call %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32 %116, i8** nonnull %3, i32 4, void (i8*, i32)* nonnull @jit_fill_hole) #12
  %118 = icmp eq %struct.bpf_binary_header* %117, null
  br i1 %118, label %119, label %120

119:                                              ; preds = %114
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %243

120:                                              ; preds = %114
  %121 = bitcast i8** %3 to i32*
  %122 = load i32, i32* %121, align 4
  %123 = bitcast i32** %78 to i32*
  store i32 %122, i32* %123, align 4
  store i32 0, i32* %71, align 4
  call fastcc void @build_prologue(%struct.jit_ctx* nonnull %2)
  %124 = load %struct.bpf_prog*, %struct.bpf_prog** %18, align 4
  %125 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %124, i32 0, i32 4
  %126 = load i32, i32* %125, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %126)
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %129, label %128

128:                                              ; preds = %120
  br label %130

129:                                              ; preds = %120
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %163

130:                                              ; preds = %161, %128
  %131 = phi i32 [ %157, %161 ], [ 0, %128 ]
  %132 = getelementptr %struct.bpf_prog, %struct.bpf_prog* %124, i32 0, i32 11, i32 %131
  %133 = call fastcc i32 @build_insn(%struct.bpf_insn* %132, %struct.jit_ctx* nonnull %2) #12
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %133)
  %134 = icmp sgt i32 %133, 0
  br i1 %134, label %135, label %144

135:                                              ; preds = %130
  %136 = add nuw i32 %131, 1
  %137 = load i32*, i32** %78, align 4
  %138 = icmp eq i32* %137, null
  br i1 %138, label %140, label %139

139:                                              ; preds = %135
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %155

140:                                              ; preds = %135
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %141 = load i32, i32* %71, align 4
  %142 = load i32*, i32** %24, align 4
  %143 = getelementptr i32, i32* %142, i32 %136
  store i32 %141, i32* %143, align 4
  br label %155

144:                                              ; preds = %130
  %145 = load i32*, i32** %78, align 4
  %146 = icmp eq i32* %145, null
  br i1 %146, label %148, label %147

147:                                              ; preds = %144
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %152

148:                                              ; preds = %144
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %149 = load i32, i32* %71, align 4
  %150 = load i32*, i32** %24, align 4
  %151 = getelementptr i32, i32* %150, i32 %131
  store i32 %149, i32* %151, align 4
  br label %152

152:                                              ; preds = %147, %148
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %133)
  %153 = icmp eq i32 %133, 0
  br i1 %153, label %154, label %162

154:                                              ; preds = %152
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %155

155:                                              ; preds = %154, %139, %140
  %156 = phi i32 [ %136, %139 ], [ %136, %140 ], [ %131, %154 ]
  %157 = add i32 %156, 1
  %158 = load i32, i32* %125, align 4
  %159 = icmp ult i32 %157, %158
  br i1 %159, label %161, label %160

160:                                              ; preds = %155
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %163

161:                                              ; preds = %155
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %130

162:                                              ; preds = %152
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i8* null, i8** %3, align 4
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* nonnull %117) #12
  br label %243

163:                                              ; preds = %160, %129
  %164 = load i32*, i32** %78, align 4
  %165 = icmp eq i32* %164, null
  %166 = load i32, i32* %71, align 4
  br i1 %165, label %167, label %169

167:                                              ; preds = %163
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %168 = add i32 %166, 1
  store i32 %168, i32* %71, align 4
  br label %179

169:                                              ; preds = %163
  %170 = getelementptr i32, i32* %164, i32 %166
  store i32 198222049, i32* %170, align 4
  %171 = load i32*, i32** %78, align 4
  %172 = load i32, i32* %71, align 4
  %173 = add i32 %172, 1
  store i32 %173, i32* %71, align 4
  %174 = icmp eq i32* %171, null
  br i1 %174, label %175, label %176

175:                                              ; preds = %169
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %179

176:                                              ; preds = %169
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %177 = getelementptr i32, i32* %171, i32 %173
  store i32 -259277336, i32* %177, align 4
  %178 = load i32, i32* %71, align 4
  br label %179

179:                                              ; preds = %175, %167, %176
  %180 = phi i32 [ %168, %167 ], [ %173, %175 ], [ %178, %176 ]
  %181 = add i32 %180, 1
  store i32 %181, i32* %71, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %181)
  %182 = icmp eq i32 %181, 0
  %183 = load i32*, i32** %78, align 4
  br i1 %182, label %185, label %184

184:                                              ; preds = %179
  br label %191

185:                                              ; preds = %179
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %197

186:                                              ; preds = %191
  %187 = add nuw i32 %192, 1
  %188 = icmp eq i32 %192, %180
  br i1 %188, label %190, label %189

189:                                              ; preds = %186
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %191

190:                                              ; preds = %186
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %197

191:                                              ; preds = %189, %184
  %192 = phi i32 [ %187, %189 ], [ 0, %184 ]
  %193 = getelementptr i32, i32* %183, i32 %192
  %194 = load i32, i32* %193, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 -237044249, i32 %194)
  %195 = icmp eq i32 %194, -237044249
  br i1 %195, label %196, label %186

196:                                              ; preds = %191
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i8* null, i8** %3, align 4
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* nonnull %117) #12
  br label %243

197:                                              ; preds = %190, %185
  %198 = load void (i32, i32)*, void (i32, i32)** getelementptr inbounds (%struct.cpu_cache_fns, %struct.cpu_cache_fns* @cpu_cache, i32 0, i32 5), align 4
  %199 = ptrtoint %struct.bpf_binary_header* %117 to i32
  %200 = getelementptr i32, i32* %183, i32 %181
  %201 = ptrtoint i32* %200 to i32
  call void %198(i32 %199, i32 %201) #12
  %202 = load i32, i32* @bpf_jit_enable, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %202)
  %203 = icmp sgt i32 %202, 1
  br i1 %203, label %205, label %204

204:                                              ; preds = %197
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %221

205:                                              ; preds = %197
  %206 = load i32, i32* %21, align 4
  %207 = bitcast i32** %78 to i8**
  %208 = load i8*, i8** %207, align 4
  %209 = call i32 @llvm.read_register.i32(metadata !0) #12
  %210 = and i32 %209, -8192
  %211 = inttoptr i32 %210 to %struct.thread_info*
  %212 = getelementptr inbounds %struct.thread_info, %struct.thread_info* %211, i32 0, i32 3
  %213 = load %struct.task_struct*, %struct.task_struct** %212, align 4
  %214 = getelementptr inbounds %struct.task_struct, %struct.task_struct* %213, i32 0, i32 92, i32 0
  %215 = getelementptr inbounds %struct.task_struct, %struct.task_struct* %213, i32 0, i32 60
  %216 = load i32, i32* %215, align 8
  %217 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.5, i32 0, i32 0), i32 %206, i32 %116, i32 2, i8* %208, i8* %214, i32 %216) #13
  %218 = icmp eq i8* %208, null
  br i1 %218, label %219, label %220

219:                                              ; preds = %205
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %221

220:                                              ; preds = %205
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @print_hex_dump(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 2, i32 16, i32 1, i8* nonnull %208, i32 %116, i1 zeroext false) #12
  br label %221

221:                                              ; preds = %219, %204, %220
  %222 = bitcast %struct.bpf_binary_header* %117 to i8*
  %223 = call %struct.vm_struct* @find_vm_area(i8* nonnull %222) #12
  %224 = icmp eq %struct.vm_struct* %223, null
  br i1 %224, label %225, label %226

225:                                              ; preds = %221
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %230

226:                                              ; preds = %221
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %227 = getelementptr inbounds %struct.vm_struct, %struct.vm_struct* %223, i32 0, i32 3
  %228 = load i32, i32* %227, align 4
  %229 = or i32 %228, 256
  store i32 %229, i32* %227, align 4
  br label %230

230:                                              ; preds = %225, %226
  %231 = getelementptr inbounds %struct.bpf_binary_header, %struct.bpf_binary_header* %117, i32 0, i32 0
  %232 = load i32, i32* %231, align 8
  %233 = call i32 @set_memory_ro(i32 %199, i32 %232) #12
  %234 = load i32, i32* %231, align 8
  %235 = call i32 @set_memory_x(i32 %199, i32 %234) #12
  %236 = load i32, i32* %123, align 4
  %237 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %12, i32 0, i32 9
  %238 = bitcast i32 (i8*, %struct.bpf_insn*)** %237 to i32*
  store i32 %236, i32* %238, align 4
  %239 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %12, i32 0, i32 1
  %240 = load i16, i16* %239, align 2
  %241 = or i16 %240, -32768
  store i16 %241, i16* %239, align 2
  %242 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %12, i32 0, i32 5
  store i32 %116, i32* %242, align 4
  br label %243

243:                                              ; preds = %119, %230, %196, %162
  %244 = phi %struct.bpf_prog* [ %0, %162 ], [ %0, %196 ], [ %12, %230 ], [ %0, %119 ]
  %245 = load i16, i16* %100, align 2
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %245)
  %246 = icmp eq i16 %245, 0
  br i1 %246, label %247, label %248

247:                                              ; preds = %243
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %252

248:                                              ; preds = %243
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %249 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 11
  %250 = bitcast i32** %249 to i8**
  %251 = load i8*, i8** %250, align 4
  call void @kfree(i8* %251) #12
  br label %252

252:                                              ; preds = %247, %111, %61, %248
  %253 = phi %struct.bpf_prog* [ %244, %248 ], [ %244, %247 ], [ %0, %111 ], [ %0, %61 ]
  %254 = load i8*, i8** %25, align 4
  call void @kfree(i8* %254) #12
  br label %255

255:                                              ; preds = %27, %252
  %256 = phi %struct.bpf_prog* [ %253, %252 ], [ %0, %27 ]
  br i1 %16, label %257, label %258

257:                                              ; preds = %255
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %261

258:                                              ; preds = %255
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %259 = icmp eq %struct.bpf_prog* %256, %0
  %260 = select i1 %259, %struct.bpf_prog* %12, %struct.bpf_prog* %0
  call void @bpf_jit_prog_release_other(%struct.bpf_prog* %256, %struct.bpf_prog* %260) #12
  br label %261

261:                                              ; preds = %257, %14, %10, %258
  %262 = phi %struct.bpf_prog* [ %0, %10 ], [ %0, %14 ], [ %256, %258 ], [ %256, %257 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 44, i8* nonnull %4) #12
  ret %struct.bpf_prog* %262
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #2

declare dso_local %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog*) local_unnamed_addr #3

; Function Attrs: nobuiltin nofree
declare dso_local i8* @memset(i8*, i32, i32) local_unnamed_addr #4

; Function Attrs: nounwind readonly
declare dso_local i32 @cpu_architecture() local_unnamed_addr #5

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc i8* @kcalloc(i32 %0) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2 = tail call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %0, i32 4) #12
  %3 = extractvalue { i32, i1 } %2, 1
  br i1 %3, label %4, label %5, !prof !4, !misexpect !5

4:                                                ; preds = %1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %11

5:                                                ; preds = %1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %6 = extractvalue { i32, i1 } %2, 0
  %7 = tail call noalias i8* @__kmalloc(i32 %6, i32 3520) #12
  %8 = ptrtoint i8* %7 to i32
  %9 = and i32 %8, 127
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %9)
  %10 = icmp eq i32 %9, 0
  tail call void @llvm.assume(i1 %10) #12
  br label %11

11:                                               ; preds = %4, %5
  %12 = phi i8* [ %7, %5 ], [ null, %4 ]
  ret i8* %12
}

; Function Attrs: nounwind sspstrong uwtable
define internal fastcc void @build_prologue(%struct.jit_ctx* %0) unnamed_addr #1 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %0, i32 0, i32 7
  %3 = load i32*, i32** %2, align 4
  %4 = icmp eq i32* %3, null
  %5 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %0, i32 0, i32 1
  %6 = load i32, i32* %5, align 4
  br i1 %4, label %7, label %9

7:                                                ; preds = %1
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %8 = add i32 %6, 1
  store i32 %8, i32* %5, align 4
  br label %16

9:                                                ; preds = %1
  %10 = getelementptr i32, i32* %3, i32 %6
  store i32 -263508503, i32* %10, align 4
  %11 = load i32*, i32** %2, align 4
  %12 = load i32, i32* %5, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %5, align 4
  %14 = icmp eq i32* %11, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %9
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %16

16:                                               ; preds = %15, %7
  %17 = phi i32 [ %13, %15 ], [ %8, %7 ]
  %18 = add i32 %17, 1
  store i32 %18, i32* %5, align 4
  br label %26

19:                                               ; preds = %9
  %20 = getelementptr i32, i32* %11, i32 %13
  store i32 229679329, i32* %20, align 4
  %21 = load i32, i32* %5, align 4
  %22 = load i32*, i32** %2, align 4
  %23 = add i32 %21, 1
  store i32 %23, i32* %5, align 4
  %24 = icmp eq i32* %22, null
  br i1 %24, label %25, label %29

25:                                               ; preds = %19
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %26

26:                                               ; preds = %25, %16
  %27 = phi i32 [ %17, %16 ], [ %21, %25 ]
  %28 = add i32 %27, 2
  store i32 %28, i32* %5, align 4
  br label %39

29:                                               ; preds = %19
  %30 = getelementptr i32, i32* %22, i32 %23
  store i32 3186915, i32* %30, align 4
  %31 = load i32*, i32** %2, align 4
  %32 = load i32, i32* %5, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %5, align 4
  %34 = icmp eq i32* %31, null
  br i1 %34, label %35, label %36

35:                                               ; preds = %29
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %39

36:                                               ; preds = %29
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %37 = getelementptr i32, i32* %31, i32 %33
  store i32 1344294370, i32* %37, align 4
  %38 = load i32, i32* %5, align 4
  br label %39

39:                                               ; preds = %35, %26, %36
  %40 = phi i32 [ %28, %26 ], [ %33, %35 ], [ %38, %36 ]
  %41 = add i32 %40, 1
  store i32 %41, i32* %5, align 4
  %42 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %0, i32 0, i32 0
  %43 = load %struct.bpf_prog*, %struct.bpf_prog** %42, align 4
  %44 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %43, i32 0, i32 7
  %45 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %44, align 4
  %46 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %45, i32 0, i32 5
  %47 = load i32, i32* %46, align 8
  %48 = add i32 %47, 87
  %49 = and i32 %48, -8
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %49)
  %50 = icmp ult i32 %49, 256
  br i1 %50, label %51, label %57

51:                                               ; preds = %39
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

52:                                               ; preds = %116, %112, %108, %104, %100, %96, %92, %88, %84, %80, %76, %72, %68, %64, %60, %51
  %53 = phi i32 [ 0, %51 ], [ 256, %60 ], [ 512, %64 ], [ 768, %68 ], [ 1024, %72 ], [ 1280, %76 ], [ 1536, %80 ], [ 1792, %84 ], [ 2048, %88 ], [ 2304, %92 ], [ 2560, %96 ], [ 2816, %100 ], [ 3072, %104 ], [ 3328, %108 ], [ 3584, %112 ], [ 3840, %116 ]
  %54 = phi i32 [ 0, %51 ], [ 2, %60 ], [ 4, %64 ], [ 6, %68 ], [ 8, %72 ], [ 10, %76 ], [ 12, %80 ], [ 14, %84 ], [ 16, %88 ], [ 18, %92 ], [ 20, %96 ], [ 22, %100 ], [ 24, %104 ], [ 26, %108 ], [ 28, %112 ], [ 30, %116 ]
  %55 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 %54) #12
  %56 = or i32 %55, %53
  br label %117

57:                                               ; preds = %39
  %58 = and i32 %48, 1073741760
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %58)
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %61

60:                                               ; preds = %57
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

61:                                               ; preds = %57
  %62 = and i32 %48, 268435440
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %62)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

65:                                               ; preds = %61
  %66 = and i32 %48, 67108856
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %66)
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

69:                                               ; preds = %65
  %70 = and i32 %48, 16777208
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %70)
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

73:                                               ; preds = %69
  %74 = and i32 %48, -1069547528
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %74)
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %77

76:                                               ; preds = %73
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

77:                                               ; preds = %73
  %78 = and i32 %48, -267386888
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %78)
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %81

80:                                               ; preds = %77
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

81:                                               ; preds = %77
  %82 = and i32 %48, -66846728
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %82)
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %85

84:                                               ; preds = %81
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

85:                                               ; preds = %81
  %86 = and i32 %48, -16711688
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %86)
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %89

88:                                               ; preds = %85
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

89:                                               ; preds = %85
  %90 = and i32 %48, -4177928
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %90)
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %93

92:                                               ; preds = %89
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

93:                                               ; preds = %89
  %94 = and i32 %48, -1044488
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %94)
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %97

96:                                               ; preds = %93
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

97:                                               ; preds = %93
  %98 = and i32 %48, -261128
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %98)
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %97
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

101:                                              ; preds = %97
  %102 = and i32 %48, -65288
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %102)
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %105

104:                                              ; preds = %101
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

105:                                              ; preds = %101
  %106 = and i32 %48, -16328
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %106)
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %109

108:                                              ; preds = %105
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

109:                                              ; preds = %105
  %110 = and i32 %48, -4088
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %110)
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %113

112:                                              ; preds = %109
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

113:                                              ; preds = %109
  call void @__sanitizer_cov_trace_const_cmp4(i32 1024, i32 %48)
  %114 = icmp ult i32 %48, 1024
  br i1 %114, label %116, label %115

115:                                              ; preds = %113
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %117

116:                                              ; preds = %113
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

117:                                              ; preds = %115, %52
  %118 = phi i32 [ %56, %52 ], [ -1, %115 ]
  %119 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %0, i32 0, i32 8
  store i32 %118, i32* %119, align 4
  %120 = load i32*, i32** %2, align 4
  %121 = icmp eq i32* %120, null
  br i1 %121, label %122, label %123

122:                                              ; preds = %117
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %128

123:                                              ; preds = %117
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %124 = or i32 %118, -498216960
  %125 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %124) #14, !srcloc !6
  %126 = getelementptr i32, i32* %120, i32 %41
  store i32 %125, i32* %126, align 4
  %127 = load i32, i32* %5, align 4
  br label %128

128:                                              ; preds = %122, %123
  %129 = phi i32 [ %41, %122 ], [ %127, %123 ]
  %130 = add i32 %129, 1
  store i32 %130, i32* %5, align 4
  tail call fastcc void @emit_a32_mov_r64(i1 zeroext true, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 10, i32 0), i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 1, i32 0), %struct.jit_ctx* %0)
  %131 = load i32*, i32** %2, align 4
  %132 = icmp eq i32* %131, null
  br i1 %132, label %133, label %134

133:                                              ; preds = %128
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %137

134:                                              ; preds = %128
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %135 = load i32, i32* %5, align 4
  %136 = getelementptr i32, i32* %131, i32 %135
  store i32 2138339, i32* %136, align 4
  br label %137

137:                                              ; preds = %133, %134
  %138 = load i32, i32* %5, align 4
  %139 = add i32 %138, 1
  store i32 %139, i32* %5, align 4
  tail call fastcc void @emit_a32_mov_r64(i1 zeroext true, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 14, i32 0), i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 1, i32 0), %struct.jit_ctx* %0)
  %140 = load i32*, i32** %2, align 4
  %141 = icmp eq i32* %140, null
  br i1 %141, label %142, label %143

142:                                              ; preds = %137
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %146

143:                                              ; preds = %137
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %144 = load i32, i32* %5, align 4
  %145 = getelementptr i32, i32* %140, i32 %144
  store i32 2138337, i32* %145, align 4
  br label %146

146:                                              ; preds = %142, %143
  %147 = load i32, i32* %5, align 4
  %148 = add i32 %147, 1
  store i32 %148, i32* %5, align 4
  ret void
}

declare dso_local %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32, i8**, i32, void (i8*, i32)*) local_unnamed_addr #3

; Function Attrs: nofree norecurse nounwind sspstrong uwtable writeonly
define internal void @jit_fill_hole(i8* nocapture %0, i32 %1) #7 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__sanitizer_cov_trace_const_cmp4(i32 3, i32 %1)
  %3 = icmp ugt i32 %1, 3
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %15

5:                                                ; preds = %2
  %6 = bitcast i8* %0 to i32*
  br label %7

7:                                                ; preds = %14, %5
  %8 = phi i32* [ %10, %14 ], [ %6, %5 ]
  %9 = phi i32 [ %11, %14 ], [ %1, %5 ]
  %10 = getelementptr i32, i32* %8, i32 1
  store i32 -237044249, i32* %8, align 4
  %11 = add i32 %9, -4
  %12 = icmp ugt i32 %11, 3
  br i1 %12, label %14, label %13

13:                                               ; preds = %7
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %15

14:                                               ; preds = %7
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %7

15:                                               ; preds = %13, %4
  ret void
}

declare dso_local void @bpf_jit_binary_free(%struct.bpf_binary_header*) local_unnamed_addr #3

declare dso_local void @kfree(i8*) local_unnamed_addr #3

declare dso_local void @bpf_jit_prog_release_other(%struct.bpf_prog*, %struct.bpf_prog*) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #8

declare dso_local noalias i8* @__kmalloc(i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #9

; Function Attrs: nounwind sspstrong uwtable
define internal fastcc i32 @build_insn(%struct.bpf_insn* %0, %struct.jit_ctx* %1) unnamed_addr #1 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 0
  %4 = load i8, i8* %3, align 4
  %5 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 1
  %6 = load i8, i8* %5, align 1
  %7 = lshr i8 %6, 4
  %8 = zext i8 %7 to i32
  %9 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 0
  %10 = and i8 %6, 15
  %11 = zext i8 %10 to i32
  %12 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 0
  %13 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 2
  %14 = load i16, i16* %13, align 2
  %15 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %0, i32 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 0
  %18 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %19 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %18, i32 0, i32 11, i32 0
  %20 = ptrtoint %struct.bpf_insn* %0 to i32
  %21 = ptrtoint %struct.bpf_insn* %19 to i32
  %22 = sub i32 %20, %21
  %23 = ashr exact i32 %22, 3
  %24 = zext i8 %4 to i32
  %25 = and i32 %24, 7
  call void @__sanitizer_cov_trace_const_cmp4(i32 7, i32 %25)
  %26 = icmp eq i32 %25, 7
  %27 = zext i8 %4 to i64
  call void @__sanitizer_cov_trace_switch(i64 %27, i64* getelementptr inbounds ([117 x i64], [117 x i64]* @__sancov_gen_cov_switch_values, i32 0, i32 0))
  switch i8 %4, label %3539 [
    i8 -76, label %129
    i8 -68, label %128
    i8 -73, label %127
    i8 -65, label %126
    i8 4, label %125
    i8 12, label %124
    i8 20, label %123
    i8 28, label %122
    i8 68, label %121
    i8 76, label %120
    i8 84, label %119
    i8 92, label %118
    i8 -92, label %117
    i8 -84, label %116
    i8 36, label %115
    i8 44, label %114
    i8 108, label %113
    i8 124, label %112
    i8 -52, label %111
    i8 7, label %110
    i8 15, label %109
    i8 23, label %108
    i8 31, label %107
    i8 71, label %106
    i8 79, label %105
    i8 87, label %104
    i8 95, label %103
    i8 -89, label %102
    i8 -81, label %101
    i8 52, label %100
    i8 60, label %99
    i8 -108, label %98
    i8 -100, label %97
    i8 55, label %96
    i8 63, label %95
    i8 -105, label %94
    i8 -97, label %93
    i8 100, label %92
    i8 116, label %91
    i8 -60, label %90
    i8 103, label %504
    i8 119, label %730
    i8 111, label %958
    i8 127, label %1150
    i8 -49, label %1342
    i8 -57, label %1534
    i8 -124, label %1764
    i8 -121, label %1819
    i8 47, label %89
    i8 39, label %88
    i8 -44, label %87
    i8 -36, label %86
    i8 24, label %2242
    i8 97, label %85
    i8 105, label %84
    i8 113, label %83
    i8 121, label %82
    i8 98, label %81
    i8 106, label %80
    i8 114, label %79
    i8 122, label %78
    i8 -61, label %77
    i8 -37, label %76
    i8 99, label %75
    i8 107, label %74
    i8 115, label %73
    i8 123, label %72
    i8 29, label %71
    i8 45, label %70
    i8 61, label %69
    i8 93, label %68
    i8 109, label %67
    i8 125, label %66
    i8 77, label %65
    i8 -67, label %64
    i8 -83, label %63
    i8 -51, label %62
    i8 -35, label %61
    i8 30, label %60
    i8 46, label %59
    i8 62, label %58
    i8 94, label %57
    i8 110, label %56
    i8 126, label %55
    i8 78, label %54
    i8 -66, label %53
    i8 -82, label %52
    i8 -50, label %51
    i8 -34, label %50
    i8 21, label %49
    i8 37, label %48
    i8 53, label %47
    i8 85, label %46
    i8 101, label %45
    i8 117, label %44
    i8 69, label %43
    i8 -91, label %42
    i8 -75, label %41
    i8 -59, label %40
    i8 -43, label %39
    i8 22, label %38
    i8 38, label %37
    i8 54, label %36
    i8 86, label %35
    i8 102, label %34
    i8 118, label %33
    i8 70, label %32
    i8 -90, label %31
    i8 -74, label %30
    i8 -58, label %29
    i8 -42, label %28
    i8 5, label %3157
    i8 -11, label %3195
    i8 -123, label %3418
    i8 -107, label %3497
  ]

28:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

29:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

30:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

31:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

32:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

33:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

34:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

35:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

36:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

37:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

38:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

39:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

40:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

41:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

42:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

43:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

44:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

45:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

46:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

47:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

48:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

49:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2777

50:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

51:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

52:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

53:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

54:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

55:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

56:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

57:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

58:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

59:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

60:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

61:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

62:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

63:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

64:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

65:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

66:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

67:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

68:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

69:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

70:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

71:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2734

72:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2701

73:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2701

74:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2701

75:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2701

76:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3534

77:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3534

78:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2688

79:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2688

80:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2688

81:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2688

82:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2249

83:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2249

84:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2249

85:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2249

86:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1959

87:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1959

88:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1949

89:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1949

90:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %440

91:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %440

92:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %440

93:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3534

94:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3534

95:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3534

96:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3534

97:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %199

98:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %199

99:                                               ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %199

100:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %199

101:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

102:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

103:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

104:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

105:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

106:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

107:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

108:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

109:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

110:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

111:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

112:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

113:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

114:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

115:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

116:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

117:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

118:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

119:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

120:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

121:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

122:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

123:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

124:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

125:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %187

126:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %130

127:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %130

128:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %130

129:                                              ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %130

130:                                              ; preds = %126, %127, %128, %129
  %131 = and i32 %24, 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %131)
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %181, label %133

133:                                              ; preds = %130
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %16)
  %134 = icmp eq i32 %16, 1
  br i1 %134, label %135, label %180

135:                                              ; preds = %133
  %136 = load i8, i8* %9, align 1
  %137 = lshr i32 20412, %8
  %138 = and i32 %137, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %138)
  %139 = icmp eq i32 %138, 0
  %140 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %141 = load i32*, i32** %140, align 4
  %142 = icmp eq i32* %141, null
  br i1 %139, label %166, label %143

143:                                              ; preds = %135
  br i1 %142, label %144, label %145

144:                                              ; preds = %143
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %149

145:                                              ; preds = %143
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %146 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %147 = load i32, i32* %146, align 4
  %148 = getelementptr i32, i32* %141, i32 %147
  store i32 6332643, i32* %148, align 4
  br label %149

149:                                              ; preds = %144, %145
  %150 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %151 = load i32, i32* %150, align 4
  %152 = add i32 %151, 1
  store i32 %152, i32* %150, align 4
  %153 = load i32*, i32** %140, align 4
  %154 = icmp eq i32* %153, null
  br i1 %154, label %155, label %156

155:                                              ; preds = %149
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %163

156:                                              ; preds = %149
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %157 = sext i8 %136 to i32
  %158 = sub nsw i32 0, %157
  %159 = or i32 %158, -452239360
  %160 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %159) #14, !srcloc !6
  %161 = getelementptr i32, i32* %153, i32 %152
  store i32 %160, i32* %161, align 4
  %162 = load i32, i32* %150, align 4
  br label %163

163:                                              ; preds = %155, %156
  %164 = phi i32 [ %162, %156 ], [ %152, %155 ]
  %165 = add i32 %164, 1
  store i32 %165, i32* %150, align 4
  br label %3544

166:                                              ; preds = %135
  br i1 %142, label %167, label %168

167:                                              ; preds = %166
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %176

168:                                              ; preds = %166
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %169 = zext i8 %136 to i32
  %170 = shl nuw nsw i32 %169, 12
  %171 = or i32 %170, -476053504
  %172 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %171) #14, !srcloc !6
  %173 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %174 = load i32, i32* %173, align 4
  %175 = getelementptr i32, i32* %141, i32 %174
  store i32 %172, i32* %175, align 4
  br label %176

176:                                              ; preds = %167, %168
  %177 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %178 = load i32, i32* %177, align 4
  %179 = add i32 %178, 1
  store i32 %179, i32* %177, align 4
  br label %3544

180:                                              ; preds = %133
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  tail call fastcc void @emit_a32_mov_r64(i1 zeroext %26, i8* %9, i8* %12, %struct.jit_ctx* %1)
  br label %3544

181:                                              ; preds = %130
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %182 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %183 = icmp slt i32 %16, 0
  %184 = and i1 %26, %183
  %185 = or i64 %182, -4294967296
  %186 = select i1 %184, i64 %185, i64 %182
  tail call fastcc void @emit_a32_mov_i64(i8* %9, i64 %186, %struct.jit_ctx* %1) #12
  br label %3544

187:                                              ; preds = %101, %102, %103, %104, %105, %106, %107, %108, %109, %110, %111, %112, %113, %114, %115, %116, %117, %118, %119, %120, %121, %122, %123, %124, %125
  %188 = and i32 %24, 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %188)
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %192, label %190

190:                                              ; preds = %187
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %191 = and i8 %4, -16
  tail call fastcc void @emit_a32_alu_r64(i1 zeroext %26, i8* %9, i8* %12, %struct.jit_ctx* %1, i8 zeroext %191)
  br label %3544

192:                                              ; preds = %187
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %193 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %194 = icmp slt i32 %16, 0
  %195 = and i1 %26, %194
  %196 = or i64 %193, -4294967296
  %197 = select i1 %195, i64 %196, i64 %193
  tail call fastcc void @emit_a32_mov_i64(i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), i64 %197, %struct.jit_ctx* %1) #12
  %198 = and i8 %4, -16
  tail call fastcc void @emit_a32_alu_r64(i1 zeroext %26, i8* %9, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), %struct.jit_ctx* %1, i8 zeroext %198)
  br label %3544

199:                                              ; preds = %97, %98, %99, %100
  %200 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %201 = load i8, i8* %200, align 1
  %202 = lshr i32 20412, %8
  %203 = and i32 %202, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %203)
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %206, label %205

205:                                              ; preds = %199
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %223

206:                                              ; preds = %199
  %207 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %208 = load i32*, i32** %207, align 4
  %209 = icmp eq i32* %208, null
  br i1 %209, label %210, label %211

210:                                              ; preds = %206
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %219

211:                                              ; preds = %206
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %212 = sext i8 %201 to i32
  %213 = sub nsw i32 0, %212
  %214 = or i32 %213, -451182592
  %215 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %214) #14, !srcloc !6
  %216 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %217 = load i32, i32* %216, align 4
  %218 = getelementptr i32, i32* %208, i32 %217
  store i32 %215, i32* %218, align 4
  br label %219

219:                                              ; preds = %210, %211
  %220 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %221 = load i32, i32* %220, align 4
  %222 = add i32 %221, 1
  store i32 %222, i32* %220, align 4
  br label %223

223:                                              ; preds = %205, %219
  %224 = phi i8 [ 8, %219 ], [ %201, %205 ]
  %225 = and i32 %24, 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %225)
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %251, label %227

227:                                              ; preds = %223
  %228 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %229 = load i8, i8* %228, align 1
  %230 = lshr i32 20412, %11
  %231 = and i32 %230, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %231)
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %233, label %234

233:                                              ; preds = %227
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %252

234:                                              ; preds = %227
  %235 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %236 = load i32*, i32** %235, align 4
  %237 = icmp eq i32* %236, null
  br i1 %237, label %238, label %239

238:                                              ; preds = %234
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %247

239:                                              ; preds = %234
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %240 = sext i8 %229 to i32
  %241 = sub nsw i32 0, %240
  %242 = or i32 %241, -451178496
  %243 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %242) #14, !srcloc !6
  %244 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %245 = load i32, i32* %244, align 4
  %246 = getelementptr i32, i32* %236, i32 %245
  store i32 %243, i32* %246, align 4
  br label %247

247:                                              ; preds = %238, %239
  %248 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %249 = load i32, i32* %248, align 4
  %250 = add i32 %249, 1
  store i32 %250, i32* %248, align 4
  br label %252

251:                                              ; preds = %223
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  tail call fastcc void @emit_mov_i(i8 zeroext 9, i32 %16, %struct.jit_ctx* %1) #12
  br label %252

252:                                              ; preds = %233, %247, %251
  %253 = phi i8 [ 9, %251 ], [ 9, %247 ], [ %229, %233 ]
  %254 = and i8 %4, -16
  %255 = zext i8 %253 to i32
  %256 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %257 = load i32*, i32** %256, align 4
  %258 = icmp eq i32* %257, null
  br i1 %258, label %259, label %260

259:                                              ; preds = %252
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %264

260:                                              ; preds = %252
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %261 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %262 = load i32, i32* %261, align 4
  %263 = getelementptr i32, i32* %257, i32 %262
  store i32 24158433, i32* %263, align 4
  br label %264

264:                                              ; preds = %259, %260
  %265 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %266 = load i32, i32* %265, align 4
  %267 = add i32 %266, 1
  store i32 %267, i32* %265, align 4
  %268 = load i32*, i32** %256, align 4
  %269 = icmp eq i32* %268, null
  br i1 %269, label %270, label %271

270:                                              ; preds = %264
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %276

271:                                              ; preds = %264
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %272 = or i32 %255, -509603840
  %273 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %272) #14, !srcloc !6
  %274 = getelementptr i32, i32* %268, i32 %267
  store i32 %273, i32* %274, align 4
  %275 = load i32, i32* %265, align 4
  br label %276

276:                                              ; preds = %270, %271
  %277 = phi i32 [ %267, %270 ], [ %275, %271 ]
  %278 = add i32 %277, 1
  store i32 %278, i32* %265, align 4
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %224)
  %279 = icmp ne i8 %224, 0
  br i1 %279, label %281, label %280

280:                                              ; preds = %276
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %303

281:                                              ; preds = %276
  %282 = zext i8 %224 to i32
  %283 = load i32*, i32** %256, align 4
  %284 = icmp eq i32* %283, null
  br i1 %284, label %285, label %286

285:                                              ; preds = %281
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %289

286:                                              ; preds = %281
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %287 = getelementptr i32, i32* %283, i32 %278
  store i32 6332641, i32* %287, align 4
  %288 = load i32, i32* %265, align 4
  br label %289

289:                                              ; preds = %285, %286
  %290 = phi i32 [ %288, %286 ], [ %278, %285 ]
  %291 = add i32 %290, 1
  store i32 %291, i32* %265, align 4
  %292 = load i32*, i32** %256, align 4
  %293 = icmp eq i32* %292, null
  br i1 %293, label %294, label %295

294:                                              ; preds = %289
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %300

295:                                              ; preds = %289
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %296 = or i32 %282, -509607936
  %297 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %296) #14, !srcloc !6
  %298 = getelementptr i32, i32* %292, i32 %291
  store i32 %297, i32* %298, align 4
  %299 = load i32, i32* %265, align 4
  br label %300

300:                                              ; preds = %294, %295
  %301 = phi i32 [ %291, %294 ], [ %299, %295 ]
  %302 = add i32 %301, 1
  store i32 %302, i32* %265, align 4
  br label %303

303:                                              ; preds = %280, %300
  call void @__sanitizer_cov_trace_const_cmp1(i8 48, i8 %254)
  %304 = icmp eq i8 %254, 48
  %305 = select i1 %304, i32 ptrtoint (i32 (i32, i32)* @jit_udiv32 to i32), i32 ptrtoint (i32 (i32, i32)* @jit_mod32 to i32)
  tail call fastcc void @emit_mov_i(i8 zeroext 12, i32 %305, %struct.jit_ctx* %1) #12
  %306 = load i32*, i32** %256, align 4
  %307 = icmp eq i32* %306, null
  br i1 %307, label %308, label %309

308:                                              ; preds = %303
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %312

309:                                              ; preds = %303
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %310 = load i32, i32* %265, align 4
  %311 = getelementptr i32, i32* %306, i32 %310
  store i32 1023356897, i32* %311, align 4
  br label %312

312:                                              ; preds = %308, %309
  %313 = load i32, i32* %265, align 4
  %314 = add i32 %313, 1
  store i32 %314, i32* %265, align 4
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %224)
  %315 = icmp eq i8 %224, 0
  br i1 %315, label %316, label %317

316:                                              ; preds = %312
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %331

317:                                              ; preds = %312
  %318 = load i32*, i32** %256, align 4
  %319 = icmp eq i32* %318, null
  br i1 %319, label %320, label %321

320:                                              ; preds = %317
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %328

321:                                              ; preds = %317
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %322 = zext i8 %224 to i32
  %323 = shl nuw nsw i32 %322, 12
  %324 = or i32 %323, -509607936
  %325 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %324) #14, !srcloc !6
  %326 = getelementptr i32, i32* %318, i32 %314
  store i32 %325, i32* %326, align 4
  %327 = load i32, i32* %265, align 4
  br label %328

328:                                              ; preds = %320, %321
  %329 = phi i32 [ %314, %320 ], [ %327, %321 ]
  %330 = add i32 %329, 1
  store i32 %330, i32* %265, align 4
  br label %331

331:                                              ; preds = %316, %328
  %332 = phi i32 [ %314, %316 ], [ %330, %328 ]
  %333 = load i32*, i32** %256, align 4
  %334 = icmp eq i32* %333, null
  br i1 %334, label %335, label %336

335:                                              ; preds = %331
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %339

336:                                              ; preds = %331
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %337 = getelementptr i32, i32* %333, i32 %332
  store i32 118530273, i32* %337, align 4
  %338 = load i32, i32* %265, align 4
  br label %339

339:                                              ; preds = %335, %336
  %340 = phi i32 [ %332, %335 ], [ %338, %336 ]
  %341 = add i32 %340, 1
  store i32 %341, i32* %265, align 4
  br i1 %279, label %343, label %342

342:                                              ; preds = %339
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %353

343:                                              ; preds = %339
  %344 = load i32*, i32** %256, align 4
  %345 = icmp eq i32* %344, null
  br i1 %345, label %346, label %347

346:                                              ; preds = %343
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %350

347:                                              ; preds = %343
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %348 = getelementptr i32, i32* %344, i32 %341
  store i32 100704481, i32* %348, align 4
  %349 = load i32, i32* %265, align 4
  br label %350

350:                                              ; preds = %346, %347
  %351 = phi i32 [ %341, %346 ], [ %349, %347 ]
  %352 = add i32 %351, 1
  store i32 %352, i32* %265, align 4
  br label %353

353:                                              ; preds = %342, %350
  %354 = phi i32 [ %341, %342 ], [ %352, %350 ]
  br i1 %204, label %355, label %372

355:                                              ; preds = %353
  %356 = load i32*, i32** %256, align 4
  %357 = icmp eq i32* %356, null
  br i1 %357, label %358, label %359

358:                                              ; preds = %355
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %369

359:                                              ; preds = %355
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %360 = zext i8 %224 to i32
  %361 = shl nuw nsw i32 %360, 12
  %362 = sext i8 %201 to i32
  %363 = sub nsw i32 0, %362
  %364 = or i32 %361, %363
  %365 = or i32 %364, -452263936
  %366 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %365) #14, !srcloc !6
  %367 = getelementptr i32, i32* %356, i32 %354
  store i32 %366, i32* %367, align 4
  %368 = load i32, i32* %265, align 4
  br label %369

369:                                              ; preds = %358, %359
  %370 = phi i32 [ %354, %358 ], [ %368, %359 ]
  %371 = add i32 %370, 1
  br label %391

372:                                              ; preds = %353
  call void @__sanitizer_cov_trace_cmp1(i8 %201, i8 %224)
  %373 = icmp eq i8 %201, %224
  br i1 %373, label %374, label %375

374:                                              ; preds = %372
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %393

375:                                              ; preds = %372
  %376 = load i32*, i32** %256, align 4
  %377 = icmp eq i32* %376, null
  br i1 %377, label %378, label %379

378:                                              ; preds = %375
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %388

379:                                              ; preds = %375
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %380 = zext i8 %201 to i32
  %381 = shl nuw nsw i32 %380, 12
  %382 = zext i8 %224 to i32
  %383 = or i32 %381, %382
  %384 = or i32 %383, -509607936
  %385 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %384) #14, !srcloc !6
  %386 = getelementptr i32, i32* %376, i32 %354
  store i32 %385, i32* %386, align 4
  %387 = load i32, i32* %265, align 4
  br label %388

388:                                              ; preds = %378, %379
  %389 = phi i32 [ %387, %379 ], [ %354, %378 ]
  %390 = add i32 %389, 1
  br label %391

391:                                              ; preds = %388, %369
  %392 = phi i32 [ %371, %369 ], [ %390, %388 ]
  store i32 %392, i32* %265, align 4
  br label %393

393:                                              ; preds = %374, %391
  %394 = phi i32 [ %354, %374 ], [ %392, %391 ]
  %395 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %396 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %395, i32 0, i32 7
  %397 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %396, align 4
  %398 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %397, i32 0, i32 13
  %399 = load i8, i8* %398, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %399)
  %400 = icmp eq i8 %399, 0
  br i1 %400, label %402, label %401

401:                                              ; preds = %393
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

402:                                              ; preds = %393
  %403 = load i8, i8* %9, align 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %203)
  %404 = icmp eq i32 %203, 0
  %405 = load i32*, i32** %256, align 4
  %406 = icmp eq i32* %405, null
  br i1 %404, label %428, label %407

407:                                              ; preds = %402
  br i1 %406, label %408, label %409

408:                                              ; preds = %407
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %412

409:                                              ; preds = %407
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %410 = getelementptr i32, i32* %405, i32 %394
  store i32 6332643, i32* %410, align 4
  %411 = load i32, i32* %265, align 4
  br label %412

412:                                              ; preds = %408, %409
  %413 = phi i32 [ %394, %408 ], [ %411, %409 ]
  %414 = add i32 %413, 1
  store i32 %414, i32* %265, align 4
  %415 = load i32*, i32** %256, align 4
  %416 = icmp eq i32* %415, null
  br i1 %416, label %417, label %418

417:                                              ; preds = %412
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %425

418:                                              ; preds = %412
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %419 = sext i8 %403 to i32
  %420 = sub nsw i32 0, %419
  %421 = or i32 %420, -452239360
  %422 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %421) #14, !srcloc !6
  %423 = getelementptr i32, i32* %415, i32 %414
  store i32 %422, i32* %423, align 4
  %424 = load i32, i32* %265, align 4
  br label %425

425:                                              ; preds = %417, %418
  %426 = phi i32 [ %424, %418 ], [ %414, %417 ]
  %427 = add i32 %426, 1
  store i32 %427, i32* %265, align 4
  br label %3544

428:                                              ; preds = %402
  br i1 %406, label %429, label %430

429:                                              ; preds = %428
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %437

430:                                              ; preds = %428
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %431 = zext i8 %403 to i32
  %432 = shl nuw nsw i32 %431, 12
  %433 = or i32 %432, -476053504
  %434 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %433) #14, !srcloc !6
  %435 = getelementptr i32, i32* %405, i32 %394
  store i32 %434, i32* %435, align 4
  %436 = load i32, i32* %265, align 4
  br label %437

437:                                              ; preds = %429, %430
  %438 = phi i32 [ %394, %429 ], [ %436, %430 ]
  %439 = add i32 %438, 1
  store i32 %439, i32* %265, align 4
  br label %3544

440:                                              ; preds = %90, %91, %92
  call void @__sanitizer_cov_trace_const_cmp4(i32 31, i32 %16)
  %441 = icmp sgt i32 %16, 31
  br i1 %441, label %442, label %443, !prof !4, !misexpect !5

442:                                              ; preds = %440
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

443:                                              ; preds = %440
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %444 = icmp eq i32 %16, 0
  br i1 %444, label %445, label %446

445:                                              ; preds = %443
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %451

446:                                              ; preds = %443
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %447 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %448 = load i8, i8* %447, align 1
  %449 = and i8 %4, -16
  tail call fastcc void @emit_a32_alu_i(i8 signext %448, i32 %16, %struct.jit_ctx* %1, i8 zeroext %449)
  %450 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  br label %451

451:                                              ; preds = %445, %446
  %452 = phi %struct.bpf_prog* [ %18, %445 ], [ %450, %446 ]
  %453 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %452, i32 0, i32 7
  %454 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %453, align 4
  %455 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %454, i32 0, i32 13
  %456 = load i8, i8* %455, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %456)
  %457 = icmp eq i8 %456, 0
  br i1 %457, label %459, label %458

458:                                              ; preds = %451
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

459:                                              ; preds = %451
  %460 = load i8, i8* %9, align 1
  %461 = lshr i32 20412, %8
  %462 = and i32 %461, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %462)
  %463 = icmp eq i32 %462, 0
  %464 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %465 = load i32*, i32** %464, align 4
  %466 = icmp eq i32* %465, null
  br i1 %463, label %490, label %467

467:                                              ; preds = %459
  br i1 %466, label %468, label %469

468:                                              ; preds = %467
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %473

469:                                              ; preds = %467
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %470 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %471 = load i32, i32* %470, align 4
  %472 = getelementptr i32, i32* %465, i32 %471
  store i32 6332643, i32* %472, align 4
  br label %473

473:                                              ; preds = %468, %469
  %474 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %475 = load i32, i32* %474, align 4
  %476 = add i32 %475, 1
  store i32 %476, i32* %474, align 4
  %477 = load i32*, i32** %464, align 4
  %478 = icmp eq i32* %477, null
  br i1 %478, label %479, label %480

479:                                              ; preds = %473
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %487

480:                                              ; preds = %473
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %481 = sext i8 %460 to i32
  %482 = sub nsw i32 0, %481
  %483 = or i32 %482, -452239360
  %484 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %483) #14, !srcloc !6
  %485 = getelementptr i32, i32* %477, i32 %476
  store i32 %484, i32* %485, align 4
  %486 = load i32, i32* %474, align 4
  br label %487

487:                                              ; preds = %479, %480
  %488 = phi i32 [ %486, %480 ], [ %476, %479 ]
  %489 = add i32 %488, 1
  store i32 %489, i32* %474, align 4
  br label %3544

490:                                              ; preds = %459
  br i1 %466, label %491, label %492

491:                                              ; preds = %490
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %500

492:                                              ; preds = %490
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %493 = zext i8 %460 to i32
  %494 = shl nuw nsw i32 %493, 12
  %495 = or i32 %494, -476053504
  %496 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %495) #14, !srcloc !6
  %497 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %498 = load i32, i32* %497, align 4
  %499 = getelementptr i32, i32* %465, i32 %498
  store i32 %496, i32* %499, align 4
  br label %500

500:                                              ; preds = %491, %492
  %501 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %502 = load i32, i32* %501, align 4
  %503 = add i32 %502, 1
  store i32 %503, i32* %501, align 4
  br label %3544

504:                                              ; preds = %2
  call void @__sanitizer_cov_trace_const_cmp4(i32 63, i32 %16)
  %505 = icmp sgt i32 %16, 63
  br i1 %505, label %506, label %507, !prof !4, !misexpect !5

506:                                              ; preds = %504
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

507:                                              ; preds = %504
  %508 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %509 = load i8, i8* %508, align 1
  %510 = lshr i32 20412, %8
  %511 = and i32 %510, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %511)
  %512 = icmp ne i32 %511, 0
  br i1 %512, label %514, label %513

513:                                              ; preds = %507
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %535

514:                                              ; preds = %507
  %515 = sext i8 %509 to i32
  %516 = sub nsw i32 0, %515
  %517 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %518 = load i32*, i32** %517, align 4
  %519 = icmp eq i32* %518, null
  br i1 %519, label %520, label %521

520:                                              ; preds = %514
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %531

521:                                              ; preds = %514
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %522 = shl nuw nsw i32 %516, 4
  %523 = and i32 %522, 3840
  %524 = and i32 %516, 15
  %525 = or i32 %523, %524
  %526 = or i32 %525, -515153712
  %527 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %526) #14, !srcloc !6
  %528 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %529 = load i32, i32* %528, align 4
  %530 = getelementptr i32, i32* %518, i32 %529
  store i32 %527, i32* %530, align 4
  br label %531

531:                                              ; preds = %520, %521
  %532 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %533 = load i32, i32* %532, align 4
  %534 = add i32 %533, 1
  store i32 %534, i32* %532, align 4
  br label %535

535:                                              ; preds = %513, %531
  %536 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %531 ], [ %9, %513 ]
  call void @__sanitizer_cov_trace_const_cmp4(i32 32, i32 %16)
  %537 = icmp ult i32 %16, 32
  br i1 %537, label %538, label %593

538:                                              ; preds = %535
  %539 = shl nuw nsw i32 %16, 7
  %540 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %541 = load i32*, i32** %540, align 4
  %542 = icmp eq i32* %541, null
  br i1 %542, label %543, label %544

543:                                              ; preds = %538
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %553

544:                                              ; preds = %538
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %545 = load i8, i8* %536, align 1
  %546 = sext i8 %545 to i32
  %547 = or i32 %539, %546
  %548 = or i32 %547, -509571072
  %549 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %548) #14, !srcloc !6
  %550 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %551 = load i32, i32* %550, align 4
  %552 = getelementptr i32, i32* %541, i32 %551
  store i32 %549, i32* %552, align 4
  br label %553

553:                                              ; preds = %543, %544
  %554 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %555 = load i32, i32* %554, align 4
  %556 = add i32 %555, 1
  store i32 %556, i32* %554, align 4
  %557 = getelementptr i8, i8* %536, i32 1
  %558 = load i32*, i32** %540, align 4
  %559 = icmp eq i32* %558, null
  br i1 %559, label %560, label %561

560:                                              ; preds = %553
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %574

561:                                              ; preds = %553
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %562 = sub nuw nsw i32 4096, %539
  %563 = load i8, i8* %557, align 1
  %564 = sext i8 %563 to i32
  %565 = or i32 %562, %564
  %566 = load i8, i8* %536, align 1
  %567 = sext i8 %566 to i32
  %568 = shl nsw i32 %567, 12
  %569 = or i32 %565, %568
  %570 = or i32 %569, -511115232
  %571 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %570) #14, !srcloc !6
  %572 = getelementptr i32, i32* %558, i32 %556
  store i32 %571, i32* %572, align 4
  %573 = load i32, i32* %554, align 4
  br label %574

574:                                              ; preds = %560, %561
  %575 = phi i32 [ %556, %560 ], [ %573, %561 ]
  %576 = add i32 %575, 1
  store i32 %576, i32* %554, align 4
  %577 = load i8, i8* %557, align 1
  %578 = sext i8 %577 to i32
  %579 = load i32*, i32** %540, align 4
  %580 = icmp eq i32* %579, null
  br i1 %580, label %581, label %582

581:                                              ; preds = %574
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %590

582:                                              ; preds = %574
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %583 = or i32 %539, %578
  %584 = shl nsw i32 %578, 12
  %585 = or i32 %583, %584
  %586 = or i32 %585, -509607936
  %587 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %586) #14, !srcloc !6
  %588 = getelementptr i32, i32* %579, i32 %576
  store i32 %587, i32* %588, align 4
  %589 = load i32, i32* %554, align 4
  br label %590

590:                                              ; preds = %581, %582
  %591 = phi i32 [ %576, %581 ], [ %589, %582 ]
  %592 = add i32 %591, 1
  store i32 %592, i32* %554, align 4
  br label %654

593:                                              ; preds = %535
  call void @__sanitizer_cov_trace_const_cmp4(i32 32, i32 %16)
  %594 = icmp eq i32 %16, 32
  %595 = load i8, i8* %536, align 1
  %596 = sext i8 %595 to i32
  %597 = shl nsw i32 %596, 12
  %598 = getelementptr i8, i8* %536, i32 1
  %599 = load i8, i8* %598, align 1
  %600 = sext i8 %599 to i32
  %601 = or i32 %597, %600
  %602 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %603 = load i32*, i32** %602, align 4
  %604 = icmp eq i32* %603, null
  br i1 %594, label %605, label %617

605:                                              ; preds = %593
  br i1 %604, label %606, label %607

606:                                              ; preds = %605
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %613

607:                                              ; preds = %605
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %608 = or i32 %601, -509607936
  %609 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %608) #14, !srcloc !6
  %610 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %611 = load i32, i32* %610, align 4
  %612 = getelementptr i32, i32* %603, i32 %611
  store i32 %609, i32* %612, align 4
  br label %613

613:                                              ; preds = %606, %607
  %614 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %615 = load i32, i32* %614, align 4
  %616 = add i32 %615, 1
  store i32 %616, i32* %614, align 4
  br label %632

617:                                              ; preds = %593
  br i1 %604, label %618, label %619

618:                                              ; preds = %617
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %628

619:                                              ; preds = %617
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %620 = shl i32 %16, 7
  %621 = add i32 %620, 536866816
  %622 = or i32 %601, %621
  %623 = or i32 %622, -509607936
  %624 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %623) #14, !srcloc !6
  %625 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %626 = load i32, i32* %625, align 4
  %627 = getelementptr i32, i32* %603, i32 %626
  store i32 %624, i32* %627, align 4
  br label %628

628:                                              ; preds = %618, %619
  %629 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %630 = load i32, i32* %629, align 4
  %631 = add i32 %630, 1
  store i32 %631, i32* %629, align 4
  br label %632

632:                                              ; preds = %628, %613
  %633 = phi i32 [ %631, %628 ], [ %616, %613 ]
  %634 = load i8, i8* %598, align 1
  %635 = sext i8 %634 to i32
  %636 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %637 = load i32*, i32** %636, align 4
  %638 = icmp eq i32* %637, null
  br i1 %638, label %639, label %640

639:                                              ; preds = %632
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %650

640:                                              ; preds = %632
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %641 = shl nsw i32 %635, 16
  %642 = or i32 %641, %635
  %643 = shl nsw i32 %635, 12
  %644 = or i32 %642, %643
  %645 = or i32 %644, -534773760
  %646 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %645) #14, !srcloc !6
  %647 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %648 = getelementptr i32, i32* %637, i32 %633
  store i32 %646, i32* %648, align 4
  %649 = load i32, i32* %647, align 4
  br label %650

650:                                              ; preds = %639, %640
  %651 = phi i32 [ %633, %639 ], [ %649, %640 ]
  %652 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %653 = add i32 %651, 1
  store i32 %653, i32* %652, align 4
  br label %654

654:                                              ; preds = %650, %590
  %655 = phi i32 [ %653, %650 ], [ %592, %590 ]
  %656 = getelementptr i8, i8* %536, i32 1
  %657 = load i8, i8* %656, align 1
  br i1 %512, label %658, label %683

658:                                              ; preds = %654
  %659 = sext i8 %509 to i32
  %660 = sub nsw i32 0, %659
  %661 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %662 = load i32*, i32** %661, align 4
  %663 = icmp eq i32* %662, null
  br i1 %663, label %664, label %665

664:                                              ; preds = %658
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %679

665:                                              ; preds = %658
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %666 = shl nuw nsw i32 %660, 4
  %667 = and i32 %666, 3840
  %668 = and i32 %660, 15
  %669 = or i32 %667, %668
  %670 = zext i8 %657 to i32
  %671 = shl nuw nsw i32 %670, 12
  %672 = or i32 %671, 21692656
  %673 = or i32 %669, %672
  %674 = or i32 %673, -536870912
  %675 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %674) #14, !srcloc !6
  %676 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %677 = getelementptr i32, i32* %662, i32 %655
  store i32 %675, i32* %677, align 4
  %678 = load i32, i32* %676, align 4
  br label %679

679:                                              ; preds = %664, %665
  %680 = phi i32 [ %655, %664 ], [ %678, %665 ]
  %681 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %682 = add i32 %680, 1
  store i32 %682, i32* %681, align 4
  br label %3544

683:                                              ; preds = %654
  call void @__sanitizer_cov_trace_cmp1(i8 %509, i8 %657)
  %684 = icmp eq i8 %509, %657
  br i1 %684, label %685, label %686

685:                                              ; preds = %683
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %705

686:                                              ; preds = %683
  %687 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %688 = load i32*, i32** %687, align 4
  %689 = icmp eq i32* %688, null
  br i1 %689, label %690, label %691

690:                                              ; preds = %686
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %701

691:                                              ; preds = %686
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %692 = zext i8 %509 to i32
  %693 = shl nuw nsw i32 %692, 12
  %694 = sext i8 %657 to i32
  %695 = or i32 %693, %694
  %696 = or i32 %695, -509607936
  %697 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %696) #14, !srcloc !6
  %698 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %699 = getelementptr i32, i32* %688, i32 %655
  store i32 %697, i32* %699, align 4
  %700 = load i32, i32* %698, align 4
  br label %701

701:                                              ; preds = %690, %691
  %702 = phi i32 [ %655, %690 ], [ %700, %691 ]
  %703 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %704 = add i32 %702, 1
  store i32 %704, i32* %703, align 4
  br label %705

705:                                              ; preds = %685, %701
  %706 = phi i32 [ %704, %701 ], [ %655, %685 ]
  %707 = load i8, i8* %9, align 1
  %708 = load i8, i8* %536, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %707, i8 %708)
  %709 = icmp eq i8 %707, %708
  br i1 %709, label %710, label %711

710:                                              ; preds = %705
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

711:                                              ; preds = %705
  %712 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %713 = load i32*, i32** %712, align 4
  %714 = icmp eq i32* %713, null
  br i1 %714, label %715, label %716

715:                                              ; preds = %711
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %726

716:                                              ; preds = %711
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %717 = sext i8 %707 to i32
  %718 = shl nsw i32 %717, 12
  %719 = sext i8 %708 to i32
  %720 = or i32 %718, %719
  %721 = or i32 %720, -509607936
  %722 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %721) #14, !srcloc !6
  %723 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %724 = getelementptr i32, i32* %713, i32 %706
  store i32 %722, i32* %724, align 4
  %725 = load i32, i32* %723, align 4
  br label %726

726:                                              ; preds = %715, %716
  %727 = phi i32 [ %706, %715 ], [ %725, %716 ]
  %728 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %729 = add i32 %727, 1
  store i32 %729, i32* %728, align 4
  br label %3544

730:                                              ; preds = %2
  call void @__sanitizer_cov_trace_const_cmp4(i32 63, i32 %16)
  %731 = icmp sgt i32 %16, 63
  br i1 %731, label %732, label %733, !prof !4, !misexpect !5

732:                                              ; preds = %730
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

733:                                              ; preds = %730
  %734 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %735 = load i8, i8* %734, align 1
  %736 = lshr i32 20412, %8
  %737 = and i32 %736, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %737)
  %738 = icmp ne i32 %737, 0
  br i1 %738, label %740, label %739

739:                                              ; preds = %733
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %761

740:                                              ; preds = %733
  %741 = sext i8 %735 to i32
  %742 = sub nsw i32 0, %741
  %743 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %744 = load i32*, i32** %743, align 4
  %745 = icmp eq i32* %744, null
  br i1 %745, label %746, label %747

746:                                              ; preds = %740
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %757

747:                                              ; preds = %740
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %748 = shl nuw nsw i32 %742, 4
  %749 = and i32 %748, 3840
  %750 = and i32 %742, 15
  %751 = or i32 %749, %750
  %752 = or i32 %751, -515153712
  %753 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %752) #14, !srcloc !6
  %754 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %755 = load i32, i32* %754, align 4
  %756 = getelementptr i32, i32* %744, i32 %755
  store i32 %753, i32* %756, align 4
  br label %757

757:                                              ; preds = %746, %747
  %758 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %759 = load i32, i32* %758, align 4
  %760 = add i32 %759, 1
  store i32 %760, i32* %758, align 4
  br label %761

761:                                              ; preds = %739, %757
  %762 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %757 ], [ %9, %739 ]
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %763 = icmp eq i32 %16, 0
  br i1 %763, label %764, label %765

764:                                              ; preds = %761
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %884

765:                                              ; preds = %761
  call void @__sanitizer_cov_trace_const_cmp4(i32 32, i32 %16)
  %766 = icmp ult i32 %16, 32
  br i1 %766, label %767, label %819

767:                                              ; preds = %765
  %768 = getelementptr i8, i8* %762, i32 1
  %769 = shl nuw nsw i32 %16, 7
  %770 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %771 = load i32*, i32** %770, align 4
  %772 = icmp eq i32* %771, null
  br i1 %772, label %773, label %774

773:                                              ; preds = %767
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %783

774:                                              ; preds = %767
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %775 = load i8, i8* %768, align 1
  %776 = sext i8 %775 to i32
  %777 = or i32 %769, %776
  %778 = or i32 %777, -509575136
  %779 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %778) #14, !srcloc !6
  %780 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %781 = load i32, i32* %780, align 4
  %782 = getelementptr i32, i32* %771, i32 %781
  store i32 %779, i32* %782, align 4
  br label %783

783:                                              ; preds = %773, %774
  %784 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %785 = load i32, i32* %784, align 4
  %786 = add i32 %785, 1
  store i32 %786, i32* %784, align 4
  %787 = load i32*, i32** %770, align 4
  %788 = icmp eq i32* %787, null
  br i1 %788, label %789, label %790

789:                                              ; preds = %783
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %803

790:                                              ; preds = %783
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %791 = sub nuw nsw i32 4096, %769
  %792 = load i8, i8* %762, align 1
  %793 = sext i8 %792 to i32
  %794 = or i32 %791, %793
  %795 = load i8, i8* %768, align 1
  %796 = sext i8 %795 to i32
  %797 = shl nsw i32 %796, 12
  %798 = or i32 %794, %797
  %799 = or i32 %798, -511180800
  %800 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %799) #14, !srcloc !6
  %801 = getelementptr i32, i32* %787, i32 %786
  store i32 %800, i32* %801, align 4
  %802 = load i32, i32* %784, align 4
  br label %803

803:                                              ; preds = %789, %790
  %804 = phi i32 [ %786, %789 ], [ %802, %790 ]
  %805 = add i32 %804, 1
  store i32 %805, i32* %784, align 4
  %806 = load i8, i8* %762, align 1
  %807 = sext i8 %806 to i32
  %808 = load i32*, i32** %770, align 4
  %809 = icmp eq i32* %808, null
  br i1 %809, label %810, label %811

810:                                              ; preds = %803
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %880

811:                                              ; preds = %803
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %812 = or i32 %769, %807
  %813 = shl nsw i32 %807, 12
  %814 = or i32 %812, %813
  %815 = or i32 %814, -509607904
  %816 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %815) #14, !srcloc !6
  %817 = getelementptr i32, i32* %808, i32 %805
  store i32 %816, i32* %817, align 4
  %818 = load i32, i32* %784, align 4
  br label %880

819:                                              ; preds = %765
  call void @__sanitizer_cov_trace_const_cmp4(i32 32, i32 %16)
  %820 = icmp eq i32 %16, 32
  %821 = getelementptr i8, i8* %762, i32 1
  %822 = load i8, i8* %821, align 1
  %823 = sext i8 %822 to i32
  %824 = shl nsw i32 %823, 12
  %825 = load i8, i8* %762, align 1
  %826 = sext i8 %825 to i32
  %827 = or i32 %824, %826
  %828 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %829 = load i32*, i32** %828, align 4
  %830 = icmp eq i32* %829, null
  br i1 %820, label %831, label %854

831:                                              ; preds = %819
  br i1 %830, label %832, label %833

832:                                              ; preds = %831
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %839

833:                                              ; preds = %831
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %834 = or i32 %827, -509607936
  %835 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %834) #14, !srcloc !6
  %836 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %837 = load i32, i32* %836, align 4
  %838 = getelementptr i32, i32* %829, i32 %837
  store i32 %835, i32* %838, align 4
  br label %839

839:                                              ; preds = %832, %833
  %840 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %841 = load i32, i32* %840, align 4
  %842 = add i32 %841, 1
  store i32 %842, i32* %840, align 4
  %843 = load i32*, i32** %828, align 4
  %844 = icmp eq i32* %843, null
  br i1 %844, label %845, label %846

845:                                              ; preds = %839
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %880

846:                                              ; preds = %839
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %847 = load i8, i8* %762, align 1
  %848 = sext i8 %847 to i32
  %849 = shl nsw i32 %848, 12
  %850 = or i32 %849, -476053504
  %851 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %850) #14, !srcloc !6
  %852 = getelementptr i32, i32* %843, i32 %842
  store i32 %851, i32* %852, align 4
  %853 = load i32, i32* %840, align 4
  br label %880

854:                                              ; preds = %819
  br i1 %830, label %855, label %856

855:                                              ; preds = %854
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %865

856:                                              ; preds = %854
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %857 = shl i32 %16, 7
  %858 = add i32 %857, 536866816
  %859 = or i32 %827, %858
  %860 = or i32 %859, -509607904
  %861 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %860) #14, !srcloc !6
  %862 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %863 = load i32, i32* %862, align 4
  %864 = getelementptr i32, i32* %829, i32 %863
  store i32 %861, i32* %864, align 4
  br label %865

865:                                              ; preds = %855, %856
  %866 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %867 = load i32, i32* %866, align 4
  %868 = add i32 %867, 1
  store i32 %868, i32* %866, align 4
  %869 = load i32*, i32** %828, align 4
  %870 = icmp eq i32* %869, null
  br i1 %870, label %871, label %872

871:                                              ; preds = %865
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %880

872:                                              ; preds = %865
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %873 = load i8, i8* %762, align 1
  %874 = sext i8 %873 to i32
  %875 = shl nsw i32 %874, 12
  %876 = or i32 %875, -476053504
  %877 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %876) #14, !srcloc !6
  %878 = getelementptr i32, i32* %869, i32 %868
  store i32 %877, i32* %878, align 4
  %879 = load i32, i32* %866, align 4
  br label %880

880:                                              ; preds = %871, %845, %810, %872, %846, %811
  %881 = phi i32 [ %805, %810 ], [ %818, %811 ], [ %842, %845 ], [ %853, %846 ], [ %868, %871 ], [ %879, %872 ]
  %882 = phi i32* [ %784, %810 ], [ %784, %811 ], [ %840, %845 ], [ %840, %846 ], [ %866, %871 ], [ %866, %872 ]
  %883 = add i32 %881, 1
  store i32 %883, i32* %882, align 4
  br label %884

884:                                              ; preds = %764, %880
  %885 = getelementptr i8, i8* %762, i32 1
  %886 = load i8, i8* %885, align 1
  br i1 %738, label %887, label %912

887:                                              ; preds = %884
  %888 = sext i8 %735 to i32
  %889 = sub nsw i32 0, %888
  %890 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %891 = load i32*, i32** %890, align 4
  %892 = icmp eq i32* %891, null
  br i1 %892, label %893, label %894

893:                                              ; preds = %887
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %908

894:                                              ; preds = %887
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %895 = shl nuw nsw i32 %889, 4
  %896 = and i32 %895, 3840
  %897 = and i32 %889, 15
  %898 = or i32 %896, %897
  %899 = zext i8 %886 to i32
  %900 = shl nuw nsw i32 %899, 12
  %901 = or i32 %900, 21692656
  %902 = or i32 %898, %901
  %903 = or i32 %902, -536870912
  %904 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %903) #14, !srcloc !6
  %905 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %906 = load i32, i32* %905, align 4
  %907 = getelementptr i32, i32* %891, i32 %906
  store i32 %904, i32* %907, align 4
  br label %908

908:                                              ; preds = %893, %894
  %909 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %910 = load i32, i32* %909, align 4
  %911 = add i32 %910, 1
  store i32 %911, i32* %909, align 4
  br label %3544

912:                                              ; preds = %884
  call void @__sanitizer_cov_trace_cmp1(i8 %735, i8 %886)
  %913 = icmp eq i8 %735, %886
  br i1 %913, label %914, label %915

914:                                              ; preds = %912
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %934

915:                                              ; preds = %912
  %916 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %917 = load i32*, i32** %916, align 4
  %918 = icmp eq i32* %917, null
  br i1 %918, label %919, label %920

919:                                              ; preds = %915
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %930

920:                                              ; preds = %915
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %921 = zext i8 %735 to i32
  %922 = shl nuw nsw i32 %921, 12
  %923 = sext i8 %886 to i32
  %924 = or i32 %922, %923
  %925 = or i32 %924, -509607936
  %926 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %925) #14, !srcloc !6
  %927 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %928 = load i32, i32* %927, align 4
  %929 = getelementptr i32, i32* %917, i32 %928
  store i32 %926, i32* %929, align 4
  br label %930

930:                                              ; preds = %919, %920
  %931 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %932 = load i32, i32* %931, align 4
  %933 = add i32 %932, 1
  store i32 %933, i32* %931, align 4
  br label %934

934:                                              ; preds = %914, %930
  %935 = load i8, i8* %9, align 1
  %936 = load i8, i8* %762, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %935, i8 %936)
  %937 = icmp eq i8 %935, %936
  br i1 %937, label %938, label %939

938:                                              ; preds = %934
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

939:                                              ; preds = %934
  %940 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %941 = load i32*, i32** %940, align 4
  %942 = icmp eq i32* %941, null
  br i1 %942, label %943, label %944

943:                                              ; preds = %939
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %954

944:                                              ; preds = %939
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %945 = sext i8 %935 to i32
  %946 = shl nsw i32 %945, 12
  %947 = sext i8 %936 to i32
  %948 = or i32 %946, %947
  %949 = or i32 %948, -509607936
  %950 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %949) #14, !srcloc !6
  %951 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %952 = load i32, i32* %951, align 4
  %953 = getelementptr i32, i32* %941, i32 %952
  store i32 %950, i32* %953, align 4
  br label %954

954:                                              ; preds = %943, %944
  %955 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %956 = load i32, i32* %955, align 4
  %957 = add i32 %956, 1
  store i32 %957, i32* %955, align 4
  br label %3544

958:                                              ; preds = %2
  %959 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %960 = load i8, i8* %959, align 1
  %961 = lshr i32 20412, %11
  %962 = and i32 %961, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %962)
  %963 = icmp eq i32 %962, 0
  br i1 %963, label %964, label %965

964:                                              ; preds = %958
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %982

965:                                              ; preds = %958
  %966 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %967 = load i32*, i32** %966, align 4
  %968 = icmp eq i32* %967, null
  br i1 %968, label %969, label %970

969:                                              ; preds = %965
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %978

970:                                              ; preds = %965
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %971 = sext i8 %960 to i32
  %972 = sub nsw i32 0, %971
  %973 = or i32 %972, -451182592
  %974 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %973) #14, !srcloc !6
  %975 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %976 = load i32, i32* %975, align 4
  %977 = getelementptr i32, i32* %967, i32 %976
  store i32 %974, i32* %977, align 4
  br label %978

978:                                              ; preds = %969, %970
  %979 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %980 = load i32, i32* %979, align 4
  %981 = add i32 %980, 1
  store i32 %981, i32* %979, align 4
  br label %982

982:                                              ; preds = %964, %978
  %983 = phi i8 [ 8, %978 ], [ %960, %964 ]
  %984 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %985 = load i8, i8* %984, align 1
  %986 = lshr i32 20412, %8
  %987 = and i32 %986, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %987)
  %988 = icmp ne i32 %987, 0
  br i1 %988, label %990, label %989

989:                                              ; preds = %982
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1011

990:                                              ; preds = %982
  %991 = sext i8 %985 to i32
  %992 = sub nsw i32 0, %991
  %993 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %994 = load i32*, i32** %993, align 4
  %995 = icmp eq i32* %994, null
  br i1 %995, label %996, label %997

996:                                              ; preds = %990
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1007

997:                                              ; preds = %990
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %998 = shl nuw nsw i32 %992, 4
  %999 = and i32 %998, 3840
  %1000 = and i32 %992, 15
  %1001 = or i32 %999, %1000
  %1002 = or i32 %1001, -515153712
  %1003 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1002) #14, !srcloc !6
  %1004 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1005 = load i32, i32* %1004, align 4
  %1006 = getelementptr i32, i32* %994, i32 %1005
  store i32 %1003, i32* %1006, align 4
  br label %1007

1007:                                             ; preds = %996, %997
  %1008 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1009 = load i32, i32* %1008, align 4
  %1010 = add i32 %1009, 1
  store i32 %1010, i32* %1008, align 4
  br label %1011

1011:                                             ; preds = %989, %1007
  %1012 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %1007 ], [ %9, %989 ]
  %1013 = zext i8 %983 to i32
  %1014 = shl nuw nsw i32 %1013, 16
  %1015 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1016 = load i32*, i32** %1015, align 4
  %1017 = icmp eq i32* %1016, null
  br i1 %1017, label %1018, label %1019

1018:                                             ; preds = %1011
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1025

1019:                                             ; preds = %1011
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1020 = or i32 %1014, -499072992
  %1021 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1020) #14, !srcloc !6
  %1022 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1023 = load i32, i32* %1022, align 4
  %1024 = getelementptr i32, i32* %1016, i32 %1023
  store i32 %1021, i32* %1024, align 4
  br label %1025

1025:                                             ; preds = %1018, %1019
  %1026 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1027 = load i32, i32* %1026, align 4
  %1028 = add i32 %1027, 1
  store i32 %1028, i32* %1026, align 4
  %1029 = load i32*, i32** %1015, align 4
  %1030 = icmp eq i32* %1029, null
  br i1 %1030, label %1031, label %1032

1031:                                             ; preds = %1025
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1037

1032:                                             ; preds = %1025
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1033 = or i32 %1014, -496988128
  %1034 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1033) #14, !srcloc !6
  %1035 = getelementptr i32, i32* %1029, i32 %1028
  store i32 %1034, i32* %1035, align 4
  %1036 = load i32, i32* %1026, align 4
  br label %1037

1037:                                             ; preds = %1031, %1032
  %1038 = phi i32 [ %1028, %1031 ], [ %1036, %1032 ]
  %1039 = add i32 %1038, 1
  store i32 %1039, i32* %1026, align 4
  %1040 = shl nuw nsw i32 %1013, 8
  %1041 = load i32*, i32** %1015, align 4
  %1042 = icmp eq i32* %1041, null
  br i1 %1042, label %1043, label %1044

1043:                                             ; preds = %1037
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1052

1044:                                             ; preds = %1037
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1045 = load i8, i8* %1012, align 1
  %1046 = sext i8 %1045 to i32
  %1047 = or i32 %1040, %1046
  %1048 = or i32 %1047, -509550576
  %1049 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1048) #14, !srcloc !6
  %1050 = getelementptr i32, i32* %1041, i32 %1039
  store i32 %1049, i32* %1050, align 4
  %1051 = load i32, i32* %1026, align 4
  br label %1052

1052:                                             ; preds = %1043, %1044
  %1053 = phi i32 [ %1039, %1043 ], [ %1051, %1044 ]
  %1054 = add i32 %1053, 1
  store i32 %1054, i32* %1026, align 4
  %1055 = getelementptr i8, i8* %1012, i32 1
  %1056 = load i32*, i32** %1015, align 4
  %1057 = icmp eq i32* %1056, null
  br i1 %1057, label %1058, label %1059

1058:                                             ; preds = %1052
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1066

1059:                                             ; preds = %1052
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1060 = load i8, i8* %1055, align 1
  %1061 = sext i8 %1060 to i32
  %1062 = or i32 %1061, -510727152
  %1063 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1062) #14, !srcloc !6
  %1064 = getelementptr i32, i32* %1056, i32 %1054
  store i32 %1063, i32* %1064, align 4
  %1065 = load i32, i32* %1026, align 4
  br label %1066

1066:                                             ; preds = %1058, %1059
  %1067 = phi i32 [ %1054, %1058 ], [ %1065, %1059 ]
  %1068 = add i32 %1067, 1
  store i32 %1068, i32* %1026, align 4
  %1069 = load i32*, i32** %1015, align 4
  %1070 = icmp eq i32* %1069, null
  br i1 %1070, label %1071, label %1072

1071:                                             ; preds = %1066
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1079

1072:                                             ; preds = %1066
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1073 = load i8, i8* %1055, align 1
  %1074 = sext i8 %1073 to i32
  %1075 = or i32 %1074, -510736080
  %1076 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1075) #14, !srcloc !6
  %1077 = getelementptr i32, i32* %1069, i32 %1068
  store i32 %1076, i32* %1077, align 4
  %1078 = load i32, i32* %1026, align 4
  br label %1079

1079:                                             ; preds = %1071, %1072
  %1080 = phi i32 [ %1068, %1071 ], [ %1078, %1072 ]
  %1081 = add i32 %1080, 1
  store i32 %1081, i32* %1026, align 4
  %1082 = load i32*, i32** %1015, align 4
  %1083 = icmp eq i32* %1082, null
  br i1 %1083, label %1084, label %1085

1084:                                             ; preds = %1079
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1093

1085:                                             ; preds = %1079
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1086 = load i8, i8* %1055, align 1
  %1087 = sext i8 %1086 to i32
  %1088 = or i32 %1040, %1087
  %1089 = or i32 %1088, -509550576
  %1090 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1089) #14, !srcloc !6
  %1091 = getelementptr i32, i32* %1082, i32 %1081
  store i32 %1090, i32* %1091, align 4
  %1092 = load i32, i32* %1026, align 4
  br label %1093

1093:                                             ; preds = %1084, %1085
  %1094 = phi i32 [ %1081, %1084 ], [ %1092, %1085 ]
  %1095 = add i32 %1094, 1
  store i32 %1095, i32* %1026, align 4
  %1096 = load i32*, i32** %1015, align 4
  %1097 = icmp eq i32* %1096, null
  br i1 %988, label %1098, label %1107

1098:                                             ; preds = %1093
  br i1 %1097, label %1099, label %1100

1099:                                             ; preds = %1098
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1116

1100:                                             ; preds = %1098
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1101 = sext i8 %985 to i32
  %1102 = sub nsw i32 0, %1101
  %1103 = or i32 %1102, -452206592
  %1104 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1103) #14, !srcloc !6
  %1105 = getelementptr i32, i32* %1096, i32 %1095
  store i32 %1104, i32* %1105, align 4
  %1106 = load i32, i32* %1026, align 4
  br label %1116

1107:                                             ; preds = %1093
  br i1 %1097, label %1108, label %1109

1108:                                             ; preds = %1107
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1133

1109:                                             ; preds = %1107
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1110 = zext i8 %985 to i32
  %1111 = shl nuw nsw i32 %1110, 12
  %1112 = or i32 %1111, -509607922
  %1113 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1112) #14, !srcloc !6
  %1114 = getelementptr i32, i32* %1096, i32 %1095
  store i32 %1113, i32* %1114, align 4
  %1115 = load i32, i32* %1026, align 4
  br label %1133

1116:                                             ; preds = %1099, %1100
  %1117 = phi i32 [ %1095, %1099 ], [ %1106, %1100 ]
  %1118 = add i32 %1117, 1
  store i32 %1118, i32* %1026, align 4
  %1119 = load i32*, i32** %1015, align 4
  %1120 = icmp eq i32* %1119, null
  br i1 %1120, label %1121, label %1122

1121:                                             ; preds = %1116
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1130

1122:                                             ; preds = %1116
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1123 = load i8, i8* %9, align 1
  %1124 = sext i8 %1123 to i32
  %1125 = sub nsw i32 0, %1124
  %1126 = or i32 %1125, -452214784
  %1127 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1126) #14, !srcloc !6
  %1128 = getelementptr i32, i32* %1119, i32 %1118
  store i32 %1127, i32* %1128, align 4
  %1129 = load i32, i32* %1026, align 4
  br label %1130

1130:                                             ; preds = %1121, %1122
  %1131 = phi i32 [ %1118, %1121 ], [ %1129, %1122 ]
  %1132 = add i32 %1131, 1
  store i32 %1132, i32* %1026, align 4
  br label %3544

1133:                                             ; preds = %1108, %1109
  %1134 = phi i32 [ %1115, %1109 ], [ %1095, %1108 ]
  %1135 = add i32 %1134, 1
  store i32 %1135, i32* %1026, align 4
  %1136 = load i32*, i32** %1015, align 4
  %1137 = icmp eq i32* %1136, null
  br i1 %1137, label %1138, label %1139

1138:                                             ; preds = %1133
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1147

1139:                                             ; preds = %1133
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1140 = load i8, i8* %9, align 1
  %1141 = zext i8 %1140 to i32
  %1142 = shl nuw nsw i32 %1141, 12
  %1143 = or i32 %1142, -509607924
  %1144 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1143) #14, !srcloc !6
  %1145 = getelementptr i32, i32* %1136, i32 %1135
  store i32 %1144, i32* %1145, align 4
  %1146 = load i32, i32* %1026, align 4
  br label %1147

1147:                                             ; preds = %1138, %1139
  %1148 = phi i32 [ %1146, %1139 ], [ %1135, %1138 ]
  %1149 = add i32 %1148, 1
  store i32 %1149, i32* %1026, align 4
  br label %3544

1150:                                             ; preds = %2
  %1151 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %1152 = load i8, i8* %1151, align 1
  %1153 = lshr i32 20412, %11
  %1154 = and i32 %1153, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1154)
  %1155 = icmp eq i32 %1154, 0
  br i1 %1155, label %1156, label %1157

1156:                                             ; preds = %1150
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1174

1157:                                             ; preds = %1150
  %1158 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1159 = load i32*, i32** %1158, align 4
  %1160 = icmp eq i32* %1159, null
  br i1 %1160, label %1161, label %1162

1161:                                             ; preds = %1157
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1170

1162:                                             ; preds = %1157
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1163 = sext i8 %1152 to i32
  %1164 = sub nsw i32 0, %1163
  %1165 = or i32 %1164, -451182592
  %1166 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1165) #14, !srcloc !6
  %1167 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1168 = load i32, i32* %1167, align 4
  %1169 = getelementptr i32, i32* %1159, i32 %1168
  store i32 %1166, i32* %1169, align 4
  br label %1170

1170:                                             ; preds = %1161, %1162
  %1171 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1172 = load i32, i32* %1171, align 4
  %1173 = add i32 %1172, 1
  store i32 %1173, i32* %1171, align 4
  br label %1174

1174:                                             ; preds = %1156, %1170
  %1175 = phi i8 [ 8, %1170 ], [ %1152, %1156 ]
  %1176 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %1177 = load i8, i8* %1176, align 1
  %1178 = lshr i32 20412, %8
  %1179 = and i32 %1178, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1179)
  %1180 = icmp ne i32 %1179, 0
  br i1 %1180, label %1182, label %1181

1181:                                             ; preds = %1174
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1203

1182:                                             ; preds = %1174
  %1183 = sext i8 %1177 to i32
  %1184 = sub nsw i32 0, %1183
  %1185 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1186 = load i32*, i32** %1185, align 4
  %1187 = icmp eq i32* %1186, null
  br i1 %1187, label %1188, label %1189

1188:                                             ; preds = %1182
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1199

1189:                                             ; preds = %1182
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1190 = shl nuw nsw i32 %1184, 4
  %1191 = and i32 %1190, 3840
  %1192 = and i32 %1184, 15
  %1193 = or i32 %1191, %1192
  %1194 = or i32 %1193, -515153712
  %1195 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1194) #14, !srcloc !6
  %1196 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1197 = load i32, i32* %1196, align 4
  %1198 = getelementptr i32, i32* %1186, i32 %1197
  store i32 %1195, i32* %1198, align 4
  br label %1199

1199:                                             ; preds = %1188, %1189
  %1200 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1201 = load i32, i32* %1200, align 4
  %1202 = add i32 %1201, 1
  store i32 %1202, i32* %1200, align 4
  br label %1203

1203:                                             ; preds = %1181, %1199
  %1204 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %1199 ], [ %9, %1181 ]
  %1205 = zext i8 %1175 to i32
  %1206 = shl nuw nsw i32 %1205, 16
  %1207 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1208 = load i32*, i32** %1207, align 4
  %1209 = icmp eq i32* %1208, null
  br i1 %1209, label %1210, label %1211

1210:                                             ; preds = %1203
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1217

1211:                                             ; preds = %1203
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1212 = or i32 %1206, -496975840
  %1213 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1212) #14, !srcloc !6
  %1214 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1215 = load i32, i32* %1214, align 4
  %1216 = getelementptr i32, i32* %1208, i32 %1215
  store i32 %1213, i32* %1216, align 4
  br label %1217

1217:                                             ; preds = %1210, %1211
  %1218 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1219 = load i32, i32* %1218, align 4
  %1220 = add i32 %1219, 1
  store i32 %1220, i32* %1218, align 4
  %1221 = load i32*, i32** %1207, align 4
  %1222 = icmp eq i32* %1221, null
  br i1 %1222, label %1223, label %1224

1223:                                             ; preds = %1217
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1229

1224:                                             ; preds = %1217
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1225 = or i32 %1206, -498036704
  %1226 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1225) #14, !srcloc !6
  %1227 = getelementptr i32, i32* %1221, i32 %1220
  store i32 %1226, i32* %1227, align 4
  %1228 = load i32, i32* %1218, align 4
  br label %1229

1229:                                             ; preds = %1223, %1224
  %1230 = phi i32 [ %1220, %1223 ], [ %1228, %1224 ]
  %1231 = add i32 %1230, 1
  store i32 %1231, i32* %1218, align 4
  %1232 = shl nuw nsw i32 %1205, 8
  %1233 = load i32*, i32** %1207, align 4
  %1234 = icmp eq i32* %1233, null
  br i1 %1234, label %1235, label %1236

1235:                                             ; preds = %1229
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1245

1236:                                             ; preds = %1229
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1237 = getelementptr i8, i8* %1204, i32 1
  %1238 = load i8, i8* %1237, align 1
  %1239 = sext i8 %1238 to i32
  %1240 = or i32 %1232, %1239
  %1241 = or i32 %1240, -509550544
  %1242 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1241) #14, !srcloc !6
  %1243 = getelementptr i32, i32* %1233, i32 %1231
  store i32 %1242, i32* %1243, align 4
  %1244 = load i32, i32* %1218, align 4
  br label %1245

1245:                                             ; preds = %1235, %1236
  %1246 = phi i32 [ %1231, %1235 ], [ %1244, %1236 ]
  %1247 = add i32 %1246, 1
  store i32 %1247, i32* %1218, align 4
  %1248 = load i32*, i32** %1207, align 4
  %1249 = icmp eq i32* %1248, null
  br i1 %1249, label %1250, label %1251

1250:                                             ; preds = %1245
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1258

1251:                                             ; preds = %1245
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1252 = load i8, i8* %1204, align 1
  %1253 = sext i8 %1252 to i32
  %1254 = or i32 %1253, -510727152
  %1255 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1254) #14, !srcloc !6
  %1256 = getelementptr i32, i32* %1248, i32 %1247
  store i32 %1255, i32* %1256, align 4
  %1257 = load i32, i32* %1218, align 4
  br label %1258

1258:                                             ; preds = %1250, %1251
  %1259 = phi i32 [ %1247, %1250 ], [ %1257, %1251 ]
  %1260 = add i32 %1259, 1
  store i32 %1260, i32* %1218, align 4
  %1261 = load i32*, i32** %1207, align 4
  %1262 = icmp eq i32* %1261, null
  br i1 %1262, label %1263, label %1264

1263:                                             ; preds = %1258
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1271

1264:                                             ; preds = %1258
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1265 = load i8, i8* %1204, align 1
  %1266 = sext i8 %1265 to i32
  %1267 = or i32 %1266, -510727888
  %1268 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1267) #14, !srcloc !6
  %1269 = getelementptr i32, i32* %1261, i32 %1260
  store i32 %1268, i32* %1269, align 4
  %1270 = load i32, i32* %1218, align 4
  br label %1271

1271:                                             ; preds = %1263, %1264
  %1272 = phi i32 [ %1260, %1263 ], [ %1270, %1264 ]
  %1273 = add i32 %1272, 1
  store i32 %1273, i32* %1218, align 4
  %1274 = load i32*, i32** %1207, align 4
  %1275 = icmp eq i32* %1274, null
  br i1 %1275, label %1276, label %1277

1276:                                             ; preds = %1271
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1285

1277:                                             ; preds = %1271
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1278 = load i8, i8* %1204, align 1
  %1279 = sext i8 %1278 to i32
  %1280 = or i32 %1232, %1279
  %1281 = or i32 %1280, -509558736
  %1282 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1281) #14, !srcloc !6
  %1283 = getelementptr i32, i32* %1274, i32 %1273
  store i32 %1282, i32* %1283, align 4
  %1284 = load i32, i32* %1218, align 4
  br label %1285

1285:                                             ; preds = %1276, %1277
  %1286 = phi i32 [ %1273, %1276 ], [ %1284, %1277 ]
  %1287 = add i32 %1286, 1
  store i32 %1287, i32* %1218, align 4
  %1288 = load i32*, i32** %1207, align 4
  %1289 = icmp eq i32* %1288, null
  br i1 %1180, label %1290, label %1299

1290:                                             ; preds = %1285
  br i1 %1289, label %1291, label %1292

1291:                                             ; preds = %1290
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1308

1292:                                             ; preds = %1290
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1293 = sext i8 %1177 to i32
  %1294 = sub nsw i32 0, %1293
  %1295 = or i32 %1294, -452206592
  %1296 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1295) #14, !srcloc !6
  %1297 = getelementptr i32, i32* %1288, i32 %1287
  store i32 %1296, i32* %1297, align 4
  %1298 = load i32, i32* %1218, align 4
  br label %1308

1299:                                             ; preds = %1285
  br i1 %1289, label %1300, label %1301

1300:                                             ; preds = %1299
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1325

1301:                                             ; preds = %1299
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1302 = zext i8 %1177 to i32
  %1303 = shl nuw nsw i32 %1302, 12
  %1304 = or i32 %1303, -509607922
  %1305 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1304) #14, !srcloc !6
  %1306 = getelementptr i32, i32* %1288, i32 %1287
  store i32 %1305, i32* %1306, align 4
  %1307 = load i32, i32* %1218, align 4
  br label %1325

1308:                                             ; preds = %1291, %1292
  %1309 = phi i32 [ %1287, %1291 ], [ %1298, %1292 ]
  %1310 = add i32 %1309, 1
  store i32 %1310, i32* %1218, align 4
  %1311 = load i32*, i32** %1207, align 4
  %1312 = icmp eq i32* %1311, null
  br i1 %1312, label %1313, label %1314

1313:                                             ; preds = %1308
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1322

1314:                                             ; preds = %1308
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1315 = load i8, i8* %9, align 1
  %1316 = sext i8 %1315 to i32
  %1317 = sub nsw i32 0, %1316
  %1318 = or i32 %1317, -452214784
  %1319 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1318) #14, !srcloc !6
  %1320 = getelementptr i32, i32* %1311, i32 %1310
  store i32 %1319, i32* %1320, align 4
  %1321 = load i32, i32* %1218, align 4
  br label %1322

1322:                                             ; preds = %1313, %1314
  %1323 = phi i32 [ %1310, %1313 ], [ %1321, %1314 ]
  %1324 = add i32 %1323, 1
  store i32 %1324, i32* %1218, align 4
  br label %3544

1325:                                             ; preds = %1300, %1301
  %1326 = phi i32 [ %1307, %1301 ], [ %1287, %1300 ]
  %1327 = add i32 %1326, 1
  store i32 %1327, i32* %1218, align 4
  %1328 = load i32*, i32** %1207, align 4
  %1329 = icmp eq i32* %1328, null
  br i1 %1329, label %1330, label %1331

1330:                                             ; preds = %1325
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1339

1331:                                             ; preds = %1325
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1332 = load i8, i8* %9, align 1
  %1333 = zext i8 %1332 to i32
  %1334 = shl nuw nsw i32 %1333, 12
  %1335 = or i32 %1334, -509607924
  %1336 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1335) #14, !srcloc !6
  %1337 = getelementptr i32, i32* %1328, i32 %1327
  store i32 %1336, i32* %1337, align 4
  %1338 = load i32, i32* %1218, align 4
  br label %1339

1339:                                             ; preds = %1330, %1331
  %1340 = phi i32 [ %1338, %1331 ], [ %1327, %1330 ]
  %1341 = add i32 %1340, 1
  store i32 %1341, i32* %1218, align 4
  br label %3544

1342:                                             ; preds = %2
  %1343 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %1344 = load i8, i8* %1343, align 1
  %1345 = lshr i32 20412, %11
  %1346 = and i32 %1345, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1346)
  %1347 = icmp eq i32 %1346, 0
  br i1 %1347, label %1348, label %1349

1348:                                             ; preds = %1342
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1366

1349:                                             ; preds = %1342
  %1350 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1351 = load i32*, i32** %1350, align 4
  %1352 = icmp eq i32* %1351, null
  br i1 %1352, label %1353, label %1354

1353:                                             ; preds = %1349
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1362

1354:                                             ; preds = %1349
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1355 = sext i8 %1344 to i32
  %1356 = sub nsw i32 0, %1355
  %1357 = or i32 %1356, -451182592
  %1358 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1357) #14, !srcloc !6
  %1359 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1360 = load i32, i32* %1359, align 4
  %1361 = getelementptr i32, i32* %1351, i32 %1360
  store i32 %1358, i32* %1361, align 4
  br label %1362

1362:                                             ; preds = %1353, %1354
  %1363 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1364 = load i32, i32* %1363, align 4
  %1365 = add i32 %1364, 1
  store i32 %1365, i32* %1363, align 4
  br label %1366

1366:                                             ; preds = %1348, %1362
  %1367 = phi i8 [ 8, %1362 ], [ %1344, %1348 ]
  %1368 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %1369 = load i8, i8* %1368, align 1
  %1370 = lshr i32 20412, %8
  %1371 = and i32 %1370, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1371)
  %1372 = icmp ne i32 %1371, 0
  br i1 %1372, label %1374, label %1373

1373:                                             ; preds = %1366
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1395

1374:                                             ; preds = %1366
  %1375 = sext i8 %1369 to i32
  %1376 = sub nsw i32 0, %1375
  %1377 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1378 = load i32*, i32** %1377, align 4
  %1379 = icmp eq i32* %1378, null
  br i1 %1379, label %1380, label %1381

1380:                                             ; preds = %1374
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1391

1381:                                             ; preds = %1374
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1382 = shl nuw nsw i32 %1376, 4
  %1383 = and i32 %1382, 3840
  %1384 = and i32 %1376, 15
  %1385 = or i32 %1383, %1384
  %1386 = or i32 %1385, -515153712
  %1387 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1386) #14, !srcloc !6
  %1388 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1389 = load i32, i32* %1388, align 4
  %1390 = getelementptr i32, i32* %1378, i32 %1389
  store i32 %1387, i32* %1390, align 4
  br label %1391

1391:                                             ; preds = %1380, %1381
  %1392 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1393 = load i32, i32* %1392, align 4
  %1394 = add i32 %1393, 1
  store i32 %1394, i32* %1392, align 4
  br label %1395

1395:                                             ; preds = %1373, %1391
  %1396 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %1391 ], [ %9, %1373 ]
  %1397 = zext i8 %1367 to i32
  %1398 = shl nuw nsw i32 %1397, 16
  %1399 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1400 = load i32*, i32** %1399, align 4
  %1401 = icmp eq i32* %1400, null
  br i1 %1401, label %1402, label %1403

1402:                                             ; preds = %1395
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1409

1403:                                             ; preds = %1395
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1404 = or i32 %1398, -496975840
  %1405 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1404) #14, !srcloc !6
  %1406 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1407 = load i32, i32* %1406, align 4
  %1408 = getelementptr i32, i32* %1400, i32 %1407
  store i32 %1405, i32* %1408, align 4
  br label %1409

1409:                                             ; preds = %1402, %1403
  %1410 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1411 = load i32, i32* %1410, align 4
  %1412 = add i32 %1411, 1
  store i32 %1412, i32* %1410, align 4
  %1413 = load i32*, i32** %1399, align 4
  %1414 = icmp eq i32* %1413, null
  br i1 %1414, label %1415, label %1416

1415:                                             ; preds = %1409
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1421

1416:                                             ; preds = %1409
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1417 = or i32 %1398, -498036704
  %1418 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1417) #14, !srcloc !6
  %1419 = getelementptr i32, i32* %1413, i32 %1412
  store i32 %1418, i32* %1419, align 4
  %1420 = load i32, i32* %1410, align 4
  br label %1421

1421:                                             ; preds = %1415, %1416
  %1422 = phi i32 [ %1412, %1415 ], [ %1420, %1416 ]
  %1423 = add i32 %1422, 1
  store i32 %1423, i32* %1410, align 4
  %1424 = shl nuw nsw i32 %1397, 8
  %1425 = load i32*, i32** %1399, align 4
  %1426 = icmp eq i32* %1425, null
  br i1 %1426, label %1427, label %1428

1427:                                             ; preds = %1421
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1437

1428:                                             ; preds = %1421
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1429 = getelementptr i8, i8* %1396, i32 1
  %1430 = load i8, i8* %1429, align 1
  %1431 = sext i8 %1430 to i32
  %1432 = or i32 %1424, %1431
  %1433 = or i32 %1432, -509550544
  %1434 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1433) #14, !srcloc !6
  %1435 = getelementptr i32, i32* %1425, i32 %1423
  store i32 %1434, i32* %1435, align 4
  %1436 = load i32, i32* %1410, align 4
  br label %1437

1437:                                             ; preds = %1427, %1428
  %1438 = phi i32 [ %1423, %1427 ], [ %1436, %1428 ]
  %1439 = add i32 %1438, 1
  store i32 %1439, i32* %1410, align 4
  %1440 = load i32*, i32** %1399, align 4
  %1441 = icmp eq i32* %1440, null
  br i1 %1441, label %1442, label %1443

1442:                                             ; preds = %1437
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1450

1443:                                             ; preds = %1437
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1444 = load i8, i8* %1396, align 1
  %1445 = sext i8 %1444 to i32
  %1446 = or i32 %1445, -510727152
  %1447 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1446) #14, !srcloc !6
  %1448 = getelementptr i32, i32* %1440, i32 %1439
  store i32 %1447, i32* %1448, align 4
  %1449 = load i32, i32* %1410, align 4
  br label %1450

1450:                                             ; preds = %1442, %1443
  %1451 = phi i32 [ %1439, %1442 ], [ %1449, %1443 ]
  %1452 = add i32 %1451, 1
  store i32 %1452, i32* %1410, align 4
  %1453 = load i32*, i32** %1399, align 4
  %1454 = icmp eq i32* %1453, null
  br i1 %1454, label %1455, label %1456

1455:                                             ; preds = %1450
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1463

1456:                                             ; preds = %1450
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1457 = load i8, i8* %1396, align 1
  %1458 = sext i8 %1457 to i32
  %1459 = or i32 %1458, 1368320336
  %1460 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1459) #14, !srcloc !6
  %1461 = getelementptr i32, i32* %1453, i32 %1452
  store i32 %1460, i32* %1461, align 4
  %1462 = load i32, i32* %1410, align 4
  br label %1463

1463:                                             ; preds = %1455, %1456
  %1464 = phi i32 [ %1452, %1455 ], [ %1462, %1456 ]
  %1465 = add i32 %1464, 1
  store i32 %1465, i32* %1410, align 4
  %1466 = load i32*, i32** %1399, align 4
  %1467 = icmp eq i32* %1466, null
  br i1 %1467, label %1468, label %1469

1468:                                             ; preds = %1463
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1477

1469:                                             ; preds = %1463
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1470 = load i8, i8* %1396, align 1
  %1471 = sext i8 %1470 to i32
  %1472 = or i32 %1424, %1471
  %1473 = or i32 %1472, -509558704
  %1474 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1473) #14, !srcloc !6
  %1475 = getelementptr i32, i32* %1466, i32 %1465
  store i32 %1474, i32* %1475, align 4
  %1476 = load i32, i32* %1410, align 4
  br label %1477

1477:                                             ; preds = %1468, %1469
  %1478 = phi i32 [ %1465, %1468 ], [ %1476, %1469 ]
  %1479 = add i32 %1478, 1
  store i32 %1479, i32* %1410, align 4
  %1480 = load i32*, i32** %1399, align 4
  %1481 = icmp eq i32* %1480, null
  br i1 %1372, label %1482, label %1491

1482:                                             ; preds = %1477
  br i1 %1481, label %1483, label %1484

1483:                                             ; preds = %1482
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1500

1484:                                             ; preds = %1482
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1485 = sext i8 %1369 to i32
  %1486 = sub nsw i32 0, %1485
  %1487 = or i32 %1486, -452206592
  %1488 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1487) #14, !srcloc !6
  %1489 = getelementptr i32, i32* %1480, i32 %1479
  store i32 %1488, i32* %1489, align 4
  %1490 = load i32, i32* %1410, align 4
  br label %1500

1491:                                             ; preds = %1477
  br i1 %1481, label %1492, label %1493

1492:                                             ; preds = %1491
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1517

1493:                                             ; preds = %1491
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1494 = zext i8 %1369 to i32
  %1495 = shl nuw nsw i32 %1494, 12
  %1496 = or i32 %1495, -509607922
  %1497 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1496) #14, !srcloc !6
  %1498 = getelementptr i32, i32* %1480, i32 %1479
  store i32 %1497, i32* %1498, align 4
  %1499 = load i32, i32* %1410, align 4
  br label %1517

1500:                                             ; preds = %1483, %1484
  %1501 = phi i32 [ %1479, %1483 ], [ %1490, %1484 ]
  %1502 = add i32 %1501, 1
  store i32 %1502, i32* %1410, align 4
  %1503 = load i32*, i32** %1399, align 4
  %1504 = icmp eq i32* %1503, null
  br i1 %1504, label %1505, label %1506

1505:                                             ; preds = %1500
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1514

1506:                                             ; preds = %1500
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1507 = load i8, i8* %9, align 1
  %1508 = sext i8 %1507 to i32
  %1509 = sub nsw i32 0, %1508
  %1510 = or i32 %1509, -452214784
  %1511 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1510) #14, !srcloc !6
  %1512 = getelementptr i32, i32* %1503, i32 %1502
  store i32 %1511, i32* %1512, align 4
  %1513 = load i32, i32* %1410, align 4
  br label %1514

1514:                                             ; preds = %1505, %1506
  %1515 = phi i32 [ %1502, %1505 ], [ %1513, %1506 ]
  %1516 = add i32 %1515, 1
  store i32 %1516, i32* %1410, align 4
  br label %3544

1517:                                             ; preds = %1492, %1493
  %1518 = phi i32 [ %1499, %1493 ], [ %1479, %1492 ]
  %1519 = add i32 %1518, 1
  store i32 %1519, i32* %1410, align 4
  %1520 = load i32*, i32** %1399, align 4
  %1521 = icmp eq i32* %1520, null
  br i1 %1521, label %1522, label %1523

1522:                                             ; preds = %1517
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1531

1523:                                             ; preds = %1517
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1524 = load i8, i8* %9, align 1
  %1525 = zext i8 %1524 to i32
  %1526 = shl nuw nsw i32 %1525, 12
  %1527 = or i32 %1526, -509607924
  %1528 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1527) #14, !srcloc !6
  %1529 = getelementptr i32, i32* %1520, i32 %1519
  store i32 %1528, i32* %1529, align 4
  %1530 = load i32, i32* %1410, align 4
  br label %1531

1531:                                             ; preds = %1522, %1523
  %1532 = phi i32 [ %1530, %1523 ], [ %1519, %1522 ]
  %1533 = add i32 %1532, 1
  store i32 %1533, i32* %1410, align 4
  br label %3544

1534:                                             ; preds = %2
  call void @__sanitizer_cov_trace_const_cmp4(i32 63, i32 %16)
  %1535 = icmp sgt i32 %16, 63
  br i1 %1535, label %1536, label %1537, !prof !4, !misexpect !5

1536:                                             ; preds = %1534
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

1537:                                             ; preds = %1534
  %1538 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %1539 = load i8, i8* %1538, align 1
  %1540 = lshr i32 20412, %8
  %1541 = and i32 %1540, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1541)
  %1542 = icmp ne i32 %1541, 0
  br i1 %1542, label %1544, label %1543

1543:                                             ; preds = %1537
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1565

1544:                                             ; preds = %1537
  %1545 = sext i8 %1539 to i32
  %1546 = sub nsw i32 0, %1545
  %1547 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1548 = load i32*, i32** %1547, align 4
  %1549 = icmp eq i32* %1548, null
  br i1 %1549, label %1550, label %1551

1550:                                             ; preds = %1544
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1561

1551:                                             ; preds = %1544
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1552 = shl nuw nsw i32 %1546, 4
  %1553 = and i32 %1552, 3840
  %1554 = and i32 %1546, 15
  %1555 = or i32 %1553, %1554
  %1556 = or i32 %1555, -515153712
  %1557 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1556) #14, !srcloc !6
  %1558 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1559 = load i32, i32* %1558, align 4
  %1560 = getelementptr i32, i32* %1548, i32 %1559
  store i32 %1557, i32* %1560, align 4
  br label %1561

1561:                                             ; preds = %1550, %1551
  %1562 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1563 = load i32, i32* %1562, align 4
  %1564 = add i32 %1563, 1
  store i32 %1564, i32* %1562, align 4
  br label %1565

1565:                                             ; preds = %1543, %1561
  %1566 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %1561 ], [ %9, %1543 ]
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %1567 = icmp eq i32 %16, 0
  br i1 %1567, label %1568, label %1569

1568:                                             ; preds = %1565
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1690

1569:                                             ; preds = %1565
  call void @__sanitizer_cov_trace_const_cmp4(i32 32, i32 %16)
  %1570 = icmp ult i32 %16, 32
  br i1 %1570, label %1571, label %1623

1571:                                             ; preds = %1569
  %1572 = getelementptr i8, i8* %1566, i32 1
  %1573 = shl nuw nsw i32 %16, 7
  %1574 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1575 = load i32*, i32** %1574, align 4
  %1576 = icmp eq i32* %1575, null
  br i1 %1576, label %1577, label %1578

1577:                                             ; preds = %1571
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1587

1578:                                             ; preds = %1571
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1579 = load i8, i8* %1572, align 1
  %1580 = sext i8 %1579 to i32
  %1581 = or i32 %1573, %1580
  %1582 = or i32 %1581, -509575136
  %1583 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1582) #14, !srcloc !6
  %1584 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1585 = load i32, i32* %1584, align 4
  %1586 = getelementptr i32, i32* %1575, i32 %1585
  store i32 %1583, i32* %1586, align 4
  br label %1587

1587:                                             ; preds = %1577, %1578
  %1588 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1589 = load i32, i32* %1588, align 4
  %1590 = add i32 %1589, 1
  store i32 %1590, i32* %1588, align 4
  %1591 = load i32*, i32** %1574, align 4
  %1592 = icmp eq i32* %1591, null
  br i1 %1592, label %1593, label %1594

1593:                                             ; preds = %1587
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1607

1594:                                             ; preds = %1587
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1595 = sub nuw nsw i32 4096, %1573
  %1596 = load i8, i8* %1566, align 1
  %1597 = sext i8 %1596 to i32
  %1598 = or i32 %1595, %1597
  %1599 = load i8, i8* %1572, align 1
  %1600 = sext i8 %1599 to i32
  %1601 = shl nsw i32 %1600, 12
  %1602 = or i32 %1598, %1601
  %1603 = or i32 %1602, -511180800
  %1604 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1603) #14, !srcloc !6
  %1605 = getelementptr i32, i32* %1591, i32 %1590
  store i32 %1604, i32* %1605, align 4
  %1606 = load i32, i32* %1588, align 4
  br label %1607

1607:                                             ; preds = %1593, %1594
  %1608 = phi i32 [ %1590, %1593 ], [ %1606, %1594 ]
  %1609 = add i32 %1608, 1
  store i32 %1609, i32* %1588, align 4
  %1610 = load i8, i8* %1566, align 1
  %1611 = sext i8 %1610 to i32
  %1612 = load i32*, i32** %1574, align 4
  %1613 = icmp eq i32* %1612, null
  br i1 %1613, label %1614, label %1615

1614:                                             ; preds = %1607
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1686

1615:                                             ; preds = %1607
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1616 = or i32 %1573, %1611
  %1617 = shl nsw i32 %1611, 12
  %1618 = or i32 %1616, %1617
  %1619 = or i32 %1618, -509607872
  %1620 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1619) #14, !srcloc !6
  %1621 = getelementptr i32, i32* %1612, i32 %1609
  store i32 %1620, i32* %1621, align 4
  %1622 = load i32, i32* %1588, align 4
  br label %1686

1623:                                             ; preds = %1569
  call void @__sanitizer_cov_trace_const_cmp4(i32 32, i32 %16)
  %1624 = icmp eq i32 %16, 32
  %1625 = getelementptr i8, i8* %1566, i32 1
  %1626 = load i8, i8* %1625, align 1
  %1627 = sext i8 %1626 to i32
  %1628 = shl nsw i32 %1627, 12
  %1629 = load i8, i8* %1566, align 1
  %1630 = sext i8 %1629 to i32
  %1631 = or i32 %1628, %1630
  %1632 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1633 = load i32*, i32** %1632, align 4
  %1634 = icmp eq i32* %1633, null
  br i1 %1624, label %1635, label %1659

1635:                                             ; preds = %1623
  br i1 %1634, label %1636, label %1637

1636:                                             ; preds = %1635
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1643

1637:                                             ; preds = %1635
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1638 = or i32 %1631, -509607936
  %1639 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1638) #14, !srcloc !6
  %1640 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1641 = load i32, i32* %1640, align 4
  %1642 = getelementptr i32, i32* %1633, i32 %1641
  store i32 %1639, i32* %1642, align 4
  br label %1643

1643:                                             ; preds = %1636, %1637
  %1644 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1645 = load i32, i32* %1644, align 4
  %1646 = add i32 %1645, 1
  store i32 %1646, i32* %1644, align 4
  %1647 = load i8, i8* %1566, align 1
  %1648 = sext i8 %1647 to i32
  %1649 = load i32*, i32** %1632, align 4
  %1650 = icmp eq i32* %1649, null
  br i1 %1650, label %1651, label %1652

1651:                                             ; preds = %1643
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1686

1652:                                             ; preds = %1643
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1653 = shl nsw i32 %1648, 12
  %1654 = or i32 %1653, %1648
  %1655 = or i32 %1654, -509603904
  %1656 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1655) #14, !srcloc !6
  %1657 = getelementptr i32, i32* %1649, i32 %1646
  store i32 %1656, i32* %1657, align 4
  %1658 = load i32, i32* %1644, align 4
  br label %1686

1659:                                             ; preds = %1623
  br i1 %1634, label %1660, label %1661

1660:                                             ; preds = %1659
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1670

1661:                                             ; preds = %1659
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1662 = shl i32 %16, 7
  %1663 = add i32 %1662, 536866816
  %1664 = or i32 %1631, %1663
  %1665 = or i32 %1664, -509607872
  %1666 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1665) #14, !srcloc !6
  %1667 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1668 = load i32, i32* %1667, align 4
  %1669 = getelementptr i32, i32* %1633, i32 %1668
  store i32 %1666, i32* %1669, align 4
  br label %1670

1670:                                             ; preds = %1660, %1661
  %1671 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1672 = load i32, i32* %1671, align 4
  %1673 = add i32 %1672, 1
  store i32 %1673, i32* %1671, align 4
  %1674 = load i8, i8* %1566, align 1
  %1675 = sext i8 %1674 to i32
  %1676 = load i32*, i32** %1632, align 4
  %1677 = icmp eq i32* %1676, null
  br i1 %1677, label %1678, label %1679

1678:                                             ; preds = %1670
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1686

1679:                                             ; preds = %1670
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1680 = shl nsw i32 %1675, 12
  %1681 = or i32 %1680, %1675
  %1682 = or i32 %1681, -509603904
  %1683 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1682) #14, !srcloc !6
  %1684 = getelementptr i32, i32* %1676, i32 %1673
  store i32 %1683, i32* %1684, align 4
  %1685 = load i32, i32* %1671, align 4
  br label %1686

1686:                                             ; preds = %1678, %1651, %1614, %1679, %1652, %1615
  %1687 = phi i32 [ %1609, %1614 ], [ %1622, %1615 ], [ %1646, %1651 ], [ %1658, %1652 ], [ %1673, %1678 ], [ %1685, %1679 ]
  %1688 = phi i32* [ %1588, %1614 ], [ %1588, %1615 ], [ %1644, %1651 ], [ %1644, %1652 ], [ %1671, %1678 ], [ %1671, %1679 ]
  %1689 = add i32 %1687, 1
  store i32 %1689, i32* %1688, align 4
  br label %1690

1690:                                             ; preds = %1568, %1686
  %1691 = getelementptr i8, i8* %1566, i32 1
  %1692 = load i8, i8* %1691, align 1
  br i1 %1542, label %1693, label %1718

1693:                                             ; preds = %1690
  %1694 = sext i8 %1539 to i32
  %1695 = sub nsw i32 0, %1694
  %1696 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1697 = load i32*, i32** %1696, align 4
  %1698 = icmp eq i32* %1697, null
  br i1 %1698, label %1699, label %1700

1699:                                             ; preds = %1693
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1714

1700:                                             ; preds = %1693
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1701 = shl nuw nsw i32 %1695, 4
  %1702 = and i32 %1701, 3840
  %1703 = and i32 %1695, 15
  %1704 = or i32 %1702, %1703
  %1705 = zext i8 %1692 to i32
  %1706 = shl nuw nsw i32 %1705, 12
  %1707 = or i32 %1706, 21692656
  %1708 = or i32 %1704, %1707
  %1709 = or i32 %1708, -536870912
  %1710 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1709) #14, !srcloc !6
  %1711 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1712 = load i32, i32* %1711, align 4
  %1713 = getelementptr i32, i32* %1697, i32 %1712
  store i32 %1710, i32* %1713, align 4
  br label %1714

1714:                                             ; preds = %1699, %1700
  %1715 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1716 = load i32, i32* %1715, align 4
  %1717 = add i32 %1716, 1
  store i32 %1717, i32* %1715, align 4
  br label %3544

1718:                                             ; preds = %1690
  call void @__sanitizer_cov_trace_cmp1(i8 %1539, i8 %1692)
  %1719 = icmp eq i8 %1539, %1692
  br i1 %1719, label %1720, label %1721

1720:                                             ; preds = %1718
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1740

1721:                                             ; preds = %1718
  %1722 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1723 = load i32*, i32** %1722, align 4
  %1724 = icmp eq i32* %1723, null
  br i1 %1724, label %1725, label %1726

1725:                                             ; preds = %1721
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1736

1726:                                             ; preds = %1721
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1727 = zext i8 %1539 to i32
  %1728 = shl nuw nsw i32 %1727, 12
  %1729 = sext i8 %1692 to i32
  %1730 = or i32 %1728, %1729
  %1731 = or i32 %1730, -509607936
  %1732 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1731) #14, !srcloc !6
  %1733 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1734 = load i32, i32* %1733, align 4
  %1735 = getelementptr i32, i32* %1723, i32 %1734
  store i32 %1732, i32* %1735, align 4
  br label %1736

1736:                                             ; preds = %1725, %1726
  %1737 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1738 = load i32, i32* %1737, align 4
  %1739 = add i32 %1738, 1
  store i32 %1739, i32* %1737, align 4
  br label %1740

1740:                                             ; preds = %1720, %1736
  %1741 = load i8, i8* %9, align 1
  %1742 = load i8, i8* %1566, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %1741, i8 %1742)
  %1743 = icmp eq i8 %1741, %1742
  br i1 %1743, label %1744, label %1745

1744:                                             ; preds = %1740
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

1745:                                             ; preds = %1740
  %1746 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1747 = load i32*, i32** %1746, align 4
  %1748 = icmp eq i32* %1747, null
  br i1 %1748, label %1749, label %1750

1749:                                             ; preds = %1745
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1760

1750:                                             ; preds = %1745
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1751 = sext i8 %1741 to i32
  %1752 = shl nsw i32 %1751, 12
  %1753 = sext i8 %1742 to i32
  %1754 = or i32 %1752, %1753
  %1755 = or i32 %1754, -509607936
  %1756 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1755) #14, !srcloc !6
  %1757 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1758 = load i32, i32* %1757, align 4
  %1759 = getelementptr i32, i32* %1747, i32 %1758
  store i32 %1756, i32* %1759, align 4
  br label %1760

1760:                                             ; preds = %1749, %1750
  %1761 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1762 = load i32, i32* %1761, align 4
  %1763 = add i32 %1762, 1
  store i32 %1763, i32* %1761, align 4
  br label %3544

1764:                                             ; preds = %2
  %1765 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %1766 = load i8, i8* %1765, align 1
  tail call fastcc void @emit_a32_alu_i(i8 signext %1766, i32 0, %struct.jit_ctx* %1, i8 zeroext -128)
  %1767 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %1768 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %1767, i32 0, i32 7
  %1769 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %1768, align 4
  %1770 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1769, i32 0, i32 13
  %1771 = load i8, i8* %1770, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %1771)
  %1772 = icmp eq i8 %1771, 0
  br i1 %1772, label %1774, label %1773

1773:                                             ; preds = %1764
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

1774:                                             ; preds = %1764
  %1775 = load i8, i8* %9, align 1
  %1776 = lshr i32 20412, %8
  %1777 = and i32 %1776, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1777)
  %1778 = icmp eq i32 %1777, 0
  %1779 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1780 = load i32*, i32** %1779, align 4
  %1781 = icmp eq i32* %1780, null
  br i1 %1778, label %1805, label %1782

1782:                                             ; preds = %1774
  br i1 %1781, label %1783, label %1784

1783:                                             ; preds = %1782
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1788

1784:                                             ; preds = %1782
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1785 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1786 = load i32, i32* %1785, align 4
  %1787 = getelementptr i32, i32* %1780, i32 %1786
  store i32 6332643, i32* %1787, align 4
  br label %1788

1788:                                             ; preds = %1783, %1784
  %1789 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1790 = load i32, i32* %1789, align 4
  %1791 = add i32 %1790, 1
  store i32 %1791, i32* %1789, align 4
  %1792 = load i32*, i32** %1779, align 4
  %1793 = icmp eq i32* %1792, null
  br i1 %1793, label %1794, label %1795

1794:                                             ; preds = %1788
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1802

1795:                                             ; preds = %1788
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1796 = sext i8 %1775 to i32
  %1797 = sub nsw i32 0, %1796
  %1798 = or i32 %1797, -452239360
  %1799 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1798) #14, !srcloc !6
  %1800 = getelementptr i32, i32* %1792, i32 %1791
  store i32 %1799, i32* %1800, align 4
  %1801 = load i32, i32* %1789, align 4
  br label %1802

1802:                                             ; preds = %1794, %1795
  %1803 = phi i32 [ %1801, %1795 ], [ %1791, %1794 ]
  %1804 = add i32 %1803, 1
  store i32 %1804, i32* %1789, align 4
  br label %3544

1805:                                             ; preds = %1774
  br i1 %1781, label %1806, label %1807

1806:                                             ; preds = %1805
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1815

1807:                                             ; preds = %1805
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1808 = zext i8 %1775 to i32
  %1809 = shl nuw nsw i32 %1808, 12
  %1810 = or i32 %1809, -476053504
  %1811 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1810) #14, !srcloc !6
  %1812 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1813 = load i32, i32* %1812, align 4
  %1814 = getelementptr i32, i32* %1780, i32 %1813
  store i32 %1811, i32* %1814, align 4
  br label %1815

1815:                                             ; preds = %1806, %1807
  %1816 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1817 = load i32, i32* %1816, align 4
  %1818 = add i32 %1817, 1
  store i32 %1818, i32* %1816, align 4
  br label %3544

1819:                                             ; preds = %2
  %1820 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %1821 = load i8, i8* %1820, align 1
  %1822 = lshr i32 20412, %8
  %1823 = and i32 %1822, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1823)
  %1824 = icmp ne i32 %1823, 0
  br i1 %1824, label %1826, label %1825

1825:                                             ; preds = %1819
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1847

1826:                                             ; preds = %1819
  %1827 = sext i8 %1821 to i32
  %1828 = sub nsw i32 0, %1827
  %1829 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1830 = load i32*, i32** %1829, align 4
  %1831 = icmp eq i32* %1830, null
  br i1 %1831, label %1832, label %1833

1832:                                             ; preds = %1826
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1843

1833:                                             ; preds = %1826
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1834 = shl nuw nsw i32 %1828, 4
  %1835 = and i32 %1834, 3840
  %1836 = and i32 %1828, 15
  %1837 = or i32 %1835, %1836
  %1838 = or i32 %1837, -515153712
  %1839 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1838) #14, !srcloc !6
  %1840 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1841 = load i32, i32* %1840, align 4
  %1842 = getelementptr i32, i32* %1830, i32 %1841
  store i32 %1839, i32* %1842, align 4
  br label %1843

1843:                                             ; preds = %1832, %1833
  %1844 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1845 = load i32, i32* %1844, align 4
  %1846 = add i32 %1845, 1
  store i32 %1846, i32* %1844, align 4
  br label %1847

1847:                                             ; preds = %1825, %1843
  %1848 = phi i8 [ 6, %1843 ], [ %1821, %1825 ]
  %1849 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %1843 ], [ %9, %1825 ]
  %1850 = getelementptr i8, i8* %1849, i32 1
  %1851 = zext i8 %1848 to i32
  %1852 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1853 = load i32*, i32** %1852, align 4
  %1854 = icmp eq i32* %1853, null
  br i1 %1854, label %1855, label %1856

1855:                                             ; preds = %1847
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1865

1856:                                             ; preds = %1847
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1857 = shl nuw nsw i32 %1851, 12
  %1858 = shl nuw nsw i32 %1851, 16
  %1859 = or i32 %1857, %1858
  %1860 = or i32 %1859, -495976448
  %1861 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1860) #14, !srcloc !6
  %1862 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1863 = load i32, i32* %1862, align 4
  %1864 = getelementptr i32, i32* %1853, i32 %1863
  store i32 %1861, i32* %1864, align 4
  br label %1865

1865:                                             ; preds = %1855, %1856
  %1866 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1867 = load i32, i32* %1866, align 4
  %1868 = add i32 %1867, 1
  store i32 %1868, i32* %1866, align 4
  %1869 = load i8, i8* %1849, align 1
  %1870 = sext i8 %1869 to i32
  %1871 = load i32*, i32** %1852, align 4
  %1872 = icmp eq i32* %1871, null
  br i1 %1872, label %1873, label %1874

1873:                                             ; preds = %1865
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1882

1874:                                             ; preds = %1865
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1875 = shl nsw i32 %1870, 12
  %1876 = shl nsw i32 %1870, 16
  %1877 = or i32 %1875, %1876
  %1878 = or i32 %1877, -488636416
  %1879 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1878) #14, !srcloc !6
  %1880 = getelementptr i32, i32* %1871, i32 %1868
  store i32 %1879, i32* %1880, align 4
  %1881 = load i32, i32* %1866, align 4
  br label %1882

1882:                                             ; preds = %1873, %1874
  %1883 = phi i32 [ %1868, %1873 ], [ %1881, %1874 ]
  %1884 = add i32 %1883, 1
  store i32 %1884, i32* %1866, align 4
  %1885 = load i8, i8* %1850, align 1
  br i1 %1824, label %1886, label %1908

1886:                                             ; preds = %1882
  %1887 = sext i8 %1821 to i32
  %1888 = sub nsw i32 0, %1887
  %1889 = load i32*, i32** %1852, align 4
  %1890 = icmp eq i32* %1889, null
  br i1 %1890, label %1891, label %1892

1891:                                             ; preds = %1886
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1905

1892:                                             ; preds = %1886
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1893 = shl nuw nsw i32 %1888, 4
  %1894 = and i32 %1893, 3840
  %1895 = and i32 %1888, 15
  %1896 = or i32 %1894, %1895
  %1897 = zext i8 %1885 to i32
  %1898 = shl nuw nsw i32 %1897, 12
  %1899 = or i32 %1898, 21692656
  %1900 = or i32 %1896, %1899
  %1901 = or i32 %1900, -536870912
  %1902 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1901) #14, !srcloc !6
  %1903 = getelementptr i32, i32* %1889, i32 %1884
  store i32 %1902, i32* %1903, align 4
  %1904 = load i32, i32* %1866, align 4
  br label %1905

1905:                                             ; preds = %1891, %1892
  %1906 = phi i32 [ %1884, %1891 ], [ %1904, %1892 ]
  %1907 = add i32 %1906, 1
  store i32 %1907, i32* %1866, align 4
  br label %3544

1908:                                             ; preds = %1882
  call void @__sanitizer_cov_trace_cmp1(i8 %1821, i8 %1885)
  %1909 = icmp eq i8 %1821, %1885
  br i1 %1909, label %1910, label %1911

1910:                                             ; preds = %1908
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1927

1911:                                             ; preds = %1908
  %1912 = load i32*, i32** %1852, align 4
  %1913 = icmp eq i32* %1912, null
  br i1 %1913, label %1914, label %1915

1914:                                             ; preds = %1911
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1924

1915:                                             ; preds = %1911
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1916 = zext i8 %1821 to i32
  %1917 = shl nuw nsw i32 %1916, 12
  %1918 = sext i8 %1885 to i32
  %1919 = or i32 %1917, %1918
  %1920 = or i32 %1919, -509607936
  %1921 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1920) #14, !srcloc !6
  %1922 = getelementptr i32, i32* %1912, i32 %1884
  store i32 %1921, i32* %1922, align 4
  %1923 = load i32, i32* %1866, align 4
  br label %1924

1924:                                             ; preds = %1914, %1915
  %1925 = phi i32 [ %1884, %1914 ], [ %1923, %1915 ]
  %1926 = add i32 %1925, 1
  store i32 %1926, i32* %1866, align 4
  br label %1927

1927:                                             ; preds = %1910, %1924
  %1928 = phi i32 [ %1926, %1924 ], [ %1884, %1910 ]
  %1929 = load i8, i8* %9, align 1
  %1930 = load i8, i8* %1849, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %1929, i8 %1930)
  %1931 = icmp eq i8 %1929, %1930
  br i1 %1931, label %1932, label %1933

1932:                                             ; preds = %1927
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

1933:                                             ; preds = %1927
  %1934 = load i32*, i32** %1852, align 4
  %1935 = icmp eq i32* %1934, null
  br i1 %1935, label %1936, label %1937

1936:                                             ; preds = %1933
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1946

1937:                                             ; preds = %1933
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1938 = sext i8 %1929 to i32
  %1939 = shl nsw i32 %1938, 12
  %1940 = sext i8 %1930 to i32
  %1941 = or i32 %1939, %1940
  %1942 = or i32 %1941, -509607936
  %1943 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1942) #14, !srcloc !6
  %1944 = getelementptr i32, i32* %1934, i32 %1928
  store i32 %1943, i32* %1944, align 4
  %1945 = load i32, i32* %1866, align 4
  br label %1946

1946:                                             ; preds = %1936, %1937
  %1947 = phi i32 [ %1928, %1936 ], [ %1945, %1937 ]
  %1948 = add i32 %1947, 1
  store i32 %1948, i32* %1866, align 4
  br label %3544

1949:                                             ; preds = %88, %89
  %1950 = and i32 %24, 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1950)
  %1951 = icmp eq i32 %1950, 0
  br i1 %1951, label %1953, label %1952

1952:                                             ; preds = %1949
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  tail call fastcc void @emit_a32_mul_r64(i8* %9, i8* %12, %struct.jit_ctx* %1)
  br label %3544

1953:                                             ; preds = %1949
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1954 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %1955 = icmp slt i32 %16, 0
  %1956 = and i1 %26, %1955
  %1957 = or i64 %1954, -4294967296
  %1958 = select i1 %1956, i64 %1957, i64 %1954
  tail call fastcc void @emit_a32_mov_i64(i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), i64 %1958, %struct.jit_ctx* %1) #12
  tail call fastcc void @emit_a32_mul_r64(i8* %9, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), %struct.jit_ctx* %1)
  br label %3544

1959:                                             ; preds = %86, %87
  %1960 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %1961 = load i8, i8* %1960, align 1
  %1962 = lshr i32 20412, %8
  %1963 = and i32 %1962, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1963)
  %1964 = icmp ne i32 %1963, 0
  br i1 %1964, label %1966, label %1965

1965:                                             ; preds = %1959
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1987

1966:                                             ; preds = %1959
  %1967 = sext i8 %1961 to i32
  %1968 = sub nsw i32 0, %1967
  %1969 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1970 = load i32*, i32** %1969, align 4
  %1971 = icmp eq i32* %1970, null
  br i1 %1971, label %1972, label %1973

1972:                                             ; preds = %1966
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %1983

1973:                                             ; preds = %1966
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %1974 = shl nuw nsw i32 %1968, 4
  %1975 = and i32 %1974, 3840
  %1976 = and i32 %1968, 15
  %1977 = or i32 %1975, %1976
  %1978 = or i32 %1977, -515153712
  %1979 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %1978) #14, !srcloc !6
  %1980 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1981 = load i32, i32* %1980, align 4
  %1982 = getelementptr i32, i32* %1970, i32 %1981
  store i32 %1979, i32* %1982, align 4
  br label %1983

1983:                                             ; preds = %1972, %1973
  %1984 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %1985 = load i32, i32* %1984, align 4
  %1986 = add i32 %1985, 1
  store i32 %1986, i32* %1984, align 4
  br label %1987

1987:                                             ; preds = %1965, %1983
  %1988 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %1983 ], [ %9, %1965 ]
  %1989 = and i32 %24, 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1989)
  %1990 = icmp eq i32 %1989, 0
  br i1 %1990, label %2083, label %1991

1991:                                             ; preds = %1987
  %1992 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_switch(i64 %1992, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__sancov_gen_cov_switch_values.8, i32 0, i32 0))
  switch i32 %16, label %1993 [
    i32 16, label %1994
    i32 32, label %2014
    i32 64, label %2034
  ]

1993:                                             ; preds = %1991
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2162

1994:                                             ; preds = %1991
  %1995 = getelementptr i8, i8* %1988, i32 1
  %1996 = load i8, i8* %1995, align 1
  %1997 = zext i8 %1996 to i32
  %1998 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %1999 = load i32*, i32** %1998, align 4
  %2000 = icmp eq i32* %1999, null
  br i1 %2000, label %2001, label %2002

2001:                                             ; preds = %1994
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2010

2002:                                             ; preds = %1994
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2003 = shl nuw nsw i32 %1997, 12
  %2004 = or i32 %2003, %1997
  %2005 = or i32 %2004, -423686224
  %2006 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2005) #14, !srcloc !6
  %2007 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2008 = load i32, i32* %2007, align 4
  %2009 = getelementptr i32, i32* %1999, i32 %2008
  store i32 %2006, i32* %2009, align 4
  br label %2010

2010:                                             ; preds = %2001, %2002
  %2011 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2012 = load i32, i32* %2011, align 4
  %2013 = add i32 %2012, 1
  store i32 %2013, i32* %2011, align 4
  br label %2088

2014:                                             ; preds = %1991
  %2015 = getelementptr i8, i8* %1988, i32 1
  %2016 = load i8, i8* %2015, align 1
  %2017 = zext i8 %2016 to i32
  %2018 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2019 = load i32*, i32** %2018, align 4
  %2020 = icmp eq i32* %2019, null
  br i1 %2020, label %2021, label %2022

2021:                                             ; preds = %2014
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2030

2022:                                             ; preds = %2014
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2023 = shl nuw nsw i32 %2017, 12
  %2024 = or i32 %2023, %2017
  %2025 = or i32 %2024, -423686352
  %2026 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2025) #14, !srcloc !6
  %2027 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2028 = load i32, i32* %2027, align 4
  %2029 = getelementptr i32, i32* %2019, i32 %2028
  store i32 %2026, i32* %2029, align 4
  br label %2030

2030:                                             ; preds = %2021, %2022
  %2031 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2032 = load i32, i32* %2031, align 4
  %2033 = add i32 %2032, 1
  store i32 %2033, i32* %2031, align 4
  br label %2133

2034:                                             ; preds = %1991
  %2035 = getelementptr i8, i8* %1988, i32 1
  %2036 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2037 = load i32*, i32** %2036, align 4
  %2038 = icmp eq i32* %2037, null
  br i1 %2038, label %2039, label %2040

2039:                                             ; preds = %2034
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2048

2040:                                             ; preds = %2034
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2041 = load i8, i8* %2035, align 1
  %2042 = zext i8 %2041 to i32
  %2043 = or i32 %2042, -423629008
  %2044 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2043) #14, !srcloc !6
  %2045 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2046 = load i32, i32* %2045, align 4
  %2047 = getelementptr i32, i32* %2037, i32 %2046
  store i32 %2044, i32* %2047, align 4
  br label %2048

2048:                                             ; preds = %2039, %2040
  %2049 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2050 = load i32, i32* %2049, align 4
  %2051 = add i32 %2050, 1
  store i32 %2051, i32* %2049, align 4
  %2052 = load i32*, i32** %2036, align 4
  %2053 = icmp eq i32* %2052, null
  br i1 %2053, label %2054, label %2055

2054:                                             ; preds = %2048
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2066

2055:                                             ; preds = %2048
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2056 = load i8, i8* %2035, align 1
  %2057 = zext i8 %2056 to i32
  %2058 = shl nuw nsw i32 %2057, 12
  %2059 = load i8, i8* %1988, align 1
  %2060 = zext i8 %2059 to i32
  %2061 = or i32 %2058, %2060
  %2062 = or i32 %2061, -423686352
  %2063 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2062) #14, !srcloc !6
  %2064 = getelementptr i32, i32* %2052, i32 %2051
  store i32 %2063, i32* %2064, align 4
  %2065 = load i32, i32* %2049, align 4
  br label %2066

2066:                                             ; preds = %2054, %2055
  %2067 = phi i32 [ %2051, %2054 ], [ %2065, %2055 ]
  %2068 = add i32 %2067, 1
  store i32 %2068, i32* %2049, align 4
  %2069 = load i32*, i32** %2036, align 4
  %2070 = icmp eq i32* %2069, null
  br i1 %2070, label %2071, label %2072

2071:                                             ; preds = %2066
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2080

2072:                                             ; preds = %2066
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2073 = load i8, i8* %1988, align 1
  %2074 = sext i8 %2073 to i32
  %2075 = shl nsw i32 %2074, 12
  %2076 = or i32 %2075, -509607922
  %2077 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2076) #14, !srcloc !6
  %2078 = getelementptr i32, i32* %2069, i32 %2068
  store i32 %2077, i32* %2078, align 4
  %2079 = load i32, i32* %2049, align 4
  br label %2080

2080:                                             ; preds = %2071, %2072
  %2081 = phi i32 [ %2068, %2071 ], [ %2079, %2072 ]
  %2082 = add i32 %2081, 1
  store i32 %2082, i32* %2049, align 4
  br label %2162

2083:                                             ; preds = %1987
  %2084 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_switch(i64 %2084, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__sancov_gen_cov_switch_values.9, i32 0, i32 0))
  switch i32 %16, label %2087 [
    i32 16, label %2086
    i32 32, label %2085
  ]

2085:                                             ; preds = %2083
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2133

2086:                                             ; preds = %2083
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2088

2087:                                             ; preds = %2083
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2162

2088:                                             ; preds = %2086, %2010
  %2089 = getelementptr i8, i8* %1988, i32 1
  %2090 = load i8, i8* %2089, align 1
  %2091 = sext i8 %2090 to i32
  %2092 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2093 = load i32*, i32** %2092, align 4
  %2094 = icmp eq i32* %2093, null
  br i1 %2094, label %2095, label %2096

2095:                                             ; preds = %2088
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2104

2096:                                             ; preds = %2088
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2097 = shl nsw i32 %2091, 12
  %2098 = or i32 %2097, %2091
  %2099 = or i32 %2098, -419495824
  %2100 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2099) #14, !srcloc !6
  %2101 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2102 = load i32, i32* %2101, align 4
  %2103 = getelementptr i32, i32* %2093, i32 %2102
  store i32 %2100, i32* %2103, align 4
  br label %2104

2104:                                             ; preds = %2095, %2096
  %2105 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2106 = load i32, i32* %2105, align 4
  %2107 = add i32 %2106, 1
  store i32 %2107, i32* %2105, align 4
  %2108 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %2109 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %2108, i32 0, i32 7
  %2110 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %2109, align 4
  %2111 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %2110, i32 0, i32 13
  %2112 = load i8, i8* %2111, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2112)
  %2113 = icmp eq i8 %2112, 0
  br i1 %2113, label %2115, label %2114

2114:                                             ; preds = %2104
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2162

2115:                                             ; preds = %2104
  %2116 = load i8, i8* %1988, align 1
  %2117 = sext i8 %2116 to i32
  %2118 = load i32*, i32** %2092, align 4
  %2119 = icmp eq i32* %2118, null
  br i1 %2119, label %2120, label %2121

2120:                                             ; preds = %2115
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2130

2121:                                             ; preds = %2115
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2122 = shl nsw i32 %2117, 16
  %2123 = or i32 %2122, %2117
  %2124 = shl nsw i32 %2117, 12
  %2125 = or i32 %2123, %2124
  %2126 = or i32 %2125, -534773760
  %2127 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2126) #14, !srcloc !6
  %2128 = getelementptr i32, i32* %2118, i32 %2107
  store i32 %2127, i32* %2128, align 4
  %2129 = load i32, i32* %2105, align 4
  br label %2130

2130:                                             ; preds = %2120, %2121
  %2131 = phi i32 [ %2107, %2120 ], [ %2129, %2121 ]
  %2132 = add i32 %2131, 1
  store i32 %2132, i32* %2105, align 4
  br label %2162

2133:                                             ; preds = %2085, %2030
  %2134 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %2135 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %2134, i32 0, i32 7
  %2136 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %2135, align 4
  %2137 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %2136, i32 0, i32 13
  %2138 = load i8, i8* %2137, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2138)
  %2139 = icmp eq i8 %2138, 0
  br i1 %2139, label %2141, label %2140

2140:                                             ; preds = %2133
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2162

2141:                                             ; preds = %2133
  %2142 = load i8, i8* %1988, align 1
  %2143 = sext i8 %2142 to i32
  %2144 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2145 = load i32*, i32** %2144, align 4
  %2146 = icmp eq i32* %2145, null
  br i1 %2146, label %2147, label %2148

2147:                                             ; preds = %2141
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2158

2148:                                             ; preds = %2141
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2149 = shl nsw i32 %2143, 16
  %2150 = or i32 %2149, %2143
  %2151 = shl nsw i32 %2143, 12
  %2152 = or i32 %2150, %2151
  %2153 = or i32 %2152, -534773760
  %2154 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2153) #14, !srcloc !6
  %2155 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2156 = load i32, i32* %2155, align 4
  %2157 = getelementptr i32, i32* %2145, i32 %2156
  store i32 %2154, i32* %2157, align 4
  br label %2158

2158:                                             ; preds = %2147, %2148
  %2159 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2160 = load i32, i32* %2159, align 4
  %2161 = add i32 %2160, 1
  store i32 %2161, i32* %2159, align 4
  br label %2162

2162:                                             ; preds = %2140, %2114, %2087, %1993, %2130, %2158, %2080
  %2163 = getelementptr i8, i8* %1988, i32 1
  %2164 = load i8, i8* %2163, align 1
  br i1 %1964, label %2165, label %2196

2165:                                             ; preds = %2162
  %2166 = sext i8 %1961 to i16
  %2167 = lshr i32 12355, %8
  %2168 = and i32 %2167, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2168)
  %2169 = icmp ne i32 %2168, 0
  %2170 = sub nsw i16 0, %2166
  %2171 = select i1 %2169, i16 %2166, i16 %2170
  %2172 = sext i16 %2171 to i32
  %2173 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2174 = load i32*, i32** %2173, align 4
  %2175 = icmp eq i32* %2174, null
  br i1 %2175, label %2176, label %2177

2176:                                             ; preds = %2165
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2192

2177:                                             ; preds = %2165
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2178 = shl nuw nsw i32 %2172, 4
  %2179 = and i32 %2178, 3840
  %2180 = and i32 %2172, 15
  %2181 = or i32 %2179, %2180
  %2182 = zext i8 %2164 to i32
  %2183 = shl nuw nsw i32 %2182, 12
  %2184 = select i1 %2169, i32 30081264, i32 21692656
  %2185 = or i32 %2183, %2184
  %2186 = or i32 %2181, %2185
  %2187 = or i32 %2186, -536870912
  %2188 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2187) #14, !srcloc !6
  %2189 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2190 = load i32, i32* %2189, align 4
  %2191 = getelementptr i32, i32* %2174, i32 %2190
  store i32 %2188, i32* %2191, align 4
  br label %2192

2192:                                             ; preds = %2176, %2177
  %2193 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2194 = load i32, i32* %2193, align 4
  %2195 = add i32 %2194, 1
  store i32 %2195, i32* %2193, align 4
  br label %3544

2196:                                             ; preds = %2162
  call void @__sanitizer_cov_trace_cmp1(i8 %1961, i8 %2164)
  %2197 = icmp eq i8 %1961, %2164
  br i1 %2197, label %2198, label %2199

2198:                                             ; preds = %2196
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2218

2199:                                             ; preds = %2196
  %2200 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2201 = load i32*, i32** %2200, align 4
  %2202 = icmp eq i32* %2201, null
  br i1 %2202, label %2203, label %2204

2203:                                             ; preds = %2199
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2214

2204:                                             ; preds = %2199
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2205 = zext i8 %1961 to i32
  %2206 = shl nuw nsw i32 %2205, 12
  %2207 = sext i8 %2164 to i32
  %2208 = or i32 %2206, %2207
  %2209 = or i32 %2208, -509607936
  %2210 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2209) #14, !srcloc !6
  %2211 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2212 = load i32, i32* %2211, align 4
  %2213 = getelementptr i32, i32* %2201, i32 %2212
  store i32 %2210, i32* %2213, align 4
  br label %2214

2214:                                             ; preds = %2203, %2204
  %2215 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2216 = load i32, i32* %2215, align 4
  %2217 = add i32 %2216, 1
  store i32 %2217, i32* %2215, align 4
  br label %2218

2218:                                             ; preds = %2198, %2214
  %2219 = load i8, i8* %9, align 1
  %2220 = load i8, i8* %1988, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %2219, i8 %2220)
  %2221 = icmp eq i8 %2219, %2220
  br i1 %2221, label %2222, label %2223

2222:                                             ; preds = %2218
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

2223:                                             ; preds = %2218
  %2224 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2225 = load i32*, i32** %2224, align 4
  %2226 = icmp eq i32* %2225, null
  br i1 %2226, label %2227, label %2228

2227:                                             ; preds = %2223
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2238

2228:                                             ; preds = %2223
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2229 = sext i8 %2219 to i32
  %2230 = shl nsw i32 %2229, 12
  %2231 = sext i8 %2220 to i32
  %2232 = or i32 %2230, %2231
  %2233 = or i32 %2232, -509607936
  %2234 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2233) #14, !srcloc !6
  %2235 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2236 = load i32, i32* %2235, align 4
  %2237 = getelementptr i32, i32* %2225, i32 %2236
  store i32 %2234, i32* %2237, align 4
  br label %2238

2238:                                             ; preds = %2227, %2228
  %2239 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2240 = load i32, i32* %2239, align 4
  %2241 = add i32 %2240, 1
  store i32 %2241, i32* %2239, align 4
  br label %3544

2242:                                             ; preds = %2
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2243 = zext i32 %16 to i64
  %2244 = getelementptr %struct.bpf_insn, %struct.bpf_insn* %0, i32 1, i32 3
  %2245 = load i32, i32* %2244, align 4
  %2246 = zext i32 %2245 to i64
  %2247 = shl nuw i64 %2246, 32
  %2248 = or i64 %2247, %2243
  tail call fastcc void @emit_a32_mov_i64(i8* %9, i64 %2248, %struct.jit_ctx* %1)
  br label %3549

2249:                                             ; preds = %82, %83, %84, %85
  %2250 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %2251 = load i8, i8* %2250, align 1
  %2252 = lshr i32 20412, %11
  %2253 = and i32 %2252, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2253)
  %2254 = icmp eq i32 %2253, 0
  br i1 %2254, label %2255, label %2256

2255:                                             ; preds = %2249
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2273

2256:                                             ; preds = %2249
  %2257 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2258 = load i32*, i32** %2257, align 4
  %2259 = icmp eq i32* %2258, null
  br i1 %2259, label %2260, label %2261

2260:                                             ; preds = %2256
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2269

2261:                                             ; preds = %2256
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2262 = sext i8 %2251 to i32
  %2263 = sub nsw i32 0, %2262
  %2264 = or i32 %2263, -451182592
  %2265 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2264) #14, !srcloc !6
  %2266 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2267 = load i32, i32* %2266, align 4
  %2268 = getelementptr i32, i32* %2258, i32 %2267
  store i32 %2265, i32* %2268, align 4
  br label %2269

2269:                                             ; preds = %2260, %2261
  %2270 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2271 = load i32, i32* %2270, align 4
  %2272 = add i32 %2271, 1
  store i32 %2272, i32* %2270, align 4
  br label %2273

2273:                                             ; preds = %2255, %2269
  %2274 = phi i8 [ 8, %2269 ], [ %2251, %2255 ]
  %2275 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %2276 = load i8, i8* %2275, align 1
  %2277 = lshr i32 20412, %8
  %2278 = and i32 %2277, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2278)
  %2279 = icmp ne i32 %2278, 0
  %2280 = select i1 %2279, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), i8* %9
  %2281 = lshr i8 %4, 3
  %2282 = and i8 %2281, 3
  %2283 = zext i8 %2282 to i32
  %2284 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.emit_str_r, i32 0, i32 %2283
  %2285 = load i32, i32* %2284, align 4
  %2286 = sub nsw i32 0, %2285
  %2287 = sext i16 %14 to i32
  call void @__sanitizer_cov_trace_cmp4(i32 %2286, i32 %2287)
  %2288 = icmp sle i32 %2286, %2287
  call void @__sanitizer_cov_trace_cmp4(i32 %2285, i32 %2287)
  %2289 = icmp sge i32 %2285, %2287
  %2290 = and i1 %2289, %2288
  br i1 %2290, label %2303, label %2291

2291:                                             ; preds = %2273
  tail call fastcc void @emit_mov_i(i8 zeroext 7, i32 %2287, %struct.jit_ctx* %1) #12
  %2292 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2293 = load i32*, i32** %2292, align 4
  %2294 = icmp eq i32* %2293, null
  br i1 %2294, label %2295, label %2296

2295:                                             ; preds = %2291
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2320

2296:                                             ; preds = %2291
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2297 = zext i8 %2274 to i32
  %2298 = or i32 %2297, -527994880
  %2299 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2298) #14, !srcloc !6
  %2300 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2301 = load i32, i32* %2300, align 4
  %2302 = getelementptr i32, i32* %2293, i32 %2301
  store i32 %2299, i32* %2302, align 4
  br label %2320

2303:                                             ; preds = %2273
  %2304 = getelementptr i8, i8* %2280, i32 1
  %2305 = load i8, i8* %2304, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %2305, i8 %2274)
  %2306 = icmp eq i8 %2305, %2274
  br i1 %2306, label %2308, label %2307

2307:                                             ; preds = %2303
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2325

2308:                                             ; preds = %2303
  %2309 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2310 = load i32*, i32** %2309, align 4
  %2311 = icmp eq i32* %2310, null
  br i1 %2311, label %2312, label %2313

2312:                                             ; preds = %2308
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2320

2313:                                             ; preds = %2308
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2314 = zext i8 %2274 to i32
  %2315 = or i32 %2314, -509579264
  %2316 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2315) #14, !srcloc !6
  %2317 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2318 = load i32, i32* %2317, align 4
  %2319 = getelementptr i32, i32* %2310, i32 %2318
  store i32 %2316, i32* %2319, align 4
  br label %2320

2320:                                             ; preds = %2312, %2295, %2313, %2296
  %2321 = phi i16 [ 0, %2296 ], [ 0, %2295 ], [ %14, %2313 ], [ %14, %2312 ]
  %2322 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2323 = load i32, i32* %2322, align 4
  %2324 = add i32 %2323, 1
  store i32 %2324, i32* %2322, align 4
  br label %2325

2325:                                             ; preds = %2307, %2320
  %2326 = phi i16 [ %14, %2307 ], [ %2321, %2320 ]
  %2327 = phi i8 [ %2274, %2307 ], [ 7, %2320 ]
  %2328 = zext i32 %2283 to i64
  call void @__sanitizer_cov_trace_switch(i64 %2328, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.10, i32 0, i32 0))
  switch i32 %2283, label %2611 [
    i32 2, label %2329
    i32 1, label %2404
    i32 0, label %2482
    i32 3, label %2557
  ]

2329:                                             ; preds = %2325
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %2326)
  %2330 = icmp sgt i16 %2326, -1
  %2331 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2332 = load i32*, i32** %2331, align 4
  %2333 = icmp eq i32* %2332, null
  br i1 %2333, label %2334, label %2335

2334:                                             ; preds = %2329
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2355

2335:                                             ; preds = %2329
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2336 = zext i8 %2327 to i32
  %2337 = shl nuw nsw i32 %2336, 16
  %2338 = select i1 %2330, i32 97517568, i32 89128960
  %2339 = or i32 %2337, %2338
  %2340 = getelementptr i8, i8* %2280, i32 1
  %2341 = load i8, i8* %2340, align 1
  %2342 = zext i8 %2341 to i32
  %2343 = shl nuw nsw i32 %2342, 12
  %2344 = or i32 %2339, %2343
  %2345 = sub i16 0, %2326
  %2346 = select i1 %2330, i16 %2326, i16 %2345
  %2347 = and i16 %2346, 4095
  %2348 = zext i16 %2347 to i32
  %2349 = or i32 %2344, %2348
  %2350 = or i32 %2349, -536870912
  %2351 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2350) #14, !srcloc !6
  %2352 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2353 = load i32, i32* %2352, align 4
  %2354 = getelementptr i32, i32* %2332, i32 %2353
  store i32 %2351, i32* %2354, align 4
  br label %2355

2355:                                             ; preds = %2334, %2335
  %2356 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2357 = load i32, i32* %2356, align 4
  %2358 = add i32 %2357, 1
  store i32 %2358, i32* %2356, align 4
  %2359 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %2360 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %2359, i32 0, i32 7
  %2361 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %2360, align 4
  %2362 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %2361, i32 0, i32 13
  %2363 = load i8, i8* %2362, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2363)
  %2364 = icmp eq i8 %2363, 0
  br i1 %2364, label %2366, label %2365

2365:                                             ; preds = %2355
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2612

2366:                                             ; preds = %2355
  %2367 = load i8, i8* %2280, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2367)
  %2368 = icmp slt i8 %2367, 0
  %2369 = load i32*, i32** %2331, align 4
  %2370 = icmp eq i32* %2369, null
  br i1 %2368, label %2371, label %2392

2371:                                             ; preds = %2366
  br i1 %2370, label %2372, label %2373

2372:                                             ; preds = %2371
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2376

2373:                                             ; preds = %2371
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2374 = getelementptr i32, i32* %2369, i32 %2358
  store i32 6332643, i32* %2374, align 4
  %2375 = load i32, i32* %2356, align 4
  br label %2376

2376:                                             ; preds = %2372, %2373
  %2377 = phi i32 [ %2358, %2372 ], [ %2375, %2373 ]
  %2378 = add i32 %2377, 1
  store i32 %2378, i32* %2356, align 4
  %2379 = load i32*, i32** %2331, align 4
  %2380 = icmp eq i32* %2379, null
  br i1 %2380, label %2381, label %2382

2381:                                             ; preds = %2376
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2389

2382:                                             ; preds = %2376
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2383 = sext i8 %2367 to i32
  %2384 = sub nsw i32 0, %2383
  %2385 = or i32 %2384, -452239360
  %2386 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2385) #14, !srcloc !6
  %2387 = getelementptr i32, i32* %2379, i32 %2378
  store i32 %2386, i32* %2387, align 4
  %2388 = load i32, i32* %2356, align 4
  br label %2389

2389:                                             ; preds = %2381, %2382
  %2390 = phi i32 [ %2388, %2382 ], [ %2378, %2381 ]
  %2391 = add i32 %2390, 1
  store i32 %2391, i32* %2356, align 4
  br label %2612

2392:                                             ; preds = %2366
  br i1 %2370, label %2393, label %2394

2393:                                             ; preds = %2392
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2401

2394:                                             ; preds = %2392
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2395 = zext i8 %2367 to i32
  %2396 = shl nuw nsw i32 %2395, 12
  %2397 = or i32 %2396, -476053504
  %2398 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2397) #14, !srcloc !6
  %2399 = getelementptr i32, i32* %2369, i32 %2358
  store i32 %2398, i32* %2399, align 4
  %2400 = load i32, i32* %2356, align 4
  br label %2401

2401:                                             ; preds = %2393, %2394
  %2402 = phi i32 [ %2358, %2393 ], [ %2400, %2394 ]
  %2403 = add i32 %2402, 1
  store i32 %2403, i32* %2356, align 4
  br label %2612

2404:                                             ; preds = %2325
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %2326)
  %2405 = icmp sgt i16 %2326, -1
  %2406 = sub i16 0, %2326
  %2407 = select i1 %2405, i16 %2326, i16 %2406
  %2408 = sext i16 %2407 to i32
  %2409 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2410 = load i32*, i32** %2409, align 4
  %2411 = icmp eq i32* %2410, null
  br i1 %2411, label %2412, label %2413

2412:                                             ; preds = %2404
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2433

2413:                                             ; preds = %2404
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2414 = shl nsw i32 %2408, 4
  %2415 = and i32 %2414, 3840
  %2416 = and i32 %2408, 15
  %2417 = or i32 %2415, %2416
  %2418 = zext i8 %2327 to i32
  %2419 = shl nuw nsw i32 %2418, 16
  %2420 = select i1 %2405, i32 30408880, i32 22020272
  %2421 = or i32 %2419, %2420
  %2422 = getelementptr i8, i8* %2280, i32 1
  %2423 = load i8, i8* %2422, align 1
  %2424 = zext i8 %2423 to i32
  %2425 = shl nuw nsw i32 %2424, 12
  %2426 = or i32 %2421, %2425
  %2427 = or i32 %2417, %2426
  %2428 = or i32 %2427, -536870912
  %2429 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2428) #14, !srcloc !6
  %2430 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2431 = load i32, i32* %2430, align 4
  %2432 = getelementptr i32, i32* %2410, i32 %2431
  store i32 %2429, i32* %2432, align 4
  br label %2433

2433:                                             ; preds = %2412, %2413
  %2434 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2435 = load i32, i32* %2434, align 4
  %2436 = add i32 %2435, 1
  store i32 %2436, i32* %2434, align 4
  %2437 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %2438 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %2437, i32 0, i32 7
  %2439 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %2438, align 4
  %2440 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %2439, i32 0, i32 13
  %2441 = load i8, i8* %2440, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2441)
  %2442 = icmp eq i8 %2441, 0
  br i1 %2442, label %2444, label %2443

2443:                                             ; preds = %2433
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2612

2444:                                             ; preds = %2433
  %2445 = load i8, i8* %2280, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2445)
  %2446 = icmp slt i8 %2445, 0
  %2447 = load i32*, i32** %2409, align 4
  %2448 = icmp eq i32* %2447, null
  br i1 %2446, label %2449, label %2470

2449:                                             ; preds = %2444
  br i1 %2448, label %2450, label %2451

2450:                                             ; preds = %2449
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2454

2451:                                             ; preds = %2449
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2452 = getelementptr i32, i32* %2447, i32 %2436
  store i32 6332643, i32* %2452, align 4
  %2453 = load i32, i32* %2434, align 4
  br label %2454

2454:                                             ; preds = %2450, %2451
  %2455 = phi i32 [ %2436, %2450 ], [ %2453, %2451 ]
  %2456 = add i32 %2455, 1
  store i32 %2456, i32* %2434, align 4
  %2457 = load i32*, i32** %2409, align 4
  %2458 = icmp eq i32* %2457, null
  br i1 %2458, label %2459, label %2460

2459:                                             ; preds = %2454
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2467

2460:                                             ; preds = %2454
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2461 = sext i8 %2445 to i32
  %2462 = sub nsw i32 0, %2461
  %2463 = or i32 %2462, -452239360
  %2464 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2463) #14, !srcloc !6
  %2465 = getelementptr i32, i32* %2457, i32 %2456
  store i32 %2464, i32* %2465, align 4
  %2466 = load i32, i32* %2434, align 4
  br label %2467

2467:                                             ; preds = %2459, %2460
  %2468 = phi i32 [ %2466, %2460 ], [ %2456, %2459 ]
  %2469 = add i32 %2468, 1
  store i32 %2469, i32* %2434, align 4
  br label %2612

2470:                                             ; preds = %2444
  br i1 %2448, label %2471, label %2472

2471:                                             ; preds = %2470
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2479

2472:                                             ; preds = %2470
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2473 = zext i8 %2445 to i32
  %2474 = shl nuw nsw i32 %2473, 12
  %2475 = or i32 %2474, -476053504
  %2476 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2475) #14, !srcloc !6
  %2477 = getelementptr i32, i32* %2447, i32 %2436
  store i32 %2476, i32* %2477, align 4
  %2478 = load i32, i32* %2434, align 4
  br label %2479

2479:                                             ; preds = %2471, %2472
  %2480 = phi i32 [ %2436, %2471 ], [ %2478, %2472 ]
  %2481 = add i32 %2480, 1
  store i32 %2481, i32* %2434, align 4
  br label %2612

2482:                                             ; preds = %2325
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %2326)
  %2483 = icmp sgt i16 %2326, -1
  %2484 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2485 = load i32*, i32** %2484, align 4
  %2486 = icmp eq i32* %2485, null
  br i1 %2486, label %2487, label %2488

2487:                                             ; preds = %2482
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2508

2488:                                             ; preds = %2482
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2489 = zext i8 %2327 to i32
  %2490 = shl nuw nsw i32 %2489, 16
  %2491 = select i1 %2483, i32 93323264, i32 84934656
  %2492 = or i32 %2490, %2491
  %2493 = getelementptr i8, i8* %2280, i32 1
  %2494 = load i8, i8* %2493, align 1
  %2495 = zext i8 %2494 to i32
  %2496 = shl nuw nsw i32 %2495, 12
  %2497 = or i32 %2492, %2496
  %2498 = sub i16 0, %2326
  %2499 = select i1 %2483, i16 %2326, i16 %2498
  %2500 = and i16 %2499, 4095
  %2501 = zext i16 %2500 to i32
  %2502 = or i32 %2497, %2501
  %2503 = or i32 %2502, -536870912
  %2504 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2503) #14, !srcloc !6
  %2505 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2506 = load i32, i32* %2505, align 4
  %2507 = getelementptr i32, i32* %2485, i32 %2506
  store i32 %2504, i32* %2507, align 4
  br label %2508

2508:                                             ; preds = %2487, %2488
  %2509 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2510 = load i32, i32* %2509, align 4
  %2511 = add i32 %2510, 1
  store i32 %2511, i32* %2509, align 4
  %2512 = load %struct.bpf_prog*, %struct.bpf_prog** %17, align 4
  %2513 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %2512, i32 0, i32 7
  %2514 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %2513, align 4
  %2515 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %2514, i32 0, i32 13
  %2516 = load i8, i8* %2515, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2516)
  %2517 = icmp eq i8 %2516, 0
  br i1 %2517, label %2519, label %2518

2518:                                             ; preds = %2508
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2612

2519:                                             ; preds = %2508
  %2520 = load i8, i8* %2280, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %2520)
  %2521 = icmp slt i8 %2520, 0
  %2522 = load i32*, i32** %2484, align 4
  %2523 = icmp eq i32* %2522, null
  br i1 %2521, label %2524, label %2545

2524:                                             ; preds = %2519
  br i1 %2523, label %2525, label %2526

2525:                                             ; preds = %2524
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2529

2526:                                             ; preds = %2524
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2527 = getelementptr i32, i32* %2522, i32 %2511
  store i32 6332643, i32* %2527, align 4
  %2528 = load i32, i32* %2509, align 4
  br label %2529

2529:                                             ; preds = %2525, %2526
  %2530 = phi i32 [ %2511, %2525 ], [ %2528, %2526 ]
  %2531 = add i32 %2530, 1
  store i32 %2531, i32* %2509, align 4
  %2532 = load i32*, i32** %2484, align 4
  %2533 = icmp eq i32* %2532, null
  br i1 %2533, label %2534, label %2535

2534:                                             ; preds = %2529
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2542

2535:                                             ; preds = %2529
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2536 = sext i8 %2520 to i32
  %2537 = sub nsw i32 0, %2536
  %2538 = or i32 %2537, -452239360
  %2539 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2538) #14, !srcloc !6
  %2540 = getelementptr i32, i32* %2532, i32 %2531
  store i32 %2539, i32* %2540, align 4
  %2541 = load i32, i32* %2509, align 4
  br label %2542

2542:                                             ; preds = %2534, %2535
  %2543 = phi i32 [ %2541, %2535 ], [ %2531, %2534 ]
  %2544 = add i32 %2543, 1
  store i32 %2544, i32* %2509, align 4
  br label %2612

2545:                                             ; preds = %2519
  br i1 %2523, label %2546, label %2547

2546:                                             ; preds = %2545
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2554

2547:                                             ; preds = %2545
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2548 = zext i8 %2520 to i32
  %2549 = shl nuw nsw i32 %2548, 12
  %2550 = or i32 %2549, -476053504
  %2551 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2550) #14, !srcloc !6
  %2552 = getelementptr i32, i32* %2522, i32 %2511
  store i32 %2551, i32* %2552, align 4
  %2553 = load i32, i32* %2509, align 4
  br label %2554

2554:                                             ; preds = %2546, %2547
  %2555 = phi i32 [ %2511, %2546 ], [ %2553, %2547 ]
  %2556 = add i32 %2555, 1
  store i32 %2556, i32* %2509, align 4
  br label %2612

2557:                                             ; preds = %2325
  %2558 = zext i8 %2327 to i32
  %2559 = shl nuw nsw i32 %2558, 16
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %2326)
  %2560 = icmp sgt i16 %2326, -1
  %2561 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2562 = load i32*, i32** %2561, align 4
  %2563 = icmp eq i32* %2562, null
  br i1 %2563, label %2564, label %2565

2564:                                             ; preds = %2557
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2583

2565:                                             ; preds = %2557
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2566 = select i1 %2560, i32 93323264, i32 84934656
  %2567 = or i32 %2559, %2566
  %2568 = getelementptr i8, i8* %2280, i32 1
  %2569 = load i8, i8* %2568, align 1
  %2570 = zext i8 %2569 to i32
  %2571 = shl nuw nsw i32 %2570, 12
  %2572 = or i32 %2567, %2571
  %2573 = sub i16 0, %2326
  %2574 = select i1 %2560, i16 %2326, i16 %2573
  %2575 = and i16 %2574, 4095
  %2576 = zext i16 %2575 to i32
  %2577 = or i32 %2572, %2576
  %2578 = or i32 %2577, -536870912
  %2579 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2578) #14, !srcloc !6
  %2580 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2581 = load i32, i32* %2580, align 4
  %2582 = getelementptr i32, i32* %2562, i32 %2581
  store i32 %2579, i32* %2582, align 4
  br label %2583

2583:                                             ; preds = %2564, %2565
  %2584 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2585 = load i32, i32* %2584, align 4
  %2586 = add i32 %2585, 1
  store i32 %2586, i32* %2584, align 4
  %2587 = add i16 %2326, 4
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %2587)
  %2588 = icmp sgt i16 %2587, -1
  %2589 = load i32*, i32** %2561, align 4
  %2590 = icmp eq i32* %2589, null
  br i1 %2590, label %2591, label %2592

2591:                                             ; preds = %2583
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2608

2592:                                             ; preds = %2583
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2593 = select i1 %2588, i32 93323264, i32 84934656
  %2594 = or i32 %2593, %2559
  %2595 = load i8, i8* %2280, align 1
  %2596 = zext i8 %2595 to i32
  %2597 = shl nuw nsw i32 %2596, 12
  %2598 = or i32 %2594, %2597
  %2599 = sub i16 4092, %2326
  %2600 = select i1 %2588, i16 %2587, i16 %2599
  %2601 = and i16 %2600, 4095
  %2602 = zext i16 %2601 to i32
  %2603 = or i32 %2598, %2602
  %2604 = or i32 %2603, -536870912
  %2605 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2604) #14, !srcloc !6
  %2606 = getelementptr i32, i32* %2589, i32 %2586
  store i32 %2605, i32* %2606, align 4
  %2607 = load i32, i32* %2584, align 4
  br label %2608

2608:                                             ; preds = %2591, %2592
  %2609 = phi i32 [ %2586, %2591 ], [ %2607, %2592 ]
  %2610 = add i32 %2609, 1
  store i32 %2610, i32* %2584, align 4
  br label %2612

2611:                                             ; preds = %2325
  unreachable

2612:                                             ; preds = %2518, %2443, %2365, %2608, %2554, %2542, %2479, %2467, %2401, %2389
  %2613 = phi i32 [ %2610, %2608 ], [ %2556, %2554 ], [ %2544, %2542 ], [ %2511, %2518 ], [ %2481, %2479 ], [ %2469, %2467 ], [ %2436, %2443 ], [ %2403, %2401 ], [ %2391, %2389 ], [ %2358, %2365 ]
  %2614 = getelementptr i8, i8* %2280, i32 1
  %2615 = load i8, i8* %2614, align 1
  br i1 %2279, label %2616, label %2641

2616:                                             ; preds = %2612
  %2617 = sext i8 %2276 to i32
  %2618 = sub nsw i32 0, %2617
  %2619 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2620 = load i32*, i32** %2619, align 4
  %2621 = icmp eq i32* %2620, null
  br i1 %2621, label %2622, label %2623

2622:                                             ; preds = %2616
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2637

2623:                                             ; preds = %2616
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2624 = shl nuw nsw i32 %2618, 4
  %2625 = and i32 %2624, 3840
  %2626 = and i32 %2618, 15
  %2627 = or i32 %2625, %2626
  %2628 = zext i8 %2615 to i32
  %2629 = shl nuw nsw i32 %2628, 12
  %2630 = or i32 %2629, 21692656
  %2631 = or i32 %2627, %2630
  %2632 = or i32 %2631, -536870912
  %2633 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2632) #14, !srcloc !6
  %2634 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2635 = getelementptr i32, i32* %2620, i32 %2613
  store i32 %2633, i32* %2635, align 4
  %2636 = load i32, i32* %2634, align 4
  br label %2637

2637:                                             ; preds = %2622, %2623
  %2638 = phi i32 [ %2636, %2623 ], [ %2613, %2622 ]
  %2639 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2640 = add i32 %2638, 1
  store i32 %2640, i32* %2639, align 4
  br label %3544

2641:                                             ; preds = %2612
  call void @__sanitizer_cov_trace_cmp1(i8 %2276, i8 %2615)
  %2642 = icmp eq i8 %2276, %2615
  br i1 %2642, label %2643, label %2644

2643:                                             ; preds = %2641
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2663

2644:                                             ; preds = %2641
  %2645 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2646 = load i32*, i32** %2645, align 4
  %2647 = icmp eq i32* %2646, null
  br i1 %2647, label %2648, label %2649

2648:                                             ; preds = %2644
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2659

2649:                                             ; preds = %2644
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2650 = zext i8 %2276 to i32
  %2651 = shl nuw nsw i32 %2650, 12
  %2652 = sext i8 %2615 to i32
  %2653 = or i32 %2651, %2652
  %2654 = or i32 %2653, -509607936
  %2655 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2654) #14, !srcloc !6
  %2656 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2657 = getelementptr i32, i32* %2646, i32 %2613
  store i32 %2655, i32* %2657, align 4
  %2658 = load i32, i32* %2656, align 4
  br label %2659

2659:                                             ; preds = %2648, %2649
  %2660 = phi i32 [ %2658, %2649 ], [ %2613, %2648 ]
  %2661 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2662 = add i32 %2660, 1
  store i32 %2662, i32* %2661, align 4
  br label %2663

2663:                                             ; preds = %2643, %2659
  %2664 = phi i32 [ %2662, %2659 ], [ %2613, %2643 ]
  %2665 = load i8, i8* %9, align 1
  %2666 = load i8, i8* %2280, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %2665, i8 %2666)
  %2667 = icmp eq i8 %2665, %2666
  br i1 %2667, label %2668, label %2669

2668:                                             ; preds = %2663
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

2669:                                             ; preds = %2663
  %2670 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2671 = load i32*, i32** %2670, align 4
  %2672 = icmp eq i32* %2671, null
  br i1 %2672, label %2673, label %2674

2673:                                             ; preds = %2669
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2684

2674:                                             ; preds = %2669
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2675 = sext i8 %2665 to i32
  %2676 = shl nsw i32 %2675, 12
  %2677 = sext i8 %2666 to i32
  %2678 = or i32 %2676, %2677
  %2679 = or i32 %2678, -509607936
  %2680 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2679) #14, !srcloc !6
  %2681 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2682 = getelementptr i32, i32* %2671, i32 %2664
  store i32 %2680, i32* %2682, align 4
  %2683 = load i32, i32* %2681, align 4
  br label %2684

2684:                                             ; preds = %2673, %2674
  %2685 = phi i32 [ %2683, %2674 ], [ %2664, %2673 ]
  %2686 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2687 = add i32 %2685, 1
  store i32 %2687, i32* %2686, align 4
  br label %3544

2688:                                             ; preds = %78, %79, %80, %81
  %2689 = and i32 %24, 24
  call void @__sanitizer_cov_trace_const_cmp4(i32 24, i32 %2689)
  %2690 = icmp eq i32 %2689, 24
  br i1 %2690, label %2691, label %2696

2691:                                             ; preds = %2688
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2692 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %2693 = icmp slt i32 %16, 0
  %2694 = or i64 %2692, -4294967296
  %2695 = select i1 %2693, i64 %2694, i64 %2692
  tail call fastcc void @emit_a32_mov_i64(i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), i64 %2695, %struct.jit_ctx* %1) #12
  br label %2697

2696:                                             ; preds = %2688
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  tail call fastcc void @emit_mov_i(i8 zeroext 8, i32 %16, %struct.jit_ctx* %1) #12
  br label %2697

2697:                                             ; preds = %2696, %2691
  %2698 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %2699 = load i8, i8* %2698, align 1
  %2700 = trunc i32 %2689 to i8
  tail call fastcc void @emit_str_r(i8 signext %2699, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), i16 signext %14, %struct.jit_ctx* %1, i8 zeroext %2700)
  br label %3544

2701:                                             ; preds = %72, %73, %74, %75
  %2702 = lshr i32 20412, %11
  %2703 = and i32 %2702, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2703)
  %2704 = icmp eq i32 %2703, 0
  br i1 %2704, label %2705, label %2706

2705:                                             ; preds = %2701
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2729

2706:                                             ; preds = %2701
  %2707 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %2708 = load i8, i8* %2707, align 1
  %2709 = sext i8 %2708 to i32
  %2710 = sub nsw i32 0, %2709
  %2711 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2712 = load i32*, i32** %2711, align 4
  %2713 = icmp eq i32* %2712, null
  br i1 %2713, label %2714, label %2715

2714:                                             ; preds = %2706
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2725

2715:                                             ; preds = %2706
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2716 = shl nuw nsw i32 %2710, 4
  %2717 = and i32 %2716, 3840
  %2718 = and i32 %2710, 15
  %2719 = or i32 %2717, %2718
  %2720 = or i32 %2719, -515145520
  %2721 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2720) #14, !srcloc !6
  %2722 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2723 = load i32, i32* %2722, align 4
  %2724 = getelementptr i32, i32* %2712, i32 %2723
  store i32 %2721, i32* %2724, align 4
  br label %2725

2725:                                             ; preds = %2714, %2715
  %2726 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2727 = load i32, i32* %2726, align 4
  %2728 = add i32 %2727, 1
  store i32 %2728, i32* %2726, align 4
  br label %2729

2729:                                             ; preds = %2705, %2725
  %2730 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), %2725 ], [ %12, %2705 ]
  %2731 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %2732 = load i8, i8* %2731, align 1
  %2733 = and i8 %4, 24
  tail call fastcc void @emit_str_r(i8 signext %2732, i8* %2730, i16 signext %14, %struct.jit_ctx* %1, i8 zeroext %2733)
  br label %3544

2734:                                             ; preds = %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71
  %2735 = load i8, i8* %12, align 1
  %2736 = lshr i32 20412, %11
  %2737 = and i32 %2736, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2737)
  %2738 = icmp eq i32 %2737, 0
  br i1 %2738, label %2739, label %2742

2739:                                             ; preds = %2734
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2740 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %2741 = load i8, i8* %2740, align 1
  br label %2785

2742:                                             ; preds = %2734
  %2743 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2744 = load i32*, i32** %2743, align 4
  %2745 = icmp eq i32* %2744, null
  br i1 %2745, label %2746, label %2747

2746:                                             ; preds = %2742
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2755

2747:                                             ; preds = %2742
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2748 = sext i8 %2735 to i32
  %2749 = sub nsw i32 0, %2748
  %2750 = or i32 %2749, -451178496
  %2751 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2750) #14, !srcloc !6
  %2752 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2753 = load i32, i32* %2752, align 4
  %2754 = getelementptr i32, i32* %2744, i32 %2753
  store i32 %2751, i32* %2754, align 4
  br label %2755

2755:                                             ; preds = %2746, %2747
  %2756 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2757 = load i32, i32* %2756, align 4
  %2758 = add i32 %2757, 1
  store i32 %2758, i32* %2756, align 4
  %2759 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2760 = load i32*, i32** %2759, align 4
  %2761 = icmp eq i32* %2760, null
  br i1 %2761, label %2762, label %2763

2762:                                             ; preds = %2755
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2773

2763:                                             ; preds = %2755
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2764 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %11, i32 1
  %2765 = load i8, i8* %2764, align 1
  %2766 = sext i8 %2765 to i32
  %2767 = sub nsw i32 0, %2766
  %2768 = or i32 %2767, -451182592
  %2769 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2768) #14, !srcloc !6
  %2770 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2771 = load i32, i32* %2770, align 4
  %2772 = getelementptr i32, i32* %2760, i32 %2771
  store i32 %2769, i32* %2772, align 4
  br label %2773

2773:                                             ; preds = %2762, %2763
  %2774 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2775 = load i32, i32* %2774, align 4
  %2776 = add i32 %2775, 1
  store i32 %2776, i32* %2774, align 4
  br label %2785

2777:                                             ; preds = %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %14)
  %2778 = icmp eq i16 %14, 0
  br i1 %2778, label %2779, label %2780

2779:                                             ; preds = %2777
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

2780:                                             ; preds = %2777
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2781 = zext i32 %16 to i64
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %16)
  %2782 = icmp slt i32 %16, 0
  %2783 = or i64 %2781, -4294967296
  %2784 = select i1 %2782, i64 %2783, i64 %2781
  tail call fastcc void @emit_a32_mov_i64(i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), i64 %2784, %struct.jit_ctx* %1) #12
  br label %2785

2785:                                             ; preds = %2739, %2773, %2780
  %2786 = phi i8 [ 9, %2780 ], [ 9, %2773 ], [ %2735, %2739 ]
  %2787 = phi i8 [ 8, %2780 ], [ 8, %2773 ], [ %2741, %2739 ]
  %2788 = lshr i32 20412, %8
  %2789 = and i32 %2788, 1
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2789)
  %2790 = icmp eq i32 %2789, 0
  br i1 %2790, label %2791, label %2792

2791:                                             ; preds = %2785
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2815

2792:                                             ; preds = %2785
  %2793 = getelementptr [15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 %8, i32 1
  %2794 = load i8, i8* %2793, align 1
  %2795 = sext i8 %2794 to i32
  %2796 = sub nsw i32 0, %2795
  %2797 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2798 = load i32*, i32** %2797, align 4
  %2799 = icmp eq i32* %2798, null
  br i1 %2799, label %2800, label %2801

2800:                                             ; preds = %2792
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2811

2801:                                             ; preds = %2792
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2802 = shl nuw nsw i32 %2796, 4
  %2803 = and i32 %2802, 3840
  %2804 = and i32 %2796, 15
  %2805 = or i32 %2803, %2804
  %2806 = or i32 %2805, -515153712
  %2807 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2806) #14, !srcloc !6
  %2808 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2809 = load i32, i32* %2808, align 4
  %2810 = getelementptr i32, i32* %2798, i32 %2809
  store i32 %2807, i32* %2810, align 4
  br label %2811

2811:                                             ; preds = %2800, %2801
  %2812 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2813 = load i32, i32* %2812, align 4
  %2814 = add i32 %2813, 1
  store i32 %2814, i32* %2812, align 4
  br label %2815

2815:                                             ; preds = %2791, %2811
  %2816 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %2811 ], [ %9, %2791 ]
  %2817 = load i8, i8* %2816, align 1
  %2818 = getelementptr i8, i8* %2816, i32 1
  %2819 = load i8, i8* %2818, align 1
  %2820 = and i32 %24, 240
  call void @__sanitizer_cov_trace_const_cmp4(i32 5, i32 %25)
  %2821 = icmp eq i32 %25, 5
  %2822 = add nsw i32 %2820, -16
  %2823 = lshr exact i32 %2822, 4
  %2824 = zext i32 %2823 to i64
  call void @__sanitizer_cov_trace_switch(i64 %2824, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__sancov_gen_cov_switch_values.11, i32 0, i32 0))
  switch i32 %2823, label %2835 [
    i32 3, label %2836
    i32 0, label %2834
    i32 4, label %2833
    i32 1, label %2832
    i32 2, label %2831
    i32 10, label %2830
    i32 9, label %2829
    i32 12, label %2828
    i32 5, label %2827
    i32 11, label %2826
    i32 6, label %2825
  ]

2825:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2978

2826:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2978

2827:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2942

2828:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2942

2829:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2891

2830:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2891

2831:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2891

2832:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2891

2833:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2891

2834:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2891

2835:                                             ; preds = %2815
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3014

2836:                                             ; preds = %2815
  %2837 = zext i8 %2819 to i32
  %2838 = shl nuw nsw i32 %2837, 16
  %2839 = zext i8 %2787 to i32
  %2840 = or i32 %2838, %2839
  %2841 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2842 = load i32*, i32** %2841, align 4
  %2843 = icmp eq i32* %2842, null
  br i1 %2821, label %2844, label %2879

2844:                                             ; preds = %2836
  br i1 %2843, label %2845, label %2846

2845:                                             ; preds = %2844
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2852

2846:                                             ; preds = %2844
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2847 = or i32 %2840, -536821760
  %2848 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2847) #14, !srcloc !6
  %2849 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2850 = load i32, i32* %2849, align 4
  %2851 = getelementptr i32, i32* %2842, i32 %2850
  store i32 %2848, i32* %2851, align 4
  br label %2852

2852:                                             ; preds = %2845, %2846
  %2853 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2854 = load i32, i32* %2853, align 4
  %2855 = add i32 %2854, 1
  store i32 %2855, i32* %2853, align 4
  %2856 = load i32*, i32** %2841, align 4
  %2857 = icmp eq i32* %2856, null
  br i1 %2857, label %2858, label %2860

2858:                                             ; preds = %2852
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2859 = add i32 %2854, 2
  store i32 %2859, i32* %2853, align 4
  br label %2876

2860:                                             ; preds = %2852
  %2861 = zext i8 %2817 to i32
  %2862 = shl nuw nsw i32 %2861, 16
  %2863 = zext i8 %2786 to i32
  %2864 = or i32 %2862, %2863
  %2865 = or i32 %2864, -536813568
  %2866 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2865) #14, !srcloc !6
  %2867 = getelementptr i32, i32* %2856, i32 %2855
  store i32 %2866, i32* %2867, align 4
  %2868 = load i32*, i32** %2841, align 4
  %2869 = load i32, i32* %2853, align 4
  %2870 = add i32 %2869, 1
  store i32 %2870, i32* %2853, align 4
  %2871 = icmp eq i32* %2868, null
  br i1 %2871, label %2872, label %2873

2872:                                             ; preds = %2860
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2876

2873:                                             ; preds = %2860
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2874 = getelementptr i32, i32* %2868, i32 %2870
  store i32 213950177, i32* %2874, align 4
  %2875 = load i32, i32* %2853, align 4
  br label %2876

2876:                                             ; preds = %2872, %2873, %2858
  %2877 = phi i32 [ %2859, %2858 ], [ %2870, %2872 ], [ %2875, %2873 ]
  %2878 = add i32 %2877, 1
  store i32 %2878, i32* %2853, align 4
  br label %3014

2879:                                             ; preds = %2836
  br i1 %2843, label %2880, label %2881

2880:                                             ; preds = %2879
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2887

2881:                                             ; preds = %2879
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2882 = or i32 %2840, -535773184
  %2883 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2882) #14, !srcloc !6
  %2884 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2885 = load i32, i32* %2884, align 4
  %2886 = getelementptr i32, i32* %2842, i32 %2885
  store i32 %2883, i32* %2886, align 4
  br label %2887

2887:                                             ; preds = %2880, %2881
  %2888 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2889 = load i32, i32* %2888, align 4
  %2890 = add i32 %2889, 1
  store i32 %2890, i32* %2888, align 4
  br label %3014

2891:                                             ; preds = %2829, %2830, %2831, %2832, %2833, %2834
  %2892 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2893 = load i32*, i32** %2892, align 4
  %2894 = icmp eq i32* %2893, null
  br i1 %2821, label %2895, label %2926

2895:                                             ; preds = %2891
  br i1 %2894, label %2896, label %2897

2896:                                             ; preds = %2895
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2907

2897:                                             ; preds = %2895
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2898 = zext i8 %2817 to i32
  %2899 = shl nuw nsw i32 %2898, 16
  %2900 = zext i8 %2786 to i32
  %2901 = or i32 %2899, %2900
  %2902 = or i32 %2901, -514850816
  %2903 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2902) #14, !srcloc !6
  %2904 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2905 = load i32, i32* %2904, align 4
  %2906 = getelementptr i32, i32* %2893, i32 %2905
  store i32 %2903, i32* %2906, align 4
  br label %2907

2907:                                             ; preds = %2896, %2897
  %2908 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2909 = load i32, i32* %2908, align 4
  %2910 = add i32 %2909, 1
  store i32 %2910, i32* %2908, align 4
  %2911 = load i32*, i32** %2892, align 4
  %2912 = icmp eq i32* %2911, null
  br i1 %2912, label %2913, label %2914

2913:                                             ; preds = %2907
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2923

2914:                                             ; preds = %2907
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2915 = zext i8 %2819 to i32
  %2916 = shl nuw nsw i32 %2915, 16
  %2917 = zext i8 %2787 to i32
  %2918 = or i32 %2916, %2917
  %2919 = or i32 %2918, 22020096
  %2920 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2919) #14, !srcloc !6
  %2921 = getelementptr i32, i32* %2911, i32 %2910
  store i32 %2920, i32* %2921, align 4
  %2922 = load i32, i32* %2908, align 4
  br label %2923

2923:                                             ; preds = %2913, %2914
  %2924 = phi i32 [ %2910, %2913 ], [ %2922, %2914 ]
  %2925 = add i32 %2924, 1
  store i32 %2925, i32* %2908, align 4
  br label %3014

2926:                                             ; preds = %2891
  br i1 %2894, label %2927, label %2928

2927:                                             ; preds = %2926
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2938

2928:                                             ; preds = %2926
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2929 = zext i8 %2819 to i32
  %2930 = shl nuw nsw i32 %2929, 16
  %2931 = zext i8 %2787 to i32
  %2932 = or i32 %2930, %2931
  %2933 = or i32 %2932, -514850816
  %2934 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2933) #14, !srcloc !6
  %2935 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2936 = load i32, i32* %2935, align 4
  %2937 = getelementptr i32, i32* %2893, i32 %2936
  store i32 %2934, i32* %2937, align 4
  br label %2938

2938:                                             ; preds = %2927, %2928
  %2939 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2940 = load i32, i32* %2939, align 4
  %2941 = add i32 %2940, 1
  store i32 %2941, i32* %2939, align 4
  br label %3014

2942:                                             ; preds = %2827, %2828
  %2943 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2944 = load i32*, i32** %2943, align 4
  %2945 = icmp eq i32* %2944, null
  br i1 %2945, label %2946, label %2947

2946:                                             ; preds = %2942
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2957

2947:                                             ; preds = %2942
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2948 = zext i8 %2787 to i32
  %2949 = shl nuw nsw i32 %2948, 16
  %2950 = zext i8 %2819 to i32
  %2951 = or i32 %2949, %2950
  %2952 = or i32 %2951, -514850816
  %2953 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2952) #14, !srcloc !6
  %2954 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2955 = load i32, i32* %2954, align 4
  %2956 = getelementptr i32, i32* %2944, i32 %2955
  store i32 %2953, i32* %2956, align 4
  br label %2957

2957:                                             ; preds = %2946, %2947
  %2958 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2959 = load i32, i32* %2958, align 4
  %2960 = add i32 %2959, 1
  store i32 %2960, i32* %2958, align 4
  br i1 %2821, label %2962, label %2961

2961:                                             ; preds = %2957
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3014

2962:                                             ; preds = %2957
  %2963 = load i32*, i32** %2943, align 4
  %2964 = icmp eq i32* %2963, null
  br i1 %2964, label %2965, label %2966

2965:                                             ; preds = %2962
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2975

2966:                                             ; preds = %2962
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2967 = zext i8 %2786 to i32
  %2968 = shl nuw nsw i32 %2967, 16
  %2969 = zext i8 %2817 to i32
  %2970 = or i32 %2968, %2969
  %2971 = or i32 %2970, -523190272
  %2972 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2971) #14, !srcloc !6
  %2973 = getelementptr i32, i32* %2963, i32 %2960
  store i32 %2972, i32* %2973, align 4
  %2974 = load i32, i32* %2958, align 4
  br label %2975

2975:                                             ; preds = %2965, %2966
  %2976 = phi i32 [ %2960, %2965 ], [ %2974, %2966 ]
  %2977 = add i32 %2976, 1
  store i32 %2977, i32* %2958, align 4
  br label %3014

2978:                                             ; preds = %2825, %2826
  %2979 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %2980 = load i32*, i32** %2979, align 4
  %2981 = icmp eq i32* %2980, null
  br i1 %2981, label %2982, label %2983

2982:                                             ; preds = %2978
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %2993

2983:                                             ; preds = %2978
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %2984 = zext i8 %2819 to i32
  %2985 = shl nuw nsw i32 %2984, 16
  %2986 = zext i8 %2787 to i32
  %2987 = or i32 %2985, %2986
  %2988 = or i32 %2987, -514850816
  %2989 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %2988) #14, !srcloc !6
  %2990 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2991 = load i32, i32* %2990, align 4
  %2992 = getelementptr i32, i32* %2980, i32 %2991
  store i32 %2989, i32* %2992, align 4
  br label %2993

2993:                                             ; preds = %2982, %2983
  %2994 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %2995 = load i32, i32* %2994, align 4
  %2996 = add i32 %2995, 1
  store i32 %2996, i32* %2994, align 4
  br i1 %2821, label %2998, label %2997

2997:                                             ; preds = %2993
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3014

2998:                                             ; preds = %2993
  %2999 = load i32*, i32** %2979, align 4
  %3000 = icmp eq i32* %2999, null
  br i1 %3000, label %3001, label %3002

3001:                                             ; preds = %2998
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3011

3002:                                             ; preds = %2998
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3003 = zext i8 %2817 to i32
  %3004 = shl nuw nsw i32 %3003, 16
  %3005 = zext i8 %2786 to i32
  %3006 = or i32 %3004, %3005
  %3007 = or i32 %3006, -523190272
  %3008 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3007) #14, !srcloc !6
  %3009 = getelementptr i32, i32* %2999, i32 %2996
  store i32 %3008, i32* %3009, align 4
  %3010 = load i32, i32* %2994, align 4
  br label %3011

3011:                                             ; preds = %3001, %3002
  %3012 = phi i32 [ %2996, %3001 ], [ %3010, %3002 ]
  %3013 = add i32 %3012, 1
  store i32 %3013, i32* %2994, align 4
  br label %3014

3014:                                             ; preds = %2997, %2961, %2835, %2876, %2887, %2923, %2938, %2975, %3011
  %3015 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %3016 = load i32*, i32** %3015, align 4
  %3017 = icmp eq i32* %3016, null
  br i1 %3017, label %3018, label %3019

3018:                                             ; preds = %3014
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3032

3019:                                             ; preds = %3014
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3020 = sext i16 %14 to i32
  %3021 = add nsw i32 %23, %3020
  %3022 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 6
  %3023 = load i32*, i32** %3022, align 4
  %3024 = getelementptr i32, i32* %3023, i32 %3021
  %3025 = load i32, i32* %3024, align 4
  %3026 = getelementptr i32, i32* %3023, i32 %23
  %3027 = load i32, i32* %3026, align 4
  %3028 = xor i32 %3027, 16777215
  %3029 = add i32 %3028, %3025
  %3030 = and i32 %3029, 16777215
  %3031 = or i32 %3030, 167772160
  br label %3032

3032:                                             ; preds = %3018, %3019
  %3033 = phi i32 [ %3031, %3019 ], [ 167772160, %3018 ]
  %3034 = zext i32 %2823 to i64
  call void @__sanitizer_cov_trace_switch(i64 %3034, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__sancov_gen_cov_switch_values.12, i32 0, i32 0))
  switch i32 %2823, label %3037 [
    i32 4, label %3036
    i32 3, label %3035
    i32 0, label %3050
    i32 1, label %3061
    i32 2, label %3073
    i32 5, label %3085
    i32 6, label %3097
    i32 10, label %3109
    i32 9, label %3121
    i32 11, label %3133
    i32 12, label %3145
  ]

3035:                                             ; preds = %3032
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3038

3036:                                             ; preds = %3032
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3038

3037:                                             ; preds = %3032
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

3038:                                             ; preds = %3035, %3036
  br i1 %3017, label %3039, label %3040

3039:                                             ; preds = %3038
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3046

3040:                                             ; preds = %3038
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3041 = or i32 %3033, 268435456
  %3042 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3041) #14, !srcloc !6
  %3043 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3044 = load i32, i32* %3043, align 4
  %3045 = getelementptr i32, i32* %3016, i32 %3044
  store i32 %3042, i32* %3045, align 4
  br label %3046

3046:                                             ; preds = %3039, %3040
  %3047 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3048 = load i32, i32* %3047, align 4
  %3049 = add i32 %3048, 1
  store i32 %3049, i32* %3047, align 4
  br label %3544

3050:                                             ; preds = %3032
  br i1 %3017, label %3051, label %3052

3051:                                             ; preds = %3050
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3057

3052:                                             ; preds = %3050
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3053 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3033) #14, !srcloc !6
  %3054 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3055 = load i32, i32* %3054, align 4
  %3056 = getelementptr i32, i32* %3016, i32 %3055
  store i32 %3053, i32* %3056, align 4
  br label %3057

3057:                                             ; preds = %3051, %3052
  %3058 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3059 = load i32, i32* %3058, align 4
  %3060 = add i32 %3059, 1
  store i32 %3060, i32* %3058, align 4
  br label %3544

3061:                                             ; preds = %3032
  br i1 %3017, label %3062, label %3063

3062:                                             ; preds = %3061
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3069

3063:                                             ; preds = %3061
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3064 = or i32 %3033, -2147483648
  %3065 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3064) #14, !srcloc !6
  %3066 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3067 = load i32, i32* %3066, align 4
  %3068 = getelementptr i32, i32* %3016, i32 %3067
  store i32 %3065, i32* %3068, align 4
  br label %3069

3069:                                             ; preds = %3062, %3063
  %3070 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3071 = load i32, i32* %3070, align 4
  %3072 = add i32 %3071, 1
  store i32 %3072, i32* %3070, align 4
  br label %3544

3073:                                             ; preds = %3032
  br i1 %3017, label %3074, label %3075

3074:                                             ; preds = %3073
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3081

3075:                                             ; preds = %3073
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3076 = or i32 %3033, 536870912
  %3077 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3076) #14, !srcloc !6
  %3078 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3079 = load i32, i32* %3078, align 4
  %3080 = getelementptr i32, i32* %3016, i32 %3079
  store i32 %3077, i32* %3080, align 4
  br label %3081

3081:                                             ; preds = %3074, %3075
  %3082 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3083 = load i32, i32* %3082, align 4
  %3084 = add i32 %3083, 1
  store i32 %3084, i32* %3082, align 4
  br label %3544

3085:                                             ; preds = %3032
  br i1 %3017, label %3086, label %3087

3086:                                             ; preds = %3085
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3093

3087:                                             ; preds = %3085
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3088 = or i32 %3033, -1342177280
  %3089 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3088) #14, !srcloc !6
  %3090 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3091 = load i32, i32* %3090, align 4
  %3092 = getelementptr i32, i32* %3016, i32 %3091
  store i32 %3089, i32* %3092, align 4
  br label %3093

3093:                                             ; preds = %3086, %3087
  %3094 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3095 = load i32, i32* %3094, align 4
  %3096 = add i32 %3095, 1
  store i32 %3096, i32* %3094, align 4
  br label %3544

3097:                                             ; preds = %3032
  br i1 %3017, label %3098, label %3099

3098:                                             ; preds = %3097
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3105

3099:                                             ; preds = %3097
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3100 = or i32 %3033, -1610612736
  %3101 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3100) #14, !srcloc !6
  %3102 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3103 = load i32, i32* %3102, align 4
  %3104 = getelementptr i32, i32* %3016, i32 %3103
  store i32 %3101, i32* %3104, align 4
  br label %3105

3105:                                             ; preds = %3098, %3099
  %3106 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3107 = load i32, i32* %3106, align 4
  %3108 = add i32 %3107, 1
  store i32 %3108, i32* %3106, align 4
  br label %3544

3109:                                             ; preds = %3032
  br i1 %3017, label %3110, label %3111

3110:                                             ; preds = %3109
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3117

3111:                                             ; preds = %3109
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3112 = or i32 %3033, -1879048192
  %3113 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3112) #14, !srcloc !6
  %3114 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3115 = load i32, i32* %3114, align 4
  %3116 = getelementptr i32, i32* %3016, i32 %3115
  store i32 %3113, i32* %3116, align 4
  br label %3117

3117:                                             ; preds = %3110, %3111
  %3118 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3119 = load i32, i32* %3118, align 4
  %3120 = add i32 %3119, 1
  store i32 %3120, i32* %3118, align 4
  br label %3544

3121:                                             ; preds = %3032
  br i1 %3017, label %3122, label %3123

3122:                                             ; preds = %3121
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3129

3123:                                             ; preds = %3121
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3124 = or i32 %3033, 805306368
  %3125 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3124) #14, !srcloc !6
  %3126 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3127 = load i32, i32* %3126, align 4
  %3128 = getelementptr i32, i32* %3016, i32 %3127
  store i32 %3125, i32* %3128, align 4
  br label %3129

3129:                                             ; preds = %3122, %3123
  %3130 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3131 = load i32, i32* %3130, align 4
  %3132 = add i32 %3131, 1
  store i32 %3132, i32* %3130, align 4
  br label %3544

3133:                                             ; preds = %3032
  br i1 %3017, label %3134, label %3135

3134:                                             ; preds = %3133
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3141

3135:                                             ; preds = %3133
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3136 = or i32 %3033, -1342177280
  %3137 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3136) #14, !srcloc !6
  %3138 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3139 = load i32, i32* %3138, align 4
  %3140 = getelementptr i32, i32* %3016, i32 %3139
  store i32 %3137, i32* %3140, align 4
  br label %3141

3141:                                             ; preds = %3134, %3135
  %3142 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3143 = load i32, i32* %3142, align 4
  %3144 = add i32 %3143, 1
  store i32 %3144, i32* %3142, align 4
  br label %3544

3145:                                             ; preds = %3032
  br i1 %3017, label %3146, label %3147

3146:                                             ; preds = %3145
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3153

3147:                                             ; preds = %3145
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3148 = or i32 %3033, -1610612736
  %3149 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3148) #14, !srcloc !6
  %3150 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3151 = load i32, i32* %3150, align 4
  %3152 = getelementptr i32, i32* %3016, i32 %3151
  store i32 %3149, i32* %3152, align 4
  br label %3153

3153:                                             ; preds = %3146, %3147
  %3154 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3155 = load i32, i32* %3154, align 4
  %3156 = add i32 %3155, 1
  store i32 %3156, i32* %3154, align 4
  br label %3544

3157:                                             ; preds = %2
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %14)
  %3158 = icmp eq i16 %14, 0
  br i1 %3158, label %3159, label %3160

3159:                                             ; preds = %3157
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

3160:                                             ; preds = %3157
  %3161 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %3162 = load i32*, i32** %3161, align 4
  %3163 = icmp eq i32* %3162, null
  br i1 %3163, label %3164, label %3165

3164:                                             ; preds = %3160
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3181

3165:                                             ; preds = %3160
  %3166 = sext i16 %14 to i32
  %3167 = add nsw i32 %23, %3166
  %3168 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 6
  %3169 = load i32*, i32** %3168, align 4
  %3170 = getelementptr i32, i32* %3169, i32 %3167
  %3171 = load i32, i32* %3170, align 4
  %3172 = getelementptr i32, i32* %3169, i32 %23
  %3173 = load i32, i32* %3172, align 4
  %3174 = xor i32 %3173, -1
  %3175 = add i32 %3171, %3174
  %3176 = add i32 %3175, 8388608
  call void @__sanitizer_cov_trace_const_cmp4(i32 16777215, i32 %3176)
  %3177 = icmp ugt i32 %3176, 16777215
  br i1 %3177, label %3179, label %3178

3178:                                             ; preds = %3165
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3181

3179:                                             ; preds = %3165
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3180 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %23, i32 %3175, i32 %3175) #13
  br label %3549

3181:                                             ; preds = %3178, %3164
  %3182 = phi i32 [ %3175, %3178 ], [ 0, %3164 ]
  br i1 %3163, label %3183, label %3184

3183:                                             ; preds = %3181
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3191

3184:                                             ; preds = %3181
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3185 = and i32 %3182, 16777215
  %3186 = or i32 %3185, -369098752
  %3187 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3186) #14, !srcloc !6
  %3188 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3189 = load i32, i32* %3188, align 4
  %3190 = getelementptr i32, i32* %3162, i32 %3189
  store i32 %3187, i32* %3190, align 4
  br label %3191

3191:                                             ; preds = %3183, %3184
  %3192 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3193 = load i32, i32* %3192, align 4
  %3194 = add i32 %3193, 1
  store i32 %3194, i32* %3192, align 4
  br label %3544

3195:                                             ; preds = %2
  %3196 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3197 = load i32, i32* %3196, align 4
  %3198 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %3199 = load i32*, i32** %3198, align 4
  %3200 = icmp eq i32* %3199, null
  br i1 %3200, label %3201, label %3204

3201:                                             ; preds = %3195
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3202 = add i32 %3197, 1
  %3203 = add i32 %3197, 2
  store i32 %3203, i32* %3196, align 4
  br label %3219

3204:                                             ; preds = %3195
  %3205 = getelementptr i32, i32* %3199, i32 %3197
  store i32 143662053, i32* %3205, align 4
  %3206 = load i32*, i32** %3198, align 4
  %3207 = load i32, i32* %3196, align 4
  %3208 = add i32 %3207, 1
  store i32 %3208, i32* %3196, align 4
  %3209 = icmp eq i32* %3206, null
  br i1 %3209, label %3210, label %3212

3210:                                             ; preds = %3204
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3211 = add i32 %3207, 3
  store i32 %3211, i32* %3196, align 4
  br label %3232

3212:                                             ; preds = %3204
  %3213 = getelementptr i32, i32* %3206, i32 %3208
  store i32 276831205, i32* %3213, align 4
  %3214 = load i32*, i32** %3198, align 4
  %3215 = load i32, i32* %3196, align 4
  %3216 = add i32 %3215, 1
  store i32 %3216, i32* %3196, align 4
  %3217 = icmp eq i32* %3214, null
  br i1 %3217, label %3218, label %3222

3218:                                             ; preds = %3212
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3219

3219:                                             ; preds = %3218, %3201
  %3220 = phi i32 [ %3202, %3201 ], [ %3215, %3218 ]
  %3221 = add i32 %3220, 2
  store i32 %3221, i32* %3196, align 4
  br label %3232

3222:                                             ; preds = %3212
  %3223 = getelementptr i32, i32* %3214, i32 %3216
  store i32 408984037, i32* %3223, align 4
  %3224 = load i32*, i32** %3198, align 4
  %3225 = load i32, i32* %3196, align 4
  %3226 = add i32 %3225, 1
  store i32 %3226, i32* %3196, align 4
  %3227 = icmp eq i32* %3224, null
  br i1 %3227, label %3228, label %3229

3228:                                             ; preds = %3222
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3232

3229:                                             ; preds = %3222
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3230 = getelementptr i32, i32* %3224, i32 %3226
  store i32 100686049, i32* %3230, align 4
  %3231 = load i32, i32* %3196, align 4
  br label %3232

3232:                                             ; preds = %3228, %3229, %3219, %3210
  %3233 = phi i32 [ %3221, %3219 ], [ %3226, %3228 ], [ %3231, %3229 ], [ %3211, %3210 ]
  %3234 = add i32 %3233, 1
  store i32 %3234, i32* %3196, align 4
  %3235 = load i32, i32* @out_offset, align 4
  %3236 = add i32 %3197, 16777214
  %3237 = add i32 %3236, %3235
  %3238 = load i32*, i32** %3198, align 4
  %3239 = icmp eq i32* %3238, null
  br i1 %3239, label %3240, label %3243

3240:                                             ; preds = %3232
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3241 = add i32 %3233, 2
  %3242 = add i32 %3233, 3
  store i32 %3242, i32* %3196, align 4
  br label %3263

3243:                                             ; preds = %3232
  %3244 = xor i32 %3233, 16777215
  %3245 = add i32 %3237, %3244
  %3246 = and i32 %3245, 16777215
  %3247 = or i32 %3246, 704643072
  %3248 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3247) #14, !srcloc !6
  %3249 = getelementptr i32, i32* %3238, i32 %3234
  store i32 %3248, i32* %3249, align 4
  %3250 = load i32*, i32** %3198, align 4
  %3251 = load i32, i32* %3196, align 4
  %3252 = add i32 %3251, 1
  store i32 %3252, i32* %3196, align 4
  %3253 = icmp eq i32* %3250, null
  br i1 %3253, label %3254, label %3256

3254:                                             ; preds = %3243
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3255 = add i32 %3251, 3
  store i32 %3255, i32* %3196, align 4
  br label %3276

3256:                                             ; preds = %3243
  %3257 = getelementptr i32, i32* %3250, i32 %3252
  store i32 -664515615, i32* %3257, align 4
  %3258 = load i32*, i32** %3198, align 4
  %3259 = load i32, i32* %3196, align 4
  %3260 = add i32 %3259, 1
  store i32 %3260, i32* %3196, align 4
  %3261 = icmp eq i32* %3258, null
  br i1 %3261, label %3262, label %3266

3262:                                             ; preds = %3256
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3263

3263:                                             ; preds = %3262, %3240
  %3264 = phi i32 [ %3241, %3240 ], [ %3259, %3262 ]
  %3265 = add i32 %3264, 2
  store i32 %3265, i32* %3196, align 4
  br label %3276

3266:                                             ; preds = %3256
  %3267 = getelementptr i32, i32* %3258, i32 %3260
  store i32 22499, i32* %3267, align 4
  %3268 = load i32*, i32** %3198, align 4
  %3269 = load i32, i32* %3196, align 4
  %3270 = add i32 %3269, 1
  store i32 %3270, i32* %3196, align 4
  %3271 = icmp eq i32* %3268, null
  br i1 %3271, label %3272, label %3273

3272:                                             ; preds = %3266
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3276

3273:                                             ; preds = %3266
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3274 = getelementptr i32, i32* %3268, i32 %3270
  store i32 536892931, i32* %3274, align 4
  %3275 = load i32, i32* %3196, align 4
  br label %3276

3276:                                             ; preds = %3272, %3273, %3263, %3254
  %3277 = phi i32 [ %3265, %3263 ], [ %3270, %3272 ], [ %3275, %3273 ], [ %3255, %3254 ]
  %3278 = add i32 %3277, 1
  store i32 %3278, i32* %3196, align 4
  %3279 = load i32*, i32** %3198, align 4
  %3280 = icmp eq i32* %3279, null
  br i1 %3280, label %3281, label %3284

3281:                                             ; preds = %3276
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3282 = add i32 %3277, 2
  %3283 = add i32 %3277, 3
  store i32 %3283, i32* %3196, align 4
  br label %3305

3284:                                             ; preds = %3276
  %3285 = xor i32 %3277, 16777215
  %3286 = add i32 %3237, %3285
  %3287 = and i32 %3286, 16777215
  %3288 = or i32 %3287, -1979711488
  %3289 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3288) #14, !srcloc !6
  %3290 = getelementptr i32, i32* %3279, i32 %3278
  store i32 %3289, i32* %3290, align 4
  %3291 = load i32*, i32** %3198, align 4
  %3292 = load i32, i32* %3196, align 4
  %3293 = add i32 %3292, 1
  store i32 %3293, i32* %3196, align 4
  %3294 = icmp eq i32* %3291, null
  br i1 %3294, label %3295, label %3298

3295:                                             ; preds = %3284
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3296 = add i32 %3292, 2
  %3297 = add i32 %3292, 3
  store i32 %3297, i32* %3196, align 4
  br label %3316

3298:                                             ; preds = %3284
  %3299 = getelementptr i32, i32* %3291, i32 %3293
  store i32 23107298, i32* %3299, align 4
  %3300 = load i32*, i32** %3198, align 4
  %3301 = load i32, i32* %3196, align 4
  %3302 = add i32 %3301, 1
  store i32 %3302, i32* %3196, align 4
  %3303 = icmp eq i32* %3300, null
  br i1 %3303, label %3304, label %3309

3304:                                             ; preds = %3298
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3305

3305:                                             ; preds = %3304, %3281
  %3306 = phi i32 [ %3282, %3281 ], [ %3301, %3304 ]
  %3307 = add i32 %3306, 2
  %3308 = add i32 %3306, 3
  store i32 %3308, i32* %3196, align 4
  br label %3327

3309:                                             ; preds = %3298
  %3310 = getelementptr i32, i32* %3300, i32 %3302
  store i32 7383010, i32* %3310, align 4
  %3311 = load i32*, i32** %3198, align 4
  %3312 = load i32, i32* %3196, align 4
  %3313 = add i32 %3312, 1
  store i32 %3313, i32* %3196, align 4
  %3314 = icmp eq i32* %3311, null
  br i1 %3314, label %3315, label %3320

3315:                                             ; preds = %3309
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3316

3316:                                             ; preds = %3315, %3295
  %3317 = phi i32 [ %3296, %3295 ], [ %3312, %3315 ]
  %3318 = add i32 %3317, 2
  %3319 = add i32 %3317, 3
  store i32 %3319, i32* %3196, align 4
  br label %3337

3320:                                             ; preds = %3309
  %3321 = getelementptr i32, i32* %3311, i32 %3313
  store i32 -127644703, i32* %3321, align 4
  %3322 = load i32*, i32** %3198, align 4
  %3323 = load i32, i32* %3196, align 4
  %3324 = add i32 %3323, 1
  store i32 %3324, i32* %3196, align 4
  %3325 = icmp eq i32* %3322, null
  br i1 %3325, label %3326, label %3330

3326:                                             ; preds = %3320
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3327

3327:                                             ; preds = %3326, %3305
  %3328 = phi i32 [ %3307, %3305 ], [ %3323, %3326 ]
  %3329 = add i32 %3328, 3
  store i32 %3329, i32* %3196, align 4
  br label %3350

3330:                                             ; preds = %3320
  %3331 = getelementptr i32, i32* %3322, i32 %3324
  store i32 426674658, i32* %3331, align 4
  %3332 = load i32*, i32** %3198, align 4
  %3333 = load i32, i32* %3196, align 4
  %3334 = add i32 %3333, 1
  store i32 %3334, i32* %3196, align 4
  %3335 = icmp eq i32* %3332, null
  br i1 %3335, label %3336, label %3340

3336:                                             ; preds = %3330
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3337

3337:                                             ; preds = %3336, %3316
  %3338 = phi i32 [ %3318, %3316 ], [ %3333, %3336 ]
  %3339 = add i32 %3338, 2
  store i32 %3339, i32* %3196, align 4
  br label %3350

3340:                                             ; preds = %3330
  %3341 = getelementptr i32, i32* %3332, i32 %3334
  store i32 140613351, i32* %3341, align 4
  %3342 = load i32*, i32** %3198, align 4
  %3343 = load i32, i32* %3196, align 4
  %3344 = add i32 %3343, 1
  store i32 %3344, i32* %3196, align 4
  %3345 = icmp eq i32* %3342, null
  br i1 %3345, label %3346, label %3347

3346:                                             ; preds = %3340
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3350

3347:                                             ; preds = %3340
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3348 = getelementptr i32, i32* %3342, i32 %3344
  store i32 22243, i32* %3348, align 4
  %3349 = load i32, i32* %3196, align 4
  br label %3350

3350:                                             ; preds = %3346, %3347, %3337, %3327
  %3351 = phi i32 [ %3339, %3337 ], [ %3344, %3346 ], [ %3349, %3347 ], [ %3329, %3327 ]
  %3352 = add i32 %3351, 1
  store i32 %3352, i32* %3196, align 4
  %3353 = load i32*, i32** %3198, align 4
  %3354 = icmp eq i32* %3353, null
  br i1 %3354, label %3355, label %3357

3355:                                             ; preds = %3350
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3356 = add i32 %3351, 2
  store i32 %3356, i32* %3196, align 4
  br label %3372

3357:                                             ; preds = %3350
  %3358 = xor i32 %3351, 16777215
  %3359 = add i32 %3237, %3358
  %3360 = and i32 %3359, 16777215
  %3361 = or i32 %3360, 167772160
  %3362 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3361) #14, !srcloc !6
  %3363 = getelementptr i32, i32* %3353, i32 %3352
  store i32 %3362, i32* %3363, align 4
  %3364 = load i32*, i32** %3198, align 4
  %3365 = load i32, i32* %3196, align 4
  %3366 = add i32 %3365, 1
  store i32 %3366, i32* %3196, align 4
  %3367 = icmp eq i32* %3364, null
  br i1 %3367, label %3368, label %3369

3368:                                             ; preds = %3357
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3372

3369:                                             ; preds = %3357
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3370 = getelementptr i32, i32* %3364, i32 %3366
  store i32 610309861, i32* %3370, align 4
  %3371 = load i32, i32* %3196, align 4
  br label %3372

3372:                                             ; preds = %3368, %3369, %3355
  %3373 = phi i32 [ %3356, %3355 ], [ %3366, %3368 ], [ %3371, %3369 ]
  %3374 = add i32 %3373, 1
  store i32 %3374, i32* %3196, align 4
  %3375 = load i32*, i32** %3198, align 4
  %3376 = icmp eq i32* %3375, null
  br i1 %3376, label %3377, label %3378

3377:                                             ; preds = %3372
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3386

3378:                                             ; preds = %3372
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3379 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 2
  %3380 = load i32, i32* %3379, align 4
  %3381 = or i32 %3380, -494510080
  %3382 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3381) #14, !srcloc !6
  %3383 = getelementptr i32, i32* %3375, i32 %3374
  store i32 %3382, i32* %3383, align 4
  %3384 = load i32*, i32** %3198, align 4
  %3385 = load i32, i32* %3196, align 4
  br label %3386

3386:                                             ; preds = %3377, %3378
  %3387 = phi i32 [ %3374, %3377 ], [ %3385, %3378 ]
  %3388 = phi i32* [ null, %3377 ], [ %3384, %3378 ]
  %3389 = add i32 %3387, 1
  store i32 %3389, i32* %3196, align 4
  %3390 = load i32, i32* @elf_hwcap, align 4
  %3391 = and i32 %3390, 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %3391)
  %3392 = icmp eq i32 %3391, 0
  %3393 = icmp eq i32* %3388, null
  br i1 %3392, label %3398, label %3394

3394:                                             ; preds = %3386
  br i1 %3393, label %3395, label %3396

3395:                                             ; preds = %3394
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3402

3396:                                             ; preds = %3394
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3397 = getelementptr i32, i32* %3388, i32 %3389
  store i32 385822689, i32* %3397, align 4
  br label %3402

3398:                                             ; preds = %3386
  br i1 %3393, label %3399, label %3400

3399:                                             ; preds = %3398
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3402

3400:                                             ; preds = %3398
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3401 = getelementptr i32, i32* %3388, i32 %3389
  store i32 116433121, i32* %3401, align 4
  br label %3402

3402:                                             ; preds = %3399, %3395, %3400, %3396
  %3403 = load i32, i32* %3196, align 4
  %3404 = add i32 %3403, 1
  store i32 %3404, i32* %3196, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 -1, i32 %3235)
  %3405 = icmp eq i32 %3235, -1
  br i1 %3405, label %3406, label %3408

3406:                                             ; preds = %3402
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3407 = sub i32 %3404, %3197
  store i32 %3407, i32* @out_offset, align 4
  br label %3544

3408:                                             ; preds = %3402
  %3409 = load i32, i32* @out_offset, align 4
  %3410 = sub i32 %3404, %3197
  call void @__sanitizer_cov_trace_cmp4(i32 %3410, i32 %3409)
  %3411 = icmp eq i32 %3410, %3409
  br i1 %3411, label %3412, label %3413

3412:                                             ; preds = %3408
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

3413:                                             ; preds = %3408
  %3414 = load i1, i1* @emit_bpf_tail_call.__print_once, align 1
  br i1 %3414, label %3415, label %3416

3415:                                             ; preds = %3413
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

3416:                                             ; preds = %3413
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @emit_bpf_tail_call.__print_once, align 1
  %3417 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.4, i32 0, i32 0), i32 %3410, i32 %3409) #13
  br label %3549

3418:                                             ; preds = %2
  %3419 = add i32 %16, ptrtoint (i64 (i64, i64, i64, i64, i64)* @__bpf_call_base to i32)
  tail call fastcc void @emit_a32_mov_r64(i1 zeroext true, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 1, i32 0), %struct.jit_ctx* %1)
  tail call fastcc void @emit_a32_mov_r64(i1 zeroext true, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 1, i32 0), i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 2, i32 0), %struct.jit_ctx* %1)
  %3420 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %3421 = load i32*, i32** %3420, align 4
  %3422 = icmp eq i32* %3421, null
  %3423 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3424 = load i32, i32* %3423, align 4
  br i1 %3422, label %3425, label %3427

3425:                                             ; preds = %3418
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3426 = add i32 %3424, 1
  store i32 %3426, i32* %3423, align 4
  br label %3434

3427:                                             ; preds = %3418
  %3428 = getelementptr i32, i32* %3421, i32 %3424
  store i32 -796767263, i32* %3428, align 4
  %3429 = load i32*, i32** %3420, align 4
  %3430 = load i32, i32* %3423, align 4
  %3431 = add i32 %3430, 1
  store i32 %3431, i32* %3423, align 4
  %3432 = icmp eq i32* %3429, null
  br i1 %3432, label %3433, label %3437

3433:                                             ; preds = %3427
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3434

3434:                                             ; preds = %3433, %3425
  %3435 = phi i32 [ %3431, %3433 ], [ %3426, %3425 ]
  %3436 = add i32 %3435, 1
  store i32 %3436, i32* %3423, align 4
  br label %3444

3437:                                             ; preds = %3427
  %3438 = getelementptr i32, i32* %3429, i32 %3431
  store i32 208361, i32* %3438, align 4
  %3439 = load i32, i32* %3423, align 4
  %3440 = load i32*, i32** %3420, align 4
  %3441 = add i32 %3439, 1
  store i32 %3441, i32* %3423, align 4
  %3442 = icmp eq i32* %3440, null
  br i1 %3442, label %3443, label %3448

3443:                                             ; preds = %3437
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3444

3444:                                             ; preds = %3443, %3434
  %3445 = phi i32 [ %3435, %3434 ], [ %3439, %3443 ]
  %3446 = add i32 %3445, 2
  %3447 = add i32 %3445, 3
  store i32 %3447, i32* %3423, align 4
  br label %3463

3448:                                             ; preds = %3437
  %3449 = getelementptr i32, i32* %3440, i32 %3441
  store i32 -662615071, i32* %3449, align 4
  %3450 = load i32*, i32** %3420, align 4
  %3451 = load i32, i32* %3423, align 4
  %3452 = add i32 %3451, 1
  store i32 %3452, i32* %3423, align 4
  %3453 = icmp eq i32* %3450, null
  br i1 %3453, label %3454, label %3456

3454:                                             ; preds = %3448
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3455 = add i32 %3451, 3
  store i32 %3455, i32* %3423, align 4
  br label %3476

3456:                                             ; preds = %3448
  %3457 = getelementptr i32, i32* %3450, i32 %3452
  store i32 208361, i32* %3457, align 4
  %3458 = load i32*, i32** %3420, align 4
  %3459 = load i32, i32* %3423, align 4
  %3460 = add i32 %3459, 1
  store i32 %3460, i32* %3423, align 4
  %3461 = icmp eq i32* %3458, null
  br i1 %3461, label %3462, label %3466

3462:                                             ; preds = %3456
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3463

3463:                                             ; preds = %3462, %3444
  %3464 = phi i32 [ %3446, %3444 ], [ %3459, %3462 ]
  %3465 = add i32 %3464, 2
  store i32 %3465, i32* %3423, align 4
  br label %3476

3466:                                             ; preds = %3456
  %3467 = getelementptr i32, i32* %3458, i32 %3460
  store i32 -796832799, i32* %3467, align 4
  %3468 = load i32*, i32** %3420, align 4
  %3469 = load i32, i32* %3423, align 4
  %3470 = add i32 %3469, 1
  store i32 %3470, i32* %3423, align 4
  %3471 = icmp eq i32* %3468, null
  br i1 %3471, label %3472, label %3473

3472:                                             ; preds = %3466
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3476

3473:                                             ; preds = %3466
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3474 = getelementptr i32, i32* %3468, i32 %3470
  store i32 208361, i32* %3474, align 4
  %3475 = load i32, i32* %3423, align 4
  br label %3476

3476:                                             ; preds = %3472, %3454, %3463, %3473
  %3477 = phi i32 [ %3465, %3463 ], [ %3470, %3472 ], [ %3475, %3473 ], [ %3455, %3454 ]
  %3478 = add i32 %3477, 1
  store i32 %3478, i32* %3423, align 4
  tail call fastcc void @emit_mov_i(i8 zeroext 6, i32 %3419, %struct.jit_ctx* %1) #12
  %3479 = load i32*, i32** %3420, align 4
  %3480 = icmp eq i32* %3479, null
  %3481 = load i32, i32* %3423, align 4
  br i1 %3480, label %3482, label %3484

3482:                                             ; preds = %3476
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3483 = add i32 %3481, 1
  store i32 %3483, i32* %3423, align 4
  br label %3494

3484:                                             ; preds = %3476
  %3485 = getelementptr i32, i32* %3479, i32 %3481
  store i32 922693601, i32* %3485, align 4
  %3486 = load i32*, i32** %3420, align 4
  %3487 = load i32, i32* %3423, align 4
  %3488 = add i32 %3487, 1
  store i32 %3488, i32* %3423, align 4
  %3489 = icmp eq i32* %3486, null
  br i1 %3489, label %3490, label %3491

3490:                                             ; preds = %3484
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3494

3491:                                             ; preds = %3484
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3492 = getelementptr i32, i32* %3486, i32 %3488
  store i32 416320994, i32* %3492, align 4
  %3493 = load i32, i32* %3423, align 4
  br label %3494

3494:                                             ; preds = %3490, %3482, %3491
  %3495 = phi i32 [ %3483, %3482 ], [ %3488, %3490 ], [ %3493, %3491 ]
  %3496 = add i32 %3495, 1
  store i32 %3496, i32* %3423, align 4
  br label %3544

3497:                                             ; preds = %2
  %3498 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %18, i32 0, i32 4
  %3499 = load i32, i32* %3498, align 4
  %3500 = add i32 %3499, -1
  call void @__sanitizer_cov_trace_cmp4(i32 %23, i32 %3500)
  %3501 = icmp eq i32 %23, %3500
  br i1 %3501, label %3502, label %3503

3502:                                             ; preds = %3497
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3544

3503:                                             ; preds = %3497
  %3504 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 7
  %3505 = load i32*, i32** %3504, align 4
  %3506 = icmp eq i32* %3505, null
  br i1 %3506, label %3507, label %3508

3507:                                             ; preds = %3503
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3520

3508:                                             ; preds = %3503
  %3509 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 3
  %3510 = load i32, i32* %3509, align 4
  %3511 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3512 = load i32, i32* %3511, align 4
  %3513 = add i32 %3510, -2
  %3514 = sub i32 %3513, %3512
  %3515 = add i32 %3514, 8388608
  call void @__sanitizer_cov_trace_const_cmp4(i32 16777215, i32 %3515)
  %3516 = icmp ugt i32 %3515, 16777215
  br i1 %3516, label %3518, label %3517

3517:                                             ; preds = %3508
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3520

3518:                                             ; preds = %3508
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3519 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %23, i32 %3514, i32 %3514) #13
  br label %3549

3520:                                             ; preds = %3517, %3507
  %3521 = phi i32 [ %3514, %3517 ], [ 0, %3507 ]
  br i1 %3506, label %3522, label %3523

3522:                                             ; preds = %3520
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3530

3523:                                             ; preds = %3520
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3524 = and i32 %3521, 16777215
  %3525 = or i32 %3524, -369098752
  %3526 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %3525) #14, !srcloc !6
  %3527 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3528 = load i32, i32* %3527, align 4
  %3529 = getelementptr i32, i32* %3505, i32 %3528
  store i32 %3526, i32* %3529, align 4
  br label %3530

3530:                                             ; preds = %3522, %3523
  %3531 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 1
  %3532 = load i32, i32* %3531, align 4
  %3533 = add i32 %3532, 1
  store i32 %3533, i32* %3531, align 4
  br label %3544

3534:                                             ; preds = %76, %77, %93, %94, %95, %96
  %3535 = load i1, i1* @build_insn.__print_once, align 1
  br i1 %3535, label %3536, label %3537

3536:                                             ; preds = %3534
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

3537:                                             ; preds = %3534
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @build_insn.__print_once, align 1
  %3538 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 %24) #13
  br label %3549

3539:                                             ; preds = %2
  %3540 = load i1, i1* @build_insn.__print_once.2, align 1
  br i1 %3540, label %3541, label %3542

3541:                                             ; preds = %3539
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %3549

3542:                                             ; preds = %3539
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @build_insn.__print_once.2, align 1
  %3543 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %24) #13
  br label %3549

3544:                                             ; preds = %3502, %3412, %3159, %3037, %2779, %2668, %2222, %1932, %1773, %1744, %938, %710, %458, %401, %3406, %2684, %2637, %2238, %2192, %1946, %1905, %1815, %1802, %1760, %1714, %1531, %1514, %1339, %1322, %1147, %1130, %954, %908, %726, %679, %500, %487, %437, %425, %176, %163, %3046, %3057, %3069, %3081, %3093, %3105, %3117, %3129, %3141, %3153, %1952, %1953, %190, %192, %180, %181, %3530, %3494, %3191, %2729, %2697
  %3545 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %1, i32 0, i32 5
  %3546 = load i32, i32* %3545, align 4
  %3547 = shl i32 %3546, 31
  %3548 = ashr exact i32 %3547, 31
  br label %3549

3549:                                             ; preds = %3541, %3536, %3415, %1536, %732, %506, %442, %3416, %3544, %3542, %3537, %3518, %3179, %2242
  %3550 = phi i32 [ -22, %3518 ], [ -22, %3179 ], [ 1, %2242 ], [ -22, %442 ], [ -22, %506 ], [ -22, %732 ], [ -22, %1536 ], [ -14, %3537 ], [ -14, %3536 ], [ -22, %3542 ], [ -22, %3541 ], [ %3548, %3544 ], [ -14, %3415 ], [ -14, %3416 ]
  ret i32 %3550
}

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_a32_mov_r64(i1 zeroext %0, i8* nocapture readonly %1, i8* nocapture readonly %2, %struct.jit_ctx* %3) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br i1 %0, label %118, label %5

5:                                                ; preds = %4
  %6 = getelementptr i8, i8* %1, i32 1
  %7 = load i8, i8* %6, align 1
  %8 = getelementptr i8, i8* %2, i32 1
  %9 = load i8, i8* %8, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %9)
  %10 = icmp slt i8 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %29

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %14 = load i32*, i32** %13, align 4
  %15 = icmp eq i32* %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %25

17:                                               ; preds = %12
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %18 = sext i8 %9 to i32
  %19 = sub nsw i32 0, %18
  %20 = or i32 %19, -451186688
  %21 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %20) #14, !srcloc !6
  %22 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr i32, i32* %14, i32 %23
  store i32 %21, i32* %24, align 4
  br label %25

25:                                               ; preds = %16, %17
  %26 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %27 = load i32, i32* %26, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %26, align 4
  br label %29

29:                                               ; preds = %11, %25
  %30 = phi i8 [ 7, %25 ], [ %9, %11 ]
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %7)
  %31 = icmp slt i8 %7, 0
  br i1 %31, label %32, label %48

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %34 = load i32*, i32** %33, align 4
  %35 = icmp eq i32* %34, null
  br i1 %35, label %36, label %37

36:                                               ; preds = %32
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %66

37:                                               ; preds = %32
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %38 = zext i8 %30 to i32
  %39 = shl nuw nsw i32 %38, 12
  %40 = sext i8 %7 to i32
  %41 = sub nsw i32 0, %40
  %42 = or i32 %39, %41
  %43 = or i32 %42, -452263936
  %44 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %43) #14, !srcloc !6
  %45 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %46 = load i32, i32* %45, align 4
  %47 = getelementptr i32, i32* %34, i32 %46
  store i32 %44, i32* %47, align 4
  br label %66

48:                                               ; preds = %29
  call void @__sanitizer_cov_trace_cmp1(i8 %30, i8 %7)
  %49 = icmp eq i8 %30, %7
  br i1 %49, label %50, label %51

50:                                               ; preds = %48
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %70

51:                                               ; preds = %48
  %52 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %53 = load i32*, i32** %52, align 4
  %54 = icmp eq i32* %53, null
  br i1 %54, label %55, label %56

55:                                               ; preds = %51
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %66

56:                                               ; preds = %51
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %57 = zext i8 %7 to i32
  %58 = shl nuw nsw i32 %57, 12
  %59 = zext i8 %30 to i32
  %60 = or i32 %58, %59
  %61 = or i32 %60, -509607936
  %62 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %61) #14, !srcloc !6
  %63 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %64 = load i32, i32* %63, align 4
  %65 = getelementptr i32, i32* %53, i32 %64
  store i32 %62, i32* %65, align 4
  br label %66

66:                                               ; preds = %55, %36, %56, %37
  %67 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %68 = load i32, i32* %67, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %67, align 4
  br label %70

70:                                               ; preds = %50, %66
  %71 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 0
  %72 = load %struct.bpf_prog*, %struct.bpf_prog** %71, align 4
  %73 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %72, i32 0, i32 7
  %74 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %73, align 4
  %75 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %74, i32 0, i32 13
  %76 = load i8, i8* %75, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %76)
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %79, label %78

78:                                               ; preds = %70
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %250

79:                                               ; preds = %70
  %80 = load i8, i8* %1, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %80)
  %81 = icmp slt i8 %80, 0
  %82 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %83 = load i32*, i32** %82, align 4
  %84 = icmp eq i32* %83, null
  br i1 %81, label %85, label %105

85:                                               ; preds = %79
  br i1 %84, label %86, label %87

86:                                               ; preds = %85
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %91

87:                                               ; preds = %85
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %88 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %89 = load i32, i32* %88, align 4
  %90 = getelementptr i32, i32* %83, i32 %89
  store i32 6332643, i32* %90, align 4
  br label %91

91:                                               ; preds = %86, %87
  %92 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %93 = load i32, i32* %92, align 4
  %94 = add i32 %93, 1
  store i32 %94, i32* %92, align 4
  %95 = load i32*, i32** %82, align 4
  %96 = icmp eq i32* %95, null
  br i1 %96, label %97, label %98

97:                                               ; preds = %91
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %246

98:                                               ; preds = %91
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %99 = sext i8 %80 to i32
  %100 = sub nsw i32 0, %99
  %101 = or i32 %100, -452239360
  %102 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %101) #14, !srcloc !6
  %103 = getelementptr i32, i32* %95, i32 %94
  store i32 %102, i32* %103, align 4
  %104 = load i32, i32* %92, align 4
  br label %246

105:                                              ; preds = %79
  br i1 %84, label %106, label %107

106:                                              ; preds = %105
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %115

107:                                              ; preds = %105
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %108 = zext i8 %80 to i32
  %109 = shl nuw nsw i32 %108, 12
  %110 = or i32 %109, -476053504
  %111 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %110) #14, !srcloc !6
  %112 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %113 = load i32, i32* %112, align 4
  %114 = getelementptr i32, i32* %83, i32 %113
  store i32 %111, i32* %114, align 4
  br label %115

115:                                              ; preds = %106, %107
  %116 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %117 = load i32, i32* %116, align 4
  br label %246

118:                                              ; preds = %4
  %119 = getelementptr i8, i8* %2, i32 1
  %120 = load i8, i8* %119, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %120)
  %121 = icmp slt i8 %120, 0
  %122 = getelementptr i8, i8* %1, i32 1
  %123 = load i8, i8* %122, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %123)
  %124 = icmp slt i8 %123, 0
  br i1 %121, label %125, label %187

125:                                              ; preds = %118
  %126 = sext i8 %120 to i32
  %127 = sub nsw i32 0, %126
  %128 = and i32 %127, 65535
  %129 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %130 = load i32*, i32** %129, align 4
  %131 = icmp eq i32* %130, null
  br i1 %124, label %132, label %168

132:                                              ; preds = %125
  br i1 %131, label %133, label %134

133:                                              ; preds = %132
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %144

134:                                              ; preds = %132
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %135 = and i32 %127, 15
  %136 = shl nuw nsw i32 %128, 4
  %137 = and i32 %136, 3840
  %138 = or i32 %135, %137
  %139 = or i32 %138, -515153712
  %140 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %139) #14, !srcloc !6
  %141 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %142 = load i32, i32* %141, align 4
  %143 = getelementptr i32, i32* %130, i32 %142
  store i32 %140, i32* %143, align 4
  br label %144

144:                                              ; preds = %133, %134
  %145 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %146 = load i32, i32* %145, align 4
  %147 = add i32 %146, 1
  store i32 %147, i32* %145, align 4
  %148 = load i8, i8* %122, align 1
  %149 = sext i8 %148 to i16
  call void @__sanitizer_cov_trace_const_cmp1(i8 -1, i8 %148)
  %150 = icmp sgt i8 %148, -1
  %151 = sub nsw i16 0, %149
  %152 = select i1 %150, i16 %149, i16 %151
  %153 = zext i16 %152 to i32
  %154 = load i32*, i32** %129, align 4
  %155 = icmp eq i32* %154, null
  br i1 %155, label %156, label %157

156:                                              ; preds = %144
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %246

157:                                              ; preds = %144
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %158 = and i32 %153, 15
  %159 = select i1 %150, i32 30105840, i32 21717232
  %160 = or i32 %158, %159
  %161 = shl nuw nsw i32 %153, 4
  %162 = and i32 %161, 3840
  %163 = or i32 %160, %162
  %164 = or i32 %163, -536870912
  %165 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %164) #14, !srcloc !6
  %166 = getelementptr i32, i32* %154, i32 %147
  store i32 %165, i32* %166, align 4
  %167 = load i32, i32* %145, align 4
  br label %246

168:                                              ; preds = %125
  br i1 %131, label %169, label %170

169:                                              ; preds = %168
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %184

170:                                              ; preds = %168
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %171 = shl nuw nsw i32 %128, 4
  %172 = and i32 %171, 3840
  %173 = and i32 %127, 15
  %174 = or i32 %172, %173
  %175 = zext i8 %123 to i32
  %176 = shl nuw nsw i32 %175, 12
  %177 = or i32 %176, 21692624
  %178 = or i32 %174, %177
  %179 = or i32 %178, -536870912
  %180 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %179) #14, !srcloc !6
  %181 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %182 = load i32, i32* %181, align 4
  %183 = getelementptr i32, i32* %130, i32 %182
  store i32 %180, i32* %183, align 4
  br label %184

184:                                              ; preds = %169, %170
  %185 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %186 = load i32, i32* %185, align 4
  br label %246

187:                                              ; preds = %118
  br i1 %124, label %188, label %211

188:                                              ; preds = %187
  %189 = sext i8 %123 to i32
  %190 = sub nsw i32 0, %189
  %191 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %192 = load i32*, i32** %191, align 4
  %193 = icmp eq i32* %192, null
  br i1 %193, label %194, label %195

194:                                              ; preds = %188
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %208

195:                                              ; preds = %188
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %196 = zext i8 %120 to i32
  %197 = shl nuw nsw i32 %196, 12
  %198 = and i32 %190, 15
  %199 = or i32 %197, %198
  %200 = shl nuw nsw i32 %190, 4
  %201 = and i32 %200, 3840
  %202 = or i32 %199, %201
  %203 = or i32 %202, -515178256
  %204 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %203) #14, !srcloc !6
  %205 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %206 = load i32, i32* %205, align 4
  %207 = getelementptr i32, i32* %192, i32 %206
  store i32 %204, i32* %207, align 4
  br label %208

208:                                              ; preds = %194, %195
  %209 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %210 = load i32, i32* %209, align 4
  br label %246

211:                                              ; preds = %187
  %212 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %213 = load i32*, i32** %212, align 4
  %214 = icmp eq i32* %213, null
  br i1 %214, label %215, label %216

215:                                              ; preds = %211
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %228

216:                                              ; preds = %211
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %217 = load i8, i8* %1, align 1
  %218 = sext i8 %217 to i32
  %219 = shl nsw i32 %218, 12
  %220 = load i8, i8* %2, align 1
  %221 = sext i8 %220 to i32
  %222 = or i32 %219, %221
  %223 = or i32 %222, -509607936
  %224 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %223) #14, !srcloc !6
  %225 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %226 = load i32, i32* %225, align 4
  %227 = getelementptr i32, i32* %213, i32 %226
  store i32 %224, i32* %227, align 4
  br label %228

228:                                              ; preds = %215, %216
  %229 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %230 = load i32, i32* %229, align 4
  %231 = add i32 %230, 1
  store i32 %231, i32* %229, align 4
  %232 = load i32*, i32** %212, align 4
  %233 = icmp eq i32* %232, null
  br i1 %233, label %234, label %235

234:                                              ; preds = %228
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %246

235:                                              ; preds = %228
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %236 = load i8, i8* %122, align 1
  %237 = sext i8 %236 to i32
  %238 = shl nsw i32 %237, 12
  %239 = load i8, i8* %119, align 1
  %240 = sext i8 %239 to i32
  %241 = or i32 %238, %240
  %242 = or i32 %241, -509607936
  %243 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %242) #14, !srcloc !6
  %244 = getelementptr i32, i32* %232, i32 %231
  store i32 %243, i32* %244, align 4
  %245 = load i32, i32* %229, align 4
  br label %246

246:                                              ; preds = %234, %156, %97, %235, %157, %98, %184, %208, %115
  %247 = phi i32 [ %117, %115 ], [ %210, %208 ], [ %186, %184 ], [ %104, %98 ], [ %94, %97 ], [ %147, %156 ], [ %167, %157 ], [ %231, %234 ], [ %245, %235 ]
  %248 = phi i32* [ %116, %115 ], [ %209, %208 ], [ %185, %184 ], [ %92, %98 ], [ %92, %97 ], [ %145, %156 ], [ %145, %157 ], [ %229, %234 ], [ %229, %235 ]
  %249 = add i32 %247, 1
  store i32 %249, i32* %248, align 4
  br label %250

250:                                              ; preds = %78, %246
  ret void
}

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_a32_alu_r64(i1 zeroext %0, i8* nocapture readonly %1, i8* nocapture readonly %2, %struct.jit_ctx* %3, i8 zeroext %4) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %6 = getelementptr i8, i8* %1, i32 1
  %7 = load i8, i8* %6, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %7)
  %8 = icmp slt i8 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %31

10:                                               ; preds = %5
  %11 = sext i8 %7 to i32
  %12 = sub nsw i32 0, %11
  %13 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %14 = load i32*, i32** %13, align 4
  %15 = icmp eq i32* %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %27

17:                                               ; preds = %10
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %18 = shl nuw nsw i32 %12, 4
  %19 = and i32 %18, 3840
  %20 = and i32 %12, 15
  %21 = or i32 %19, %20
  %22 = or i32 %21, -515153712
  %23 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %22) #14, !srcloc !6
  %24 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr i32, i32* %14, i32 %25
  store i32 %23, i32* %26, align 4
  br label %27

27:                                               ; preds = %16, %17
  %28 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %29 = load i32, i32* %28, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %28, align 4
  br label %31

31:                                               ; preds = %9, %27
  %32 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %27 ], [ %1, %9 ]
  %33 = getelementptr i8, i8* %2, i32 1
  %34 = load i8, i8* %33, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %34)
  %35 = icmp slt i8 %34, 0
  br i1 %0, label %36, label %66

36:                                               ; preds = %31
  br i1 %35, label %38, label %37

37:                                               ; preds = %36
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %59

38:                                               ; preds = %36
  %39 = sext i8 %34 to i32
  %40 = sub nsw i32 0, %39
  %41 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %42 = load i32*, i32** %41, align 4
  %43 = icmp eq i32* %42, null
  br i1 %43, label %44, label %45

44:                                               ; preds = %38
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %55

45:                                               ; preds = %38
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %46 = shl nuw nsw i32 %40, 4
  %47 = and i32 %46, 3840
  %48 = and i32 %40, 15
  %49 = or i32 %47, %48
  %50 = or i32 %49, -515145520
  %51 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %50) #14, !srcloc !6
  %52 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr i32, i32* %42, i32 %53
  store i32 %51, i32* %54, align 4
  br label %55

55:                                               ; preds = %44, %45
  %56 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %57 = load i32, i32* %56, align 4
  %58 = add i32 %57, 1
  store i32 %58, i32* %56, align 4
  br label %59

59:                                               ; preds = %37, %55
  %60 = phi i8 [ 8, %55 ], [ %34, %37 ]
  %61 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), %55 ], [ %2, %37 ]
  %62 = getelementptr i8, i8* %32, i32 1
  %63 = load i8, i8* %62, align 1
  tail call fastcc void @emit_alu_r(i8 zeroext %63, i8 zeroext %60, i1 zeroext false, i8 zeroext %4, %struct.jit_ctx* %3)
  %64 = load i8, i8* %32, align 1
  %65 = load i8, i8* %61, align 1
  tail call fastcc void @emit_alu_r(i8 zeroext %64, i8 zeroext %65, i1 zeroext true, i8 zeroext %4, %struct.jit_ctx* %3)
  br label %140

66:                                               ; preds = %31
  br i1 %35, label %68, label %67

67:                                               ; preds = %66
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %85

68:                                               ; preds = %66
  %69 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %70 = load i32*, i32** %69, align 4
  %71 = icmp eq i32* %70, null
  br i1 %71, label %72, label %73

72:                                               ; preds = %68
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %81

73:                                               ; preds = %68
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %74 = sext i8 %34 to i32
  %75 = sub nsw i32 0, %74
  %76 = or i32 %75, -451182592
  %77 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %76) #14, !srcloc !6
  %78 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %79 = load i32, i32* %78, align 4
  %80 = getelementptr i32, i32* %70, i32 %79
  store i32 %77, i32* %80, align 4
  br label %81

81:                                               ; preds = %72, %73
  %82 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %83 = load i32, i32* %82, align 4
  %84 = add i32 %83, 1
  store i32 %84, i32* %82, align 4
  br label %85

85:                                               ; preds = %67, %81
  %86 = phi i8 [ 8, %81 ], [ %34, %67 ]
  %87 = getelementptr i8, i8* %32, i32 1
  %88 = load i8, i8* %87, align 1
  tail call fastcc void @emit_alu_r(i8 zeroext %88, i8 zeroext %86, i1 zeroext false, i8 zeroext %4, %struct.jit_ctx* %3)
  %89 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 0
  %90 = load %struct.bpf_prog*, %struct.bpf_prog** %89, align 4
  %91 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %90, i32 0, i32 7
  %92 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %91, align 4
  %93 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %92, i32 0, i32 13
  %94 = load i8, i8* %93, align 8, !range !7
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %94)
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %97, label %96

96:                                               ; preds = %85
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %140

97:                                               ; preds = %85
  %98 = load i8, i8* %32, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %98)
  %99 = icmp slt i8 %98, 0
  %100 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %101 = load i32*, i32** %100, align 4
  %102 = icmp eq i32* %101, null
  br i1 %99, label %103, label %126

103:                                              ; preds = %97
  br i1 %102, label %104, label %105

104:                                              ; preds = %103
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %109

105:                                              ; preds = %103
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %106 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %107 = load i32, i32* %106, align 4
  %108 = getelementptr i32, i32* %101, i32 %107
  store i32 6332643, i32* %108, align 4
  br label %109

109:                                              ; preds = %104, %105
  %110 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %111 = load i32, i32* %110, align 4
  %112 = add i32 %111, 1
  store i32 %112, i32* %110, align 4
  %113 = load i32*, i32** %100, align 4
  %114 = icmp eq i32* %113, null
  br i1 %114, label %115, label %116

115:                                              ; preds = %109
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %123

116:                                              ; preds = %109
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %117 = sext i8 %98 to i32
  %118 = sub nsw i32 0, %117
  %119 = or i32 %118, -452239360
  %120 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %119) #14, !srcloc !6
  %121 = getelementptr i32, i32* %113, i32 %112
  store i32 %120, i32* %121, align 4
  %122 = load i32, i32* %110, align 4
  br label %123

123:                                              ; preds = %115, %116
  %124 = phi i32 [ %122, %116 ], [ %112, %115 ]
  %125 = add i32 %124, 1
  store i32 %125, i32* %110, align 4
  br label %140

126:                                              ; preds = %97
  br i1 %102, label %127, label %128

127:                                              ; preds = %126
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %136

128:                                              ; preds = %126
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %129 = zext i8 %98 to i32
  %130 = shl nuw nsw i32 %129, 12
  %131 = or i32 %130, -476053504
  %132 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %131) #14, !srcloc !6
  %133 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %134 = load i32, i32* %133, align 4
  %135 = getelementptr i32, i32* %101, i32 %134
  store i32 %132, i32* %135, align 4
  br label %136

136:                                              ; preds = %127, %128
  %137 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %138, 1
  store i32 %139, i32* %137, align 4
  br label %140

140:                                              ; preds = %96, %136, %123, %59
  %141 = load i8, i8* %6, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %141)
  %142 = icmp slt i8 %141, 0
  %143 = getelementptr i8, i8* %32, i32 1
  %144 = load i8, i8* %143, align 1
  br i1 %142, label %145, label %166

145:                                              ; preds = %140
  %146 = sext i8 %141 to i32
  %147 = sub nsw i32 0, %146
  %148 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %149 = load i32*, i32** %148, align 4
  %150 = icmp eq i32* %149, null
  br i1 %150, label %151, label %152

151:                                              ; preds = %145
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %208

152:                                              ; preds = %145
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %153 = shl nuw nsw i32 %147, 4
  %154 = and i32 %153, 3840
  %155 = and i32 %147, 15
  %156 = or i32 %154, %155
  %157 = zext i8 %144 to i32
  %158 = shl nuw nsw i32 %157, 12
  %159 = or i32 %158, 21692656
  %160 = or i32 %156, %159
  %161 = or i32 %160, -536870912
  %162 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %161) #14, !srcloc !6
  %163 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %164 = load i32, i32* %163, align 4
  %165 = getelementptr i32, i32* %149, i32 %164
  store i32 %162, i32* %165, align 4
  br label %208

166:                                              ; preds = %140
  call void @__sanitizer_cov_trace_cmp1(i8 %141, i8 %144)
  %167 = icmp eq i8 %141, %144
  br i1 %167, label %168, label %169

168:                                              ; preds = %166
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %188

169:                                              ; preds = %166
  %170 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %171 = load i32*, i32** %170, align 4
  %172 = icmp eq i32* %171, null
  br i1 %172, label %173, label %174

173:                                              ; preds = %169
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %184

174:                                              ; preds = %169
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %175 = zext i8 %141 to i32
  %176 = shl nuw nsw i32 %175, 12
  %177 = sext i8 %144 to i32
  %178 = or i32 %176, %177
  %179 = or i32 %178, -509607936
  %180 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %179) #14, !srcloc !6
  %181 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %182 = load i32, i32* %181, align 4
  %183 = getelementptr i32, i32* %171, i32 %182
  store i32 %180, i32* %183, align 4
  br label %184

184:                                              ; preds = %173, %174
  %185 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %186 = load i32, i32* %185, align 4
  %187 = add i32 %186, 1
  store i32 %187, i32* %185, align 4
  br label %188

188:                                              ; preds = %168, %184
  %189 = load i8, i8* %1, align 1
  %190 = load i8, i8* %32, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %189, i8 %190)
  %191 = icmp eq i8 %189, %190
  br i1 %191, label %192, label %193

192:                                              ; preds = %188
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %212

193:                                              ; preds = %188
  %194 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %195 = load i32*, i32** %194, align 4
  %196 = icmp eq i32* %195, null
  br i1 %196, label %197, label %198

197:                                              ; preds = %193
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %208

198:                                              ; preds = %193
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %199 = sext i8 %189 to i32
  %200 = shl nsw i32 %199, 12
  %201 = sext i8 %190 to i32
  %202 = or i32 %200, %201
  %203 = or i32 %202, -509607936
  %204 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %203) #14, !srcloc !6
  %205 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %206 = load i32, i32* %205, align 4
  %207 = getelementptr i32, i32* %195, i32 %206
  store i32 %204, i32* %207, align 4
  br label %208

208:                                              ; preds = %197, %151, %198, %152
  %209 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %210 = load i32, i32* %209, align 4
  %211 = add i32 %210, 1
  store i32 %211, i32* %209, align 4
  br label %212

212:                                              ; preds = %192, %208
  ret void
}

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_a32_alu_i(i8 signext %0, i32 %1, %struct.jit_ctx* %2, i8 zeroext %3) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %0)
  %5 = icmp slt i8 %0, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %4
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %24

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %9 = load i32*, i32** %8, align 4
  %10 = icmp eq i32* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %20

12:                                               ; preds = %7
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %13 = sext i8 %0 to i32
  %14 = sub nsw i32 0, %13
  %15 = or i32 %14, -451186688
  %16 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %15) #14, !srcloc !6
  %17 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr i32, i32* %9, i32 %18
  store i32 %16, i32* %19, align 4
  br label %20

20:                                               ; preds = %11, %12
  %21 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %22 = load i32, i32* %21, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %21, align 4
  br label %24

24:                                               ; preds = %6, %20
  %25 = phi i8 [ 7, %20 ], [ %0, %6 ]
  %26 = zext i8 %3 to i32
  %27 = add nsw i32 %26, -96
  %28 = lshr i32 %27, 4
  %29 = shl i32 %27, 28
  %30 = or i32 %28, %29
  %31 = zext i32 %30 to i64
  call void @__sanitizer_cov_trace_switch(i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.13, i32 0, i32 0))
  switch i32 %30, label %32 [
    i32 0, label %33
    i32 1, label %49
    i32 6, label %65
    i32 2, label %81
  ]

32:                                               ; preds = %24
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %101

33:                                               ; preds = %24
  %34 = zext i8 %25 to i32
  %35 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %36 = load i32*, i32** %35, align 4
  %37 = icmp eq i32* %36, null
  br i1 %37, label %38, label %39

38:                                               ; preds = %33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %97

39:                                               ; preds = %33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %40 = shl i32 %1, 7
  %41 = or i32 %40, %34
  %42 = shl nuw nsw i32 %34, 12
  %43 = or i32 %41, %42
  %44 = or i32 %43, -509607936
  %45 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %44) #14, !srcloc !6
  %46 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %47 = load i32, i32* %46, align 4
  %48 = getelementptr i32, i32* %36, i32 %47
  store i32 %45, i32* %48, align 4
  br label %97

49:                                               ; preds = %24
  %50 = zext i8 %25 to i32
  %51 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %52 = load i32*, i32** %51, align 4
  %53 = icmp eq i32* %52, null
  br i1 %53, label %54, label %55

54:                                               ; preds = %49
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %97

55:                                               ; preds = %49
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %56 = shl i32 %1, 7
  %57 = or i32 %56, %50
  %58 = shl nuw nsw i32 %50, 12
  %59 = or i32 %57, %58
  %60 = or i32 %59, -509607904
  %61 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %60) #14, !srcloc !6
  %62 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr i32, i32* %52, i32 %63
  store i32 %61, i32* %64, align 4
  br label %97

65:                                               ; preds = %24
  %66 = zext i8 %25 to i32
  %67 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %68 = load i32*, i32** %67, align 4
  %69 = icmp eq i32* %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %97

71:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %72 = shl i32 %1, 7
  %73 = or i32 %72, %66
  %74 = shl nuw nsw i32 %66, 12
  %75 = or i32 %73, %74
  %76 = or i32 %75, -509607872
  %77 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %76) #14, !srcloc !6
  %78 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %79 = load i32, i32* %78, align 4
  %80 = getelementptr i32, i32* %68, i32 %79
  store i32 %77, i32* %80, align 4
  br label %97

81:                                               ; preds = %24
  %82 = zext i8 %25 to i32
  %83 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %84 = load i32*, i32** %83, align 4
  %85 = icmp eq i32* %84, null
  br i1 %85, label %86, label %87

86:                                               ; preds = %81
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %97

87:                                               ; preds = %81
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %88 = shl nuw nsw i32 %82, 16
  %89 = or i32 %88, %1
  %90 = shl nuw nsw i32 %82, 12
  %91 = or i32 %89, %90
  %92 = or i32 %91, -497025024
  %93 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %92) #14, !srcloc !6
  %94 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %95 = load i32, i32* %94, align 4
  %96 = getelementptr i32, i32* %84, i32 %95
  store i32 %93, i32* %96, align 4
  br label %97

97:                                               ; preds = %86, %70, %54, %38, %87, %71, %55, %39
  %98 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %99 = load i32, i32* %98, align 4
  %100 = add i32 %99, 1
  store i32 %100, i32* %98, align 4
  br label %101

101:                                              ; preds = %32, %97
  br i1 %5, label %102, label %118

102:                                              ; preds = %101
  %103 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %104 = load i32*, i32** %103, align 4
  %105 = icmp eq i32* %104, null
  br i1 %105, label %106, label %107

106:                                              ; preds = %102
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %136

107:                                              ; preds = %102
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %108 = zext i8 %25 to i32
  %109 = shl nuw nsw i32 %108, 12
  %110 = sext i8 %0 to i32
  %111 = sub nsw i32 0, %110
  %112 = or i32 %109, %111
  %113 = or i32 %112, -452263936
  %114 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %113) #14, !srcloc !6
  %115 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %116 = load i32, i32* %115, align 4
  %117 = getelementptr i32, i32* %104, i32 %116
  store i32 %114, i32* %117, align 4
  br label %136

118:                                              ; preds = %101
  call void @__sanitizer_cov_trace_cmp1(i8 %25, i8 %0)
  %119 = icmp eq i8 %25, %0
  br i1 %119, label %120, label %121

120:                                              ; preds = %118
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %140

121:                                              ; preds = %118
  %122 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %123 = load i32*, i32** %122, align 4
  %124 = icmp eq i32* %123, null
  br i1 %124, label %125, label %126

125:                                              ; preds = %121
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %136

126:                                              ; preds = %121
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %127 = zext i8 %0 to i32
  %128 = shl nuw nsw i32 %127, 12
  %129 = zext i8 %25 to i32
  %130 = or i32 %128, %129
  %131 = or i32 %130, -509607936
  %132 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %131) #14, !srcloc !6
  %133 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %134 = load i32, i32* %133, align 4
  %135 = getelementptr i32, i32* %123, i32 %134
  store i32 %132, i32* %135, align 4
  br label %136

136:                                              ; preds = %125, %106, %126, %107
  %137 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %138, 1
  store i32 %139, i32* %137, align 4
  br label %140

140:                                              ; preds = %120, %136
  ret void
}

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_a32_mul_r64(i8* nocapture readonly %0, i8* nocapture readonly %1, %struct.jit_ctx* %2) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %4 = getelementptr i8, i8* %0, i32 1
  %5 = load i8, i8* %4, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %5)
  %6 = icmp slt i8 %5, 0
  br i1 %6, label %8, label %7

7:                                                ; preds = %3
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %29

8:                                                ; preds = %3
  %9 = sext i8 %5 to i32
  %10 = sub nsw i32 0, %9
  %11 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %12 = load i32*, i32** %11, align 4
  %13 = icmp eq i32* %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %25

15:                                               ; preds = %8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %16 = shl nuw nsw i32 %10, 4
  %17 = and i32 %16, 3840
  %18 = and i32 %10, 15
  %19 = or i32 %17, %18
  %20 = or i32 %19, -515153712
  %21 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %20) #14, !srcloc !6
  %22 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr i32, i32* %12, i32 %23
  store i32 %21, i32* %24, align 4
  br label %25

25:                                               ; preds = %14, %15
  %26 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %27 = load i32, i32* %26, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %26, align 4
  br label %29

29:                                               ; preds = %7, %25
  %30 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), %25 ], [ %0, %7 ]
  %31 = getelementptr i8, i8* %1, i32 1
  %32 = load i8, i8* %31, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %32)
  %33 = icmp slt i8 %32, 0
  br i1 %33, label %35, label %34

34:                                               ; preds = %29
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %56

35:                                               ; preds = %29
  %36 = sext i8 %32 to i32
  %37 = sub nsw i32 0, %36
  %38 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %39 = load i32*, i32** %38, align 4
  %40 = icmp eq i32* %39, null
  br i1 %40, label %41, label %42

41:                                               ; preds = %35
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %52

42:                                               ; preds = %35
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %43 = shl nuw nsw i32 %37, 4
  %44 = and i32 %43, 3840
  %45 = and i32 %37, 15
  %46 = or i32 %44, %45
  %47 = or i32 %46, -515145520
  %48 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %47) #14, !srcloc !6
  %49 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %50 = load i32, i32* %49, align 4
  %51 = getelementptr i32, i32* %39, i32 %50
  store i32 %48, i32* %51, align 4
  br label %52

52:                                               ; preds = %41, %42
  %53 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %53, align 4
  br label %56

56:                                               ; preds = %34, %52
  %57 = phi i8* [ getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 13, i32 0), %52 ], [ %1, %34 ]
  %58 = getelementptr i8, i8* %30, i32 1
  %59 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %60 = load i32*, i32** %59, align 4
  %61 = icmp eq i32* %60, null
  br i1 %61, label %62, label %63

62:                                               ; preds = %56
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %75

63:                                               ; preds = %56
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %64 = load i8, i8* %58, align 1
  %65 = sext i8 %64 to i32
  %66 = shl nsw i32 %65, 8
  %67 = load i8, i8* %57, align 1
  %68 = sext i8 %67 to i32
  %69 = or i32 %66, %68
  %70 = or i32 %69, -536084336
  %71 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %70) #14, !srcloc !6
  %72 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %73 = load i32, i32* %72, align 4
  %74 = getelementptr i32, i32* %60, i32 %73
  store i32 %71, i32* %74, align 4
  br label %75

75:                                               ; preds = %62, %63
  %76 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %77 = load i32, i32* %76, align 4
  %78 = add i32 %77, 1
  store i32 %78, i32* %76, align 4
  %79 = getelementptr i8, i8* %57, i32 1
  %80 = load i32*, i32** %59, align 4
  %81 = icmp eq i32* %80, null
  br i1 %81, label %82, label %84

82:                                               ; preds = %75
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %83 = add i32 %77, 2
  store i32 %83, i32* %76, align 4
  br label %102

84:                                               ; preds = %75
  %85 = load i8, i8* %30, align 1
  %86 = sext i8 %85 to i32
  %87 = shl nsw i32 %86, 8
  %88 = load i8, i8* %79, align 1
  %89 = sext i8 %88 to i32
  %90 = or i32 %87, %89
  %91 = or i32 %90, -535953264
  %92 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %91) #14, !srcloc !6
  %93 = getelementptr i32, i32* %80, i32 %78
  store i32 %92, i32* %93, align 4
  %94 = load i32*, i32** %59, align 4
  %95 = load i32, i32* %76, align 4
  %96 = add i32 %95, 1
  store i32 %96, i32* %76, align 4
  %97 = icmp eq i32* %94, null
  br i1 %97, label %98, label %99

98:                                               ; preds = %84
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %102

99:                                               ; preds = %84
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %100 = getelementptr i32, i32* %94, i32 %96
  store i32 249597152, i32* %100, align 4
  %101 = load i32, i32* %76, align 4
  br label %102

102:                                              ; preds = %98, %82, %99
  %103 = phi i32 [ %83, %82 ], [ %96, %98 ], [ %101, %99 ]
  %104 = add i32 %103, 1
  store i32 %104, i32* %76, align 4
  %105 = load i32*, i32** %59, align 4
  %106 = icmp eq i32* %105, null
  br i1 %106, label %107, label %108

107:                                              ; preds = %102
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %123

108:                                              ; preds = %102
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %109 = load i8, i8* %79, align 1
  %110 = sext i8 %109 to i32
  %111 = shl nsw i32 %110, 8
  %112 = load i8, i8* %30, align 1
  %113 = sext i8 %112 to i32
  %114 = shl nsw i32 %113, 16
  %115 = or i32 %111, %114
  %116 = load i8, i8* %58, align 1
  %117 = sext i8 %116 to i32
  %118 = or i32 %115, %117
  %119 = or i32 %118, -528433008
  %120 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %119) #14, !srcloc !6
  %121 = getelementptr i32, i32* %105, i32 %104
  store i32 %120, i32* %121, align 4
  %122 = load i32, i32* %76, align 4
  br label %123

123:                                              ; preds = %107, %108
  %124 = phi i32 [ %104, %107 ], [ %122, %108 ]
  %125 = add i32 %124, 1
  store i32 %125, i32* %76, align 4
  %126 = load i8, i8* %30, align 1
  %127 = sext i8 %126 to i32
  %128 = load i32*, i32** %59, align 4
  %129 = icmp eq i32* %128, null
  br i1 %129, label %130, label %131

130:                                              ; preds = %123
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %138

131:                                              ; preds = %123
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %132 = shl nsw i32 %127, 12
  %133 = or i32 %132, %127
  %134 = or i32 %133, -527564800
  %135 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %134) #14, !srcloc !6
  %136 = getelementptr i32, i32* %128, i32 %125
  store i32 %135, i32* %136, align 4
  %137 = load i32, i32* %76, align 4
  br label %138

138:                                              ; preds = %130, %131
  %139 = phi i32 [ %125, %130 ], [ %137, %131 ]
  %140 = add i32 %139, 1
  store i32 %140, i32* %76, align 4
  %141 = load i8, i8* %4, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %141)
  %142 = icmp slt i8 %141, 0
  br i1 %142, label %143, label %157

143:                                              ; preds = %138
  %144 = load i32*, i32** %59, align 4
  %145 = icmp eq i32* %144, null
  br i1 %145, label %146, label %147

146:                                              ; preds = %143
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %154

147:                                              ; preds = %143
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %148 = sext i8 %141 to i32
  %149 = sub nsw i32 0, %148
  %150 = or i32 %149, -452214784
  %151 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %150) #14, !srcloc !6
  %152 = getelementptr i32, i32* %144, i32 %140
  store i32 %151, i32* %152, align 4
  %153 = load i32, i32* %76, align 4
  br label %154

154:                                              ; preds = %146, %147
  %155 = phi i32 [ %140, %146 ], [ %153, %147 ]
  %156 = add i32 %155, 1
  br label %174

157:                                              ; preds = %138
  call void @__sanitizer_cov_trace_const_cmp1(i8 12, i8 %141)
  %158 = icmp eq i8 %141, 12
  br i1 %158, label %159, label %160

159:                                              ; preds = %157
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %176

160:                                              ; preds = %157
  %161 = load i32*, i32** %59, align 4
  %162 = icmp eq i32* %161, null
  br i1 %162, label %163, label %164

163:                                              ; preds = %160
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %171

164:                                              ; preds = %160
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %165 = zext i8 %141 to i32
  %166 = shl nuw nsw i32 %165, 12
  %167 = or i32 %166, -509607924
  %168 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %167) #14, !srcloc !6
  %169 = getelementptr i32, i32* %161, i32 %140
  store i32 %168, i32* %169, align 4
  %170 = load i32, i32* %76, align 4
  br label %171

171:                                              ; preds = %163, %164
  %172 = phi i32 [ %170, %164 ], [ %140, %163 ]
  %173 = add i32 %172, 1
  br label %174

174:                                              ; preds = %171, %154
  %175 = phi i32 [ %156, %154 ], [ %173, %171 ]
  store i32 %175, i32* %76, align 4
  br label %176

176:                                              ; preds = %159, %174
  %177 = phi i32 [ %140, %159 ], [ %175, %174 ]
  %178 = load i8, i8* %0, align 1
  %179 = load i8, i8* %30, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %178)
  %180 = icmp slt i8 %178, 0
  br i1 %180, label %181, label %195

181:                                              ; preds = %176
  %182 = load i32*, i32** %59, align 4
  %183 = icmp eq i32* %182, null
  br i1 %183, label %184, label %185

184:                                              ; preds = %181
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %211

185:                                              ; preds = %181
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %186 = zext i8 %179 to i32
  %187 = shl nuw nsw i32 %186, 12
  %188 = sext i8 %178 to i32
  %189 = sub nsw i32 0, %188
  %190 = or i32 %187, %189
  %191 = or i32 %190, -452263936
  %192 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %191) #14, !srcloc !6
  %193 = getelementptr i32, i32* %182, i32 %177
  store i32 %192, i32* %193, align 4
  %194 = load i32, i32* %76, align 4
  br label %211

195:                                              ; preds = %176
  call void @__sanitizer_cov_trace_cmp1(i8 %178, i8 %179)
  %196 = icmp eq i8 %178, %179
  br i1 %196, label %197, label %198

197:                                              ; preds = %195
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %214

198:                                              ; preds = %195
  %199 = load i32*, i32** %59, align 4
  %200 = icmp eq i32* %199, null
  br i1 %200, label %201, label %202

201:                                              ; preds = %198
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %211

202:                                              ; preds = %198
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %203 = zext i8 %178 to i32
  %204 = shl nuw nsw i32 %203, 12
  %205 = sext i8 %179 to i32
  %206 = or i32 %204, %205
  %207 = or i32 %206, -509607936
  %208 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %207) #14, !srcloc !6
  %209 = getelementptr i32, i32* %199, i32 %177
  store i32 %208, i32* %209, align 4
  %210 = load i32, i32* %76, align 4
  br label %211

211:                                              ; preds = %201, %184, %202, %185
  %212 = phi i32 [ %177, %184 ], [ %194, %185 ], [ %210, %202 ], [ %177, %201 ]
  %213 = add i32 %212, 1
  store i32 %213, i32* %76, align 4
  br label %214

214:                                              ; preds = %197, %211
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
define internal fastcc void @emit_a32_mov_i64(i8* nocapture readonly %0, i64 %1, %struct.jit_ctx* nocapture %2) unnamed_addr #1 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %4 = getelementptr i8, i8* %0, i32 1
  %5 = load i8, i8* %4, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %5)
  %6 = icmp slt i8 %5, 0
  %7 = select i1 %6, i8* getelementptr inbounds ([15 x [2 x i8]], [15 x [2 x i8]]* @bpf2a32, i32 0, i32 12, i32 0), i8* %0
  %8 = getelementptr i8, i8* %7, i32 1
  %9 = load i8, i8* %8, align 1
  %10 = trunc i64 %1 to i32
  tail call fastcc void @emit_mov_i(i8 zeroext %9, i32 %10, %struct.jit_ctx* %2)
  %11 = load i8, i8* %7, align 1
  %12 = lshr i64 %1, 32
  %13 = trunc i64 %12 to i32
  tail call fastcc void @emit_mov_i(i8 zeroext %11, i32 %13, %struct.jit_ctx* %2)
  %14 = load i8, i8* %4, align 1
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %14)
  %15 = icmp slt i8 %14, 0
  %16 = load i8, i8* %8, align 1
  br i1 %15, label %17, label %38

17:                                               ; preds = %3
  %18 = sext i8 %14 to i32
  %19 = sub nsw i32 0, %18
  %20 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %21 = load i32*, i32** %20, align 4
  %22 = icmp eq i32* %21, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %17
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %80

24:                                               ; preds = %17
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %25 = shl nuw nsw i32 %19, 4
  %26 = and i32 %25, 3840
  %27 = and i32 %19, 15
  %28 = or i32 %26, %27
  %29 = zext i8 %16 to i32
  %30 = shl nuw nsw i32 %29, 12
  %31 = or i32 %30, 21692656
  %32 = or i32 %28, %31
  %33 = or i32 %32, -536870912
  %34 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %33) #14, !srcloc !6
  %35 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %36 = load i32, i32* %35, align 4
  %37 = getelementptr i32, i32* %21, i32 %36
  store i32 %34, i32* %37, align 4
  br label %80

38:                                               ; preds = %3
  call void @__sanitizer_cov_trace_cmp1(i8 %14, i8 %16)
  %39 = icmp eq i8 %14, %16
  br i1 %39, label %40, label %41

40:                                               ; preds = %38
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %60

41:                                               ; preds = %38
  %42 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %43 = load i32*, i32** %42, align 4
  %44 = icmp eq i32* %43, null
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %56

46:                                               ; preds = %41
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %47 = zext i8 %14 to i32
  %48 = shl nuw nsw i32 %47, 12
  %49 = sext i8 %16 to i32
  %50 = or i32 %48, %49
  %51 = or i32 %50, -509607936
  %52 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %51) #14, !srcloc !6
  %53 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = getelementptr i32, i32* %43, i32 %54
  store i32 %52, i32* %55, align 4
  br label %56

56:                                               ; preds = %45, %46
  %57 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %57, align 4
  br label %60

60:                                               ; preds = %40, %56
  %61 = load i8, i8* %0, align 1
  %62 = load i8, i8* %7, align 1
  call void @__sanitizer_cov_trace_cmp1(i8 %61, i8 %62)
  %63 = icmp eq i8 %61, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %60
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %84

65:                                               ; preds = %60
  %66 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %67 = load i32*, i32** %66, align 4
  %68 = icmp eq i32* %67, null
  br i1 %68, label %69, label %70

69:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %80

70:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %71 = sext i8 %61 to i32
  %72 = shl nsw i32 %71, 12
  %73 = sext i8 %62 to i32
  %74 = or i32 %72, %73
  %75 = or i32 %74, -509607936
  %76 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %75) #14, !srcloc !6
  %77 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %78 = load i32, i32* %77, align 4
  %79 = getelementptr i32, i32* %67, i32 %78
  store i32 %76, i32* %79, align 4
  br label %80

80:                                               ; preds = %69, %23, %70, %24
  %81 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %82 = load i32, i32* %81, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %81, align 4
  br label %84

84:                                               ; preds = %64, %80
  ret void
}

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_str_r(i8 signext %0, i8* nocapture readonly %1, i16 signext %2, %struct.jit_ctx* %3, i8 zeroext %4) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %0)
  %6 = icmp slt i8 %0, 0
  br i1 %6, label %8, label %7

7:                                                ; preds = %5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %25

8:                                                ; preds = %5
  %9 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %10 = load i32*, i32** %9, align 4
  %11 = icmp eq i32* %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %21

13:                                               ; preds = %8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %14 = sext i8 %0 to i32
  %15 = sub nsw i32 0, %14
  %16 = or i32 %15, -451190784
  %17 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %16) #14, !srcloc !6
  %18 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr i32, i32* %10, i32 %19
  store i32 %17, i32* %20, align 4
  br label %21

21:                                               ; preds = %12, %13
  %22 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %22, align 4
  br label %25

25:                                               ; preds = %7, %21
  %26 = phi i8 [ 6, %21 ], [ %0, %7 ]
  %27 = zext i8 %4 to i32
  %28 = lshr i32 %27, 3
  %29 = shl i32 %27, 29
  %30 = or i32 %28, %29
  call void @__sanitizer_cov_trace_const_cmp4(i32 4, i32 %30)
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %33, label %32

32:                                               ; preds = %25
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %36

33:                                               ; preds = %25
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %34 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.emit_str_r, i32 0, i32 %30
  %35 = load i32, i32* %34, align 4
  br label %36

36:                                               ; preds = %32, %33
  %37 = phi i32 [ 0, %32 ], [ %35, %33 ]
  %38 = sub nsw i32 0, %37
  %39 = sext i16 %2 to i32
  call void @__sanitizer_cov_trace_cmp4(i32 %38, i32 %39)
  %40 = icmp sle i32 %38, %39
  call void @__sanitizer_cov_trace_cmp4(i32 %37, i32 %39)
  %41 = icmp sge i32 %37, %39
  %42 = and i1 %41, %40
  br i1 %42, label %43, label %44

43:                                               ; preds = %36
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %60

44:                                               ; preds = %36
  tail call fastcc void @emit_mov_i(i8 zeroext 7, i32 %39, %struct.jit_ctx* %3) #12
  %45 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %46 = load i32*, i32** %45, align 4
  %47 = icmp eq i32* %46, null
  br i1 %47, label %48, label %49

48:                                               ; preds = %44
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %56

49:                                               ; preds = %44
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %50 = zext i8 %26 to i32
  %51 = or i32 %50, -527994880
  %52 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %51) #14, !srcloc !6
  %53 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = getelementptr i32, i32* %46, i32 %54
  store i32 %52, i32* %55, align 4
  br label %56

56:                                               ; preds = %48, %49
  %57 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %57, align 4
  br label %60

60:                                               ; preds = %43, %56
  %61 = phi i16 [ %2, %43 ], [ 0, %56 ]
  %62 = phi i8 [ %26, %43 ], [ 7, %56 ]
  %63 = zext i32 %30 to i64
  call void @__sanitizer_cov_trace_switch(i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.14, i32 0, i32 0))
  switch i32 %30, label %64 [
    i32 2, label %65
    i32 1, label %93
    i32 0, label %124
    i32 3, label %152
  ]

64:                                               ; preds = %60
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %209

65:                                               ; preds = %60
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %61)
  %66 = icmp sgt i16 %61, -1
  %67 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %68 = load i32*, i32** %67, align 4
  %69 = icmp eq i32* %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %91

71:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %72 = zext i8 %62 to i32
  %73 = shl nuw nsw i32 %72, 16
  %74 = select i1 %66, i32 96468992, i32 88080384
  %75 = or i32 %73, %74
  %76 = getelementptr i8, i8* %1, i32 1
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl nuw nsw i32 %78, 12
  %80 = or i32 %75, %79
  %81 = sub i16 0, %61
  %82 = select i1 %66, i16 %61, i16 %81
  %83 = and i16 %82, 4095
  %84 = zext i16 %83 to i32
  %85 = or i32 %80, %84
  %86 = or i32 %85, -536870912
  %87 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %86) #14, !srcloc !6
  %88 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %89 = load i32, i32* %88, align 4
  %90 = getelementptr i32, i32* %68, i32 %89
  store i32 %87, i32* %90, align 4
  br label %91

91:                                               ; preds = %70, %71
  %92 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  br label %202

93:                                               ; preds = %60
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %61)
  %94 = icmp sgt i16 %61, -1
  %95 = sub i16 0, %61
  %96 = select i1 %94, i16 %61, i16 %95
  %97 = sext i16 %96 to i32
  %98 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %99 = load i32*, i32** %98, align 4
  %100 = icmp eq i32* %99, null
  br i1 %100, label %101, label %102

101:                                              ; preds = %93
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %122

102:                                              ; preds = %93
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %103 = shl nsw i32 %97, 4
  %104 = and i32 %103, 3840
  %105 = and i32 %97, 15
  %106 = or i32 %104, %105
  %107 = zext i8 %62 to i32
  %108 = shl nuw nsw i32 %107, 16
  %109 = select i1 %94, i32 29360304, i32 20971696
  %110 = or i32 %108, %109
  %111 = getelementptr i8, i8* %1, i32 1
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = shl nuw nsw i32 %113, 12
  %115 = or i32 %110, %114
  %116 = or i32 %106, %115
  %117 = or i32 %116, -536870912
  %118 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %117) #14, !srcloc !6
  %119 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %120 = load i32, i32* %119, align 4
  %121 = getelementptr i32, i32* %99, i32 %120
  store i32 %118, i32* %121, align 4
  br label %122

122:                                              ; preds = %101, %102
  %123 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  br label %202

124:                                              ; preds = %60
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %61)
  %125 = icmp sgt i16 %61, -1
  %126 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %127 = load i32*, i32** %126, align 4
  %128 = icmp eq i32* %127, null
  br i1 %128, label %129, label %130

129:                                              ; preds = %124
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %150

130:                                              ; preds = %124
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %131 = zext i8 %62 to i32
  %132 = shl nuw nsw i32 %131, 16
  %133 = select i1 %125, i32 92274688, i32 83886080
  %134 = or i32 %132, %133
  %135 = getelementptr i8, i8* %1, i32 1
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = shl nuw nsw i32 %137, 12
  %139 = or i32 %134, %138
  %140 = sub i16 0, %61
  %141 = select i1 %125, i16 %61, i16 %140
  %142 = and i16 %141, 4095
  %143 = zext i16 %142 to i32
  %144 = or i32 %139, %143
  %145 = or i32 %144, -536870912
  %146 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %145) #14, !srcloc !6
  %147 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %148 = load i32, i32* %147, align 4
  %149 = getelementptr i32, i32* %127, i32 %148
  store i32 %146, i32* %149, align 4
  br label %150

150:                                              ; preds = %129, %130
  %151 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  br label %202

152:                                              ; preds = %60
  %153 = zext i8 %62 to i32
  %154 = shl nuw nsw i32 %153, 16
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %61)
  %155 = icmp sgt i16 %61, -1
  %156 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 7
  %157 = load i32*, i32** %156, align 4
  %158 = icmp eq i32* %157, null
  br i1 %158, label %159, label %160

159:                                              ; preds = %152
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %178

160:                                              ; preds = %152
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %161 = select i1 %155, i32 92274688, i32 83886080
  %162 = or i32 %154, %161
  %163 = getelementptr i8, i8* %1, i32 1
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = shl nuw nsw i32 %165, 12
  %167 = or i32 %162, %166
  %168 = sub i16 0, %61
  %169 = select i1 %155, i16 %61, i16 %168
  %170 = and i16 %169, 4095
  %171 = zext i16 %170 to i32
  %172 = or i32 %167, %171
  %173 = or i32 %172, -536870912
  %174 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %173) #14, !srcloc !6
  %175 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %176 = load i32, i32* %175, align 4
  %177 = getelementptr i32, i32* %157, i32 %176
  store i32 %174, i32* %177, align 4
  br label %178

178:                                              ; preds = %159, %160
  %179 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %3, i32 0, i32 1
  %180 = load i32, i32* %179, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* %179, align 4
  %182 = add i16 %61, 4
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %182)
  %183 = icmp sgt i16 %182, -1
  %184 = load i32*, i32** %156, align 4
  %185 = icmp eq i32* %184, null
  br i1 %185, label %186, label %187

186:                                              ; preds = %178
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %205

187:                                              ; preds = %178
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %188 = select i1 %183, i32 92274688, i32 83886080
  %189 = or i32 %188, %154
  %190 = load i8, i8* %1, align 1
  %191 = zext i8 %190 to i32
  %192 = shl nuw nsw i32 %191, 12
  %193 = or i32 %189, %192
  %194 = sub i16 4092, %61
  %195 = select i1 %183, i16 %182, i16 %194
  %196 = and i16 %195, 4095
  %197 = zext i16 %196 to i32
  %198 = or i32 %193, %197
  %199 = or i32 %198, -536870912
  %200 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %199) #14, !srcloc !6
  %201 = getelementptr i32, i32* %184, i32 %181
  store i32 %200, i32* %201, align 4
  br label %202

202:                                              ; preds = %150, %122, %91, %187
  %203 = phi i32* [ %179, %187 ], [ %92, %91 ], [ %123, %122 ], [ %151, %150 ]
  %204 = load i32, i32* %203, align 4
  br label %205

205:                                              ; preds = %186, %202
  %206 = phi i32 [ %181, %186 ], [ %204, %202 ]
  %207 = phi i32* [ %179, %186 ], [ %203, %202 ]
  %208 = add i32 %206, 1
  store i32 %208, i32* %207, align 4
  br label %209

209:                                              ; preds = %64, %205
  ret void
}

; Function Attrs: cold
declare dso_local i32 @printk(i8*, ...) local_unnamed_addr #10

declare dso_local i64 @__bpf_call_base(i64, i64, i64, i64, i64) #3

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_mov_i(i8 zeroext %0, i32 %1, %struct.jit_ctx* nocapture %2) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__sanitizer_cov_trace_const_cmp4(i32 256, i32 %1)
  %4 = icmp ult i32 %1, 256
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

6:                                                ; preds = %73, %68, %64, %60, %56, %52, %48, %44, %40, %36, %32, %28, %24, %20, %16, %5
  %7 = phi i32 [ 0, %5 ], [ 256, %16 ], [ 512, %20 ], [ 768, %24 ], [ 1024, %28 ], [ 1280, %32 ], [ 1536, %36 ], [ 1792, %40 ], [ 2048, %44 ], [ 2304, %48 ], [ 2560, %52 ], [ 2816, %56 ], [ 3072, %60 ], [ 3328, %64 ], [ 3584, %68 ], [ 3840, %73 ]
  %8 = phi i32 [ 0, %5 ], [ 2, %16 ], [ 4, %20 ], [ 6, %24 ], [ 8, %28 ], [ 10, %32 ], [ 12, %36 ], [ 14, %40 ], [ 16, %44 ], [ 18, %48 ], [ 20, %52 ], [ 22, %56 ], [ 24, %60 ], [ 26, %64 ], [ 28, %68 ], [ 30, %73 ]
  %9 = tail call i32 @llvm.fshl.i32(i32 %1, i32 %1, i32 %8) #12
  %10 = or i32 %9, %7
  call void @__sanitizer_cov_trace_const_cmp4(i32 -1, i32 %10)
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %74, label %12

12:                                               ; preds = %6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %88

13:                                               ; preds = %3
  %14 = and i32 %1, 1073741760
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %14)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

17:                                               ; preds = %13
  %18 = and i32 %1, 268435440
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %18)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

21:                                               ; preds = %17
  %22 = and i32 %1, 67108860
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %22)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

25:                                               ; preds = %21
  %26 = and i32 %1, 16777215
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %26)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

29:                                               ; preds = %25
  %30 = and i32 %1, -1069547521
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %30)
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

33:                                               ; preds = %29
  %34 = and i32 %1, -267386881
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %34)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

37:                                               ; preds = %33
  %38 = and i32 %1, -66846721
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %38)
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

41:                                               ; preds = %37
  %42 = and i32 %1, -16711681
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %42)
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %41
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

45:                                               ; preds = %41
  %46 = and i32 %1, -4177921
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %46)
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %45
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

49:                                               ; preds = %45
  %50 = and i32 %1, -1044481
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %50)
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %49
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

53:                                               ; preds = %49
  %54 = and i32 %1, -261121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %54)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %53
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

57:                                               ; preds = %53
  %58 = and i32 %1, -65281
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %58)
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %61

60:                                               ; preds = %57
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

61:                                               ; preds = %57
  %62 = and i32 %1, -16321
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %62)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

65:                                               ; preds = %61
  %66 = and i32 %1, -4081
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %66)
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

69:                                               ; preds = %65
  %70 = and i32 %1, -1021
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %70)
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %73, label %72

72:                                               ; preds = %69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %88

73:                                               ; preds = %69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %6

74:                                               ; preds = %6
  %75 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %76 = load i32*, i32** %75, align 4
  %77 = icmp eq i32* %76, null
  br i1 %77, label %78, label %79

78:                                               ; preds = %74
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %180

79:                                               ; preds = %74
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %80 = zext i8 %0 to i32
  %81 = shl nuw nsw i32 %80, 12
  %82 = or i32 %10, %81
  %83 = or i32 %82, -476053504
  %84 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %83) #14, !srcloc !6
  %85 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %86 = load i32, i32* %85, align 4
  %87 = getelementptr i32, i32* %76, i32 %86
  store i32 %84, i32* %87, align 4
  br label %180

88:                                               ; preds = %72, %12
  %89 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 7
  %90 = load i32*, i32** %89, align 4
  %91 = icmp eq i32* %90, null
  %92 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 10
  %93 = load i16, i16* %92, align 2
  br i1 %91, label %101, label %94

94:                                               ; preds = %88
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %93)
  %95 = icmp eq i16 %93, 0
  %96 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 11
  %97 = load i32*, i32** %96, align 4
  br i1 %95, label %98, label %99

98:                                               ; preds = %94
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %116

99:                                               ; preds = %94
  %100 = zext i16 %93 to i32
  br label %103

101:                                              ; preds = %88
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %102 = add i16 %93, 1
  store i16 %102, i16* %92, align 2
  br label %159

103:                                              ; preds = %114, %99
  %104 = phi i32 [ 0, %99 ], [ %112, %114 ]
  %105 = getelementptr i32, i32* %97, i32 %104
  %106 = load i32, i32* %105, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %106)
  %107 = icmp eq i32 %106, 0
  call void @__sanitizer_cov_trace_cmp4(i32 %106, i32 %1)
  %108 = icmp eq i32 %106, %1
  %109 = or i1 %107, %108
  br i1 %109, label %110, label %111

110:                                              ; preds = %103
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %116

111:                                              ; preds = %103
  %112 = add nuw nsw i32 %104, 1
  %113 = icmp eq i32 %112, %100
  br i1 %113, label %115, label %114

114:                                              ; preds = %111
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %103

115:                                              ; preds = %111
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %116

116:                                              ; preds = %115, %110, %98
  %117 = phi i32 [ 0, %98 ], [ %104, %110 ], [ %100, %115 ]
  %118 = getelementptr i32, i32* %97, i32 %117
  %119 = load i32, i32* %118, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %119)
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %122, label %121

121:                                              ; preds = %116
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %124

122:                                              ; preds = %116
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i32 %1, i32* %118, align 4
  %123 = load i32*, i32** %89, align 4
  br label %124

124:                                              ; preds = %121, %122
  %125 = phi i32* [ %123, %122 ], [ %90, %121 ]
  %126 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 6
  %127 = load i32*, i32** %126, align 4
  %128 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 0
  %129 = load %struct.bpf_prog*, %struct.bpf_prog** %128, align 4
  %130 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %129, i32 0, i32 4
  %131 = load i32, i32* %130, align 4
  %132 = add i32 %131, -1
  %133 = getelementptr i32, i32* %127, i32 %132
  %134 = load i32, i32* %133, align 4
  %135 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 2
  %136 = load i32, i32* %135, align 4
  %137 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 9
  %138 = load i16, i16* %137, align 4
  %139 = zext i16 %138 to i32
  %140 = add i32 %134, %117
  %141 = shl i32 %140, 2
  %142 = add i32 %141, %136
  %143 = add i32 %142, %139
  %144 = lshr i32 %143, 2
  %145 = getelementptr i32, i32* %125, i32 %144
  store i32 %1, i32* %145, align 4
  %146 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %147 = load i32, i32* %146, align 4
  %148 = mul i32 %147, -4
  %149 = add i32 %143, -8
  %150 = add i32 %149, %148
  %151 = and i32 %150, 61440
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %151)
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %157, label %153

153:                                              ; preds = %124
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %154 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 5
  %155 = load i32, i32* %154, align 4
  %156 = or i32 %155, 1
  store i32 %156, i32* %154, align 4
  br label %159

157:                                              ; preds = %124
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %158 = trunc i32 %150 to i16
  br label %159

159:                                              ; preds = %157, %153, %101
  %160 = phi i16 [ 0, %101 ], [ 0, %153 ], [ %158, %157 ]
  call void @__sanitizer_cov_trace_const_cmp2(i16 -1, i16 %160)
  %161 = icmp sgt i16 %160, -1
  %162 = load i32*, i32** %89, align 4
  %163 = icmp eq i32* %162, null
  br i1 %163, label %164, label %165

164:                                              ; preds = %159
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %180

165:                                              ; preds = %159
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %166 = select i1 %161, i32 94306304, i32 85917696
  %167 = zext i8 %0 to i32
  %168 = shl nuw nsw i32 %167, 12
  %169 = or i32 %166, %168
  %170 = sub i16 0, %160
  %171 = select i1 %161, i16 %160, i16 %170
  %172 = and i16 %171, 4095
  %173 = zext i16 %172 to i32
  %174 = or i32 %169, %173
  %175 = or i32 %174, -536870912
  %176 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %175) #14, !srcloc !6
  %177 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %178 = load i32, i32* %177, align 4
  %179 = getelementptr i32, i32* %162, i32 %178
  store i32 %176, i32* %179, align 4
  br label %180

180:                                              ; preds = %164, %78, %165, %79
  %181 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %2, i32 0, i32 1
  %182 = load i32, i32* %181, align 4
  %183 = add i32 %182, 1
  store i32 %183, i32* %181, align 4
  ret void
}

; Function Attrs: inlinehint nounwind sspstrong uwtable
define internal fastcc void @emit_alu_r(i8 zeroext %0, i8 zeroext %1, i1 zeroext %2, i8 zeroext %3, %struct.jit_ctx* %4) unnamed_addr #6 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %6 = lshr i8 %3, 4
  %7 = zext i8 %6 to i32
  %8 = zext i32 %7 to i64
  call void @__sanitizer_cov_trace_switch(i64 %8, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__sancov_gen_cov_switch_values.15, i32 0, i32 0))
  switch i32 %7, label %9 [
    i32 0, label %10
    i32 1, label %36
    i32 4, label %62
    i32 5, label %79
    i32 10, label %96
    i32 2, label %113
    i32 6, label %130
    i32 7, label %147
    i32 12, label %164
  ]

9:                                                ; preds = %5
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %185

10:                                               ; preds = %5
  %11 = zext i8 %0 to i32
  %12 = shl nuw nsw i32 %11, 12
  %13 = shl nuw nsw i32 %11, 16
  %14 = or i32 %12, %13
  %15 = zext i8 %1 to i32
  %16 = or i32 %14, %15
  %17 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %18 = load i32*, i32** %17, align 4
  %19 = icmp eq i32* %18, null
  br i1 %2, label %28, label %20

20:                                               ; preds = %10
  br i1 %19, label %21, label %22

21:                                               ; preds = %20
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

22:                                               ; preds = %20
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %23 = or i32 %16, -527433728
  %24 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %23) #14, !srcloc !6
  %25 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr i32, i32* %18, i32 %26
  store i32 %24, i32* %27, align 4
  br label %181

28:                                               ; preds = %10
  br i1 %19, label %29, label %30

29:                                               ; preds = %28
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

30:                                               ; preds = %28
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %31 = or i32 %16, -526385152
  %32 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %31) #14, !srcloc !6
  %33 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %34 = load i32, i32* %33, align 4
  %35 = getelementptr i32, i32* %18, i32 %34
  store i32 %32, i32* %35, align 4
  br label %181

36:                                               ; preds = %5
  %37 = zext i8 %0 to i32
  %38 = shl nuw nsw i32 %37, 12
  %39 = shl nuw nsw i32 %37, 16
  %40 = or i32 %38, %39
  %41 = zext i8 %1 to i32
  %42 = or i32 %40, %41
  %43 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %44 = load i32*, i32** %43, align 4
  %45 = icmp eq i32* %44, null
  br i1 %2, label %54, label %46

46:                                               ; preds = %36
  br i1 %45, label %47, label %48

47:                                               ; preds = %46
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

48:                                               ; preds = %46
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %49 = or i32 %42, -531628032
  %50 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %49) #14, !srcloc !6
  %51 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %52 = load i32, i32* %51, align 4
  %53 = getelementptr i32, i32* %44, i32 %52
  store i32 %50, i32* %53, align 4
  br label %181

54:                                               ; preds = %36
  br i1 %45, label %55, label %56

55:                                               ; preds = %54
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

56:                                               ; preds = %54
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %57 = or i32 %42, -524288000
  %58 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %57) #14, !srcloc !6
  %59 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %60 = load i32, i32* %59, align 4
  %61 = getelementptr i32, i32* %44, i32 %60
  store i32 %58, i32* %61, align 4
  br label %181

62:                                               ; preds = %5
  %63 = zext i8 %0 to i32
  %64 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %65 = load i32*, i32** %64, align 4
  %66 = icmp eq i32* %65, null
  br i1 %66, label %67, label %68

67:                                               ; preds = %62
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

68:                                               ; preds = %62
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %69 = shl nuw nsw i32 %63, 12
  %70 = shl nuw nsw i32 %63, 16
  %71 = or i32 %69, %70
  %72 = zext i8 %1 to i32
  %73 = or i32 %71, %72
  %74 = or i32 %73, -511705088
  %75 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %74) #14, !srcloc !6
  %76 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %77 = load i32, i32* %76, align 4
  %78 = getelementptr i32, i32* %65, i32 %77
  store i32 %75, i32* %78, align 4
  br label %181

79:                                               ; preds = %5
  %80 = zext i8 %0 to i32
  %81 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %82 = load i32*, i32** %81, align 4
  %83 = icmp eq i32* %82, null
  br i1 %83, label %84, label %85

84:                                               ; preds = %79
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

85:                                               ; preds = %79
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %86 = shl nuw nsw i32 %80, 12
  %87 = shl nuw nsw i32 %80, 16
  %88 = or i32 %86, %87
  %89 = zext i8 %1 to i32
  %90 = or i32 %88, %89
  %91 = or i32 %90, -536870912
  %92 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %91) #14, !srcloc !6
  %93 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %94 = load i32, i32* %93, align 4
  %95 = getelementptr i32, i32* %82, i32 %94
  store i32 %92, i32* %95, align 4
  br label %181

96:                                               ; preds = %5
  %97 = zext i8 %0 to i32
  %98 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %99 = load i32*, i32** %98, align 4
  %100 = icmp eq i32* %99, null
  br i1 %100, label %101, label %102

101:                                              ; preds = %96
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

102:                                              ; preds = %96
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %103 = shl nuw nsw i32 %97, 12
  %104 = shl nuw nsw i32 %97, 16
  %105 = or i32 %103, %104
  %106 = zext i8 %1 to i32
  %107 = or i32 %105, %106
  %108 = or i32 %107, -534773760
  %109 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %108) #14, !srcloc !6
  %110 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %111 = load i32, i32* %110, align 4
  %112 = getelementptr i32, i32* %99, i32 %111
  store i32 %109, i32* %112, align 4
  br label %181

113:                                              ; preds = %5
  %114 = zext i8 %0 to i32
  %115 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %116 = load i32*, i32** %115, align 4
  %117 = icmp eq i32* %116, null
  br i1 %117, label %118, label %119

118:                                              ; preds = %113
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

119:                                              ; preds = %113
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %120 = shl nuw nsw i32 %114, 8
  %121 = shl nuw nsw i32 %114, 16
  %122 = or i32 %120, %121
  %123 = zext i8 %1 to i32
  %124 = or i32 %122, %123
  %125 = or i32 %124, -536870768
  %126 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %125) #14, !srcloc !6
  %127 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %128 = load i32, i32* %127, align 4
  %129 = getelementptr i32, i32* %116, i32 %128
  store i32 %126, i32* %129, align 4
  br label %181

130:                                              ; preds = %5
  %131 = zext i8 %0 to i32
  %132 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %133 = load i32*, i32** %132, align 4
  %134 = icmp eq i32* %133, null
  br i1 %134, label %135, label %136

135:                                              ; preds = %130
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

136:                                              ; preds = %130
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %137 = shl nuw nsw i32 %131, 12
  %138 = or i32 %137, %131
  %139 = zext i8 %1 to i32
  %140 = shl nuw nsw i32 %139, 8
  %141 = or i32 %138, %140
  %142 = or i32 %141, -509607920
  %143 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %142) #14, !srcloc !6
  %144 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %145 = load i32, i32* %144, align 4
  %146 = getelementptr i32, i32* %133, i32 %145
  store i32 %143, i32* %146, align 4
  br label %181

147:                                              ; preds = %5
  %148 = zext i8 %0 to i32
  %149 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %150 = load i32*, i32** %149, align 4
  %151 = icmp eq i32* %150, null
  br i1 %151, label %152, label %153

152:                                              ; preds = %147
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

153:                                              ; preds = %147
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %154 = shl nuw nsw i32 %148, 12
  %155 = or i32 %154, %148
  %156 = zext i8 %1 to i32
  %157 = shl nuw nsw i32 %156, 8
  %158 = or i32 %155, %157
  %159 = or i32 %158, -509607888
  %160 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %159) #14, !srcloc !6
  %161 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %162 = load i32, i32* %161, align 4
  %163 = getelementptr i32, i32* %150, i32 %162
  store i32 %160, i32* %163, align 4
  br label %181

164:                                              ; preds = %5
  %165 = zext i8 %0 to i32
  %166 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 7
  %167 = load i32*, i32** %166, align 4
  %168 = icmp eq i32* %167, null
  br i1 %168, label %169, label %170

169:                                              ; preds = %164
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %181

170:                                              ; preds = %164
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %171 = shl nuw nsw i32 %165, 12
  %172 = or i32 %171, %165
  %173 = zext i8 %1 to i32
  %174 = shl nuw nsw i32 %173, 8
  %175 = or i32 %172, %174
  %176 = or i32 %175, -509607856
  %177 = tail call i32 asm "rev $0, $1", "=r,r"(i32 %176) #14, !srcloc !6
  %178 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %179 = load i32, i32* %178, align 4
  %180 = getelementptr i32, i32* %167, i32 %179
  store i32 %177, i32* %180, align 4
  br label %181

181:                                              ; preds = %169, %152, %135, %118, %101, %84, %67, %55, %47, %29, %21, %170, %153, %136, %119, %102, %85, %68, %56, %48, %30, %22
  %182 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %4, i32 0, i32 1
  %183 = load i32, i32* %182, align 4
  %184 = add i32 %183, 1
  store i32 %184, i32* %182, align 4
  br label %185

185:                                              ; preds = %9, %181
  ret void
}

; Function Attrs: norecurse nounwind readnone sspstrong uwtable
define internal i32 @jit_udiv32(i32 %0, i32 %1) #0 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3 = udiv i32 %0, %1
  ret i32 %3
}

; Function Attrs: norecurse nounwind readnone sspstrong uwtable
define internal i32 @jit_mod32(i32 %0, i32 %1) #0 {
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %3 = urem i32 %0, %1
  ret i32 %3
}

declare dso_local void @print_hex_dump(i8*, i8*, i32, i32, i32, i8*, i32, i1 zeroext) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #11

declare dso_local i32 @set_memory_ro(i32, i32) local_unnamed_addr #3

declare dso_local i32 @set_memory_x(i32, i32) local_unnamed_addr #3

declare dso_local %struct.vm_struct* @find_vm_area(i8*) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #8

declare void @__sanitizer_cov_trace_pc_indir(i32)

declare void @__sanitizer_cov_trace_cmp1(i8, i8)

declare void @__sanitizer_cov_trace_cmp2(i16, i16)

declare void @__sanitizer_cov_trace_cmp4(i32, i32)

declare void @__sanitizer_cov_trace_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_const_cmp1(i8, i8)

declare void @__sanitizer_cov_trace_const_cmp2(i16, i16)

declare void @__sanitizer_cov_trace_const_cmp4(i32, i32)

declare void @__sanitizer_cov_trace_const_cmp8(i64, i64)

declare void @__sanitizer_cov_trace_div4(i32)

declare void @__sanitizer_cov_trace_div8(i64)

declare void @__sanitizer_cov_trace_gep(i32)

declare void @__sanitizer_cov_trace_switch(i64, i64*)

declare void @__sanitizer_cov_trace_pc()

declare void @__sanitizer_cov_trace_pc_guard(i32*)

attributes #0 = { norecurse nounwind readnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "instrument-function-entry-inlined"="llvm.arm.gnu.eabi.mcount" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "instrument-function-entry-inlined"="llvm.arm.gnu.eabi.mcount" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #4 = { nobuiltin nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #6 = { inlinehint nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #7 = { nofree norecurse nounwind sspstrong uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "instrument-function-entry-inlined"="llvm.arm.gnu.eabi.mcount" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #8 = { nounwind readnone speculatable willreturn }
attributes #9 = { nounwind willreturn }
attributes #10 = { cold "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="mpcore" "target-features"="+armv6k,+dsp,+soft-float,+strict-align,-crypto,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #11 = { nounwind readonly }
attributes #12 = { nounwind }
attributes #13 = { cold nounwind }
attributes #14 = { nounwind readnone }

!llvm.named.register.sp = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"sp"}
!1 = !{i32 1, !"wchar_size", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"clang version 10.0.0-4ubuntu1 "}
!4 = !{!"branch_weights", i32 1, i32 2000}
!5 = !{!"misexpect", i64 1, i64 2000, i64 1}
!6 = !{i32 1214008}
!7 = !{i8 0, i8 2}
