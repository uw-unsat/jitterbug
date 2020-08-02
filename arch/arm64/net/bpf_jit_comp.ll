; ModuleID = '/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c'
source_filename = "/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.kmem_cache = type opaque
%struct.atomic_t = type { i32 }
%struct.bpf_prog = type { i16, i16, i32, i32, i32, i32, [8 x i8], %struct.bpf_prog_aux*, %struct.sock_fprog_kern*, i32 (i8*, %struct.bpf_insn*)*, [0 x %struct.sock_filter], [0 x %struct.bpf_insn] }
%struct.bpf_prog_aux = type { %struct.atomic64_t, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.bpf_ctx_arg_aux*, %struct.bpf_prog*, i8, i8, i8, i8, i32, %struct.bpf_trampoline*, %struct.hlist_node, %struct.btf_type*, i8*, %struct.bpf_prog**, i8*, %struct.bpf_jit_poke_descriptor*, i32, %struct.bpf_ksym, %struct.bpf_prog_ops*, %struct.bpf_map**, %struct.bpf_prog*, %struct.user_struct*, i64, [2 x %struct.bpf_map*], [16 x i8], i8*, %struct.bpf_prog_offload*, %struct.btf*, %struct.bpf_func_info*, %struct.bpf_func_info_aux*, %struct.bpf_line_info*, i8**, i32, i32, i32, i32, %struct.exception_table_entry*, %struct.bpf_prog_stats*, %union.anon.144 }
%struct.atomic64_t = type { i64 }
%struct.bpf_ctx_arg_aux = type { i32, i32 }
%struct.bpf_trampoline = type { %struct.hlist_node, %struct.mutex, %struct.refcount_struct, i64, %struct.anon.4, %struct.bpf_prog*, [3 x %struct.hlist_head], [3 x i32], i8*, i64, %struct.bpf_ksym }
%struct.mutex = type { %struct.atomic64_t, %struct.spinlock, %struct.optimistic_spin_queue, %struct.list_head, i8*, %struct.lockdep_map }
%struct.spinlock = type { %union.anon }
%union.anon = type { %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.qspinlock, i32, i32, i8*, %struct.lockdep_map }
%struct.qspinlock = type { %union.anon.0 }
%union.anon.0 = type { %struct.atomic_t }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.lockdep_map = type { %struct.lock_class_key*, [2 x %struct.lock_class*], i8*, i16, i16, i32, i64 }
%struct.lock_class_key = type { %union.anon.2 }
%union.anon.2 = type { %struct.hlist_node }
%struct.lock_class = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.lockdep_subclass_key*, i32, i32, i64, [9 x %struct.lock_trace*], i32, i8*, i16, i16, [4 x i64], [4 x i64] }
%struct.lockdep_subclass_key = type { i8 }
%struct.lock_trace = type opaque
%struct.refcount_struct = type { %struct.atomic_t }
%struct.anon.4 = type { %struct.btf_func_model, i8*, i8 }
%struct.btf_func_model = type { i8, i8, [12 x i8] }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.btf_type = type opaque
%struct.bpf_jit_poke_descriptor = type { i8*, %union.anon.5, i8, i8, i16 }
%union.anon.5 = type { %struct.anon.6 }
%struct.anon.6 = type { %struct.bpf_map*, i32 }
%struct.bpf_map = type { %struct.bpf_map_ops*, %struct.bpf_map*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.btf*, %struct.bpf_map_memory, [16 x i8], i32, i8, i8, [18 x i8], %struct.atomic64_t, %struct.atomic64_t, %struct.work_struct, %struct.mutex, i64, [56 x i8] }
%struct.bpf_map_ops = type { i32 (%union.bpf_attr*)*, %struct.bpf_map* (%union.bpf_attr*)*, void (%struct.bpf_map*, %struct.file*)*, void (%struct.bpf_map*)*, i32 (%struct.bpf_map*, i8*, i8*)*, void (%struct.bpf_map*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*)*, i8* (%struct.bpf_map*, %struct.file*, i32)*, void (i8*)*, i32 (%struct.bpf_map*, %struct.bpf_insn*)*, i32 (i8*)*, void (%struct.bpf_map*, i8*, %struct.seq_file*)*, i32 (%struct.bpf_map*, %struct.btf*, %struct.btf_type*, %struct.btf_type*)*, i32 (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, i32, %struct.bpf_prog*, %struct.bpf_prog*)*, i32 (%struct.bpf_map*, i64*, i32)*, i32 (%struct.bpf_map*, i64, i32*)*, i32 (%struct.bpf_map*, %struct.vm_area_struct*)*, i32 (%struct.bpf_map*, %struct.file*, %struct.poll_table_struct*)* }
%union.bpf_attr = type { %struct.anon.11 }
%struct.anon.11 = type { i32, i32, i64, i64, i32, i32, i64, i32, i32, [16 x i8], i32, i32, i32, i32, i64, i32, i32, i64, i32, i32, i32 }
%struct.file = type { %union.anon.26, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, i32, %struct.atomic64_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.26 = type { %struct.callback_head }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.vfsmount = type opaque
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [32 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i64, i8*, %union.anon.123, %struct.list_head, %struct.list_head, %union.anon.124 }
%struct.seqcount = type { i32, %struct.lockdep_map }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.27, i8* }
%union.anon.27 = type { i64 }
%struct.lockref = type { %union.anon.121 }
%union.anon.121 = type { %struct.anon.122 }
%struct.anon.122 = type { %struct.spinlock, i32 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.path*, i1)*, %struct.dentry* (%struct.dentry*, %struct.inode*)*, [24 x i8] }
%struct.super_block = type { %struct.list_head, i32, i8, i64, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i64, i64, i64, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.fscrypt_operations*, %struct.key*, %struct.fsverity_operations*, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, i8*, i32, i64, i64, i32, %struct.fsnotify_mark_connector*, [32 x i8], %struct.uuid_t, i32, i32, %struct.mutex, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic64_t, %struct.atomic64_t, i32, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.user_namespace*, %struct.list_lru, %struct.list_lru, %struct.callback_head, %struct.work_struct, %struct.mutex, i32, [20 x i8], %struct.spinlock, %struct.list_head, %struct.spinlock, %struct.list_head, [16 x i8] }
%struct.file_system_type = type { i8*, i32, i32 (%struct.fs_context*)*, %struct.fs_parameter_spec*, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.fs_context = type opaque
%struct.fs_parameter_spec = type opaque
%struct.module = type { i32, %struct.list_head, [56 x i8], %struct.module_kobject, %struct.module_attribute*, i8*, i8*, %struct.kobject*, %struct.kernel_symbol*, i32*, i32, %struct.mutex, %struct.kernel_param*, i32, i32, %struct.kernel_symbol*, i32*, %struct.kernel_symbol*, i32*, i32, i32, %struct.kernel_symbol*, i32*, i8, i8, %struct.kernel_symbol*, i32*, i32, i32, %struct.exception_table_entry*, i32 ()*, %struct.module_layout, %struct.module_layout, %struct.mod_arch_specific, i64, i32, %struct.list_head, %struct.bug_entry*, %struct.mod_kallsyms*, %struct.mod_kallsyms, %struct.module_sect_attrs*, %struct.module_notes_attrs*, i8*, i8*, i32, i8*, i32, i32, i32*, i32, %struct.srcu_struct**, i32, %struct.bpf_raw_event_map*, %struct.jump_entry*, i32, i32, i8**, %struct.trace_event_call**, i32, %struct.trace_eval_map**, i32, i32, i64*, i8*, i32, i64*, i32, %struct.list_head, %struct.list_head, void ()*, %struct.atomic_t, void ()**, i32, %struct.error_injection_entry*, i32, [36 x i8] }
%struct.module_kobject = type { %struct.kobject, %struct.module*, %struct.kobject*, %struct.module_param_attrs*, %struct.completion* }
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, %struct.delayed_work, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [64 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.attribute_group**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)*, void (%struct.kobject*, %struct.kuid_t*, %struct.kgid_t*)* }
%struct.sysfs_ops = type { i64 (%struct.kobject*, %struct.attribute*, i8*)*, i64 (%struct.kobject*, %struct.attribute*, i8*, i64)* }
%struct.attribute = type { i8*, i16, i8, %struct.lock_class_key*, %struct.lock_class_key }
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, i16 (%struct.kobject*, %struct.bin_attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i64, i8*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.vm_area_struct = type { i64, i64, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i64, %struct.mm_struct*, %struct.pgprot_t, i64, %struct.anon.111, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i64, %struct.file*, i8*, %struct.atomic64_t, %struct.mempolicy*, %struct.vm_userfaultfd_ctx }
%struct.rb_node = type { i64, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.anon.29, [0 x i64] }
%struct.anon.29 = type { %struct.vm_area_struct*, %struct.rb_root, i64, i64 (%struct.file*, i64, i64, i64, i64)*, i64, i64, i64, i64, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i64, i64, i64, i64, %struct.atomic64_t, i64, i64, i64, i64, %struct.spinlock, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [46 x i64], %struct.mm_rss_stat, %struct.linux_binfmt*, %struct.mm_context_t, i64, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.task_struct*, %struct.user_namespace*, %struct.file*, %struct.mmu_notifier_subscriptions*, i64, i64, i32, %struct.atomic_t, %struct.uprobes_state, %struct.atomic64_t, %struct.work_struct }
%struct.rb_root = type { %struct.rb_node* }
%struct.pgd_t = type { i64 }
%struct.mm_rss_stat = type { [4 x %struct.atomic64_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { %struct.atomic64_t, i8*, i64 }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.swait_queue_head }
%struct.swait_queue_head = type { %struct.raw_spinlock, %struct.list_head }
%struct.kioctx_table = type opaque
%struct.task_struct = type { %struct.thread_info, i64, i8*, %struct.refcount_struct, i32, i32, %struct.llist_node, i32, i32, i32, i32, i64, %struct.task_struct*, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, [32 x i8], %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, [2 x %struct.uclamp_se], [2 x %struct.uclamp_se], %struct.hlist_head, i32, i32, i32, %struct.cpumask*, %struct.cpumask, i64, i8, i8, i32, %struct.list_head, i32, i32, %union.rcu_special, i8, %struct.list_head, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, %struct.vmacache, %struct.task_rss_stat, i32, i32, i32, i32, i64, i32, i8, [3 x i8], i8, i64, %struct.restart_block, i32, i32, i64, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.pid*, [4 x %struct.hlist_node], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, %struct.prev_cputime, i64, i64, i64, i64, i64, i64, %struct.posix_cputimers, %struct.cred*, %struct.cred*, %struct.cred*, %struct.key*, [16 x i8], %struct.nameidata*, %struct.sysv_sem, %struct.sysv_shm, i64, i64, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i64, i64, i32, %struct.callback_head*, %struct.audit_context*, %struct.kuid_t, i32, %struct.seccomp, i64, i64, %struct.spinlock, %struct.raw_spinlock, %struct.wake_q_node, %struct.rb_root_cached, %struct.task_struct*, %struct.rt_mutex_waiter*, %struct.mutex_waiter*, i32, i32, i32, i64, i64, i32, i32, i32, i32, i64, i64, i64, i32, i32, i32, i32, i32, i64, i32, i32, [48 x %struct.held_lock], i32, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, %struct.capture_control*, i64, %struct.kernel_siginfo*, %struct.task_io_accounting, i32, i64, i64, i64, %struct.nodemask_t, %struct.seqcount, i32, i32, %struct.css_set*, %struct.list_head, %struct.robust_list_head*, %struct.compat_robust_list_head*, %struct.list_head, %struct.futex_pi_state*, %struct.mutex, i32, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, %struct.mempolicy*, i16, i16, i32, i32, i32, i32, i64, i64, i64, i64, %struct.callback_head, %struct.numa_group*, i64*, i64, [3 x i64], i64, %struct.rseq*, i32, i64, %struct.tlbflush_unmap_batch, %union.anon.106, %struct.pipe_inode_info*, %struct.page_frag, %struct.task_delay_info*, i32, i32, i32, i32, i64, i32, [32 x %struct.latency_record], i64, i64, i32, i32, i32, %struct.ftrace_ret_stack*, i64, %struct.atomic_t, %struct.atomic_t, i64, i64, i32, i32, i8*, %struct.kcov*, i64, i32, i32, %struct.mem_cgroup*, i32, i32, i32, %struct.mem_cgroup*, %struct.request_queue*, %struct.uprobe_task*, i32, i32, i64, i32, %struct.task_struct*, %struct.refcount_struct, i8*, %struct.thread_struct, [16 x i8] }
%struct.thread_info = type { i64, i64, i64, %union.anon.30, i8*, i8* }
%union.anon.30 = type { i64 }
%struct.llist_node = type { %struct.llist_node* }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, i64, [24 x i8], %struct.sched_avg }
%struct.load_weight = type { i64, i32 }
%struct.sched_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i64, i64, i64, i32, i32, i64, i64, i64, %struct.util_est }
%struct.util_est = type { i32, i32 }
%struct.sched_rt_entity = type { %struct.list_head, i64, i64, i32, i16, i16, %struct.sched_rt_entity*, %struct.sched_rt_entity*, %struct.rt_rq*, %struct.rt_rq* }
%struct.rt_rq = type opaque
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i64, i32, i8, %struct.hrtimer, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, i64, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i8, i8, i8, i8 }
%struct.timerqueue_node = type { %struct.rb_node, i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.seqcount, %struct.hrtimer*, %struct.timerqueue_head, i64 ()*, i64, [16 x i8] }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, i8, i32, i16, i16, i32, i64, %struct.hrtimer*, i64, %struct.hrtimer*, [56 x i8], [8 x %struct.hrtimer_clock_base] }
%struct.timerqueue_head = type { %struct.rb_root_cached }
%struct.uclamp_se = type { i16, [2 x i8] }
%struct.cpumask = type { [4 x i64] }
%union.rcu_special = type { i32 }
%struct.sched_info = type { i64, i64, i64, i64 }
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.vmacache = type { i64, [4 x %struct.vm_area_struct*] }
%struct.task_rss_stat = type { i32, [4 x i32] }
%struct.restart_block = type { i64 (%struct.restart_block*)*, %union.anon.33 }
%union.anon.33 = type { %struct.anon.34 }
%struct.anon.34 = type { i32*, i32, i32, i32, i64, i32* }
%struct.pid = type { %struct.refcount_struct, i32, %struct.spinlock, [4 x %struct.hlist_head], %struct.hlist_head, %struct.wait_queue_head, %struct.callback_head, [1 x %struct.upid] }
%struct.wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.upid = type { i32, %struct.pid_namespace* }
%struct.pid_namespace = type { %struct.kref, %struct.idr, %struct.callback_head, i32, %struct.task_struct*, %struct.kmem_cache*, i32, %struct.pid_namespace*, %struct.fs_pin*, %struct.user_namespace*, %struct.ucounts*, i32, %struct.ns_common }
%struct.idr = type { %struct.xarray, i32, i32 }
%struct.xarray = type { %struct.spinlock, i32, i8* }
%struct.fs_pin = type opaque
%struct.ucounts = type { %struct.hlist_node, %struct.user_namespace*, %struct.kuid_t, i32, [10 x %struct.atomic_t] }
%struct.ns_common = type { %struct.atomic64_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
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
%struct.net = type { %struct.refcount_struct, %struct.refcount_struct, %struct.spinlock, i32, i32, i32, %struct.spinlock, %struct.atomic_t, %struct.list_head, %struct.list_head, %struct.llist_node, %struct.key_tag*, %struct.user_namespace*, %struct.ucounts*, %struct.idr, %struct.ns_common, %struct.list_head, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.ctl_table_set, %struct.sock*, %struct.sock*, %struct.uevent_sock*, %struct.hlist_head*, %struct.hlist_head*, %struct.raw_notifier_head, i32, %struct.net_device*, %struct.list_head, %struct.netns_core, %struct.netns_mib, %struct.netns_packet, %struct.netns_unix, %struct.netns_nexthop, [8 x i8], %struct.netns_ipv4, %struct.netns_ipv6, %struct.netns_ieee802154_lowpan, %struct.netns_sctp, %struct.netns_dccp, %struct.netns_nf, %struct.netns_xt, %struct.netns_ct, %struct.netns_nftables, %struct.netns_nf_frag, %struct.ctl_table_header*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.sk_buff_head, %struct.net_generic*, %struct.netns_bpf, [56 x i8], %struct.netns_xfrm, %struct.atomic64_t, %struct.netns_ipvs*, %struct.netns_mpls, %struct.netns_can, %struct.netns_xdp, %struct.sock*, %struct.sock* }
%struct.key_tag = type { %struct.callback_head, %struct.refcount_struct, i8 }
%struct.proc_dir_entry = type opaque
%struct.ctl_table_set = type { i32 (%struct.ctl_table_set*)*, %struct.ctl_dir }
%struct.ctl_dir = type { %struct.ctl_table_header, %struct.rb_root }
%struct.ctl_table_header = type { %union.anon.48, %struct.completion*, %struct.ctl_table*, %struct.ctl_table_root*, %struct.ctl_table_set*, %struct.ctl_dir*, %struct.ctl_node*, %struct.hlist_head }
%union.anon.48 = type { %struct.anon.49 }
%struct.anon.49 = type { %struct.ctl_table*, i32, i32, i32 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.wait_queue_head }
%struct.ctl_table_root = type { %struct.ctl_table_set, %struct.ctl_table_set* (%struct.ctl_table_root*)*, void (%struct.ctl_table_header*, %struct.ctl_table*, %struct.kuid_t*, %struct.kgid_t*)*, i32 (%struct.ctl_table_header*, %struct.ctl_table*)* }
%struct.kgid_t = type { i32 }
%struct.ctl_node = type { %struct.rb_node, %struct.ctl_table_header* }
%struct.uevent_sock = type opaque
%struct.raw_notifier_head = type { %struct.notifier_block* }
%struct.notifier_block = type { i32 (%struct.notifier_block*, i64, i8*)*, %struct.notifier_block*, i32 }
%struct.net_device = type { [16 x i8], %struct.netdev_name_node*, %struct.dev_ifalias*, i64, i64, i64, i32, i64, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.anon.125, i64, i64, i64, i64, i64, i64, i64, i32, i32, %struct.net_device_stats, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.iw_handler_def*, %struct.iw_public_data*, %struct.net_device_ops*, %struct.ethtool_ops*, %struct.l3mdev_ops*, %struct.ndisc_ops*, %struct.xfrmdev_ops*, %struct.tlsdev_ops*, %struct.header_ops*, i32, i32, i16, i16, i8, i8, i8, i8, i32, i32, i32, i16, i16, i8, i16, i16, [32 x i8], i8, i8, i8, i8, i16, i16, i16, %struct.spinlock, i8, i8, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.kset*, i32, i32, %struct.vlan_info*, %struct.dsa_port*, %struct.tipc_bearer*, i8*, %struct.in_device*, %struct.dn_dev*, %struct.inet6_dev*, i8*, %struct.wireless_dev*, %struct.wpan_dev*, %struct.mpls_dev*, i8*, %struct.netdev_rx_queue*, i32, i32, %struct.bpf_prog*, i64, i32, i32 (%struct.sk_buff**)*, i8*, %struct.mini_Qdisc*, %struct.netdev_queue*, %struct.nf_hook_entries*, [32 x i8], %struct.cpu_rmap*, %struct.hlist_node, [56 x i8], %struct.netdev_queue*, i32, i32, %struct.Qdisc*, i32, %struct.spinlock, %struct.xdp_dev_bulk_queue*, %struct.xps_dev_maps*, %struct.xps_dev_maps*, %struct.mini_Qdisc*, [16 x %struct.hlist_head], %struct.timer_list, i32, %struct.list_head, i32*, %struct.list_head, i8, i8, i16, i8, void (%struct.net_device*)*, %struct.netpoll_info*, %struct.possible_net_t, %union.anon.141, %struct.garp_port*, %struct.mrp_port*, %struct.device, [4 x %struct.attribute_group*], %struct.attribute_group*, %struct.rtnl_link_ops*, i32, i16, %struct.dcbnl_rtnl_ops*, i16, [16 x %struct.netdev_tc_txq], [16 x i8], i32, %struct.netprio_map*, %struct.phy_device*, %struct.sfp_bus*, %struct.lock_class_key*, %struct.lock_class_key*, i8, i8, %struct.list_head, %struct.macsec_ops* }
%struct.netdev_name_node = type { %struct.hlist_node, %struct.list_head, %struct.net_device*, i8* }
%struct.dev_ifalias = type { %struct.callback_head, [0 x i8] }
%struct.anon.125 = type { %struct.list_head, %struct.list_head }
%struct.net_device_stats = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.iw_handler_def = type opaque
%struct.iw_public_data = type opaque
%struct.net_device_ops = type { i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.sk_buff*, %struct.net_device*, i64)*, i16 (%struct.net_device*, %struct.sk_buff*, %struct.net_device*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ifreq*, i32)*, i32 (%struct.net_device*, %struct.ifmap*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.neigh_parms*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.rtnl_link_stats64*)*, i1 (%struct.net_device*, i32)*, i32 (i32, %struct.net_device*, i8*)*, %struct.net_device_stats* (%struct.net_device*)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i16, i16)*, void (%struct.net_device*)*, i32 (%struct.net_device*, %struct.netpoll_info*)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i16, i8, i16)*, i32 (%struct.net_device*, i32, i32, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_info*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_stats*)*, i32 (%struct.net_device*, i32, %struct.nlattr**)*, i32 (%struct.net_device*, i32, %struct.sk_buff*)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_guid*, %struct.ifla_vf_guid*)*, i32 (%struct.net_device*, i32, i64, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, i16)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, %struct.netdev_fcoe_hbainfo*)*, i32 (%struct.net_device*, i64*, i32)*, i32 (%struct.net_device*, %struct.sk_buff*, i16, i32)*, i32 (%struct.net_device*, %struct.net_device*, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, %struct.net_device* (%struct.net_device*, %struct.sk_buff*, i1)*, i64 (%struct.net_device*, i64)*, i32 (%struct.net_device*, i64)*, i32 (%struct.net_device*, %struct.neighbour*)*, void (%struct.net_device*, %struct.neighbour*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16, i16, %struct.netlink_ext_ack*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16)*, i32 (%struct.sk_buff*, %struct.netlink_callback*, %struct.net_device*, %struct.net_device*, i32*)*, i32 (%struct.sk_buff*, %struct.nlattr**, %struct.net_device*, i8*, i16, i32, i32, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16, %struct.netlink_ext_ack*)*, i32 (%struct.sk_buff*, i32, i32, %struct.net_device*, i32, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, i8*, i64)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, i8* (%struct.net_device*, %struct.net_device*)*, void (%struct.net_device*, i8*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.sk_buff*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.netdev_bpf*)*, i32 (%struct.net_device*, i32, %struct.xdp_frame**, i32)*, i32 (%struct.net_device*, i32, i32)*, %struct.devlink_port* (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ip_tunnel_parm*, i32)* }
%struct.sk_buff = type <{ %union.anon.53, %union.anon.56, %union.anon.57, [48 x i8], %union.anon.58, i64, i32, i32, i16, i16, i16, [0 x i8], i8, i8, [0 x i32], [0 x i8], i16, [0 x i8], i24, i16, %union.anon.60, i32, i32, i32, i16, i16, %union.anon.62, i32, %union.anon.63, %union.anon.64, i16, i16, i16, i16, i16, i16, i16, [0 x i32], i32, i32, i8*, i8*, i32, %struct.refcount_struct, %struct.skb_ext* }>
%union.anon.53 = type { %struct.anon.54 }
%struct.anon.54 = type { %struct.sk_buff*, %struct.sk_buff*, %union.anon.55 }
%union.anon.55 = type { %struct.net_device* }
%union.anon.56 = type { %struct.sock* }
%union.anon.57 = type { i64 }
%union.anon.58 = type { %struct.anon.59 }
%struct.anon.59 = type { i64, void (%struct.sk_buff*)* }
%union.anon.60 = type { i32 }
%union.anon.62 = type { i32 }
%union.anon.63 = type { i32 }
%union.anon.64 = type { i16 }
%struct.skb_ext = type { %struct.refcount_struct, [4 x i8], i8, [7 x i8], [0 x i8] }
%struct.ifreq = type { %union.anon.126, %union.anon.127 }
%union.anon.126 = type { [16 x i8] }
%union.anon.127 = type { %struct.ifmap }
%struct.ifmap = type { i64, i64, i16, i8, i8, i8 }
%struct.neigh_parms = type opaque
%struct.rtnl_link_stats64 = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.ifla_vf_info = type { i32, [32 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i16 }
%struct.ifla_vf_stats = type { i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.nlattr = type { i16, i16 }
%struct.ifla_vf_guid = type { i32, i64 }
%struct.scatterlist = type { i64, i32, i32, i64, i32 }
%struct.netdev_fcoe_hbainfo = type { [64 x i8], [64 x i8], [64 x i8], [64 x i8], [64 x i8], [64 x i8], [256 x i8], [256 x i8] }
%struct.netlink_ext_ack = type { i8*, %struct.nlattr*, [20 x i8], i8 }
%struct.neighbour = type opaque
%struct.ndmsg = type { i8, i8, i16, i32, i16, i8, i8 }
%struct.netlink_callback = type { %struct.sk_buff*, %struct.nlmsghdr*, i32 (%struct.sk_buff*, %struct.netlink_callback*)*, i32 (%struct.netlink_callback*)*, i8*, %struct.module*, %struct.netlink_ext_ack*, i16, i16, i32, i32, i32, i8, %union.anon.129 }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%union.anon.129 = type { [6 x i64] }
%struct.netdev_phys_item_id = type { [32 x i8], i8 }
%struct.udp_tunnel_info = type opaque
%struct.netdev_bpf = type { i32, %union.anon.130 }
%union.anon.130 = type { %struct.anon.131 }
%struct.anon.131 = type { i32, %struct.bpf_prog*, %struct.netlink_ext_ack* }
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
%struct.ethtool_rxnfc = type { i32, i32, i64, %struct.ethtool_rx_flow_spec, %union.anon.135, [0 x i32] }
%struct.ethtool_rx_flow_spec = type { i32, %union.ethtool_flow_union, %struct.ethtool_flow_ext, %union.ethtool_flow_union, %struct.ethtool_flow_ext, i64, i32 }
%union.ethtool_flow_union = type { %struct.ethtool_tcpip6_spec, [12 x i8] }
%struct.ethtool_tcpip6_spec = type { [4 x i32], [4 x i32], i16, i16, i8 }
%struct.ethtool_flow_ext = type { [2 x i8], [6 x i8], i16, i16, [2 x i32] }
%union.anon.135 = type { i32 }
%struct.ethtool_flash = type { i32, i32, [128 x i8] }
%struct.ethtool_channels = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_dump = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_ts_info = type { i32, i32, i32, i32, [3 x i32], i32, [3 x i32] }
%struct.ethtool_modinfo = type { i32, i32, i32, [8 x i32] }
%struct.ethtool_eeprom = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_eee = type { i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%struct.ethtool_tunable = type { i32, i32, i32, i32, [0 x i8*] }
%struct.ethtool_link_ksettings = type { %struct.ethtool_link_settings, %struct.anon.136 }
%struct.ethtool_link_settings = type { i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [1 x i8], [7 x i32], [0 x i32] }
%struct.anon.136 = type { [2 x i64], [2 x i64], [2 x i64] }
%struct.ethtool_fecparam = type { i32, i32, i32, i32 }
%struct.ethtool_stats = type { i32, i32, [0 x i64] }
%struct.l3mdev_ops = type opaque
%struct.ndisc_ops = type opaque
%struct.xfrmdev_ops = type { i32 (%struct.xfrm_state*)*, void (%struct.xfrm_state*)*, void (%struct.xfrm_state*)*, i1 (%struct.sk_buff*, %struct.xfrm_state*)*, void (%struct.xfrm_state*)* }
%struct.xfrm_state = type opaque
%struct.tlsdev_ops = type opaque
%struct.header_ops = type { i32 (%struct.sk_buff*, %struct.net_device*, i16, i8*, i8*, i32)*, i32 (%struct.sk_buff*, i8*)*, i32 (%struct.neighbour*, %struct.hh_cache*, i16)*, void (%struct.hh_cache*, %struct.net_device*, i8*)*, i1 (i8*, i32)*, i16 (%struct.sk_buff*)* }
%struct.hh_cache = type { i32, %struct.seqlock_t, [16 x i64] }
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
%struct.netdev_rx_queue = type { %struct.rps_map*, %struct.rps_dev_flow_table*, %struct.kobject, %struct.net_device*, [40 x i8], %struct.xdp_rxq_info, %struct.xdp_umem*, [56 x i8] }
%struct.rps_map = type { i32, %struct.callback_head, [0 x i16] }
%struct.rps_dev_flow_table = type { i32, %struct.callback_head, [0 x %struct.rps_dev_flow] }
%struct.rps_dev_flow = type { i16, i16, i32 }
%struct.xdp_rxq_info = type { %struct.net_device*, i32, i32, %struct.xdp_mem_info, [40 x i8] }
%struct.xdp_umem = type opaque
%struct.nf_hook_entries = type opaque
%struct.cpu_rmap = type opaque
%struct.netdev_queue = type { %struct.net_device*, %struct.Qdisc*, %struct.Qdisc*, %struct.kobject, i32, i64, i64, %struct.net_device*, %struct.xdp_umem*, %struct.spinlock, i32, i64, i64, [32 x i8], %struct.dql }
%struct.dql = type { i32, i32, i32, [52 x i8], i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, [20 x i8] }
%struct.Qdisc = type { i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, i32, i32, %struct.Qdisc_ops*, %struct.qdisc_size_table*, %struct.hlist_node, i32, i32, %struct.netdev_queue*, %struct.net_rate_estimator*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, i32, %struct.refcount_struct, [24 x i8], %struct.sk_buff_head, %struct.qdisc_skb_head, %struct.gnet_stats_basic_packed, %struct.seqcount, %struct.gnet_stats_queue, i64, %struct.Qdisc*, %struct.sk_buff_head, [48 x i8], %struct.spinlock, %struct.spinlock, i8, %struct.callback_head, [24 x i8] }
%struct.Qdisc_ops = type { %struct.Qdisc_ops*, %struct.Qdisc_class_ops*, [16 x i8], i32, i32, i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, %struct.sk_buff* (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, %struct.sk_buff*)*, i32 (%struct.Qdisc*, %struct.gnet_dump*)*, void (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*)*, i32 (%struct.Qdisc*)*, %struct.module* }
%struct.Qdisc_class_ops = type { i32, %struct.netdev_queue* (%struct.Qdisc*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i64, %struct.Qdisc*, %struct.Qdisc**, %struct.netlink_ext_ack*)*, %struct.Qdisc* (%struct.Qdisc*, i64)*, void (%struct.Qdisc*, i64)*, i64 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, i32, %struct.nlattr**, i64*, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i64)*, void (%struct.Qdisc*, %struct.qdisc_walker*)*, %struct.tcf_block* (%struct.Qdisc*, i64, %struct.netlink_ext_ack*)*, i64 (%struct.Qdisc*, i64, i32)*, void (%struct.Qdisc*, i64)*, i32 (%struct.Qdisc*, i64, %struct.sk_buff*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i64, %struct.gnet_dump*)* }
%struct.tcmsg = type { i8, i8, i16, i32, i32, i32, i32 }
%struct.qdisc_walker = type opaque
%struct.tcf_block = type { %struct.mutex, %struct.list_head, i32, i32, %struct.refcount_struct, %struct.net*, %struct.Qdisc*, %struct.rw_semaphore, %struct.flow_block, %struct.list_head, i8, %struct.atomic_t, i32, i32, %struct.anon.140, %struct.callback_head, [128 x %struct.hlist_head], %struct.mutex }
%struct.flow_block = type { %struct.list_head }
%struct.anon.140 = type { %struct.tcf_chain*, %struct.list_head }
%struct.tcf_chain = type { %struct.mutex, %struct.tcf_proto*, %struct.list_head, %struct.tcf_block*, i32, i32, i32, i8, i8, %struct.tcf_proto_ops*, i8*, %struct.callback_head }
%struct.tcf_proto = type { %struct.tcf_proto*, i8*, i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i16, i32, i8*, %struct.tcf_proto_ops*, %struct.tcf_chain*, %struct.spinlock, i8, %struct.refcount_struct, %struct.callback_head, %struct.hlist_node }
%struct.tcf_result = type { %union.anon.137 }
%union.anon.137 = type { %struct.anon.138 }
%struct.anon.138 = type { i64, i32 }
%struct.tcf_proto_ops = type { %struct.list_head, [16 x i8], i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i32 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, i1, %struct.netlink_ext_ack*)*, i8* (%struct.tcf_proto*, i32)*, void (%struct.tcf_proto*, i8*)*, i32 (%struct.net*, %struct.sk_buff*, %struct.tcf_proto*, i64, i32, %struct.nlattr**, i8**, i1, i1, %struct.netlink_ext_ack*)*, i32 (%struct.tcf_proto*, i8*, i8*, i1, %struct.netlink_ext_ack*)*, i1 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, %struct.tcf_walker*, i1)*, i32 (%struct.tcf_proto*, i1, i32 (i32, i8*, i8*)*, i8*, %struct.netlink_ext_ack*)*, void (%struct.tcf_proto*, i8*)*, void (%struct.tcf_proto*, i8*)*, void (i8*, i32, i64, i8*, i64)*, i8* (%struct.net*, %struct.tcf_chain*, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (i8*)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.sk_buff*, %struct.net*, i8*)*, %struct.module*, i32 }
%struct.tcf_walker = type opaque
%struct.gnet_dump = type { %struct.spinlock*, %struct.sk_buff*, %struct.nlattr*, i32, i32, i32, i8*, i32, %struct.tc_stats }
%struct.tc_stats = type { i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.qdisc_size_table = type { %struct.callback_head, %struct.list_head, %struct.tc_sizespec, i32, [0 x i16] }
%struct.tc_sizespec = type { i8, i8, i16, i32, i32, i32, i32, i32 }
%struct.net_rate_estimator = type opaque
%struct.gnet_stats_basic_cpu = type { %struct.gnet_stats_basic_packed, %struct.u64_stats_sync }
%struct.u64_stats_sync = type {}
%struct.qdisc_skb_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.gnet_stats_basic_packed = type { i64, i64 }
%struct.gnet_stats_queue = type { i32, i32, i32, i32, i32 }
%struct.xdp_dev_bulk_queue = type opaque
%struct.xps_dev_maps = type { %struct.callback_head, [0 x %struct.xps_map*] }
%struct.xps_map = type { i32, i32, %struct.callback_head, [0 x i16] }
%struct.mini_Qdisc = type { %struct.tcf_proto*, %struct.tcf_block*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, %struct.callback_head }
%struct.timer_list = type { %struct.hlist_node, i64, void (%struct.timer_list*)*, i32, %struct.lockdep_map }
%struct.netpoll_info = type opaque
%struct.possible_net_t = type { %struct.net* }
%union.anon.141 = type { i8* }
%struct.garp_port = type opaque
%struct.mrp_port = type opaque
%struct.device = type { %struct.kobject, %struct.device*, %struct.device_private*, i8*, %struct.device_type*, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.mutex, %struct.mutex, %struct.dev_links_info, %struct.dev_pm_info, %struct.dev_pm_domain*, %struct.irq_domain*, %struct.dev_pin_info*, %struct.list_head, %struct.dma_map_ops*, i64*, i64, i64, i64, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.cma*, %struct.dev_archdata, %struct.device_node*, %struct.fwnode_handle*, i32, i32, i32, %struct.spinlock, %struct.list_head, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, %struct.dev_iommu*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i64)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key, i8 }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, i32, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i64)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.attribute_group**, %struct.dev_pm_ops*, void (%struct.device*)*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_links_info = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, i8, i32 }
%struct.dev_pm_info = type { %struct.pm_message, i16, i32, %struct.spinlock, %struct.list_head, %struct.completion, %struct.wakeup_source*, i8, %struct.hrtimer, i64, %struct.work_struct, %struct.wait_queue_head, %struct.wake_irq*, %struct.atomic_t, %struct.atomic_t, i16, i32, i32, i32, i32, i32, i64, i64, i64, i64, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.wakeup_source = type { i8*, i32, %struct.list_head, %struct.spinlock, %struct.wake_irq*, %struct.timer_list, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.device*, i8 }
%struct.wake_irq = type opaque
%struct.pm_subsys_data = type { %struct.spinlock, i32, %struct.list_head, %struct.pm_domain_data* }
%struct.pm_domain_data = type opaque
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, i32 (%struct.device*)*, void (%struct.device*, i1)*, i32 (%struct.device*)*, void (%struct.device*)*, void (%struct.device*)* }
%struct.irq_domain = type opaque
%struct.dev_pin_info = type opaque
%struct.dma_map_ops = type { i8* (%struct.device*, i64, i64*, i32, i64)*, void (%struct.device*, i64, i8*, i64, i64)*, i32 (%struct.device*, %struct.vm_area_struct*, i8*, i64, i64, i64)*, i32 (%struct.device*, %struct.sg_table*, i8*, i64, i64, i64)*, i64 (%struct.device*, %struct.page*, i64, i64, i32, i64)*, void (%struct.device*, i64, i64, i32, i64)*, i32 (%struct.device*, %struct.scatterlist*, i32, i32, i64)*, void (%struct.device*, %struct.scatterlist*, i32, i32, i64)*, i64 (%struct.device*, i64, i64, i32, i64)*, void (%struct.device*, i64, i64, i32, i64)*, void (%struct.device*, i64, i64, i32)*, void (%struct.device*, i64, i64, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, i8*, i64, i32)*, i32 (%struct.device*, i64)*, i64 (%struct.device*)*, i64 (%struct.device*)*, i64 (%struct.device*)* }
%struct.sg_table = type { %struct.scatterlist*, i32, i32 }
%struct.page = type { i64, %union.anon.74, %union.anon.90, %struct.atomic_t, %struct.mem_cgroup* }
%union.anon.74 = type { %struct.anon.75 }
%struct.anon.75 = type { %struct.list_head, %struct.address_space*, i64, i64 }
%union.anon.90 = type { %struct.atomic_t }
%struct.device_dma_parameters = type { i32, i64 }
%struct.dma_coherent_mem = type opaque
%struct.cma = type opaque
%struct.dev_archdata = type { i8* }
%struct.device_node = type opaque
%struct.fwnode_handle = type { %struct.fwnode_handle*, %struct.fwnode_operations*, %struct.device* }
%struct.fwnode_operations = type { %struct.fwnode_handle* (%struct.fwnode_handle*)*, void (%struct.fwnode_handle*)*, i1 (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*, %struct.device*)*, i1 (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i32, i8*, i64)*, i32 (%struct.fwnode_handle*, i8*, i8**, i64)*, i8* (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i8*, i32, i32, %struct.fwnode_reference_args*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, i32 (%struct.fwnode_handle*, %struct.fwnode_endpoint*)*, i32 (%struct.fwnode_handle*, %struct.device*)* }
%struct.fwnode_reference_args = type { %struct.fwnode_handle*, i32, [8 x i64] }
%struct.fwnode_endpoint = type { i32, i32, %struct.fwnode_handle* }
%struct.class = type { i8*, %struct.module*, %struct.attribute_group**, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, void (%struct.device*, %struct.kuid_t*, %struct.kgid_t*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.iommu_group = type opaque
%struct.dev_iommu = type opaque
%struct.rtnl_link_ops = type { %struct.list_head, i8*, i64, void (%struct.net_device*)*, i32, %struct.nla_policy*, i32 (%struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (%struct.net_device*, %struct.list_head*)*, i64 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 ()*, i32 ()*, i32, %struct.nla_policy*, i32 (%struct.net_device*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i64 (%struct.net_device*, %struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*, %struct.net_device*)*, %struct.net* (%struct.net_device*)*, i64 (%struct.net_device*, i32)*, i32 (%struct.sk_buff*, %struct.net_device*, i32*, i32)* }
%struct.nla_policy = type { i8, i8, i16, %union.anon.142 }
%union.anon.142 = type { i8* }
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
%struct.tcp_mib = type { [16 x i64] }
%struct.linux_mib = type { [122 x i64] }
%struct.icmp_mib = type { [28 x i64] }
%struct.icmpmsg_mib = type { [512 x %struct.atomic64_t] }
%struct.udp_mib = type { [9 x i64] }
%struct.ipstats_mib = type { [37 x i64], %struct.u64_stats_sync }
%struct.icmpv6_mib = type { [6 x i64] }
%struct.icmpv6msg_mib = type { [512 x %struct.atomic64_t] }
%struct.linux_xfrm_mib = type { [29 x i64] }
%struct.linux_tls_mib = type { [11 x i64] }
%struct.mptcp_mib = type opaque
%struct.netns_packet = type { %struct.mutex, %struct.hlist_head }
%struct.netns_unix = type { i32, %struct.ctl_table_header* }
%struct.netns_nexthop = type { %struct.rb_root, %struct.hlist_head*, i32, i32, %struct.atomic_notifier_head }
%struct.atomic_notifier_head = type { %struct.spinlock, %struct.notifier_block* }
%struct.netns_ipv4 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ipv4_devconf*, %struct.ipv4_devconf*, %struct.ip_ra_chain*, %struct.mutex, %struct.fib_rules_ops*, i8, i32, %struct.fib_table*, %struct.fib_table*, i8, i32, %struct.hlist_head*, i8, %struct.sock*, %struct.sock**, %struct.sock*, %struct.inet_peer_base*, %struct.sock**, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, i32, i32, i32, i32, i32, i32, %struct.local_ports, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i64, i64, [40 x i8], %struct.inet_timewait_death_row, i32, i32, %struct.tcp_congestion_ops*, %struct.tcp_fastopen_context*, %struct.spinlock, i32, %struct.atomic_t, i64, i32, i32, i32, i32, i32, i32, i32, %struct.ping_group_range, %struct.atomic_t, i64*, i32, %struct.list_head, %struct.fib_rules_ops*, i32, i32, %struct.fib_notifier_ops*, i32, %struct.fib_notifier_ops*, i32, %struct.atomic_t, %struct.siphash_key_t }
%struct.ipv4_devconf = type opaque
%struct.ip_ra_chain = type opaque
%struct.fib_table = type opaque
%struct.inet_peer_base = type opaque
%struct.fqdir = type { i64, i64, i32, i32, %struct.inet_frags*, %struct.net*, i8, [23 x i8], %struct.rhashtable, %struct.atomic64_t, %struct.work_struct, [40 x i8] }
%struct.inet_frags = type { i32, void (%struct.inet_frag_queue*, i8*)*, void (%struct.inet_frag_queue*)*, void (%struct.timer_list*)*, %struct.kmem_cache*, i8*, %struct.rhashtable_params, %struct.refcount_struct, %struct.completion }
%struct.inet_frag_queue = type { %struct.rhash_head, %union.anon.51, %struct.timer_list, %struct.spinlock, %struct.refcount_struct, %struct.rb_root, %struct.sk_buff*, %struct.sk_buff*, i64, i32, i32, i8, i16, %struct.fqdir*, %struct.callback_head }
%struct.rhash_head = type { %struct.rhash_head* }
%union.anon.51 = type { %struct.frag_v6_compare_key }
%struct.frag_v6_compare_key = type { %struct.in6_addr, %struct.in6_addr, i32, i32, i32 }
%struct.in6_addr = type { %union.anon.52 }
%union.anon.52 = type { [4 x i32] }
%struct.rhashtable_params = type { i16, i16, i16, i16, i32, i16, i8, i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)*, i32 (%struct.rhashtable_compare_arg*, i8*)* }
%struct.rhashtable_compare_arg = type { %struct.rhashtable*, i8* }
%struct.rhashtable = type { %struct.bucket_table*, i32, i32, %struct.rhashtable_params, i8, %struct.work_struct, %struct.mutex, %struct.spinlock, %struct.atomic_t }
%struct.bucket_table = type { i32, i32, i32, %struct.list_head, %struct.callback_head, %struct.bucket_table*, %struct.lockdep_map, [24 x i8], [0 x %struct.rhash_lock_head*] }
%struct.rhash_lock_head = type {}
%struct.xt_table = type opaque
%struct.local_ports = type { %struct.seqlock_t, [2 x i32], i8 }
%struct.inet_timewait_death_row = type { %struct.atomic_t, [60 x i8], %struct.inet_hashinfo*, i32, [52 x i8] }
%struct.inet_hashinfo = type opaque
%struct.tcp_congestion_ops = type opaque
%struct.tcp_fastopen_context = type opaque
%struct.ping_group_range = type { %struct.seqlock_t, [2 x %struct.kgid_t] }
%struct.fib_rules_ops = type opaque
%struct.fib_notifier_ops = type opaque
%struct.siphash_key_t = type { [2 x i64] }
%struct.netns_ipv6 = type { %struct.netns_sysctl_ipv6, %struct.ipv6_devconf*, %struct.ipv6_devconf*, %struct.inet_peer_base*, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.fib6_info*, %struct.rt6_info*, %struct.rt6_statistics*, %struct.timer_list, %struct.hlist_head*, %struct.fib6_table*, %struct.list_head, [32 x i8], %struct.dst_ops, %struct.rwlock_t, %struct.spinlock, i32, i64, i32, i8, i32, %struct.rt6_info*, %struct.rt6_info*, %struct.fib6_table*, %struct.fib_rules_ops*, %struct.sock**, %struct.sock*, %struct.sock*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.fib_rules_ops*, %struct.atomic_t, %struct.atomic_t, %struct.seg6_pernet_data*, %struct.fib_notifier_ops*, %struct.fib_notifier_ops*, i32, %struct.anon.67, [48 x i8] }
%struct.netns_sysctl_ipv6 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [4 x i64], i64*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8 }
%struct.ipv6_devconf = type opaque
%struct.fib6_info = type opaque
%struct.rt6_statistics = type opaque
%struct.dst_ops = type { i16, i32, i32 (%struct.dst_ops*)*, %struct.dst_entry* (%struct.dst_entry*, i32)*, i32 (%struct.dst_entry*)*, i32 (%struct.dst_entry*)*, i32* (%struct.dst_entry*, i64)*, void (%struct.dst_entry*)*, void (%struct.dst_entry*, %struct.net_device*, i32)*, %struct.dst_entry* (%struct.dst_entry*)*, void (%struct.sk_buff*)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*, i32, i1)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*)*, i32 (%struct.net*, %struct.sock*, %struct.sk_buff*)*, %struct.neighbour* (%struct.dst_entry*, %struct.sk_buff*, i8*)*, void (%struct.dst_entry*, i8*)*, %struct.kmem_cache*, %struct.percpu_counter, [24 x i8] }
%struct.dst_entry = type opaque
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.rwlock_t = type { %struct.qrwlock, i32, i32, i8*, %struct.lockdep_map }
%struct.qrwlock = type { %union.anon.65, %struct.qspinlock }
%union.anon.65 = type { %struct.atomic_t }
%struct.rt6_info = type opaque
%struct.fib6_table = type opaque
%struct.seg6_pernet_data = type opaque
%struct.anon.67 = type { %struct.hlist_head, %struct.spinlock, i32 }
%struct.netns_ieee802154_lowpan = type { %struct.netns_sysctl_lowpan, %struct.fqdir* }
%struct.netns_sysctl_lowpan = type { %struct.ctl_table_header* }
%struct.netns_sctp = type { %struct.sctp_mib*, %struct.proc_dir_entry*, %struct.ctl_table_header*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.timer_list, %struct.list_head, %struct.spinlock, %struct.spinlock, i32, i32, i32, i32, i32, i32, i32, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64 }
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
%struct.seq_file = type { i8*, i64, i64, i64, i64, i64, i64, %struct.mutex, %struct.seq_operations*, i32, %struct.file*, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.bpf_link_info = type { i32, i32, i32, %union.anon.68 }
%union.anon.68 = type { %struct.anon.69 }
%struct.anon.69 = type { i64, i32 }
%struct.netns_xfrm = type { %struct.list_head, %struct.hlist_head*, %struct.hlist_head*, %struct.hlist_head*, i32, i32, %struct.work_struct, %struct.list_head, %struct.hlist_head*, i32, [3 x %struct.hlist_head], [3 x %struct.xfrm_policy_hash], [6 x i32], %struct.work_struct, %struct.xfrm_policy_hthresh, %struct.list_head, %struct.sock*, %struct.sock*, i32, i32, i32, i32, %struct.ctl_table_header*, [32 x i8], %struct.dst_ops, %struct.dst_ops, %struct.spinlock, %struct.spinlock, %struct.mutex, [16 x i8] }
%struct.xfrm_policy_hash = type { %struct.hlist_head*, i32, i8, i8, i8, i8 }
%struct.xfrm_policy_hthresh = type { %struct.work_struct, %struct.seqlock_t, i8, i8, i8, i8 }
%struct.netns_ipvs = type opaque
%struct.netns_mpls = type { i32, i32, i64, %struct.mpls_route**, %struct.ctl_table_header* }
%struct.mpls_route = type opaque
%struct.netns_can = type { %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.can_dev_rcv_lists*, %struct.spinlock, %struct.timer_list, %struct.can_pkg_stats*, %struct.can_rcv_lists_stats*, %struct.hlist_head }
%struct.can_dev_rcv_lists = type opaque
%struct.can_pkg_stats = type opaque
%struct.can_rcv_lists_stats = type opaque
%struct.netns_xdp = type { %struct.mutex, %struct.hlist_head }
%struct.sock = type opaque
%struct.time_namespace = type opaque
%struct.cgroup_namespace = type { %struct.refcount_struct, %struct.ns_common, %struct.user_namespace*, %struct.ucounts*, %struct.css_set* }
%struct.signal_struct = type { %struct.refcount_struct, %struct.atomic_t, i32, %struct.list_head, %struct.wait_queue_head, %struct.task_struct*, %struct.sigpending, %struct.hlist_head, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, i64, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.posix_cputimers, [4 x %struct.pid*], %struct.pid*, i32, %struct.tty_struct*, %struct.autogroup*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.prev_cputime, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, %struct.tty_audit_buf*, i8, i16, i16, %struct.mm_struct*, %struct.mutex, %struct.mutex }
%struct.cpu_itimer = type { i64, i64 }
%struct.thread_group_cputimer = type { %struct.task_cputime_atomic }
%struct.task_cputime_atomic = type { %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t }
%struct.tty_struct = type opaque
%struct.autogroup = type opaque
%struct.rlimit = type { i64, i64 }
%struct.pacct_struct = type { i32, i64, i64, i64, i64, i64, i64 }
%struct.taskstats = type { i16, i32, i8, i8, i64, i64, i64, i64, i64, i64, i64, i64, [32 x i8], i8, [3 x i8], [4 x i8], i32, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.spinlock, %struct.refcount_struct, %struct.wait_queue_head, [64 x %struct.k_sigaction] }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i64, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [1 x i64] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.kuid_t = type { i32 }
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.wake_q_node = type { %struct.wake_q_node* }
%struct.rb_root_cached = type { %struct.rb_root, %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.mutex_waiter = type { %struct.list_head, %struct.task_struct*, %struct.ww_acquire_ctx*, i8* }
%struct.ww_acquire_ctx = type opaque
%struct.held_lock = type { i64, i64, %struct.lockdep_map*, %struct.lockdep_map*, i64, i64, i32, i32 }
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.io_context = type { %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i16, i32, i64, %struct.xarray, %struct.io_cq*, %struct.hlist_head, %struct.work_struct }
%struct.io_cq = type { %struct.request_queue*, %struct.io_context*, %union.anon.92, %union.anon.93, i32 }
%union.anon.92 = type { %struct.list_head }
%union.anon.93 = type { %struct.hlist_node }
%struct.capture_control = type opaque
%struct.kernel_siginfo = type { %struct.anon.94 }
%struct.anon.94 = type { i32, i32, i32, %union.__sifields }
%union.__sifields = type { %struct.anon.98 }
%struct.anon.98 = type { i32, i32, i32, i64, i64 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i64] }
%struct.css_set = type { [14 x %struct.cgroup_subsys_state*], %struct.refcount_struct, %struct.css_set*, %struct.cgroup*, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, [14 x %struct.list_head], %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.cgroup*, %struct.cgroup*, %struct.css_set*, i8, %struct.callback_head }
%struct.cgroup_subsys_state = type { %struct.cgroup*, %struct.cgroup_subsys*, %struct.percpu_ref, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i64, %struct.atomic_t, %struct.work_struct, %struct.rcu_work, %struct.cgroup_subsys_state* }
%struct.cgroup_subsys = type { %struct.cgroup_subsys_state* (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*, i32)*, i32 (%struct.seq_file*, %struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void ()*, i32 (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.cgroup_subsys_state*)*, i8, i32, i8*, i8*, %struct.cgroup_root*, %struct.idr, %struct.list_head, %struct.cftype*, %struct.cftype*, i32 }
%struct.cgroup_taskset = type opaque
%struct.cgroup_root = type { %struct.kernfs_root*, i32, i32, %struct.cgroup, i64, %struct.atomic_t, %struct.list_head, i32, [4096 x i8], [64 x i8] }
%struct.kernfs_root = type { %struct.kernfs_node*, i32, %struct.idr, i32, i32, %struct.kernfs_syscall_ops*, %struct.list_head, %struct.wait_queue_head }
%struct.kernfs_syscall_ops = type { i32 (%struct.seq_file*, %struct.kernfs_root*)*, i32 (%struct.kernfs_node*, i8*, i16)*, i32 (%struct.kernfs_node*)*, i32 (%struct.kernfs_node*, %struct.kernfs_node*, i8*)*, i32 (%struct.seq_file*, %struct.kernfs_node*, %struct.kernfs_root*)* }
%struct.cgroup = type { %struct.cgroup_subsys_state, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.kernfs_node*, %struct.cgroup_file, %struct.cgroup_file, i16, i16, i16, i16, [14 x %struct.cgroup_subsys_state*], %struct.cgroup_root*, %struct.list_head, [14 x %struct.list_head], %struct.cgroup*, %struct.cgroup*, %struct.cgroup_rstat_cpu*, %struct.list_head, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.prev_cputime, %struct.list_head, %struct.mutex, %struct.wait_queue_head, %struct.work_struct, %struct.psi_group, %struct.cgroup_bpf, %struct.atomic_t, %struct.cgroup_freezer_state, [0 x i64] }
%struct.cgroup_file = type { %struct.kernfs_node*, i64, %struct.timer_list }
%struct.cgroup_rstat_cpu = type { %struct.u64_stats_sync, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.cgroup*, %struct.cgroup* }
%struct.cgroup_base_stat = type { %struct.task_cputime }
%struct.task_cputime = type { i64, i64, i64 }
%struct.psi_group = type { %struct.mutex, %struct.psi_group_cpu*, [5 x i64], i64, i64, %struct.delayed_work, [2 x [5 x i64]], [5 x [3 x i64]], %struct.atomic_t, %struct.kthread_worker*, %struct.kthread_delayed_work, %struct.mutex, %struct.list_head, [5 x i32], i32, i64, [5 x i64], i64, i64 }
%struct.psi_group_cpu = type { %struct.seqcount, [4 x i32], i32, [6 x i32], i64, [16 x i8], [2 x [6 x i32]], [16 x i8] }
%struct.kthread_worker = type { i32, %struct.raw_spinlock, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.kthread_work* }
%struct.kthread_work = type { %struct.list_head, void (%struct.kthread_work*)*, %struct.kthread_worker*, i32 }
%struct.kthread_delayed_work = type { %struct.kthread_work, %struct.timer_list }
%struct.cgroup_bpf = type { [34 x %struct.bpf_prog_array*], [34 x %struct.list_head], [34 x i32], %struct.bpf_prog_array*, %struct.percpu_ref, %struct.work_struct }
%struct.bpf_prog_array = type { %struct.callback_head, [0 x %struct.bpf_prog_array_item] }
%struct.bpf_prog_array_item = type { %struct.bpf_prog*, [2 x %struct.bpf_cgroup_storage*] }
%struct.bpf_cgroup_storage = type { %union.anon.91, %struct.bpf_cgroup_storage_map*, %struct.bpf_cgroup_storage_key, %struct.list_head, %struct.rb_node, %struct.callback_head }
%union.anon.91 = type { %struct.bpf_storage_buffer* }
%struct.bpf_storage_buffer = type { %struct.callback_head, [0 x i8] }
%struct.bpf_cgroup_storage_map = type opaque
%struct.bpf_cgroup_storage_key = type { i64, i32 }
%struct.cgroup_freezer_state = type { i8, i32, i32, i32 }
%struct.cftype = type { [64 x i8], i64, i64, i32, i32, %struct.cgroup_subsys*, %struct.list_head, %struct.kernfs_ops*, i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, %struct.lock_class_key }
%struct.kernfs_ops = type { i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i64, i8, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)*, %struct.lock_class_key }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, %struct.seq_file*, i8*, %struct.mutex, %struct.mutex, i32, %struct.list_head, i8*, i64, i8, %struct.vm_operations_struct* }
%struct.poll_table_struct = type opaque
%struct.percpu_ref = type { %struct.atomic64_t, i64, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head }
%struct.rcu_work = type { %struct.work_struct, %struct.callback_head, %struct.workqueue_struct* }
%struct.robust_list_head = type opaque
%struct.compat_robust_list_head = type { %struct.compat_robust_list, i32, i32 }
%struct.compat_robust_list = type { i32 }
%struct.futex_pi_state = type opaque
%struct.perf_event_context = type opaque
%struct.numa_group = type opaque
%struct.rseq = type { i32, i32, %union.anon.105, i32, [12 x i8] }
%union.anon.105 = type { i64 }
%struct.tlbflush_unmap_batch = type {}
%union.anon.106 = type { %struct.callback_head }
%struct.pipe_inode_info = type { %struct.mutex, %struct.wait_queue_head, %struct.wait_queue_head, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer*, %struct.user_struct*, %struct.watch_queue* }
%struct.fasync_struct = type { %struct.rwlock_t, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i64 }
%struct.pipe_buf_operations = type { i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.watch_queue = type opaque
%struct.page_frag = type { %struct.page*, i32, i32 }
%struct.task_delay_info = type opaque
%struct.latency_record = type { [12 x i64], i32, i64, i64 }
%struct.ftrace_ret_stack = type opaque
%struct.kcov = type opaque
%struct.mem_cgroup = type opaque
%struct.request_queue = type opaque
%struct.uprobe_task = type { i32, %union.anon.107, %struct.uprobe*, i64, %struct.return_instance*, i32 }
%union.anon.107 = type { %struct.anon.109 }
%struct.anon.109 = type { %struct.callback_head, i64 }
%struct.uprobe = type opaque
%struct.return_instance = type { %struct.uprobe*, i64, i64, i64, i8, %struct.return_instance* }
%struct.thread_struct = type { %struct.cpu_context, %struct.anon.110, i32, i8*, i32, i32, i64, i64, %struct.debug_info, %struct.ptrauth_keys_user, %struct.ptrauth_keys_kernel }
%struct.cpu_context = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.anon.110 = type { i64, i64, %struct.user_fpsimd_state }
%struct.user_fpsimd_state = type { [32 x i128], i32, i32, [2 x i32] }
%struct.debug_info = type { i32, i32, i32, [16 x %struct.perf_event*], [16 x %struct.perf_event*] }
%struct.perf_event = type opaque
%struct.ptrauth_keys_user = type { %struct.ptrauth_key, %struct.ptrauth_key, %struct.ptrauth_key, %struct.ptrauth_key, %struct.ptrauth_key }
%struct.ptrauth_key = type { i64, i64 }
%struct.ptrauth_keys_kernel = type { %struct.ptrauth_key }
%struct.mmu_notifier_subscriptions = type opaque
%struct.uprobes_state = type { %struct.xol_area* }
%struct.xol_area = type opaque
%struct.pgprot_t = type { i64 }
%struct.anon.111 = type { %struct.rb_node, i64 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i64)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*, i32)*, void (%struct.vm_fault*, i64, i64)*, i64 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i64, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.mempolicy*)*, %struct.mempolicy* (%struct.vm_area_struct*, i64)*, %struct.page* (%struct.vm_area_struct*, i64)* }
%struct.vm_fault = type { %struct.vm_area_struct*, i32, i32, i64, i64, %struct.pmd_t*, %struct.pud_t*, %struct.pte_t, %struct.page*, %struct.page*, %struct.pte_t*, %struct.spinlock*, %struct.page* }
%struct.pmd_t = type { i64 }
%struct.pud_t = type { %struct.p4d_t }
%struct.p4d_t = type { %struct.pgd_t }
%struct.pte_t = type { i64 }
%struct.mempolicy = type opaque
%struct.vm_userfaultfd_ctx = type { %struct.userfaultfd_ctx* }
%struct.userfaultfd_ctx = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.lockdep_map, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.73, i8*, i64, i16, i16, %struct.kernfs_iattrs* }
%union.anon.73 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.refcount_struct }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*, i64)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.module*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.112 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.112 = type { i8* }
%struct.kernel_symbol = type { i32, i32, i32 }
%struct.module_layout = type { i8*, i32, i32, i32, i32, %struct.mod_tree_node }
%struct.mod_tree_node = type { %struct.module*, %struct.latch_tree_node }
%struct.latch_tree_node = type { [2 x %struct.rb_node] }
%struct.mod_arch_specific = type { %struct.mod_plt_sec, %struct.mod_plt_sec, %struct.plt_entry* }
%struct.mod_plt_sec = type { i32, i32, i32 }
%struct.plt_entry = type { i32, i32, i32 }
%struct.bug_entry = type { i32, i32, i16, i16 }
%struct.mod_kallsyms = type { %struct.elf64_sym*, i32, i8*, i8* }
%struct.elf64_sym = type { i32, i8, i8, i16, i64, i64 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.srcu_struct = type { [17 x %struct.srcu_node], [3 x %struct.srcu_node*], %struct.mutex, %struct.spinlock, %struct.mutex, i32, i64, i64, i64, i64, %struct.srcu_data*, i64, %struct.mutex, %struct.completion, %struct.atomic_t, %struct.delayed_work, %struct.lockdep_map }
%struct.srcu_node = type { %struct.spinlock, [4 x i64], [4 x i64], i64, %struct.srcu_node*, i32, i32 }
%struct.srcu_data = type { [2 x i64], [2 x i64], [32 x i8], %struct.spinlock, %struct.rcu_segcblist, i64, i64, i8, %struct.timer_list, %struct.work_struct, %struct.callback_head, %struct.srcu_node*, i64, i32, %struct.srcu_struct*, [48 x i8] }
%struct.rcu_segcblist = type { %struct.callback_head*, [4 x %struct.callback_head**], [4 x i64], %struct.atomic64_t, i8, i8 }
%struct.bpf_raw_event_map = type { %struct.tracepoint*, i8*, i32, i32, [8 x i8] }
%struct.tracepoint = type { i8*, %struct.static_key, i32 ()*, void ()*, %struct.tracepoint_func* }
%struct.static_key = type { %struct.atomic_t, %union.anon.113 }
%union.anon.113 = type { i64 }
%struct.tracepoint_func = type { i8*, i8*, i32 }
%struct.jump_entry = type { i32, i32, i64 }
%struct.trace_event_call = type opaque
%struct.trace_eval_map = type opaque
%struct.error_injection_entry = type { i64, i32 }
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i64 (%struct.super_block*, %struct.shrink_control*)*, i64 (%struct.super_block*, %struct.shrink_control*)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.spinlock, %struct.atomic_t, %struct.super_block*, %struct.kqid, i64, i64, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.114, i32 }
%union.anon.114 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.shrink_control = type { i32, i32, i64, i64, %struct.mem_cgroup* }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)*, i32 (%struct.inode*, %struct.kprojid_t*)*, i32 (%struct.inode*, i64*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.kprojid_t = type { i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.qc_info*)*, i32 (%struct.super_block*, i64, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.kqid*, %struct.qc_dqblk*)*, i32 (%struct.super_block*, i64, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.qc_state*)*, i32 (%struct.super_block*, i32)* }
%struct.qc_info = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.qc_dqblk = type { i32, i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, i64, i32 }
%struct.qc_state = type { i32, [3 x %struct.qc_type_state] }
%struct.qc_type_state = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64 }
%struct.export_operations = type opaque
%struct.rw_semaphore = type { %struct.atomic64_t, %struct.atomic64_t, %struct.optimistic_spin_queue, %struct.raw_spinlock, %struct.list_head, i8*, %struct.lockdep_map }
%struct.xattr_handler = type opaque
%struct.fscrypt_operations = type opaque
%struct.key = type { %struct.refcount_struct, i32, %union.anon.40, %struct.watch_list*, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.41, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i16, i64, %union.anon.42, %union.anon.46, %struct.key_restriction* }
%union.anon.40 = type { %struct.rb_node }
%struct.watch_list = type opaque
%struct.key_user = type opaque
%union.anon.41 = type { i64 }
%union.anon.42 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { i64, %union.anon.43, %struct.key_type*, %struct.key_tag*, i8* }
%union.anon.43 = type { i64 }
%struct.key_type = type opaque
%union.anon.46 = type { %union.key_payload }
%union.key_payload = type { [4 x i8*] }
%struct.key_restriction = type { i32 (%struct.key*, %struct.key_type*, %union.key_payload*, %struct.key*)*, %struct.key*, %struct.key_type* }
%struct.fsverity_operations = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, i8, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.backing_dev_info*, %struct.list_head, i64, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
%struct.backing_dev_info = type opaque
%struct.mtd_info = type opaque
%struct.quota_info = type { i32, %struct.rw_semaphore, [3 x %struct.inode*], [3 x %struct.mem_dqinfo], [3 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i64, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.sb_writers = type { i32, %struct.wait_queue_head, [3 x %struct.percpu_rw_semaphore] }
%struct.percpu_rw_semaphore = type { %struct.rcu_sync, i32*, %struct.rcuwait, %struct.wait_queue_head, %struct.atomic_t, %struct.lockdep_map }
%struct.rcu_sync = type { i32, i32, %struct.wait_queue_head, %struct.callback_head }
%struct.rcuwait = type { %struct.task_struct* }
%struct.fsnotify_mark_connector = type opaque
%struct.uuid_t = type { [16 x i8] }
%struct.shrinker = type { i64 (%struct.shrinker*, %struct.shrink_control*)*, i64 (%struct.shrinker*, %struct.shrink_control*)*, i64, i32, i32, %struct.list_head, i32, %struct.atomic64_t* }
%struct.workqueue_struct = type opaque
%struct.user_namespace = type { %struct.uid_gid_map, %struct.uid_gid_map, %struct.uid_gid_map, %struct.atomic_t, %struct.user_namespace*, i32, %struct.kuid_t, %struct.kgid_t, %struct.ns_common, i64, %struct.list_head, %struct.key*, %struct.rw_semaphore, %struct.key*, %struct.work_struct, %struct.ctl_table_set, %struct.ctl_table_header*, %struct.ucounts*, [10 x i32] }
%struct.uid_gid_map = type { i32, %union.anon.38 }
%union.anon.38 = type { %struct.anon.39, [48 x i8] }
%struct.anon.39 = type { %struct.uid_gid_extent*, %struct.uid_gid_extent* }
%struct.uid_gid_extent = type { i32, i32, i32 }
%struct.list_lru = type { %struct.list_lru_node*, %struct.list_head, i32, i8 }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_lru_one, %struct.list_lru_memcg*, i64, [16 x i8] }
%struct.list_lru_one = type { %struct.list_head, i64 }
%struct.list_lru_memcg = type { %struct.callback_head, [0 x %struct.list_lru_one*] }
%union.anon.123 = type { %struct.list_head }
%union.anon.124 = type { %struct.hlist_node }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i64, %union.anon.115, i32, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.spinlock, i16, i8, i8, i64, i64, %struct.rw_semaphore, i64, i64, %struct.hlist_node, %struct.list_head, %struct.bdi_writeback*, i32, i16, i16, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.116, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %union.anon.117, %struct.file_lock_context*, %struct.address_space, %struct.list_head, %union.anon.120, i32, i32, %struct.fsnotify_mark_connector*, %struct.fscrypt_info*, %struct.fsverity_info*, i8* }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.inode*, %struct.delayed_call*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.path*, %struct.kstat*, i32, i32)*, i64 (%struct.dentry*, i8*, i64)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec64*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, [24 x i8] }
%struct.delayed_call = type { void (i8*)*, i8* }
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.file* }
%struct.kstat = type { i32, i16, i32, i32, i64, i64, i64, i32, i32, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.timespec64, i64, i64 }
%struct.fiemap_extent_info = type opaque
%union.anon.115 = type { i32 }
%struct.timespec64 = type { i64, i64 }
%struct.bdi_writeback = type opaque
%union.anon.116 = type { %struct.callback_head }
%union.anon.117 = type { %struct.file_operations* }
%struct.file_lock_context = type { %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head }
%struct.address_space = type { %struct.inode*, %struct.xarray, i32, %struct.atomic_t, %struct.atomic_t, %struct.rb_root_cached, %struct.rw_semaphore, i64, i64, i64, %struct.address_space_operations*, i64, i32, %struct.spinlock, %struct.list_head, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, void (%struct.readahead_control*)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i1 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.page*)*, i32 (%struct.page*, i64, i64)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.readahead_control = type opaque
%struct.kiocb = type { %struct.file*, i64, void (%struct.kiocb*, i64, i64)*, i8*, i32, i16, i16, i32 }
%struct.iov_iter = type { i32, i64, i64, %union.anon.76, %union.anon.77 }
%union.anon.76 = type { %struct.iovec* }
%struct.iovec = type { i8*, i64 }
%union.anon.77 = type { i64 }
%struct.swap_info_struct = type opaque
%union.anon.120 = type { %struct.pipe_inode_info* }
%struct.fscrypt_info = type opaque
%struct.fsverity_info = type opaque
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, i1)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, i64, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i32 (%struct.file*, i64, i64, i32)* }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, i8*, i32, i8, i32, i32, %struct.wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i64, i64, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.118 }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i8* (i8*)*, void (i8*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock*, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)*, i1 (%struct.file_lock*)* }
%union.anon.118 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.cred = type { %struct.atomic_t, %struct.atomic_t, i8*, i32, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %union.anon.50 }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.group_info = type { %struct.atomic_t, i32, [0 x %struct.kgid_t] }
%union.anon.50 = type { %struct.callback_head }
%struct.file_ra_state = type { i64, i32, i32, i32, i32, i64 }
%struct.bpf_insn = type { i8, i8, i16, i32 }
%struct.bpf_map_memory = type { i32, %struct.user_struct* }
%struct.work_struct = type { %struct.atomic64_t, %struct.list_head, void (%struct.work_struct*)*, %struct.lockdep_map }
%struct.bpf_ksym = type { i64, i64, [128 x i8], %struct.list_head, %struct.latch_tree_node, i8 }
%struct.bpf_prog_ops = type { i32 (%struct.bpf_prog*, %union.bpf_attr*, %union.bpf_attr*)* }
%struct.user_struct = type { %struct.refcount_struct, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i64, i64, i64, %struct.atomic64_t, %struct.hlist_node, %struct.kuid_t, %struct.atomic64_t, %struct.ratelimit_state }
%struct.ratelimit_state = type { %struct.raw_spinlock, i32, i32, i32, i32, i64, i64 }
%struct.bpf_prog_offload = type { %struct.bpf_prog*, %struct.net_device*, %struct.bpf_offload_dev*, i8*, %struct.list_head, i8, i8, i8*, i32 }
%struct.bpf_offload_dev = type opaque
%struct.btf = type opaque
%struct.bpf_func_info = type { i32, i32 }
%struct.bpf_func_info_aux = type { i16, i8 }
%struct.bpf_line_info = type { i32, i32, i32, i32 }
%struct.exception_table_entry = type { i32, i32 }
%struct.bpf_prog_stats = type { i64, i64, %struct.u64_stats_sync }
%union.anon.144 = type { %struct.work_struct }
%struct.sock_fprog_kern = type { i16, %struct.sock_filter* }
%struct.sock_filter = type { i16, i8, i8, i32 }
%struct.jit_ctx = type { %struct.bpf_prog*, i32, i32, i32*, i32*, i32 }
%struct.arm64_jit_data = type { %struct.bpf_binary_header*, i8*, %struct.jit_ctx }
%struct.bpf_binary_header = type { i32, [4 x i8], [0 x i8] }
%struct.vm_struct = type { %struct.vm_struct*, i8*, i64, i64, %struct.page**, i32, i64, i8* }

@bpf_jit_enable = external dso_local local_unnamed_addr global i32, align 4
@bpf_int_jit_compile.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str = private unnamed_addr constant [40 x i8] c"\013bpf_jit: multi-func JIT bug %d != %d\0A\00", align 1
@arm64_use_ng_mappings = external dso_local local_unnamed_addr global i8, align 1
@vabits_actual = external dso_local local_unnamed_addr global i64, align 8
@kmalloc_caches = external dso_local local_unnamed_addr global [3 x [14 x %struct.kmem_cache*]], align 8
@bpf2a64 = internal unnamed_addr constant [16 x i32] [i32 7, i32 0, i32 1, i32 2, i32 3, i32 4, i32 19, i32 20, i32 21, i32 22, i32 25, i32 9, i32 10, i32 11, i32 26, i32 12], align 4
@.str.1 = private unnamed_addr constant [44 x i8] c"\016bpf_jit: [%2d] imm=%d(0x%x) out of range\0A\00", align 1
@build_insn.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"\013bpf_jit: unknown opcode %02x\0A\00", align 1
@out_offset = internal unnamed_addr global i32 -1, align 4
@emit_bpf_tail_call.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.3 = private unnamed_addr constant [52 x i8] c"\013bpf_jit: tail_call out_offset = %d, expected %d!\0A\00", align 1
@cpu_hwcaps = external dso_local global [1 x i64], align 8
@build_prologue.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.4 = private unnamed_addr constant [47 x i8] c"\013bpf_jit: PROLOGUE_OFFSET = %d, expected %d!\0A\00", align 1
@.str.5 = private unnamed_addr constant [64 x i8] c"\013bpf_jit: flen=%u proglen=%u pass=%u image=%pK from=%s pid=%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"\013\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"JIT code: \00", align 1
@cpu_number = external dso_local global i32, section ".data..percpu..read_mostly", align 4
@kgdb_active = external dso_local global %struct.atomic_t, align 4
@switch.table.build_body = private unnamed_addr constant [13 x i32] [i32 0, i32 8, i32 2, i32 1, i32 1, i32 12, i32 10, i32 0, i32 0, i32 3, i32 9, i32 11, i32 13], align 4
@__sancov_lowest_stack = external thread_local(initialexec) global i64
@__sancov_gen_cov_switch_values = internal global [117 x i64] [i64 115, i64 8, i64 4, i64 5, i64 7, i64 12, i64 15, i64 20, i64 21, i64 22, i64 23, i64 24, i64 28, i64 29, i64 30, i64 31, i64 36, i64 37, i64 38, i64 39, i64 44, i64 45, i64 46, i64 47, i64 52, i64 53, i64 54, i64 55, i64 60, i64 61, i64 62, i64 63, i64 68, i64 69, i64 70, i64 71, i64 76, i64 77, i64 78, i64 79, i64 84, i64 85, i64 86, i64 87, i64 92, i64 93, i64 94, i64 95, i64 97, i64 98, i64 99, i64 100, i64 101, i64 102, i64 103, i64 105, i64 106, i64 107, i64 108, i64 109, i64 110, i64 111, i64 113, i64 114, i64 115, i64 116, i64 117, i64 118, i64 119, i64 121, i64 122, i64 123, i64 124, i64 125, i64 126, i64 127, i64 132, i64 133, i64 135, i64 148, i64 149, i64 151, i64 156, i64 159, i64 164, i64 165, i64 166, i64 167, i64 172, i64 173, i64 174, i64 175, i64 180, i64 181, i64 182, i64 183, i64 188, i64 189, i64 190, i64 191, i64 195, i64 196, i64 197, i64 198, i64 199, i64 204, i64 205, i64 206, i64 207, i64 212, i64 213, i64 214, i64 219, i64 220, i64 221, i64 222, i64 245]
@__sancov_gen_cov_switch_values.8 = internal global [4 x i64] [i64 2, i64 8, i64 48, i64 144]
@__sancov_gen_cov_switch_values.9 = internal global [5 x i64] [i64 3, i64 32, i64 16, i64 32, i64 64]
@__sancov_gen_cov_switch_values.10 = internal global [4 x i64] [i64 2, i64 32, i64 16, i64 32]
@__sancov_gen_cov_switch_values.11 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]
@__sancov_gen_cov_switch_values.12 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]
@__sancov_gen_cov_switch_values.13 = internal global [6 x i64] [i64 4, i64 32, i64 0, i64 1, i64 2, i64 3]

; Function Attrs: nounwind sanitize_address shadowcallstack sspstrong
define dso_local %struct.bpf_prog* @bpf_int_jit_compile(%struct.bpf_prog* %prog) local_unnamed_addr #0 {
entry:
  %ctx = alloca %struct.jit_ctx, align 8
  %image_ptr = alloca i8*, align 8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %type.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %prog, i64 0, i32 2
  %0 = ptrtoint i32* %type.i to i64
  call void @__asan_load4_noabort(i64 %0)
  %1 = load i32, i32* %type.i, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %1)
  %cmp.i = icmp eq i32 %1, 0
  %2 = bitcast %struct.jit_ctx* %ctx to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %2) #11
  %3 = call i8* @memset(i8* %2, i32 170, i64 40)
  %4 = bitcast i8** %image_ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #11
  %5 = ptrtoint i8** %image_ptr to i64
  call void @__asan_store8_noabort(i64 %5)
  store i8* inttoptr (i64 -6148914691236517206 to i8*), i8** %image_ptr, align 8
  %jit_requested = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %prog, i64 0, i32 1
  %6 = ptrtoint i16* %jit_requested to i64
  call void @__asan_load2_noabort(i64 %6)
  %bf.load = load i16, i16* %jit_requested, align 2
  %bf.clear = and i16 %bf.load, 2
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear)
  %tobool = icmp eq i16 %bf.clear, 0
  br i1 %tobool, label %entry.cleanup_crit_edge, label %if.end

entry.cleanup_crit_edge:                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.end:                                           ; preds = %entry
  %call1 = call %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog* %prog) #11
  %cmp.i212 = icmp ugt %struct.bpf_prog* %call1, inttoptr (i64 -4096 to %struct.bpf_prog*)
  br i1 %cmp.i212, label %if.end.cleanup_crit_edge, label %if.end4

if.end.cleanup_crit_edge:                         ; preds = %if.end
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %cmp = icmp eq %struct.bpf_prog* %call1, %prog
  %aux = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 7
  %7 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %7)
  %8 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %jit_data7 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %8, i64 0, i32 23
  %9 = bitcast i8** %jit_data7 to %struct.arm64_jit_data**
  %10 = ptrtoint %struct.arm64_jit_data** %9 to i64
  call void @__asan_load8_noabort(i64 %10)
  %11 = load %struct.arm64_jit_data*, %struct.arm64_jit_data** %9, align 8
  %tobool8 = icmp eq %struct.arm64_jit_data* %11, null
  br i1 %tobool8, label %if.then9, label %if.end4.if.end16_crit_edge

if.end4.if.end16_crit_edge:                       ; preds = %if.end4
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end16

if.then9:                                         ; preds = %if.end4
  call void @__asan_load8_noabort(i64 ptrtoint (%struct.kmem_cache** getelementptr inbounds ([3 x [14 x %struct.kmem_cache*]], [3 x [14 x %struct.kmem_cache*]]* @kmalloc_caches, i64 0, i64 0, i64 7) to i64))
  %12 = load %struct.kmem_cache*, %struct.kmem_cache** getelementptr inbounds ([3 x [14 x %struct.kmem_cache*]], [3 x [14 x %struct.kmem_cache*]]* @kmalloc_caches, i64 0, i64 0, i64 7), align 8
  %call8.i.i = call noalias i8* @kmem_cache_alloc_trace(%struct.kmem_cache* %12, i32 3520, i64 56) #11
  %ptrint.i.i = ptrtoint i8* %call8.i.i to i64
  %maskedptr.i.i = and i64 %ptrint.i.i, 7
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %maskedptr.i.i)
  %maskcond.i.i = icmp eq i64 %maskedptr.i.i, 0
  call void @llvm.assume(i1 %maskcond.i.i) #11
  %tobool11 = icmp eq i8* %call8.i.i, null
  br i1 %tobool11, label %if.then9.out_crit_edge, label %if.end13

if.then9.out_crit_edge:                           ; preds = %if.then9
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out

if.end13:                                         ; preds = %if.then9
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %13 = bitcast i8* %call8.i.i to %struct.arm64_jit_data*
  %14 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %14)
  %15 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %jit_data15 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %15, i64 0, i32 23
  %16 = ptrtoint i8** %jit_data15 to i64
  call void @__asan_store8_noabort(i64 %16)
  store i8* %call8.i.i, i8** %jit_data15, align 8
  br label %if.end16

if.end16:                                         ; preds = %if.end4.if.end16_crit_edge, %if.end13
  %jit_data.0 = phi %struct.arm64_jit_data* [ %11, %if.end4.if.end16_crit_edge ], [ %13, %if.end13 ]
  %ctx17 = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 2
  %offset = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 2, i32 3
  %17 = ptrtoint i32** %offset to i64
  call void @__asan_load8_noabort(i64 %17)
  %18 = load i32*, i32** %offset, align 8
  %tobool18 = icmp eq i32* %18, null
  br i1 %tobool18, label %if.end23, label %if.then19

if.then19:                                        ; preds = %if.end16
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %19 = bitcast %struct.jit_ctx* %ctx17 to i8*
  %20 = call i8* @memcpy(i8* %2, i8* %19, i64 40)
  %image = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 1
  %21 = bitcast i8** %image to i64*
  %22 = ptrtoint i64* %21 to i64
  call void @__asan_load8_noabort(i64 %22)
  %23 = load i64, i64* %21, align 8
  %24 = bitcast i8** %image_ptr to i64*
  %25 = ptrtoint i64* %24 to i64
  call void @__asan_store8_noabort(i64 %25)
  store i64 %23, i64* %24, align 8
  %header21 = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 0
  %26 = ptrtoint %struct.bpf_binary_header** %header21 to i64
  call void @__asan_load8_noabort(i64 %26)
  %27 = load %struct.bpf_binary_header*, %struct.bpf_binary_header** %header21, align 8
  %idx = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %28 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %28)
  %29 = load i32, i32* %idx, align 8
  %mul = shl i32 %29, 2
  br label %skip_init_ctx

if.end23:                                         ; preds = %if.end16
  %call24 = call i8* @memset(i8* nonnull %2, i32 0, i64 40) #11
  %prog25 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 0
  %30 = ptrtoint %struct.bpf_prog** %prog25 to i64
  call void @__asan_store8_noabort(i64 %30)
  store %struct.bpf_prog* %call1, %struct.bpf_prog** %prog25, align 8
  %len = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 4
  %31 = ptrtoint i32* %len to i64
  call void @__asan_load4_noabort(i64 %31)
  %32 = load i32, i32* %len, align 4
  %conv26 = zext i32 %32 to i64
  %33 = shl nuw nsw i64 %conv26, 2
  %call8.i.i213 = call noalias i8* @__kmalloc(i64 %33, i32 3520) #11
  %ptrint.i.i214 = ptrtoint i8* %call8.i.i213 to i64
  %maskedptr.i.i215 = and i64 %ptrint.i.i214, 127
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %maskedptr.i.i215)
  %maskcond.i.i216 = icmp eq i64 %maskedptr.i.i215, 0
  call void @llvm.assume(i1 %maskcond.i.i216) #11
  %offset28 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 3
  %34 = bitcast i32** %offset28 to i8**
  %35 = ptrtoint i8** %34 to i64
  call void @__asan_store8_noabort(i64 %35)
  store i8* %call8.i.i213, i8** %34, align 8
  %cmp30 = icmp eq i8* %call8.i.i213, null
  br i1 %cmp30, label %if.end23.out_off_crit_edge, label %if.end33

if.end23.out_off_crit_edge:                       ; preds = %if.end23
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_off

if.end33:                                         ; preds = %if.end23
  %call35 = call fastcc i32 @build_body(%struct.jit_ctx* nonnull %ctx, i1 false)
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call35)
  %tobool36 = icmp eq i32 %call35, 0
  br i1 %tobool36, label %if.end38, label %if.end33.out_off_crit_edge

if.end33.out_off_crit_edge:                       ; preds = %if.end33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_off

if.end38:                                         ; preds = %if.end33
  %call40 = call fastcc i32 @build_prologue(%struct.jit_ctx* nonnull %ctx, i1 %cmp.i)
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call40)
  %tobool41 = icmp eq i32 %call40, 0
  br i1 %tobool41, label %if.end43, label %if.end38.out_off_crit_edge

if.end38.out_off_crit_edge:                       ; preds = %if.end38
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_off

if.end43:                                         ; preds = %if.end38
  %idx44 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %36 = ptrtoint i32* %idx44 to i64
  call void @__asan_load4_noabort(i64 %36)
  %37 = load i32, i32* %idx44, align 8
  %epilogue_offset = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 2
  %38 = ptrtoint i32* %epilogue_offset to i64
  call void @__asan_store4_noabort(i64 %38)
  store i32 %37, i32* %epilogue_offset, align 4
  call fastcc void @build_epilogue(%struct.jit_ctx* nonnull %ctx)
  %39 = ptrtoint i32* %idx44 to i64
  call void @__asan_load4_noabort(i64 %39)
  %40 = load i32, i32* %idx44, align 8
  %mul47 = shl i32 %40, 2
  %call49 = call %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32 %mul47, i8** nonnull %image_ptr, i32 4, void (i8*, i32)* nonnull @jit_fill_hole) #11
  %cmp50 = icmp eq %struct.bpf_binary_header* %call49, null
  br i1 %cmp50, label %if.end43.out_off_crit_edge, label %if.end53

if.end43.out_off_crit_edge:                       ; preds = %if.end43
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out_off

if.end53:                                         ; preds = %if.end43
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %41 = bitcast i8** %image_ptr to i64*
  %42 = ptrtoint i64* %41 to i64
  call void @__asan_load8_noabort(i64 %42)
  %43 = load i64, i64* %41, align 8
  %image54 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %44 = bitcast i32** %image54 to i64*
  %45 = ptrtoint i64* %44 to i64
  call void @__asan_store8_noabort(i64 %45)
  store i64 %43, i64* %44, align 8
  br label %skip_init_ctx

skip_init_ctx:                                    ; preds = %if.end53, %if.then19
  %header.0 = phi %struct.bpf_binary_header* [ %27, %if.then19 ], [ %call49, %if.end53 ]
  %extra_pass.0.off0 = phi i1 [ true, %if.then19 ], [ false, %if.end53 ]
  %image_size.0 = phi i32 [ %mul, %if.then19 ], [ %mul47, %if.end53 ]
  %idx55 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %46 = ptrtoint i32* %idx55 to i64
  call void @__asan_store4_noabort(i64 %46)
  store i32 0, i32* %idx55, align 8
  %call57 = call fastcc i32 @build_prologue(%struct.jit_ctx* nonnull %ctx, i1 %cmp.i)
  %call59 = call fastcc i32 @build_body(%struct.jit_ctx* nonnull %ctx, i1 %extra_pass.0.off0)
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call59)
  %tobool60 = icmp eq i32 %call59, 0
  br i1 %tobool60, label %if.end62, label %if.then61

if.then61:                                        ; preds = %skip_init_ctx
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* %header.0) #11
  br label %out_off

if.end62:                                         ; preds = %skip_init_ctx
  call fastcc void @build_epilogue(%struct.jit_ctx* nonnull %ctx)
  %47 = ptrtoint i32* %idx55 to i64
  call void @__asan_load4_noabort(i64 %47)
  %48 = load i32, i32* %idx55, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %48)
  %cmp8.i = icmp sgt i32 %48, 0
  br i1 %cmp8.i, label %for.body.lr.ph.i, label %if.end62.if.end66_crit_edge

if.end62.if.end66_crit_edge:                      ; preds = %if.end62
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end66

for.body.lr.ph.i:                                 ; preds = %if.end62
  %image.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %49 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %49)
  %50 = load i32*, i32** %image.i, align 8
  %51 = zext i32 %48 to i64
  br label %for.body.i

for.cond.i:                                       ; preds = %for.body.i
  %exitcond = icmp eq i64 %indvars.iv.next.i, %51
  br i1 %exitcond, label %for.cond.i.if.end66_crit_edge, label %for.cond.i.for.body.i_crit_edge

for.cond.i.for.body.i_crit_edge:                  ; preds = %for.cond.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.i

for.cond.i.if.end66_crit_edge:                    ; preds = %for.cond.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end66

for.body.i:                                       ; preds = %for.cond.i.for.body.i_crit_edge, %for.body.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next.i, %for.cond.i.for.body.i_crit_edge ]
  %arrayidx.i = getelementptr i32, i32* %50, i64 %indvars.iv.i
  %52 = ptrtoint i32* %arrayidx.i to i64
  call void @__asan_load4_noabort(i64 %52)
  %53 = load i32, i32* %arrayidx.i, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 -736092160, i32 %53)
  %cmp1.i = icmp eq i32 %53, -736092160
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  br i1 %cmp1.i, label %if.then65, label %for.cond.i

if.then65:                                        ; preds = %for.body.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* %header.0) #11
  br label %out_off

if.end66:                                         ; preds = %for.cond.i.if.end66_crit_edge, %if.end62.if.end66_crit_edge
  call void @__asan_load4_noabort(i64 ptrtoint (i32* @bpf_jit_enable to i64))
  %54 = load i32, i32* @bpf_jit_enable, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 1, i32 %54)
  %cmp67 = icmp sgt i32 %54, 1
  br i1 %cmp67, label %if.then69, label %if.end66.if.end72_crit_edge

if.end66.if.end72_crit_edge:                      ; preds = %if.end66
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end72

if.then69:                                        ; preds = %if.end66
  %len70 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 4
  %55 = ptrtoint i32* %len70 to i64
  call void @__asan_load4_noabort(i64 %55)
  %56 = load i32, i32* %len70, align 4
  %image71 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %57 = bitcast i32** %image71 to i8**
  %58 = ptrtoint i8** %57 to i64
  call void @__asan_load8_noabort(i64 %58)
  %59 = load i8*, i8** %57, align 8
  %60 = call i64 asm "mrs $0, sp_el0", "=r"() #6, !srcloc !27
  %61 = inttoptr i64 %60 to %struct.task_struct*
  %arraydecay.i = getelementptr inbounds %struct.task_struct, %struct.task_struct* %61, i64 0, i32 95, i64 0
  %pid.i.i = getelementptr inbounds %struct.task_struct, %struct.task_struct* %61, i64 0, i32 63
  %62 = ptrtoint i32* %pid.i.i to i64
  call void @__asan_load4_noabort(i64 %62)
  %63 = load i32, i32* %pid.i.i, align 8
  %call3.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.5, i64 0, i64 0), i32 %56, i32 %image_size.0, i32 2, i8* %59, i8* %arraydecay.i, i32 %63) #12
  %tobool.i = icmp eq i8* %59, null
  br i1 %tobool.i, label %if.then69.if.end72_crit_edge, label %if.then.i

if.then69.if.end72_crit_edge:                     ; preds = %if.then69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end72

if.then.i:                                        ; preds = %if.then69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %conv.i = zext i32 %image_size.0 to i64
  call void @print_hex_dump(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i32 2, i32 16, i32 1, i8* nonnull %59, i64 %conv.i, i1 false) #11
  br label %if.end72

if.end72:                                         ; preds = %if.then69.if.end72_crit_edge, %if.end66.if.end72_crit_edge, %if.then.i
  %64 = bitcast %struct.bpf_binary_header* %header.0 to i8*
  %image73 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %65 = ptrtoint i32** %image73 to i64
  call void @__asan_load8_noabort(i64 %65)
  %66 = load i32*, i32** %image73, align 8
  %67 = ptrtoint i32* %idx55 to i64
  call void @__asan_load4_noabort(i64 %67)
  %68 = load i32, i32* %idx55, align 8
  %idx.ext = sext i32 %68 to i64
  %add.ptr = getelementptr i32, i32* %66, i64 %idx.ext
  %69 = ptrtoint %struct.bpf_binary_header* %header.0 to i64
  %70 = ptrtoint i32* %add.ptr to i64
  call void @__flush_icache_range(i64 %69, i64 %70) #11
  %71 = call i64 asm sideeffect ".if 1 == 1\0A661:\0A\09mrs\09$0, daif\0A662:\0A.pushsection .altinstructions,\22a\22\0A .word 661b - .\0A .word 663f - .\0A .hword 42\0A .byte 662b-661b\0A .byte 664f-663f\0A.popsection\0A.pushsection .altinstr_replacement, \22a\22\0A663:\0A\09\09.irp\09num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\0A\09.equ\09.L__reg_num_x\\num, \\num\0A\09.endr\0A\09.equ\09.L__reg_num_xzr, 31\0A\09.macro\09mrs_s, rt, sreg\0A.inst (0xd5200000|(\\sreg)|(.L__reg_num_\\rt))\0A\09\09.endm\0A\09mrs_s $0, (((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))\0A\09.purgem\09mrs_s\0A\0A664:\0A\09.popsection\0A\09.org\09. - (664b-663b) + (662b-661b)\0A\09.org\09. - (662b-661b) + (664b-663b)\0A.endif\0A", "=&r,~{memory}"() #11, !srcloc !28
  %conv.i.i.i = trunc i64 %71 to i32
  %72 = call i32 asm sideeffect ".if 1 == 1\0A661:\0A\09and\09${0:w}, ${1:w}, #0x00000080\0A662:\0A.pushsection .altinstructions,\22a\22\0A .word 661b - .\0A .word 663f - .\0A .hword 42\0A .byte 662b-661b\0A .byte 664f-663f\0A.popsection\0A.pushsection .altinstr_replacement, \22a\22\0A663:\0A\09eor\09${0:w}, ${1:w}, #0xe0\0A664:\0A\09.popsection\0A\09.org\09. - (664b-663b) + (662b-661b)\0A\09.org\09. - (662b-661b) + (664b-663b)\0A.endif\0A", "=&r,r,~{memory}"(i32 %conv.i.i.i) #11, !srcloc !29
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %72)
  %tobool.i.i218 = icmp eq i32 %72, 0
  br i1 %tobool.i.i218, label %if.end72.if.end.i.i219_crit_edge, label %do.body10.i.i

if.end72.if.end.i.i219_crit_edge:                 ; preds = %if.end72
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end.i.i219

do.body10.i.i:                                    ; preds = %if.end72
  %73 = call i64 @llvm.read_register.i64(metadata !24) #11
  %74 = inttoptr i64 %73 to i64*
  %75 = call i64 asm ".if 1 == 1\0A661:\0A\09mrs $0, tpidr_el1\0A662:\0A.pushsection .altinstructions,\22a\22\0A .word 661b - .\0A .word 663f - .\0A .hword 11\0A .byte 662b-661b\0A .byte 664f-663f\0A.popsection\0A.pushsection .altinstr_replacement, \22a\22\0A663:\0A\09mrs $0, tpidr_el2\0A664:\0A\09.popsection\0A\09.org\09. - (664b-663b) + (662b-661b)\0A\09.org\09. - (662b-661b) + (664b-663b)\0A.endif\0A", "=r,*Q"(i64* %74) #10, !srcloc !30
  %add.i.i = add i64 %75, ptrtoint (i32* @cpu_number to i64)
  %76 = inttoptr i64 %add.i.i to i32*
  %77 = ptrtoint i32* %76 to i64
  call void @__asan_load4_noabort(i64 %77)
  %78 = load i32, i32* %76, align 4
  %call.i.i.i.i = call i1 @__kasan_check_read(i8* bitcast (%struct.atomic_t* @kgdb_active to i8*), i32 4) #11
  call void @__asan_load4_noabort(i64 ptrtoint (%struct.atomic_t* @kgdb_active to i64))
  %79 = load volatile i32, i32* getelementptr inbounds (%struct.atomic_t, %struct.atomic_t* @kgdb_active, i64 0, i32 0), align 4
  call void @__sanitizer_cov_trace_cmp4(i32 %78, i32 %79)
  %cmp17.i.i = icmp eq i32 %78, %79
  br i1 %cmp17.i.i, label %do.body10.i.i.bpf_flush_icache.exit_crit_edge, label %do.body10.i.i.if.end.i.i219_crit_edge

do.body10.i.i.if.end.i.i219_crit_edge:            ; preds = %do.body10.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end.i.i219

do.body10.i.i.bpf_flush_icache.exit_crit_edge:    ; preds = %do.body10.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %bpf_flush_icache.exit

if.end.i.i219:                                    ; preds = %do.body10.i.i.if.end.i.i219_crit_edge, %if.end72.if.end.i.i219_crit_edge
  call void @kick_all_cpus_sync() #11
  br label %bpf_flush_icache.exit

bpf_flush_icache.exit:                            ; preds = %do.body10.i.i.bpf_flush_icache.exit_crit_edge, %if.end.i.i219
  %is_func = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 1
  %80 = ptrtoint i16* %is_func to i64
  call void @__asan_load2_noabort(i64 %80)
  %bf.load75 = load i16, i16* %is_func, align 2
  %bf.clear77 = and i16 %bf.load75, 64
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear77)
  %tobool78 = icmp eq i16 %bf.clear77, 0
  %brmerge = or i1 %extra_pass.0.off0, %tobool78
  br i1 %brmerge, label %if.then81, label %if.else

if.then81:                                        ; preds = %bpf_flush_icache.exit
  br i1 %extra_pass.0.off0, label %land.lhs.true, label %if.then81.if.end106_crit_edge

if.then81.if.end106_crit_edge:                    ; preds = %if.then81
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end106

land.lhs.true:                                    ; preds = %if.then81
  %81 = ptrtoint i32* %idx55 to i64
  call void @__asan_load4_noabort(i64 %81)
  %82 = load i32, i32* %idx55, align 8
  %idx86 = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 2, i32 1
  %83 = ptrtoint i32* %idx86 to i64
  call void @__asan_load4_noabort(i64 %83)
  %84 = load i32, i32* %idx86, align 8
  call void @__sanitizer_cov_trace_cmp4(i32 %82, i32 %84)
  %cmp87 = icmp eq i32 %82, %84
  br i1 %cmp87, label %land.lhs.true.if.end106_crit_edge, label %if.then89

land.lhs.true.if.end106_crit_edge:                ; preds = %land.lhs.true
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end106

if.then89:                                        ; preds = %land.lhs.true
  %.b209 = load i1, i1* @bpf_int_jit_compile.__print_once, align 1
  br i1 %.b209, label %if.then89.if.end98_crit_edge, label %if.then93

if.then89.if.end98_crit_edge:                     ; preds = %if.then89
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end98

if.then93:                                        ; preds = %if.then89
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @bpf_int_jit_compile.__print_once, align 1
  %call97 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i64 0, i64 0), i32 %82, i32 %84) #12
  br label %if.end98

if.end98:                                         ; preds = %if.then89.if.end98_crit_edge, %if.then93
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* %header.0) #11
  %bpf_func = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 9
  %85 = ptrtoint i32 (i8*, %struct.bpf_insn*)** %bpf_func to i64
  call void @__asan_store8_noabort(i64 %85)
  store i32 (i8*, %struct.bpf_insn*)* null, i32 (i8*, %struct.bpf_insn*)** %bpf_func, align 8
  %86 = ptrtoint i16* %is_func to i64
  call void @__asan_load2_noabort(i64 %86)
  %bf.load104 = load i16, i16* %is_func, align 2
  %bf.clear105 = and i16 %bf.load104, -2
  store i16 %bf.clear105, i16* %is_func, align 2
  br label %out_off

if.end106:                                        ; preds = %land.lhs.true.if.end106_crit_edge, %if.then81.if.end106_crit_edge
  %call.i.i = call %struct.vm_struct* @find_vm_area(i8* %64) #11
  %tobool.i.i = icmp eq %struct.vm_struct* %call.i.i, null
  br i1 %tobool.i.i, label %if.end106.bpf_jit_binary_lock_ro.exit_crit_edge, label %if.then.i.i

if.end106.bpf_jit_binary_lock_ro.exit_crit_edge:  ; preds = %if.end106
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %bpf_jit_binary_lock_ro.exit

if.then.i.i:                                      ; preds = %if.end106
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %flags.i.i = getelementptr inbounds %struct.vm_struct, %struct.vm_struct* %call.i.i, i64 0, i32 3
  %87 = ptrtoint i64* %flags.i.i to i64
  call void @__asan_load8_noabort(i64 %87)
  %88 = load i64, i64* %flags.i.i, align 8
  %or.i.i = or i64 %88, 256
  store i64 %or.i.i, i64* %flags.i.i, align 8
  br label %bpf_jit_binary_lock_ro.exit

bpf_jit_binary_lock_ro.exit:                      ; preds = %if.end106.bpf_jit_binary_lock_ro.exit_crit_edge, %if.then.i.i
  %pages.i = getelementptr inbounds %struct.bpf_binary_header, %struct.bpf_binary_header* %header.0, i64 0, i32 0
  %89 = ptrtoint i32* %pages.i to i64
  call void @__asan_load4_noabort(i64 %89)
  %90 = load i32, i32* %pages.i, align 8
  %call.i = call i32 @set_memory_ro(i64 %69, i32 %90) #11
  %91 = ptrtoint i32* %pages.i to i64
  call void @__asan_load4_noabort(i64 %91)
  %92 = load i32, i32* %pages.i, align 8
  %call2.i = call i32 @set_memory_x(i64 %69, i32 %92) #11
  br label %if.end110

if.else:                                          ; preds = %bpf_flush_icache.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %93 = bitcast %struct.jit_ctx* %ctx17 to i8*
  %94 = call i8* @memcpy(i8* %93, i8* %2, i64 40)
  %95 = bitcast i8** %image_ptr to i64*
  %96 = ptrtoint i64* %95 to i64
  call void @__asan_load8_noabort(i64 %96)
  %97 = load i64, i64* %95, align 8
  %image108 = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 1
  %98 = bitcast i8** %image108 to i64*
  %99 = ptrtoint i64* %98 to i64
  call void @__asan_store8_noabort(i64 %99)
  store i64 %97, i64* %98, align 8
  %header109 = getelementptr inbounds %struct.arm64_jit_data, %struct.arm64_jit_data* %jit_data.0, i64 0, i32 0
  %100 = ptrtoint %struct.bpf_binary_header** %header109 to i64
  call void @__asan_store8_noabort(i64 %100)
  store %struct.bpf_binary_header* %header.0, %struct.bpf_binary_header** %header109, align 8
  br label %if.end110

if.end110:                                        ; preds = %if.else, %bpf_jit_binary_lock_ro.exit
  %101 = bitcast i32** %image73 to i64*
  %102 = ptrtoint i64* %101 to i64
  call void @__asan_load8_noabort(i64 %102)
  %103 = load i64, i64* %101, align 8
  %bpf_func112 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 9
  %104 = bitcast i32 (i8*, %struct.bpf_insn*)** %bpf_func112 to i64*
  %105 = ptrtoint i64* %104 to i64
  call void @__asan_store8_noabort(i64 %105)
  store i64 %103, i64* %104, align 8
  %106 = ptrtoint i16* %is_func to i64
  call void @__asan_load2_noabort(i64 %106)
  %bf.load114 = load i16, i16* %is_func, align 2
  %bf.set = or i16 %bf.load114, 1
  store i16 %bf.set, i16* %is_func, align 2
  %jited_len = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %call1, i64 0, i32 5
  %107 = ptrtoint i32* %jited_len to i64
  call void @__asan_store4_noabort(i64 %107)
  store i32 %image_size.0, i32* %jited_len, align 8
  %bf.clear119 = and i16 %bf.load114, 64
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %bf.clear119)
  %tobool120 = icmp eq i16 %bf.clear119, 0
  %brmerge211 = or i1 %extra_pass.0.off0, %tobool120
  br i1 %brmerge211, label %if.then124, label %if.end110.out_crit_edge

if.end110.out_crit_edge:                          ; preds = %if.end110
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %out

if.then124:                                       ; preds = %if.end110
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %offset125 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 3
  %108 = ptrtoint i32** %offset125 to i64
  call void @__asan_load8_noabort(i64 %108)
  %109 = load i32*, i32** %offset125, align 8
  call void @bpf_prog_fill_jited_linfo(%struct.bpf_prog* %call1, i32* %109) #11
  br label %out_off

out_off:                                          ; preds = %if.end43.out_off_crit_edge, %if.end38.out_off_crit_edge, %if.end33.out_off_crit_edge, %if.end23.out_off_crit_edge, %if.then124, %if.end98, %if.then65, %if.then61
  %prog.addr.1 = phi %struct.bpf_prog* [ %prog, %if.then61 ], [ %prog, %if.then65 ], [ %call1, %if.end98 ], [ %call1, %if.then124 ], [ %prog, %if.end23.out_off_crit_edge ], [ %prog, %if.end33.out_off_crit_edge ], [ %prog, %if.end38.out_off_crit_edge ], [ %prog, %if.end43.out_off_crit_edge ]
  %offset126 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 3
  %110 = bitcast i32** %offset126 to i8**
  %111 = ptrtoint i8** %110 to i64
  call void @__asan_load8_noabort(i64 %111)
  %112 = load i8*, i8** %110, align 8
  call void @kfree(i8* %112) #11
  %113 = bitcast %struct.arm64_jit_data* %jit_data.0 to i8*
  call void @kfree(i8* %113) #11
  %aux127 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %prog.addr.1, i64 0, i32 7
  %114 = ptrtoint %struct.bpf_prog_aux** %aux127 to i64
  call void @__asan_load8_noabort(i64 %114)
  %115 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux127, align 8
  %jit_data128 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %115, i64 0, i32 23
  %116 = ptrtoint i8** %jit_data128 to i64
  call void @__asan_store8_noabort(i64 %116)
  store i8* null, i8** %jit_data128, align 8
  br label %out

out:                                              ; preds = %if.end110.out_crit_edge, %if.then9.out_crit_edge, %out_off
  %prog.addr.2 = phi %struct.bpf_prog* [ %prog.addr.1, %out_off ], [ %prog, %if.then9.out_crit_edge ], [ %call1, %if.end110.out_crit_edge ]
  br i1 %cmp, label %out.cleanup_crit_edge, label %if.then131

out.cleanup_crit_edge:                            ; preds = %out
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.then131:                                       ; preds = %out
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %cmp132 = icmp eq %struct.bpf_prog* %prog.addr.2, %prog
  %call1.prog = select i1 %cmp132, %struct.bpf_prog* %call1, %struct.bpf_prog* %prog
  call void @bpf_jit_prog_release_other(%struct.bpf_prog* %prog.addr.2, %struct.bpf_prog* %call1.prog) #11
  br label %cleanup

cleanup:                                          ; preds = %out.cleanup_crit_edge, %if.end.cleanup_crit_edge, %entry.cleanup_crit_edge, %if.then131
  %retval.0 = phi %struct.bpf_prog* [ %prog, %entry.cleanup_crit_edge ], [ %prog, %if.end.cleanup_crit_edge ], [ %prog.addr.2, %if.then131 ], [ %prog.addr.2, %out.cleanup_crit_edge ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %2) #11
  ret %struct.bpf_prog* %retval.0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

declare dso_local %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nobuiltin nofree
declare dso_local i8* @memset(i8*, i32, i64) local_unnamed_addr #3

; Function Attrs: nounwind sanitize_address shadowcallstack sspstrong
define internal fastcc i32 @build_body(%struct.jit_ctx* %ctx, i1 %extra_pass) unnamed_addr #0 {
entry:
  %func_addr_fixed.i = alloca i8, align 4
  %func_addr.i = alloca i64, align 8
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %prog1 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 0
  %0 = ptrtoint %struct.bpf_prog** %prog1 to i64
  call void @__asan_load8_noabort(i64 %0)
  %1 = load %struct.bpf_prog*, %struct.bpf_prog** %prog1, align 8
  %len = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %1, i64 0, i32 4
  %2 = ptrtoint i32* %len to i64
  call void @__asan_load4_noabort(i64 %2)
  %3 = load i32, i32* %len, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %3)
  %cmp51 = icmp eq i32 %3, 0
  br i1 %cmp51, label %entry.cleanup21_crit_edge, label %for.body.lr.ph

entry.cleanup21_crit_edge:                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup21

for.body.lr.ph:                                   ; preds = %entry
  %image.i1281.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %idx.i1283.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %offset = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 3
  %epilogue_offset.i.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 2
  %stack_size.i.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 5
  %4 = bitcast i64* %func_addr.i to i8*
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %for.body.lr.ph
  %i.052 = phi i32 [ 0, %for.body.lr.ph ], [ %inc20, %for.inc.for.body_crit_edge ]
  %idxprom = sext i32 %i.052 to i64
  %arrayidx = getelementptr %struct.bpf_prog, %struct.bpf_prog* %1, i64 0, i32 11, i64 %idxprom
  %code1.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %arrayidx, i64 0, i32 0
  %5 = ptrtoint i8* %code1.i to i64
  call void @__asan_load1_noabort(i64 %5)
  %6 = load i8, i8* %code1.i, align 4
  %dst_reg.i = getelementptr %struct.bpf_prog, %struct.bpf_prog* %1, i64 0, i32 11, i64 %idxprom, i32 1
  %7 = ptrtoint i8* %dst_reg.i to i64
  call void @__asan_load1_noabort(i64 %7)
  %bf.load.i = load i8, i8* %dst_reg.i, align 1
  %bf.clear.i = and i8 %bf.load.i, 15
  %idxprom.i = zext i8 %bf.clear.i to i64
  %arrayidx.i = getelementptr [16 x i32], [16 x i32]* @bpf2a64, i64 0, i64 %idxprom.i
  %8 = ptrtoint i32* %arrayidx.i to i64
  call void @__asan_load4_noabort(i64 %8)
  %9 = load i32, i32* %arrayidx.i, align 4
  %bf.lshr.i = lshr i8 %bf.load.i, 4
  %idxprom3.i = zext i8 %bf.lshr.i to i64
  %arrayidx4.i = getelementptr [16 x i32], [16 x i32]* @bpf2a64, i64 0, i64 %idxprom3.i
  %10 = ptrtoint i32* %arrayidx4.i to i64
  call void @__asan_load4_noabort(i64 %10)
  %11 = load i32, i32* %arrayidx4.i, align 4
  %off9.i = getelementptr %struct.bpf_prog, %struct.bpf_prog* %1, i64 0, i32 11, i64 %idxprom, i32 2
  %12 = ptrtoint i16* %off9.i to i64
  call void @__asan_load2_noabort(i64 %12)
  %13 = load i16, i16* %off9.i, align 2
  %imm10.i = getelementptr %struct.bpf_prog, %struct.bpf_prog* %1, i64 0, i32 11, i64 %idxprom, i32 3
  %14 = ptrtoint i32* %imm10.i to i64
  call void @__asan_load4_noabort(i64 %14)
  %15 = load i32, i32* %imm10.i, align 4
  %16 = ptrtoint %struct.bpf_prog** %prog1 to i64
  call void @__asan_load8_noabort(i64 %16)
  %17 = load %struct.bpf_prog*, %struct.bpf_prog** %prog1, align 8
  %arraydecay.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %17, i64 0, i32 11, i64 0
  %sub.ptr.lhs.cast.i = ptrtoint %struct.bpf_insn* %arrayidx to i64
  %sub.ptr.rhs.cast.i = ptrtoint %struct.bpf_insn* %arraydecay.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %18 = lshr exact i64 %sub.ptr.sub.i, 3
  %conv11.i = trunc i64 %18 to i32
  %conv12.i = zext i8 %6 to i32
  %and.i = and i32 %conv12.i, 5
  %19 = or i32 %and.i, 2
  call void @__sanitizer_cov_trace_const_cmp4(i32 7, i32 %19)
  %20 = icmp eq i32 %19, 7
  %and20.i = and i32 %conv12.i, 24
  call void @__sanitizer_cov_trace_const_cmp4(i32 24, i32 %and20.i)
  %cmp21.i = icmp eq i32 %and20.i, 24
  %21 = zext i8 %6 to i64
  call void @__sanitizer_cov_trace_switch(i64 %21, i64* getelementptr inbounds ([117 x i64], [117 x i64]* @__sancov_gen_cov_switch_values, i32 0, i32 0))
  switch i8 %6, label %sw.default745.i [
    i8 -68, label %for.body.sw.bb.i_crit_edge
    i8 -65, label %for.body.sw.bb.i_crit_edge54
    i8 12, label %for.body.sw.bb28.i_crit_edge
    i8 15, label %for.body.sw.bb28.i_crit_edge55
    i8 28, label %for.body.sw.bb36.i_crit_edge
    i8 31, label %for.body.sw.bb36.i_crit_edge56
    i8 92, label %for.body.sw.bb44.i_crit_edge
    i8 95, label %for.body.sw.bb44.i_crit_edge57
    i8 76, label %for.body.sw.bb52.i_crit_edge
    i8 79, label %for.body.sw.bb52.i_crit_edge58
    i8 -84, label %for.body.sw.bb60.i_crit_edge
    i8 -81, label %for.body.sw.bb60.i_crit_edge59
    i8 44, label %for.body.sw.bb68.i_crit_edge
    i8 47, label %for.body.sw.bb68.i_crit_edge60
    i8 60, label %for.body.sw.bb76.i_crit_edge
    i8 63, label %for.body.sw.bb76.i_crit_edge61
    i8 -100, label %for.body.sw.bb76.i_crit_edge62
    i8 -97, label %for.body.sw.bb76.i_crit_edge63
    i8 108, label %for.body.sw.bb103.i_crit_edge
    i8 111, label %for.body.sw.bb103.i_crit_edge64
    i8 124, label %for.body.sw.bb111.i_crit_edge
    i8 127, label %for.body.sw.bb111.i_crit_edge65
    i8 -52, label %for.body.sw.bb119.i_crit_edge
    i8 -49, label %for.body.sw.bb119.i_crit_edge66
    i8 -124, label %for.body.sw.bb127.i_crit_edge
    i8 -121, label %for.body.sw.bb127.i_crit_edge67
    i8 -44, label %for.body.sw.bb134.i_crit_edge
    i8 -36, label %for.body.sw.bb134.i_crit_edge68
    i8 -76, label %for.body.sw.bb179.i_crit_edge
    i8 -73, label %for.body.sw.bb179.i_crit_edge69
    i8 4, label %for.body.sw.bb183.i_crit_edge
    i8 7, label %for.body.sw.bb183.i_crit_edge70
    i8 20, label %for.body.sw.bb214.i_crit_edge
    i8 23, label %for.body.sw.bb214.i_crit_edge71
    i8 84, label %for.body.sw.bb247.i_crit_edge
    i8 87, label %for.body.sw.bb247.i_crit_edge72
    i8 68, label %for.body.sw.bb275.i_crit_edge
    i8 71, label %for.body.sw.bb275.i_crit_edge73
    i8 -92, label %for.body.sw.bb307.i_crit_edge
    i8 -89, label %for.body.sw.bb307.i_crit_edge74
    i8 36, label %for.body.sw.bb339.i_crit_edge
    i8 39, label %for.body.sw.bb339.i_crit_edge75
    i8 52, label %for.body.sw.bb350.i_crit_edge
    i8 55, label %for.body.sw.bb350.i_crit_edge76
    i8 -108, label %for.body.sw.bb361.i_crit_edge
    i8 -105, label %for.body.sw.bb361.i_crit_edge77
    i8 100, label %for.body.sw.bb380.i_crit_edge
    i8 103, label %for.body.sw.bb380.i_crit_edge78
    i8 116, label %for.body.sw.bb394.i_crit_edge
    i8 119, label %for.body.sw.bb394.i_crit_edge79
    i8 -60, label %for.body.sw.bb404.i_crit_edge
    i8 -57, label %for.body.sw.bb404.i_crit_edge80
    i8 5, label %sw.bb414.i
    i8 29, label %for.body.sw.bb430.i_crit_edge
    i8 45, label %for.body.sw.bb430.i_crit_edge81
    i8 -83, label %for.body.sw.bb430.i_crit_edge82
    i8 61, label %for.body.sw.bb430.i_crit_edge83
    i8 -67, label %for.body.sw.bb430.i_crit_edge84
    i8 93, label %for.body.sw.bb430.i_crit_edge85
    i8 109, label %for.body.sw.bb430.i_crit_edge86
    i8 -51, label %for.body.sw.bb430.i_crit_edge87
    i8 125, label %for.body.sw.bb430.i_crit_edge88
    i8 -35, label %for.body.sw.bb430.i_crit_edge89
    i8 30, label %for.body.sw.bb430.i_crit_edge90
    i8 46, label %for.body.sw.bb430.i_crit_edge91
    i8 -82, label %for.body.sw.bb430.i_crit_edge92
    i8 62, label %for.body.sw.bb430.i_crit_edge93
    i8 -66, label %for.body.sw.bb430.i_crit_edge94
    i8 94, label %for.body.sw.bb430.i_crit_edge95
    i8 110, label %for.body.sw.bb430.i_crit_edge96
    i8 -50, label %for.body.sw.bb430.i_crit_edge97
    i8 126, label %for.body.sw.bb430.i_crit_edge98
    i8 -34, label %for.body.sw.bb430.i_crit_edge99
    i8 77, label %for.body.sw.bb475.i_crit_edge
    i8 78, label %for.body.sw.bb475.i_crit_edge100
    i8 21, label %for.body.sw.bb482.i_crit_edge
    i8 37, label %for.body.sw.bb482.i_crit_edge101
    i8 -91, label %for.body.sw.bb482.i_crit_edge102
    i8 53, label %for.body.sw.bb482.i_crit_edge103
    i8 -75, label %for.body.sw.bb482.i_crit_edge104
    i8 85, label %for.body.sw.bb482.i_crit_edge105
    i8 101, label %for.body.sw.bb482.i_crit_edge106
    i8 -59, label %for.body.sw.bb482.i_crit_edge107
    i8 117, label %for.body.sw.bb482.i_crit_edge108
    i8 -43, label %for.body.sw.bb482.i_crit_edge109
    i8 22, label %for.body.sw.bb482.i_crit_edge110
    i8 38, label %for.body.sw.bb482.i_crit_edge111
    i8 -90, label %for.body.sw.bb482.i_crit_edge112
    i8 54, label %for.body.sw.bb482.i_crit_edge113
    i8 -74, label %for.body.sw.bb482.i_crit_edge114
    i8 86, label %for.body.sw.bb482.i_crit_edge115
    i8 102, label %for.body.sw.bb482.i_crit_edge116
    i8 -58, label %for.body.sw.bb482.i_crit_edge117
    i8 118, label %for.body.sw.bb482.i_crit_edge118
    i8 -42, label %for.body.sw.bb482.i_crit_edge119
    i8 69, label %for.body.sw.bb512.i_crit_edge
    i8 70, label %for.body.sw.bb512.i_crit_edge120
    i8 -123, label %sw.bb542.i
    i8 -11, label %sw.bb559.i
    i8 -107, label %sw.bb564.i
    i8 24, label %sw.bb593.i
    i8 97, label %for.body.sw.bb603.i_crit_edge
    i8 105, label %for.body.sw.bb603.i_crit_edge121
    i8 113, label %for.body.sw.bb603.i_crit_edge122
    i8 121, label %for.body.sw.bb603.i_crit_edge123
    i8 98, label %for.body.sw.bb629.i_crit_edge
    i8 106, label %for.body.sw.bb629.i_crit_edge124
    i8 114, label %for.body.sw.bb629.i_crit_edge125
    i8 122, label %for.body.sw.bb629.i_crit_edge126
    i8 99, label %for.body.sw.bb656.i_crit_edge
    i8 107, label %for.body.sw.bb656.i_crit_edge127
    i8 115, label %for.body.sw.bb656.i_crit_edge128
    i8 123, label %for.body.sw.bb656.i_crit_edge129
    i8 -61, label %for.body.sw.bb682.i_crit_edge
    i8 -37, label %for.body.sw.bb682.i_crit_edge130
  ]

for.body.sw.bb682.i_crit_edge130:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb682.i

for.body.sw.bb682.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb682.i

for.body.sw.bb656.i_crit_edge129:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb656.i

for.body.sw.bb656.i_crit_edge128:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb656.i

for.body.sw.bb656.i_crit_edge127:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb656.i

for.body.sw.bb656.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb656.i

for.body.sw.bb629.i_crit_edge126:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb629.i

for.body.sw.bb629.i_crit_edge125:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb629.i

for.body.sw.bb629.i_crit_edge124:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb629.i

for.body.sw.bb629.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb629.i

for.body.sw.bb603.i_crit_edge123:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb603.i

for.body.sw.bb603.i_crit_edge122:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb603.i

for.body.sw.bb603.i_crit_edge121:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb603.i

for.body.sw.bb603.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb603.i

for.body.sw.bb512.i_crit_edge120:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb512.i

for.body.sw.bb512.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb512.i

for.body.sw.bb482.i_crit_edge119:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge118:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge117:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge116:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge115:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge114:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge113:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge112:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge111:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge110:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge109:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge108:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge107:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge106:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge105:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge104:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge103:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge102:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge101:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb482.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb482.i

for.body.sw.bb475.i_crit_edge100:                 ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb475.i

for.body.sw.bb475.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb475.i

for.body.sw.bb430.i_crit_edge99:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge98:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge97:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge96:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge95:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge94:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge93:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge92:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge91:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge90:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge89:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge88:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge87:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge86:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge85:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge84:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge83:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge82:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge81:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb430.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb430.i

for.body.sw.bb404.i_crit_edge80:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb404.i

for.body.sw.bb404.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb404.i

for.body.sw.bb394.i_crit_edge79:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb394.i

for.body.sw.bb394.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb394.i

for.body.sw.bb380.i_crit_edge78:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb380.i

for.body.sw.bb380.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb380.i

for.body.sw.bb361.i_crit_edge77:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb361.i

for.body.sw.bb361.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb361.i

for.body.sw.bb350.i_crit_edge76:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb350.i

for.body.sw.bb350.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb350.i

for.body.sw.bb339.i_crit_edge75:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb339.i

for.body.sw.bb339.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb339.i

for.body.sw.bb307.i_crit_edge74:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb307.i

for.body.sw.bb307.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb307.i

for.body.sw.bb275.i_crit_edge73:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb275.i

for.body.sw.bb275.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb275.i

for.body.sw.bb247.i_crit_edge72:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb247.i

for.body.sw.bb247.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb247.i

for.body.sw.bb214.i_crit_edge71:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb214.i

for.body.sw.bb214.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb214.i

for.body.sw.bb183.i_crit_edge70:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb183.i

for.body.sw.bb183.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb183.i

for.body.sw.bb179.i_crit_edge69:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb179.i

for.body.sw.bb179.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb179.i

for.body.sw.bb134.i_crit_edge68:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb134.i

for.body.sw.bb134.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb134.i

for.body.sw.bb127.i_crit_edge67:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb127.i

for.body.sw.bb127.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb127.i

for.body.sw.bb119.i_crit_edge66:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb119.i

for.body.sw.bb119.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb119.i

for.body.sw.bb111.i_crit_edge65:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb111.i

for.body.sw.bb111.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb111.i

for.body.sw.bb103.i_crit_edge64:                  ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb103.i

for.body.sw.bb103.i_crit_edge:                    ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb103.i

for.body.sw.bb76.i_crit_edge63:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb76.i

for.body.sw.bb76.i_crit_edge62:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb76.i

for.body.sw.bb76.i_crit_edge61:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb76.i

for.body.sw.bb76.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb76.i

for.body.sw.bb68.i_crit_edge60:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb68.i

for.body.sw.bb68.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb68.i

for.body.sw.bb60.i_crit_edge59:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb60.i

for.body.sw.bb60.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb60.i

for.body.sw.bb52.i_crit_edge58:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb52.i

for.body.sw.bb52.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb52.i

for.body.sw.bb44.i_crit_edge57:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb44.i

for.body.sw.bb44.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb44.i

for.body.sw.bb36.i_crit_edge56:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb36.i

for.body.sw.bb36.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb36.i

for.body.sw.bb28.i_crit_edge55:                   ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb28.i

for.body.sw.bb28.i_crit_edge:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb28.i

for.body.sw.bb.i_crit_edge54:                     ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

for.body.sw.bb.i_crit_edge:                       ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %sw.bb.i

sw.bb.i:                                          ; preds = %for.body.sw.bb.i_crit_edge54, %for.body.sw.bb.i_crit_edge
  %conv25.i = and i32 %9, 255
  %conv26.i = and i32 %11, 255
  %cond.i = zext i1 %20 to i32
  %call.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 %conv25.i, i32 %conv26.i, i32 0, i32 %cond.i, i32 0) #11
  %22 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %22)
  %23 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i.i = icmp eq i32* %23, null
  br i1 %cmp.i.i, label %sw.bb.i.emit.exit.i_crit_edge, label %if.then.i.i

sw.bb.i.emit.exit.i_crit_edge:                    ; preds = %sw.bb.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit.i

if.then.i.i:                                      ; preds = %sw.bb.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %24 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %24)
  %25 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i.i = sext i32 %25 to i64
  %arrayidx.i.i = getelementptr i32, i32* %23, i64 %idxprom.i.i
  %26 = ptrtoint i32* %arrayidx.i.i to i64
  call void @__asan_store4_noabort(i64 %26)
  store i32 %call.i, i32* %arrayidx.i.i, align 4
  br label %emit.exit.i

emit.exit.i:                                      ; preds = %sw.bb.i.emit.exit.i_crit_edge, %if.then.i.i
  %27 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %27)
  %28 = load i32, i32* %idx.i1283.i, align 8
  %inc.i.i = add i32 %28, 1
  store i32 %inc.i.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb28.i:                                        ; preds = %for.body.sw.bb28.i_crit_edge55, %for.body.sw.bb28.i_crit_edge
  %conv29.i = and i32 %9, 255
  %conv31.i = and i32 %11, 255
  %cond34.i = zext i1 %20 to i32
  %call35.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 %conv29.i, i32 %conv29.i, i32 %conv31.i, i32 0, i32 %cond34.i, i32 0) #11
  %29 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %29)
  %30 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1291.i = icmp eq i32* %30, null
  br i1 %cmp.i1291.i, label %sw.bb28.i.emit.exit1298.i_crit_edge, label %if.then.i1295.i

sw.bb28.i.emit.exit1298.i_crit_edge:              ; preds = %sw.bb28.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1298.i

if.then.i1295.i:                                  ; preds = %sw.bb28.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %31 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %31)
  %32 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1293.i = sext i32 %32 to i64
  %arrayidx.i1294.i = getelementptr i32, i32* %30, i64 %idxprom.i1293.i
  %33 = ptrtoint i32* %arrayidx.i1294.i to i64
  call void @__asan_store4_noabort(i64 %33)
  store i32 %call35.i, i32* %arrayidx.i1294.i, align 4
  br label %emit.exit1298.i

emit.exit1298.i:                                  ; preds = %sw.bb28.i.emit.exit1298.i_crit_edge, %if.then.i1295.i
  %34 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %34)
  %35 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1297.i = add i32 %35, 1
  store i32 %inc.i1297.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb36.i:                                        ; preds = %for.body.sw.bb36.i_crit_edge56, %for.body.sw.bb36.i_crit_edge
  %conv37.i = and i32 %9, 255
  %conv39.i = and i32 %11, 255
  %cond42.i = zext i1 %20 to i32
  %call43.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 %conv37.i, i32 %conv37.i, i32 %conv39.i, i32 0, i32 %cond42.i, i32 1) #11
  %36 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %36)
  %37 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1336.i = icmp eq i32* %37, null
  br i1 %cmp.i1336.i, label %sw.bb36.i.emit.exit1343.i_crit_edge, label %if.then.i1340.i

sw.bb36.i.emit.exit1343.i_crit_edge:              ; preds = %sw.bb36.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1343.i

if.then.i1340.i:                                  ; preds = %sw.bb36.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %38 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %38)
  %39 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1338.i = sext i32 %39 to i64
  %arrayidx.i1339.i = getelementptr i32, i32* %37, i64 %idxprom.i1338.i
  %40 = ptrtoint i32* %arrayidx.i1339.i to i64
  call void @__asan_store4_noabort(i64 %40)
  store i32 %call43.i, i32* %arrayidx.i1339.i, align 4
  br label %emit.exit1343.i

emit.exit1343.i:                                  ; preds = %sw.bb36.i.emit.exit1343.i_crit_edge, %if.then.i1340.i
  %41 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %41)
  %42 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1342.i = add i32 %42, 1
  store i32 %inc.i1342.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb44.i:                                        ; preds = %for.body.sw.bb44.i_crit_edge57, %for.body.sw.bb44.i_crit_edge
  %conv45.i = and i32 %9, 255
  %conv47.i = and i32 %11, 255
  %cond50.i = zext i1 %20 to i32
  %call51.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 %conv45.i, i32 %conv45.i, i32 %conv47.i, i32 0, i32 %cond50.i, i32 0) #11
  %43 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %43)
  %44 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1381.i = icmp eq i32* %44, null
  br i1 %cmp.i1381.i, label %sw.bb44.i.emit.exit1388.i_crit_edge, label %if.then.i1385.i

sw.bb44.i.emit.exit1388.i_crit_edge:              ; preds = %sw.bb44.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1388.i

if.then.i1385.i:                                  ; preds = %sw.bb44.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %45 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %45)
  %46 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1383.i = sext i32 %46 to i64
  %arrayidx.i1384.i = getelementptr i32, i32* %44, i64 %idxprom.i1383.i
  %47 = ptrtoint i32* %arrayidx.i1384.i to i64
  call void @__asan_store4_noabort(i64 %47)
  store i32 %call51.i, i32* %arrayidx.i1384.i, align 4
  br label %emit.exit1388.i

emit.exit1388.i:                                  ; preds = %sw.bb44.i.emit.exit1388.i_crit_edge, %if.then.i1385.i
  %48 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %48)
  %49 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1387.i = add i32 %49, 1
  store i32 %inc.i1387.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb52.i:                                        ; preds = %for.body.sw.bb52.i_crit_edge58, %for.body.sw.bb52.i_crit_edge
  %conv53.i = and i32 %9, 255
  %conv55.i = and i32 %11, 255
  %cond58.i = zext i1 %20 to i32
  %call59.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 %conv53.i, i32 %conv53.i, i32 %conv55.i, i32 0, i32 %cond58.i, i32 2) #11
  %50 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %50)
  %51 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1390.i = icmp eq i32* %51, null
  br i1 %cmp.i1390.i, label %sw.bb52.i.emit.exit1397.i_crit_edge, label %if.then.i1394.i

sw.bb52.i.emit.exit1397.i_crit_edge:              ; preds = %sw.bb52.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1397.i

if.then.i1394.i:                                  ; preds = %sw.bb52.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %52 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %52)
  %53 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1392.i = sext i32 %53 to i64
  %arrayidx.i1393.i = getelementptr i32, i32* %51, i64 %idxprom.i1392.i
  %54 = ptrtoint i32* %arrayidx.i1393.i to i64
  call void @__asan_store4_noabort(i64 %54)
  store i32 %call59.i, i32* %arrayidx.i1393.i, align 4
  br label %emit.exit1397.i

emit.exit1397.i:                                  ; preds = %sw.bb52.i.emit.exit1397.i_crit_edge, %if.then.i1394.i
  %55 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %55)
  %56 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1396.i = add i32 %56, 1
  store i32 %inc.i1396.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb60.i:                                        ; preds = %for.body.sw.bb60.i_crit_edge59, %for.body.sw.bb60.i_crit_edge
  %conv61.i = and i32 %9, 255
  %conv63.i = and i32 %11, 255
  %cond66.i = zext i1 %20 to i32
  %call67.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 %conv61.i, i32 %conv61.i, i32 %conv63.i, i32 0, i32 %cond66.i, i32 4) #11
  %57 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %57)
  %58 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1435.i = icmp eq i32* %58, null
  br i1 %cmp.i1435.i, label %sw.bb60.i.emit.exit1442.i_crit_edge, label %if.then.i1439.i

sw.bb60.i.emit.exit1442.i_crit_edge:              ; preds = %sw.bb60.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1442.i

if.then.i1439.i:                                  ; preds = %sw.bb60.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %59 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %59)
  %60 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1437.i = sext i32 %60 to i64
  %arrayidx.i1438.i = getelementptr i32, i32* %58, i64 %idxprom.i1437.i
  %61 = ptrtoint i32* %arrayidx.i1438.i to i64
  call void @__asan_store4_noabort(i64 %61)
  store i32 %call67.i, i32* %arrayidx.i1438.i, align 4
  br label %emit.exit1442.i

emit.exit1442.i:                                  ; preds = %sw.bb60.i.emit.exit1442.i_crit_edge, %if.then.i1439.i
  %62 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %62)
  %63 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1441.i = add i32 %63, 1
  store i32 %inc.i1441.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb68.i:                                        ; preds = %for.body.sw.bb68.i_crit_edge60, %for.body.sw.bb68.i_crit_edge
  %conv69.i = and i32 %9, 255
  %conv71.i = and i32 %11, 255
  %cond74.i = zext i1 %20 to i32
  %call75.i = call i32 @aarch64_insn_gen_data3(i32 %conv69.i, i32 31, i32 %conv69.i, i32 %conv71.i, i32 %cond74.i, i32 0) #11
  %64 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %64)
  %65 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1447.i = icmp eq i32* %65, null
  br i1 %cmp.i1447.i, label %sw.bb68.i.emit.exit1455.i_crit_edge, label %if.then.i1451.i

sw.bb68.i.emit.exit1455.i_crit_edge:              ; preds = %sw.bb68.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1455.i

if.then.i1451.i:                                  ; preds = %sw.bb68.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %66 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %66)
  %67 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1449.i = sext i32 %67 to i64
  %arrayidx.i1450.i = getelementptr i32, i32* %65, i64 %idxprom.i1449.i
  %68 = ptrtoint i32* %arrayidx.i1450.i to i64
  call void @__asan_store4_noabort(i64 %68)
  store i32 %call75.i, i32* %arrayidx.i1450.i, align 4
  br label %emit.exit1455.i

emit.exit1455.i:                                  ; preds = %sw.bb68.i.emit.exit1455.i_crit_edge, %if.then.i1451.i
  %69 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %69)
  %70 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1453.i = add i32 %70, 1
  store i32 %inc.i1453.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb76.i:                                        ; preds = %for.body.sw.bb76.i_crit_edge63, %for.body.sw.bb76.i_crit_edge62, %for.body.sw.bb76.i_crit_edge61, %for.body.sw.bb76.i_crit_edge
  %and78.i = and i8 %6, -16
  %71 = zext i8 %and78.i to i64
  call void @__sanitizer_cov_trace_switch(i64 %71, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__sancov_gen_cov_switch_values.8, i32 0, i32 0))
  switch i8 %and78.i, label %sw.bb76.i.if.end7_crit_edge [
    i8 48, label %sw.bb79.i
    i8 -112, label %sw.bb87.i
  ]

sw.bb76.i.if.end7_crit_edge:                      ; preds = %sw.bb76.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

sw.bb79.i:                                        ; preds = %sw.bb76.i
  %conv80.i = and i32 %9, 255
  %conv82.i = and i32 %11, 255
  %cond85.i = zext i1 %20 to i32
  %call86.i = call i32 @aarch64_insn_gen_data2(i32 %conv80.i, i32 %conv80.i, i32 %conv82.i, i32 %cond85.i, i32 0) #11
  %72 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %72)
  %73 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1457.i = icmp eq i32* %73, null
  br i1 %cmp.i1457.i, label %sw.bb79.i.emit.exit1465.i_crit_edge, label %if.then.i1461.i

sw.bb79.i.emit.exit1465.i_crit_edge:              ; preds = %sw.bb79.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1465.i

if.then.i1461.i:                                  ; preds = %sw.bb79.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %74 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %74)
  %75 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1459.i = sext i32 %75 to i64
  %arrayidx.i1460.i = getelementptr i32, i32* %73, i64 %idxprom.i1459.i
  %76 = ptrtoint i32* %arrayidx.i1460.i to i64
  call void @__asan_store4_noabort(i64 %76)
  store i32 %call86.i, i32* %arrayidx.i1460.i, align 4
  br label %emit.exit1465.i

emit.exit1465.i:                                  ; preds = %sw.bb79.i.emit.exit1465.i_crit_edge, %if.then.i1461.i
  %77 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %77)
  %78 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1463.i = add i32 %78, 1
  store i32 %inc.i1463.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb87.i:                                        ; preds = %sw.bb76.i
  %conv89.i = and i32 %9, 255
  %conv90.i = and i32 %11, 255
  %cond93.i = zext i1 %20 to i32
  %call94.i = call i32 @aarch64_insn_gen_data2(i32 10, i32 %conv89.i, i32 %conv90.i, i32 %cond93.i, i32 0) #11
  %79 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %79)
  %80 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1467.i = icmp eq i32* %80, null
  br i1 %cmp.i1467.i, label %sw.bb87.i.emit.exit1475.i_crit_edge, label %if.then.i1471.i

sw.bb87.i.emit.exit1475.i_crit_edge:              ; preds = %sw.bb87.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1475.i

if.then.i1471.i:                                  ; preds = %sw.bb87.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %81 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %81)
  %82 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1469.i = sext i32 %82 to i64
  %arrayidx.i1470.i = getelementptr i32, i32* %80, i64 %idxprom.i1469.i
  %83 = ptrtoint i32* %arrayidx.i1470.i to i64
  call void @__asan_store4_noabort(i64 %83)
  store i32 %call94.i, i32* %arrayidx.i1470.i, align 4
  br label %emit.exit1475.i

emit.exit1475.i:                                  ; preds = %sw.bb87.i.emit.exit1475.i_crit_edge, %if.then.i1471.i
  %84 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %84)
  %85 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1473.i = add i32 %85, 1
  store i32 %inc.i1473.i, i32* %idx.i1283.i, align 8
  %call102.i = call i32 @aarch64_insn_gen_data3(i32 %conv89.i, i32 %conv89.i, i32 10, i32 %conv90.i, i32 %cond93.i, i32 1) #11
  %86 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %86)
  %87 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1477.i = icmp eq i32* %87, null
  br i1 %cmp.i1477.i, label %emit.exit1475.i.emit.exit1485.i_crit_edge, label %if.then.i1481.i

emit.exit1475.i.emit.exit1485.i_crit_edge:        ; preds = %emit.exit1475.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1485.i

if.then.i1481.i:                                  ; preds = %emit.exit1475.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %88 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %88)
  %89 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1479.i = sext i32 %89 to i64
  %arrayidx.i1480.i = getelementptr i32, i32* %87, i64 %idxprom.i1479.i
  %90 = ptrtoint i32* %arrayidx.i1480.i to i64
  call void @__asan_store4_noabort(i64 %90)
  store i32 %call102.i, i32* %arrayidx.i1480.i, align 4
  br label %emit.exit1485.i

emit.exit1485.i:                                  ; preds = %emit.exit1475.i.emit.exit1485.i_crit_edge, %if.then.i1481.i
  %91 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %91)
  %92 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1483.i = add i32 %92, 1
  store i32 %inc.i1483.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb103.i:                                       ; preds = %for.body.sw.bb103.i_crit_edge64, %for.body.sw.bb103.i_crit_edge
  %conv104.i = and i32 %9, 255
  %conv106.i = and i32 %11, 255
  %cond109.i = zext i1 %20 to i32
  %call110.i = call i32 @aarch64_insn_gen_data2(i32 %conv104.i, i32 %conv104.i, i32 %conv106.i, i32 %cond109.i, i32 2) #11
  %93 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %93)
  %94 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1508.i = icmp eq i32* %94, null
  br i1 %cmp.i1508.i, label %sw.bb103.i.emit.exit1516.i_crit_edge, label %if.then.i1512.i

sw.bb103.i.emit.exit1516.i_crit_edge:             ; preds = %sw.bb103.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1516.i

if.then.i1512.i:                                  ; preds = %sw.bb103.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %95 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %95)
  %96 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1510.i = sext i32 %96 to i64
  %arrayidx.i1511.i = getelementptr i32, i32* %94, i64 %idxprom.i1510.i
  %97 = ptrtoint i32* %arrayidx.i1511.i to i64
  call void @__asan_store4_noabort(i64 %97)
  store i32 %call110.i, i32* %arrayidx.i1511.i, align 4
  br label %emit.exit1516.i

emit.exit1516.i:                                  ; preds = %sw.bb103.i.emit.exit1516.i_crit_edge, %if.then.i1512.i
  %98 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %98)
  %99 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1514.i = add i32 %99, 1
  store i32 %inc.i1514.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb111.i:                                       ; preds = %for.body.sw.bb111.i_crit_edge65, %for.body.sw.bb111.i_crit_edge
  %conv112.i = and i32 %9, 255
  %conv114.i = and i32 %11, 255
  %cond117.i = zext i1 %20 to i32
  %call118.i = call i32 @aarch64_insn_gen_data2(i32 %conv112.i, i32 %conv112.i, i32 %conv114.i, i32 %cond117.i, i32 3) #11
  %100 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %100)
  %101 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1518.i = icmp eq i32* %101, null
  br i1 %cmp.i1518.i, label %sw.bb111.i.emit.exit1526.i_crit_edge, label %if.then.i1522.i

sw.bb111.i.emit.exit1526.i_crit_edge:             ; preds = %sw.bb111.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1526.i

if.then.i1522.i:                                  ; preds = %sw.bb111.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %102 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %102)
  %103 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1520.i = sext i32 %103 to i64
  %arrayidx.i1521.i = getelementptr i32, i32* %101, i64 %idxprom.i1520.i
  %104 = ptrtoint i32* %arrayidx.i1521.i to i64
  call void @__asan_store4_noabort(i64 %104)
  store i32 %call118.i, i32* %arrayidx.i1521.i, align 4
  br label %emit.exit1526.i

emit.exit1526.i:                                  ; preds = %sw.bb111.i.emit.exit1526.i_crit_edge, %if.then.i1522.i
  %105 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %105)
  %106 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1524.i = add i32 %106, 1
  store i32 %inc.i1524.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb119.i:                                       ; preds = %for.body.sw.bb119.i_crit_edge66, %for.body.sw.bb119.i_crit_edge
  %conv120.i = and i32 %9, 255
  %conv122.i = and i32 %11, 255
  %cond125.i = zext i1 %20 to i32
  %call126.i = call i32 @aarch64_insn_gen_data2(i32 %conv120.i, i32 %conv120.i, i32 %conv122.i, i32 %cond125.i, i32 4) #11
  %107 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %107)
  %108 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1528.i = icmp eq i32* %108, null
  br i1 %cmp.i1528.i, label %sw.bb119.i.emit.exit1536.i_crit_edge, label %if.then.i1532.i

sw.bb119.i.emit.exit1536.i_crit_edge:             ; preds = %sw.bb119.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1536.i

if.then.i1532.i:                                  ; preds = %sw.bb119.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %109 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %109)
  %110 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1530.i = sext i32 %110 to i64
  %arrayidx.i1531.i = getelementptr i32, i32* %108, i64 %idxprom.i1530.i
  %111 = ptrtoint i32* %arrayidx.i1531.i to i64
  call void @__asan_store4_noabort(i64 %111)
  store i32 %call126.i, i32* %arrayidx.i1531.i, align 4
  br label %emit.exit1536.i

emit.exit1536.i:                                  ; preds = %sw.bb119.i.emit.exit1536.i_crit_edge, %if.then.i1532.i
  %112 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %112)
  %113 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1534.i = add i32 %113, 1
  store i32 %inc.i1534.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb127.i:                                       ; preds = %for.body.sw.bb127.i_crit_edge67, %for.body.sw.bb127.i_crit_edge
  %conv128.i = and i32 %9, 255
  %cond132.i = zext i1 %20 to i32
  %call133.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 %conv128.i, i32 31, i32 %conv128.i, i32 0, i32 %cond132.i, i32 1) #11
  %114 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %114)
  %115 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1538.i = icmp eq i32* %115, null
  br i1 %cmp.i1538.i, label %sw.bb127.i.emit.exit1546.i_crit_edge, label %if.then.i1542.i

sw.bb127.i.emit.exit1546.i_crit_edge:             ; preds = %sw.bb127.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1546.i

if.then.i1542.i:                                  ; preds = %sw.bb127.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %116 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %116)
  %117 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1540.i = sext i32 %117 to i64
  %arrayidx.i1541.i = getelementptr i32, i32* %115, i64 %idxprom.i1540.i
  %118 = ptrtoint i32* %arrayidx.i1541.i to i64
  call void @__asan_store4_noabort(i64 %118)
  store i32 %call133.i, i32* %arrayidx.i1541.i, align 4
  br label %emit.exit1546.i

emit.exit1546.i:                                  ; preds = %sw.bb127.i.emit.exit1546.i_crit_edge, %if.then.i1542.i
  %119 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %119)
  %120 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1544.i = add i32 %120, 1
  store i32 %inc.i1544.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb134.i:                                       ; preds = %for.body.sw.bb134.i_crit_edge68, %for.body.sw.bb134.i_crit_edge
  %and136.i = and i32 %conv12.i, 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and136.i)
  %cmp137.i = icmp eq i32 %and136.i, 0
  br i1 %cmp137.i, label %emit_bswap_uxt.i, label %if.end.i

if.end.i:                                         ; preds = %sw.bb134.i
  %121 = zext i32 %15 to i64
  call void @__sanitizer_cov_trace_switch(i64 %121, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__sancov_gen_cov_switch_values.9, i32 0, i32 0))
  switch i32 %15, label %if.end.i.if.end7_crit_edge [
    i32 16, label %sw.bb139.i
    i32 32, label %sw.bb152.i
    i32 64, label %sw.bb159.i
  ]

if.end.i.if.end7_crit_edge:                       ; preds = %if.end.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

sw.bb139.i:                                       ; preds = %if.end.i
  %conv140.i = and i32 %9, 255
  %cond144.i = zext i1 %20 to i32
  %call145.i = call i32 @aarch64_insn_gen_data1(i32 %conv140.i, i32 %conv140.i, i32 %cond144.i, i32 0) #11
  %122 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %122)
  %123 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1548.i = icmp eq i32* %123, null
  br i1 %cmp.i1548.i, label %sw.bb139.i.emit.exit1556.i_crit_edge, label %if.then.i1552.i

sw.bb139.i.emit.exit1556.i_crit_edge:             ; preds = %sw.bb139.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1556.i

if.then.i1552.i:                                  ; preds = %sw.bb139.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %124 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %124)
  %125 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1550.i = sext i32 %125 to i64
  %arrayidx.i1551.i = getelementptr i32, i32* %123, i64 %idxprom.i1550.i
  %126 = ptrtoint i32* %arrayidx.i1551.i to i64
  call void @__asan_store4_noabort(i64 %126)
  store i32 %call145.i, i32* %arrayidx.i1551.i, align 4
  br label %emit.exit1556.i

emit.exit1556.i:                                  ; preds = %sw.bb139.i.emit.exit1556.i_crit_edge, %if.then.i1552.i
  %127 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %127)
  %128 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1554.i = add i32 %128, 1
  store i32 %inc.i1554.i, i32* %idx.i1283.i, align 8
  %call151.i = call i32 @aarch64_insn_gen_bitfield(i32 %conv140.i, i32 %conv140.i, i32 0, i32 15, i32 %cond144.i, i32 1) #11
  %129 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %129)
  %130 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1558.i = icmp eq i32* %130, null
  br i1 %cmp.i1558.i, label %emit.exit1556.i.emit.exit1566.i_crit_edge, label %if.then.i1562.i

emit.exit1556.i.emit.exit1566.i_crit_edge:        ; preds = %emit.exit1556.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1566.i

if.then.i1562.i:                                  ; preds = %emit.exit1556.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %131 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %131)
  %132 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1560.i = sext i32 %132 to i64
  %arrayidx.i1561.i = getelementptr i32, i32* %130, i64 %idxprom.i1560.i
  %133 = ptrtoint i32* %arrayidx.i1561.i to i64
  call void @__asan_store4_noabort(i64 %133)
  store i32 %call151.i, i32* %arrayidx.i1561.i, align 4
  br label %emit.exit1566.i

emit.exit1566.i:                                  ; preds = %emit.exit1556.i.emit.exit1566.i_crit_edge, %if.then.i1562.i
  %134 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %134)
  %135 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1564.i = add i32 %135, 1
  store i32 %inc.i1564.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb152.i:                                       ; preds = %if.end.i
  %conv153.i = and i32 %9, 255
  %cond157.i = zext i1 %20 to i32
  %call158.i = call i32 @aarch64_insn_gen_data1(i32 %conv153.i, i32 %conv153.i, i32 %cond157.i, i32 1) #11
  %136 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %136)
  %137 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1568.i = icmp eq i32* %137, null
  br i1 %cmp.i1568.i, label %sw.bb152.i.emit.exit1576.i_crit_edge, label %if.then.i1572.i

sw.bb152.i.emit.exit1576.i_crit_edge:             ; preds = %sw.bb152.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1576.i

if.then.i1572.i:                                  ; preds = %sw.bb152.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %138 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %138)
  %139 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1570.i = sext i32 %139 to i64
  %arrayidx.i1571.i = getelementptr i32, i32* %137, i64 %idxprom.i1570.i
  %140 = ptrtoint i32* %arrayidx.i1571.i to i64
  call void @__asan_store4_noabort(i64 %140)
  store i32 %call158.i, i32* %arrayidx.i1571.i, align 4
  br label %emit.exit1576.i

emit.exit1576.i:                                  ; preds = %sw.bb152.i.emit.exit1576.i_crit_edge, %if.then.i1572.i
  %141 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %141)
  %142 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1574.i = add i32 %142, 1
  store i32 %inc.i1574.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb159.i:                                       ; preds = %if.end.i
  %conv160.i = and i32 %9, 255
  %call162.i = call i32 @aarch64_insn_gen_data1(i32 %conv160.i, i32 %conv160.i, i32 1, i32 2) #11
  %143 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %143)
  %144 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1578.i = icmp eq i32* %144, null
  br i1 %cmp.i1578.i, label %sw.bb159.i.emit.exit1586.i_crit_edge, label %if.then.i1582.i

sw.bb159.i.emit.exit1586.i_crit_edge:             ; preds = %sw.bb159.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1586.i

if.then.i1582.i:                                  ; preds = %sw.bb159.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %145 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %145)
  %146 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1580.i = sext i32 %146 to i64
  %arrayidx.i1581.i = getelementptr i32, i32* %144, i64 %idxprom.i1580.i
  %147 = ptrtoint i32* %arrayidx.i1581.i to i64
  call void @__asan_store4_noabort(i64 %147)
  store i32 %call162.i, i32* %arrayidx.i1581.i, align 4
  br label %emit.exit1586.i

emit.exit1586.i:                                  ; preds = %sw.bb159.i.emit.exit1586.i_crit_edge, %if.then.i1582.i
  %148 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %148)
  %149 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1584.i = add i32 %149, 1
  store i32 %inc.i1584.i, i32* %idx.i1283.i, align 8
  br label %if.end7

emit_bswap_uxt.i:                                 ; preds = %sw.bb134.i
  %150 = zext i32 %15 to i64
  call void @__sanitizer_cov_trace_switch(i64 %150, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__sancov_gen_cov_switch_values.10, i32 0, i32 0))
  switch i32 %15, label %emit_bswap_uxt.i.if.end7_crit_edge [
    i32 16, label %sw.bb164.i
    i32 32, label %sw.bb171.i
  ]

emit_bswap_uxt.i.if.end7_crit_edge:               ; preds = %emit_bswap_uxt.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

sw.bb164.i:                                       ; preds = %emit_bswap_uxt.i
  %conv165.i = and i32 %9, 255
  %cond169.i = zext i1 %20 to i32
  %call170.i = call i32 @aarch64_insn_gen_bitfield(i32 %conv165.i, i32 %conv165.i, i32 0, i32 15, i32 %cond169.i, i32 1) #11
  %151 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %151)
  %152 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1588.i = icmp eq i32* %152, null
  br i1 %cmp.i1588.i, label %sw.bb164.i.emit.exit1596.i_crit_edge, label %if.then.i1592.i

sw.bb164.i.emit.exit1596.i_crit_edge:             ; preds = %sw.bb164.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1596.i

if.then.i1592.i:                                  ; preds = %sw.bb164.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %153 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %153)
  %154 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1590.i = sext i32 %154 to i64
  %arrayidx.i1591.i = getelementptr i32, i32* %152, i64 %idxprom.i1590.i
  %155 = ptrtoint i32* %arrayidx.i1591.i to i64
  call void @__asan_store4_noabort(i64 %155)
  store i32 %call170.i, i32* %arrayidx.i1591.i, align 4
  br label %emit.exit1596.i

emit.exit1596.i:                                  ; preds = %sw.bb164.i.emit.exit1596.i_crit_edge, %if.then.i1592.i
  %156 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %156)
  %157 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1594.i = add i32 %157, 1
  store i32 %inc.i1594.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb171.i:                                       ; preds = %emit_bswap_uxt.i
  %conv172.i = and i32 %9, 255
  %cond176.i = zext i1 %20 to i32
  %call177.i = call i32 @aarch64_insn_gen_bitfield(i32 %conv172.i, i32 %conv172.i, i32 0, i32 31, i32 %cond176.i, i32 1) #11
  %158 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %158)
  %159 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1598.i = icmp eq i32* %159, null
  br i1 %cmp.i1598.i, label %sw.bb171.i.emit.exit1606.i_crit_edge, label %if.then.i1602.i

sw.bb171.i.emit.exit1606.i_crit_edge:             ; preds = %sw.bb171.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1606.i

if.then.i1602.i:                                  ; preds = %sw.bb171.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %160 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %160)
  %161 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1600.i = sext i32 %161 to i64
  %arrayidx.i1601.i = getelementptr i32, i32* %159, i64 %idxprom.i1600.i
  %162 = ptrtoint i32* %arrayidx.i1601.i to i64
  call void @__asan_store4_noabort(i64 %162)
  store i32 %call177.i, i32* %arrayidx.i1601.i, align 4
  br label %emit.exit1606.i

emit.exit1606.i:                                  ; preds = %sw.bb171.i.emit.exit1606.i_crit_edge, %if.then.i1602.i
  %163 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %163)
  %164 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1604.i = add i32 %164, 1
  store i32 %inc.i1604.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb179.i:                                       ; preds = %for.body.sw.bb179.i_crit_edge69, %for.body.sw.bb179.i_crit_edge
  %conv181.i = zext i1 %20 to i32
  %conv182.i = and i32 %9, 255
  call fastcc void @emit_a64_mov_i(i32 %conv181.i, i32 %conv182.i, i32 %15, %struct.jit_ctx* %ctx) #11
  br label %if.end7

sw.bb183.i:                                       ; preds = %for.body.sw.bb183.i_crit_edge70, %for.body.sw.bb183.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp4(i32 4096, i32 %15)
  %tobool.i1607.i = icmp ult i32 %15, 4096
  %and1.i.i = and i32 %15, -16773121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and1.i.i)
  %tobool2.i.i = icmp eq i32 %and1.i.i, 0
  %165 = or i1 %tobool.i1607.i, %tobool2.i.i
  br i1 %165, label %if.then185.i, label %if.else.i

if.then185.i:                                     ; preds = %sw.bb183.i
  %conv186.i = and i32 %9, 255
  %cond190.i = zext i1 %20 to i32
  %call191.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 %conv186.i, i32 %conv186.i, i32 %15, i32 %cond190.i, i32 0) #11
  %166 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %166)
  %167 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1609.i = icmp eq i32* %167, null
  br i1 %cmp.i1609.i, label %if.then185.i.emit.exit1617.i_crit_edge, label %if.then.i1613.i

if.then185.i.emit.exit1617.i_crit_edge:           ; preds = %if.then185.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1617.i

if.then.i1613.i:                                  ; preds = %if.then185.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %168 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %168)
  %169 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1611.i = sext i32 %169 to i64
  %arrayidx.i1612.i = getelementptr i32, i32* %167, i64 %idxprom.i1611.i
  %170 = ptrtoint i32* %arrayidx.i1612.i to i64
  call void @__asan_store4_noabort(i64 %170)
  store i32 %call191.i, i32* %arrayidx.i1612.i, align 4
  br label %emit.exit1617.i

emit.exit1617.i:                                  ; preds = %if.then185.i.emit.exit1617.i_crit_edge, %if.then.i1613.i
  %171 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %171)
  %172 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1615.i = add i32 %172, 1
  store i32 %inc.i1615.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else.i:                                        ; preds = %sw.bb183.i
  %sub.i = sub i32 0, %15
  call void @__sanitizer_cov_trace_const_cmp4(i32 4096, i32 %sub.i)
  %tobool.i1618.i = icmp ult i32 %sub.i, 4096
  %and1.i1619.i = and i32 %sub.i, -16773121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and1.i1619.i)
  %tobool2.i1620.i = icmp eq i32 %and1.i1619.i, 0
  %173 = or i1 %tobool.i1618.i, %tobool2.i1620.i
  br i1 %173, label %if.then193.i, label %if.else201.i

if.then193.i:                                     ; preds = %if.else.i
  %conv194.i = and i32 %9, 255
  %cond199.i = zext i1 %20 to i32
  %call200.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 %conv194.i, i32 %conv194.i, i32 %sub.i, i32 %cond199.i, i32 1) #11
  %174 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %174)
  %175 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1622.i = icmp eq i32* %175, null
  br i1 %cmp.i1622.i, label %if.then193.i.emit.exit1630.i_crit_edge, label %if.then.i1626.i

if.then193.i.emit.exit1630.i_crit_edge:           ; preds = %if.then193.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1630.i

if.then.i1626.i:                                  ; preds = %if.then193.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %176 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %176)
  %177 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1624.i = sext i32 %177 to i64
  %arrayidx.i1625.i = getelementptr i32, i32* %175, i64 %idxprom.i1624.i
  %178 = ptrtoint i32* %arrayidx.i1625.i to i64
  call void @__asan_store4_noabort(i64 %178)
  store i32 %call200.i, i32* %arrayidx.i1625.i, align 4
  br label %emit.exit1630.i

emit.exit1630.i:                                  ; preds = %if.then193.i.emit.exit1630.i_crit_edge, %if.then.i1626.i
  %179 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %179)
  %180 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1628.i = add i32 %180, 1
  store i32 %inc.i1628.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else201.i:                                     ; preds = %if.else.i
  %conv203.i = zext i1 %20 to i32
  call fastcc void @emit_a64_mov_i(i32 %conv203.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %conv205.i = and i32 %9, 255
  %call211.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 %conv205.i, i32 %conv205.i, i32 10, i32 0, i32 %conv203.i, i32 0) #11
  %181 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %181)
  %182 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1632.i = icmp eq i32* %182, null
  br i1 %cmp.i1632.i, label %if.else201.i.emit.exit1640.i_crit_edge, label %if.then.i1636.i

if.else201.i.emit.exit1640.i_crit_edge:           ; preds = %if.else201.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1640.i

if.then.i1636.i:                                  ; preds = %if.else201.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %183 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %183)
  %184 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1634.i = sext i32 %184 to i64
  %arrayidx.i1635.i = getelementptr i32, i32* %182, i64 %idxprom.i1634.i
  %185 = ptrtoint i32* %arrayidx.i1635.i to i64
  call void @__asan_store4_noabort(i64 %185)
  store i32 %call211.i, i32* %arrayidx.i1635.i, align 4
  br label %emit.exit1640.i

emit.exit1640.i:                                  ; preds = %if.else201.i.emit.exit1640.i_crit_edge, %if.then.i1636.i
  %186 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %186)
  %187 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1638.i = add i32 %187, 1
  store i32 %inc.i1638.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb214.i:                                       ; preds = %for.body.sw.bb214.i_crit_edge71, %for.body.sw.bb214.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp4(i32 4096, i32 %15)
  %tobool.i1641.i = icmp ult i32 %15, 4096
  %and1.i1642.i = and i32 %15, -16773121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and1.i1642.i)
  %tobool2.i1643.i = icmp eq i32 %and1.i1642.i, 0
  %188 = or i1 %tobool.i1641.i, %tobool2.i1643.i
  br i1 %188, label %if.then216.i, label %if.else223.i

if.then216.i:                                     ; preds = %sw.bb214.i
  %conv217.i = and i32 %9, 255
  %cond221.i = zext i1 %20 to i32
  %call222.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 %conv217.i, i32 %conv217.i, i32 %15, i32 %cond221.i, i32 1) #11
  %189 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %189)
  %190 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1645.i = icmp eq i32* %190, null
  br i1 %cmp.i1645.i, label %if.then216.i.emit.exit1653.i_crit_edge, label %if.then.i1649.i

if.then216.i.emit.exit1653.i_crit_edge:           ; preds = %if.then216.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1653.i

if.then.i1649.i:                                  ; preds = %if.then216.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %191 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %191)
  %192 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1647.i = sext i32 %192 to i64
  %arrayidx.i1648.i = getelementptr i32, i32* %190, i64 %idxprom.i1647.i
  %193 = ptrtoint i32* %arrayidx.i1648.i to i64
  call void @__asan_store4_noabort(i64 %193)
  store i32 %call222.i, i32* %arrayidx.i1648.i, align 4
  br label %emit.exit1653.i

emit.exit1653.i:                                  ; preds = %if.then216.i.emit.exit1653.i_crit_edge, %if.then.i1649.i
  %194 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %194)
  %195 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1651.i = add i32 %195, 1
  store i32 %inc.i1651.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else223.i:                                     ; preds = %sw.bb214.i
  %sub224.i = sub i32 0, %15
  call void @__sanitizer_cov_trace_const_cmp4(i32 4096, i32 %sub224.i)
  %tobool.i1654.i = icmp ult i32 %sub224.i, 4096
  %and1.i1655.i = and i32 %sub224.i, -16773121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and1.i1655.i)
  %tobool2.i1656.i = icmp eq i32 %and1.i1655.i, 0
  %196 = or i1 %tobool.i1654.i, %tobool2.i1656.i
  br i1 %196, label %if.then226.i, label %if.else234.i

if.then226.i:                                     ; preds = %if.else223.i
  %conv227.i = and i32 %9, 255
  %cond232.i = zext i1 %20 to i32
  %call233.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 %conv227.i, i32 %conv227.i, i32 %sub224.i, i32 %cond232.i, i32 0) #11
  %197 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %197)
  %198 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1658.i = icmp eq i32* %198, null
  br i1 %cmp.i1658.i, label %if.then226.i.emit.exit1666.i_crit_edge, label %if.then.i1662.i

if.then226.i.emit.exit1666.i_crit_edge:           ; preds = %if.then226.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1666.i

if.then.i1662.i:                                  ; preds = %if.then226.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %199 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %199)
  %200 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1660.i = sext i32 %200 to i64
  %arrayidx.i1661.i = getelementptr i32, i32* %198, i64 %idxprom.i1660.i
  %201 = ptrtoint i32* %arrayidx.i1661.i to i64
  call void @__asan_store4_noabort(i64 %201)
  store i32 %call233.i, i32* %arrayidx.i1661.i, align 4
  br label %emit.exit1666.i

emit.exit1666.i:                                  ; preds = %if.then226.i.emit.exit1666.i_crit_edge, %if.then.i1662.i
  %202 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %202)
  %203 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1664.i = add i32 %203, 1
  store i32 %inc.i1664.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else234.i:                                     ; preds = %if.else223.i
  %conv236.i = zext i1 %20 to i32
  call fastcc void @emit_a64_mov_i(i32 %conv236.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %conv238.i = and i32 %9, 255
  %call244.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 %conv238.i, i32 %conv238.i, i32 10, i32 0, i32 %conv236.i, i32 1) #11
  %204 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %204)
  %205 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1668.i = icmp eq i32* %205, null
  br i1 %cmp.i1668.i, label %if.else234.i.emit.exit1676.i_crit_edge, label %if.then.i1672.i

if.else234.i.emit.exit1676.i_crit_edge:           ; preds = %if.else234.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1676.i

if.then.i1672.i:                                  ; preds = %if.else234.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %206 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %206)
  %207 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1670.i = sext i32 %207 to i64
  %arrayidx.i1671.i = getelementptr i32, i32* %205, i64 %idxprom.i1670.i
  %208 = ptrtoint i32* %arrayidx.i1671.i to i64
  call void @__asan_store4_noabort(i64 %208)
  store i32 %call244.i, i32* %arrayidx.i1671.i, align 4
  br label %emit.exit1676.i

emit.exit1676.i:                                  ; preds = %if.else234.i.emit.exit1676.i_crit_edge, %if.then.i1672.i
  %209 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %209)
  %210 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1674.i = add i32 %210, 1
  store i32 %inc.i1674.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb247.i:                                       ; preds = %for.body.sw.bb247.i_crit_edge72, %for.body.sw.bb247.i_crit_edge
  %conv250.i = sext i32 %15 to i64
  %conv251.i = zext i32 %15 to i64
  %cond252.i = select i1 %20, i64 %conv250.i, i64 %conv251.i
  %cond256.i = zext i1 %20 to i32
  %conv257.i = and i32 %9, 255
  %call259.i = call i32 @aarch64_insn_gen_logical_immediate(i32 0, i32 %cond256.i, i32 %conv257.i, i32 %conv257.i, i64 %cond252.i) #11
  call void @__sanitizer_cov_trace_const_cmp4(i32 -736092160, i32 %call259.i)
  %cmp260.i = icmp eq i32 %call259.i, -736092160
  br i1 %cmp260.i, label %if.else263.i, label %if.then262.i

if.then262.i:                                     ; preds = %sw.bb247.i
  %211 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %211)
  %212 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1707.i = icmp eq i32* %212, null
  br i1 %cmp.i1707.i, label %if.then262.i.emit.exit1715.i_crit_edge, label %if.then.i1711.i

if.then262.i.emit.exit1715.i_crit_edge:           ; preds = %if.then262.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1715.i

if.then.i1711.i:                                  ; preds = %if.then262.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %213 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %213)
  %214 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1709.i = sext i32 %214 to i64
  %arrayidx.i1710.i = getelementptr i32, i32* %212, i64 %idxprom.i1709.i
  %215 = ptrtoint i32* %arrayidx.i1710.i to i64
  call void @__asan_store4_noabort(i64 %215)
  store i32 %call259.i, i32* %arrayidx.i1710.i, align 4
  br label %emit.exit1715.i

emit.exit1715.i:                                  ; preds = %if.then262.i.emit.exit1715.i_crit_edge, %if.then.i1711.i
  %216 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %216)
  %217 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1713.i = add i32 %217, 1
  store i32 %inc.i1713.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else263.i:                                     ; preds = %sw.bb247.i
  call fastcc void @emit_a64_mov_i(i32 %cond256.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %call273.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 %conv257.i, i32 %conv257.i, i32 10, i32 0, i32 %cond256.i, i32 0) #11
  %218 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %218)
  %219 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1717.i = icmp eq i32* %219, null
  br i1 %cmp.i1717.i, label %if.else263.i.emit.exit1725.i_crit_edge, label %if.then.i1721.i

if.else263.i.emit.exit1725.i_crit_edge:           ; preds = %if.else263.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1725.i

if.then.i1721.i:                                  ; preds = %if.else263.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %220 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %220)
  %221 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1719.i = sext i32 %221 to i64
  %arrayidx.i1720.i = getelementptr i32, i32* %219, i64 %idxprom.i1719.i
  %222 = ptrtoint i32* %arrayidx.i1720.i to i64
  call void @__asan_store4_noabort(i64 %222)
  store i32 %call273.i, i32* %arrayidx.i1720.i, align 4
  br label %emit.exit1725.i

emit.exit1725.i:                                  ; preds = %if.else263.i.emit.exit1725.i_crit_edge, %if.then.i1721.i
  %223 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %223)
  %224 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1723.i = add i32 %224, 1
  store i32 %inc.i1723.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb275.i:                                       ; preds = %for.body.sw.bb275.i_crit_edge73, %for.body.sw.bb275.i_crit_edge
  %conv280.i = sext i32 %15 to i64
  %conv282.i = zext i32 %15 to i64
  %cond284.i = select i1 %20, i64 %conv280.i, i64 %conv282.i
  %cond288.i = zext i1 %20 to i32
  %conv289.i = and i32 %9, 255
  %call291.i = call i32 @aarch64_insn_gen_logical_immediate(i32 2, i32 %cond288.i, i32 %conv289.i, i32 %conv289.i, i64 %cond284.i) #11
  call void @__sanitizer_cov_trace_const_cmp4(i32 -736092160, i32 %call291.i)
  %cmp292.i = icmp eq i32 %call291.i, -736092160
  br i1 %cmp292.i, label %if.else295.i, label %if.then294.i

if.then294.i:                                     ; preds = %sw.bb275.i
  %225 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %225)
  %226 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1727.i = icmp eq i32* %226, null
  br i1 %cmp.i1727.i, label %if.then294.i.emit.exit1735.i_crit_edge, label %if.then.i1731.i

if.then294.i.emit.exit1735.i_crit_edge:           ; preds = %if.then294.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1735.i

if.then.i1731.i:                                  ; preds = %if.then294.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %227 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %227)
  %228 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1729.i = sext i32 %228 to i64
  %arrayidx.i1730.i = getelementptr i32, i32* %226, i64 %idxprom.i1729.i
  %229 = ptrtoint i32* %arrayidx.i1730.i to i64
  call void @__asan_store4_noabort(i64 %229)
  store i32 %call291.i, i32* %arrayidx.i1730.i, align 4
  br label %emit.exit1735.i

emit.exit1735.i:                                  ; preds = %if.then294.i.emit.exit1735.i_crit_edge, %if.then.i1731.i
  %230 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %230)
  %231 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1733.i = add i32 %231, 1
  store i32 %inc.i1733.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else295.i:                                     ; preds = %sw.bb275.i
  call fastcc void @emit_a64_mov_i(i32 %cond288.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %call305.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 %conv289.i, i32 %conv289.i, i32 10, i32 0, i32 %cond288.i, i32 2) #11
  %232 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %232)
  %233 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1747.i = icmp eq i32* %233, null
  br i1 %cmp.i1747.i, label %if.else295.i.emit.exit1755.i_crit_edge, label %if.then.i1751.i

if.else295.i.emit.exit1755.i_crit_edge:           ; preds = %if.else295.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1755.i

if.then.i1751.i:                                  ; preds = %if.else295.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %234 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %234)
  %235 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1749.i = sext i32 %235 to i64
  %arrayidx.i1750.i = getelementptr i32, i32* %233, i64 %idxprom.i1749.i
  %236 = ptrtoint i32* %arrayidx.i1750.i to i64
  call void @__asan_store4_noabort(i64 %236)
  store i32 %call305.i, i32* %arrayidx.i1750.i, align 4
  br label %emit.exit1755.i

emit.exit1755.i:                                  ; preds = %if.else295.i.emit.exit1755.i_crit_edge, %if.then.i1751.i
  %237 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %237)
  %238 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1753.i = add i32 %238, 1
  store i32 %inc.i1753.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb307.i:                                       ; preds = %for.body.sw.bb307.i_crit_edge74, %for.body.sw.bb307.i_crit_edge
  %conv312.i = sext i32 %15 to i64
  %conv314.i = zext i32 %15 to i64
  %cond316.i = select i1 %20, i64 %conv312.i, i64 %conv314.i
  %cond320.i = zext i1 %20 to i32
  %conv321.i = and i32 %9, 255
  %call323.i = call i32 @aarch64_insn_gen_logical_immediate(i32 4, i32 %cond320.i, i32 %conv321.i, i32 %conv321.i, i64 %cond316.i) #11
  call void @__sanitizer_cov_trace_const_cmp4(i32 -736092160, i32 %call323.i)
  %cmp324.i = icmp eq i32 %call323.i, -736092160
  br i1 %cmp324.i, label %if.else327.i, label %if.then326.i

if.then326.i:                                     ; preds = %sw.bb307.i
  %239 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %239)
  %240 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1777.i = icmp eq i32* %240, null
  br i1 %cmp.i1777.i, label %if.then326.i.emit.exit1785.i_crit_edge, label %if.then.i1781.i

if.then326.i.emit.exit1785.i_crit_edge:           ; preds = %if.then326.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1785.i

if.then.i1781.i:                                  ; preds = %if.then326.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %241 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %241)
  %242 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1779.i = sext i32 %242 to i64
  %arrayidx.i1780.i = getelementptr i32, i32* %240, i64 %idxprom.i1779.i
  %243 = ptrtoint i32* %arrayidx.i1780.i to i64
  call void @__asan_store4_noabort(i64 %243)
  store i32 %call323.i, i32* %arrayidx.i1780.i, align 4
  br label %emit.exit1785.i

emit.exit1785.i:                                  ; preds = %if.then326.i.emit.exit1785.i_crit_edge, %if.then.i1781.i
  %244 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %244)
  %245 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1783.i = add i32 %245, 1
  store i32 %inc.i1783.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else327.i:                                     ; preds = %sw.bb307.i
  call fastcc void @emit_a64_mov_i(i32 %cond320.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %call337.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 %conv321.i, i32 %conv321.i, i32 10, i32 0, i32 %cond320.i, i32 4) #11
  %246 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %246)
  %247 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1912.i = icmp eq i32* %247, null
  br i1 %cmp.i1912.i, label %if.else327.i.emit.exit1920.i_crit_edge, label %if.then.i1916.i

if.else327.i.emit.exit1920.i_crit_edge:           ; preds = %if.else327.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1920.i

if.then.i1916.i:                                  ; preds = %if.else327.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %248 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %248)
  %249 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1914.i = sext i32 %249 to i64
  %arrayidx.i1915.i = getelementptr i32, i32* %247, i64 %idxprom.i1914.i
  %250 = ptrtoint i32* %arrayidx.i1915.i to i64
  call void @__asan_store4_noabort(i64 %250)
  store i32 %call337.i, i32* %arrayidx.i1915.i, align 4
  br label %emit.exit1920.i

emit.exit1920.i:                                  ; preds = %if.else327.i.emit.exit1920.i_crit_edge, %if.then.i1916.i
  %251 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %251)
  %252 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1918.i = add i32 %252, 1
  store i32 %inc.i1918.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb339.i:                                       ; preds = %for.body.sw.bb339.i_crit_edge75, %for.body.sw.bb339.i_crit_edge
  %conv341.i = zext i1 %20 to i32
  call fastcc void @emit_a64_mov_i(i32 %conv341.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %conv343.i = and i32 %9, 255
  %call349.i = call i32 @aarch64_insn_gen_data3(i32 %conv343.i, i32 31, i32 %conv343.i, i32 10, i32 %conv341.i, i32 0) #11
  %253 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %253)
  %254 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1932.i = icmp eq i32* %254, null
  br i1 %cmp.i1932.i, label %sw.bb339.i.emit.exit1940.i_crit_edge, label %if.then.i1936.i

sw.bb339.i.emit.exit1940.i_crit_edge:             ; preds = %sw.bb339.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1940.i

if.then.i1936.i:                                  ; preds = %sw.bb339.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %255 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %255)
  %256 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1934.i = sext i32 %256 to i64
  %arrayidx.i1935.i = getelementptr i32, i32* %254, i64 %idxprom.i1934.i
  %257 = ptrtoint i32* %arrayidx.i1935.i to i64
  call void @__asan_store4_noabort(i64 %257)
  store i32 %call349.i, i32* %arrayidx.i1935.i, align 4
  br label %emit.exit1940.i

emit.exit1940.i:                                  ; preds = %sw.bb339.i.emit.exit1940.i_crit_edge, %if.then.i1936.i
  %258 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %258)
  %259 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1938.i = add i32 %259, 1
  store i32 %inc.i1938.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb350.i:                                       ; preds = %for.body.sw.bb350.i_crit_edge76, %for.body.sw.bb350.i_crit_edge
  %conv352.i = zext i1 %20 to i32
  call fastcc void @emit_a64_mov_i(i32 %conv352.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %conv354.i = and i32 %9, 255
  %call360.i = call i32 @aarch64_insn_gen_data2(i32 %conv354.i, i32 %conv354.i, i32 10, i32 %conv352.i, i32 0) #11
  %260 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %260)
  %261 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1922.i = icmp eq i32* %261, null
  br i1 %cmp.i1922.i, label %sw.bb350.i.emit.exit1930.i_crit_edge, label %if.then.i1926.i

sw.bb350.i.emit.exit1930.i_crit_edge:             ; preds = %sw.bb350.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1930.i

if.then.i1926.i:                                  ; preds = %sw.bb350.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %262 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %262)
  %263 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1924.i = sext i32 %263 to i64
  %arrayidx.i1925.i = getelementptr i32, i32* %261, i64 %idxprom.i1924.i
  %264 = ptrtoint i32* %arrayidx.i1925.i to i64
  call void @__asan_store4_noabort(i64 %264)
  store i32 %call360.i, i32* %arrayidx.i1925.i, align 4
  br label %emit.exit1930.i

emit.exit1930.i:                                  ; preds = %sw.bb350.i.emit.exit1930.i_crit_edge, %if.then.i1926.i
  %265 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %265)
  %266 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1928.i = add i32 %266, 1
  store i32 %inc.i1928.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb361.i:                                       ; preds = %for.body.sw.bb361.i_crit_edge77, %for.body.sw.bb361.i_crit_edge
  %conv363.i = zext i1 %20 to i32
  call fastcc void @emit_a64_mov_i(i32 %conv363.i, i32 11, i32 %15, %struct.jit_ctx* %ctx) #11
  %conv366.i = and i32 %9, 255
  %call371.i = call i32 @aarch64_insn_gen_data2(i32 10, i32 %conv366.i, i32 11, i32 %conv363.i, i32 0) #11
  %267 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %267)
  %268 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1902.i = icmp eq i32* %268, null
  br i1 %cmp.i1902.i, label %sw.bb361.i.emit.exit1910.i_crit_edge, label %if.then.i1906.i

sw.bb361.i.emit.exit1910.i_crit_edge:             ; preds = %sw.bb361.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1910.i

if.then.i1906.i:                                  ; preds = %sw.bb361.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %269 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %269)
  %270 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1904.i = sext i32 %270 to i64
  %arrayidx.i1905.i = getelementptr i32, i32* %268, i64 %idxprom.i1904.i
  %271 = ptrtoint i32* %arrayidx.i1905.i to i64
  call void @__asan_store4_noabort(i64 %271)
  store i32 %call371.i, i32* %arrayidx.i1905.i, align 4
  br label %emit.exit1910.i

emit.exit1910.i:                                  ; preds = %sw.bb361.i.emit.exit1910.i_crit_edge, %if.then.i1906.i
  %272 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %272)
  %273 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1908.i = add i32 %273, 1
  store i32 %inc.i1908.i, i32* %idx.i1283.i, align 8
  %call379.i = call i32 @aarch64_insn_gen_data3(i32 %conv366.i, i32 %conv366.i, i32 10, i32 11, i32 %conv363.i, i32 1) #11
  %274 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %274)
  %275 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1892.i = icmp eq i32* %275, null
  br i1 %cmp.i1892.i, label %emit.exit1910.i.emit.exit1900.i_crit_edge, label %if.then.i1896.i

emit.exit1910.i.emit.exit1900.i_crit_edge:        ; preds = %emit.exit1910.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1900.i

if.then.i1896.i:                                  ; preds = %emit.exit1910.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %276 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %276)
  %277 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1894.i = sext i32 %277 to i64
  %arrayidx.i1895.i = getelementptr i32, i32* %275, i64 %idxprom.i1894.i
  %278 = ptrtoint i32* %arrayidx.i1895.i to i64
  call void @__asan_store4_noabort(i64 %278)
  store i32 %call379.i, i32* %arrayidx.i1895.i, align 4
  br label %emit.exit1900.i

emit.exit1900.i:                                  ; preds = %emit.exit1910.i.emit.exit1900.i_crit_edge, %if.then.i1896.i
  %279 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %279)
  %280 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1898.i = add i32 %280, 1
  store i32 %inc.i1898.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb380.i:                                       ; preds = %for.body.sw.bb380.i_crit_edge78, %for.body.sw.bb380.i_crit_edge
  %cond383.i = select i1 %20, i32 64, i32 32
  %conv385.i = and i32 %9, 255
  %sub387.i = sub i32 0, %15
  %281 = add nsw i32 %cond383.i, -1
  %rem.i = and i32 %281, %sub387.i
  %282 = xor i32 %15, -1
  %sub389.i = add i32 %cond383.i, %282
  %cond392.i = zext i1 %20 to i32
  %call393.i = call i32 @aarch64_insn_gen_bitfield(i32 %conv385.i, i32 %conv385.i, i32 %rem.i, i32 %sub389.i, i32 %cond392.i, i32 1) #11
  %283 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %283)
  %284 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1882.i = icmp eq i32* %284, null
  br i1 %cmp.i1882.i, label %sw.bb380.i.emit.exit1890.i_crit_edge, label %if.then.i1886.i

sw.bb380.i.emit.exit1890.i_crit_edge:             ; preds = %sw.bb380.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1890.i

if.then.i1886.i:                                  ; preds = %sw.bb380.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %285 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %285)
  %286 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1884.i = sext i32 %286 to i64
  %arrayidx.i1885.i = getelementptr i32, i32* %284, i64 %idxprom.i1884.i
  %287 = ptrtoint i32* %arrayidx.i1885.i to i64
  call void @__asan_store4_noabort(i64 %287)
  store i32 %call393.i, i32* %arrayidx.i1885.i, align 4
  br label %emit.exit1890.i

emit.exit1890.i:                                  ; preds = %sw.bb380.i.emit.exit1890.i_crit_edge, %if.then.i1886.i
  %288 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %288)
  %289 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1888.i = add i32 %289, 1
  store i32 %inc.i1888.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb394.i:                                       ; preds = %for.body.sw.bb394.i_crit_edge79, %for.body.sw.bb394.i_crit_edge
  %conv395.i = and i32 %9, 255
  %cond399.i = select i1 %20, i32 63, i32 31
  %cond402.i = zext i1 %20 to i32
  %call403.i = call i32 @aarch64_insn_gen_bitfield(i32 %conv395.i, i32 %conv395.i, i32 %15, i32 %cond399.i, i32 %cond402.i, i32 1) #11
  %290 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %290)
  %291 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1872.i = icmp eq i32* %291, null
  br i1 %cmp.i1872.i, label %sw.bb394.i.emit.exit1880.i_crit_edge, label %if.then.i1876.i

sw.bb394.i.emit.exit1880.i_crit_edge:             ; preds = %sw.bb394.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1880.i

if.then.i1876.i:                                  ; preds = %sw.bb394.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %292 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %292)
  %293 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1874.i = sext i32 %293 to i64
  %arrayidx.i1875.i = getelementptr i32, i32* %291, i64 %idxprom.i1874.i
  %294 = ptrtoint i32* %arrayidx.i1875.i to i64
  call void @__asan_store4_noabort(i64 %294)
  store i32 %call403.i, i32* %arrayidx.i1875.i, align 4
  br label %emit.exit1880.i

emit.exit1880.i:                                  ; preds = %sw.bb394.i.emit.exit1880.i_crit_edge, %if.then.i1876.i
  %295 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %295)
  %296 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1878.i = add i32 %296, 1
  store i32 %inc.i1878.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb404.i:                                       ; preds = %for.body.sw.bb404.i_crit_edge80, %for.body.sw.bb404.i_crit_edge
  %conv405.i = and i32 %9, 255
  %cond409.i = select i1 %20, i32 63, i32 31
  %cond412.i = zext i1 %20 to i32
  %call413.i = call i32 @aarch64_insn_gen_bitfield(i32 %conv405.i, i32 %conv405.i, i32 %15, i32 %cond409.i, i32 %cond412.i, i32 2) #11
  %297 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %297)
  %298 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1862.i = icmp eq i32* %298, null
  br i1 %cmp.i1862.i, label %sw.bb404.i.emit.exit1870.i_crit_edge, label %if.then.i1866.i

sw.bb404.i.emit.exit1870.i_crit_edge:             ; preds = %sw.bb404.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1870.i

if.then.i1866.i:                                  ; preds = %sw.bb404.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %299 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %299)
  %300 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1864.i = sext i32 %300 to i64
  %arrayidx.i1865.i = getelementptr i32, i32* %298, i64 %idxprom.i1864.i
  %301 = ptrtoint i32* %arrayidx.i1865.i to i64
  call void @__asan_store4_noabort(i64 %301)
  store i32 %call413.i, i32* %arrayidx.i1865.i, align 4
  br label %emit.exit1870.i

emit.exit1870.i:                                  ; preds = %sw.bb404.i.emit.exit1870.i_crit_edge, %if.then.i1866.i
  %302 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %302)
  %303 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1868.i = add i32 %303, 1
  store i32 %inc.i1868.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb414.i:                                       ; preds = %for.body
  %conv415.i = sext i16 %13 to i64
  %add.i = add nsw i64 %18, %conv415.i
  %304 = ptrtoint i32** %offset to i64
  call void @__asan_load8_noabort(i64 %304)
  %305 = load i32*, i32** %offset, align 8
  %sext1944.i = shl i64 %add.i, 32
  %idxprom.i1855.i = ashr exact i64 %sext1944.i, 32
  %arrayidx.i1856.i = getelementptr i32, i32* %305, i64 %idxprom.i1855.i
  %306 = ptrtoint i32* %arrayidx.i1856.i to i64
  call void @__asan_load4_noabort(i64 %306)
  %307 = load i32, i32* %arrayidx.i1856.i, align 4
  %sext1945.i = shl i64 %sub.ptr.sub.i, 29
  %idxprom2.i1857.i = ashr exact i64 %sext1945.i, 32
  %arrayidx3.i1858.i = getelementptr i32, i32* %305, i64 %idxprom2.i1857.i
  %308 = ptrtoint i32* %arrayidx3.i1858.i to i64
  call void @__asan_load4_noabort(i64 %308)
  %309 = load i32, i32* %arrayidx3.i1858.i, align 4
  %sub.neg.i1859.i = add i32 %307, 1
  %sub4.i1860.i = sub i32 %sub.neg.i1859.i, %309
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub4.i1860.i)
  %cmp417.i = icmp sgt i32 %sub4.i1860.i, 0
  call void @__sanitizer_cov_trace_const_cmp4(i32 67108863, i32 %sub4.i1860.i)
  %tobool419.i = icmp ugt i32 %sub4.i1860.i, 67108863
  %or.cond.i = and i1 %cmp417.i, %tobool419.i
  br i1 %or.cond.i, label %sw.bb414.i.if.then425.i_crit_edge, label %lor.lhs.false.i

sw.bb414.i.if.then425.i_crit_edge:                ; preds = %sw.bb414.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then425.i

lor.lhs.false.i:                                  ; preds = %sw.bb414.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub4.i1860.i)
  %cmp420.i = icmp slt i32 %sub4.i1860.i, 0
  call void @__sanitizer_cov_trace_const_cmp4(i32 -67108864, i32 %sub4.i1860.i)
  %tobool424.i = icmp ult i32 %sub4.i1860.i, -67108864
  %or.cond1231.i = and i1 %cmp420.i, %tobool424.i
  br i1 %or.cond1231.i, label %lor.lhs.false.i.if.then425.i_crit_edge, label %do.end.i

lor.lhs.false.i.if.then425.i_crit_edge:           ; preds = %lor.lhs.false.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then425.i

if.then425.i:                                     ; preds = %lor.lhs.false.i.if.then425.i_crit_edge, %sw.bb414.i.if.then425.i_crit_edge
  %call426.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i32 %conv11.i, i32 %sub4.i1860.i, i32 %sub4.i1860.i) #12
  br label %if.end7

do.end.i:                                         ; preds = %lor.lhs.false.i
  %shl.i = shl i32 %sub4.i1860.i, 2
  %conv428.i = sext i32 %shl.i to i64
  %call429.i = call i32 @aarch64_insn_gen_branch_imm(i64 0, i64 %conv428.i, i32 0) #11
  %310 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %310)
  %311 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1845.i = icmp eq i32* %311, null
  br i1 %cmp.i1845.i, label %do.end.i.emit.exit1853.i_crit_edge, label %if.then.i1849.i

do.end.i.emit.exit1853.i_crit_edge:               ; preds = %do.end.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1853.i

if.then.i1849.i:                                  ; preds = %do.end.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %312 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %312)
  %313 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1847.i = sext i32 %313 to i64
  %arrayidx.i1848.i = getelementptr i32, i32* %311, i64 %idxprom.i1847.i
  %314 = ptrtoint i32* %arrayidx.i1848.i to i64
  call void @__asan_store4_noabort(i64 %314)
  store i32 %call429.i, i32* %arrayidx.i1848.i, align 4
  br label %emit.exit1853.i

emit.exit1853.i:                                  ; preds = %do.end.i.emit.exit1853.i_crit_edge, %if.then.i1849.i
  %315 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %315)
  %316 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1851.i = add i32 %316, 1
  store i32 %inc.i1851.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb430.i:                                       ; preds = %for.body.sw.bb430.i_crit_edge99, %for.body.sw.bb430.i_crit_edge98, %for.body.sw.bb430.i_crit_edge97, %for.body.sw.bb430.i_crit_edge96, %for.body.sw.bb430.i_crit_edge95, %for.body.sw.bb430.i_crit_edge94, %for.body.sw.bb430.i_crit_edge93, %for.body.sw.bb430.i_crit_edge92, %for.body.sw.bb430.i_crit_edge91, %for.body.sw.bb430.i_crit_edge90, %for.body.sw.bb430.i_crit_edge89, %for.body.sw.bb430.i_crit_edge88, %for.body.sw.bb430.i_crit_edge87, %for.body.sw.bb430.i_crit_edge86, %for.body.sw.bb430.i_crit_edge85, %for.body.sw.bb430.i_crit_edge84, %for.body.sw.bb430.i_crit_edge83, %for.body.sw.bb430.i_crit_edge82, %for.body.sw.bb430.i_crit_edge81, %for.body.sw.bb430.i_crit_edge
  %conv431.i = and i32 %9, 255
  %conv432.i = and i32 %11, 255
  %cond435.i = zext i1 %20 to i32
  %call436.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 31, i32 %conv431.i, i32 %conv432.i, i32 0, i32 %cond435.i, i32 3) #11
  %317 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %317)
  %318 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1835.i = icmp eq i32* %318, null
  br i1 %cmp.i1835.i, label %sw.bb430.i.emit_cond_jmp.i_crit_edge, label %if.then.i1839.i

sw.bb430.i.emit_cond_jmp.i_crit_edge:             ; preds = %sw.bb430.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1839.i:                                  ; preds = %sw.bb430.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %319 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %319)
  %320 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1837.i = sext i32 %320 to i64
  %arrayidx.i1838.i = getelementptr i32, i32* %318, i64 %idxprom.i1837.i
  %321 = ptrtoint i32* %arrayidx.i1838.i to i64
  call void @__asan_store4_noabort(i64 %321)
  store i32 %call436.i, i32* %arrayidx.i1838.i, align 4
  br label %emit_cond_jmp.i

emit_cond_jmp.i:                                  ; preds = %if.else531.i.emit_cond_jmp.i_crit_edge, %if.then530.i.emit_cond_jmp.i_crit_edge, %if.else500.i.emit_cond_jmp.i_crit_edge, %if.then493.i.emit_cond_jmp.i_crit_edge, %if.then484.i.emit_cond_jmp.i_crit_edge, %sw.bb475.i.emit_cond_jmp.i_crit_edge, %sw.bb430.i.emit_cond_jmp.i_crit_edge, %if.then.i1839.i, %if.then.i1741.i, %if.then.i1761.i, %if.then.i1771.i, %if.then.i1791.i, %if.then.i1804.i, %if.then.i1817.i
  %322 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %322)
  %323 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1743.i = add i32 %323, 1
  store i32 %inc.i1743.i, i32* %idx.i1283.i, align 8
  %conv437.i = sext i16 %13 to i64
  %add438.i = add nsw i64 %18, %conv437.i
  %324 = ptrtoint i32** %offset to i64
  call void @__asan_load8_noabort(i64 %324)
  %325 = load i32*, i32** %offset, align 8
  %sext.i = shl i64 %add438.i, 32
  %idxprom.i1832.i = ashr exact i64 %sext.i, 32
  %arrayidx.i1833.i = getelementptr i32, i32* %325, i64 %idxprom.i1832.i
  %326 = ptrtoint i32* %arrayidx.i1833.i to i64
  call void @__asan_load4_noabort(i64 %326)
  %327 = load i32, i32* %arrayidx.i1833.i, align 4
  %sext1943.i = shl i64 %sub.ptr.sub.i, 29
  %idxprom2.i.i = ashr exact i64 %sext1943.i, 32
  %arrayidx3.i.i = getelementptr i32, i32* %325, i64 %idxprom2.i.i
  %328 = ptrtoint i32* %arrayidx3.i.i to i64
  call void @__asan_load4_noabort(i64 %328)
  %329 = load i32, i32* %arrayidx3.i.i, align 4
  %sub.neg.i.i = add i32 %327, 1
  %sub4.i.i = sub i32 %sub.neg.i.i, %329
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub4.i.i)
  %cmp441.i = icmp sgt i32 %sub4.i.i, 0
  call void @__sanitizer_cov_trace_const_cmp4(i32 524287, i32 %sub4.i.i)
  %tobool445.i = icmp ugt i32 %sub4.i.i, 524287
  %or.cond1232.i = and i1 %cmp441.i, %tobool445.i
  br i1 %or.cond1232.i, label %emit_cond_jmp.i.if.then453.i_crit_edge, label %lor.lhs.false446.i

emit_cond_jmp.i.if.then453.i_crit_edge:           ; preds = %emit_cond_jmp.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then453.i

lor.lhs.false446.i:                               ; preds = %emit_cond_jmp.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub4.i.i)
  %cmp447.i = icmp slt i32 %sub4.i.i, 0
  call void @__sanitizer_cov_trace_const_cmp4(i32 -524288, i32 %sub4.i.i)
  %tobool452.i = icmp ult i32 %sub4.i.i, -524288
  %or.cond1233.i = and i1 %cmp447.i, %tobool452.i
  br i1 %or.cond1233.i, label %lor.lhs.false446.i.if.then453.i_crit_edge, label %do.end457.i

lor.lhs.false446.i.if.then453.i_crit_edge:        ; preds = %lor.lhs.false446.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then453.i

if.then453.i:                                     ; preds = %lor.lhs.false446.i.if.then453.i_crit_edge, %emit_cond_jmp.i.if.then453.i_crit_edge
  %call454.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i32 %conv11.i, i32 %sub4.i.i, i32 %sub4.i.i) #12
  br label %if.end7

do.end457.i:                                      ; preds = %lor.lhs.false446.i
  %and459.i = and i32 %conv12.i, 240
  %330 = add nsw i32 %and459.i, -16
  %331 = lshr exact i32 %330, 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 208, i32 %330)
  %332 = icmp ult i32 %330, 208
  br i1 %332, label %switch.hole_check, label %do.end457.i.if.end7_crit_edge

do.end457.i.if.end7_crit_edge:                    ; preds = %do.end457.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

switch.hole_check:                                ; preds = %do.end457.i
  %switch.maskindex = trunc i32 %331 to i16
  %switch.shifted = lshr i16 7807, %switch.maskindex
  %333 = and i16 %switch.shifted, 1
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %333)
  %switch.lobit = icmp eq i16 %333, 0
  br i1 %switch.lobit, label %switch.hole_check.if.end7_crit_edge, label %switch.lookup

switch.hole_check.if.end7_crit_edge:              ; preds = %switch.hole_check
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

switch.lookup:                                    ; preds = %switch.hole_check
  %334 = zext i32 %331 to i64
  %switch.gep = getelementptr inbounds [13 x i32], [13 x i32]* @switch.table.build_body, i64 0, i64 %334
  %335 = ptrtoint i32* %switch.gep to i64
  call void @__asan_load4_noabort(i64 %335)
  %switch.load = load i32, i32* %switch.gep, align 4
  %shl471.i = shl i32 %sub4.i.i, 2
  %conv472.i = sext i32 %shl471.i to i64
  %call474.i = call i32 @aarch64_insn_gen_cond_branch_imm(i64 0, i64 %conv472.i, i32 %switch.load) #11
  %336 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %336)
  %337 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1823.i = icmp eq i32* %337, null
  br i1 %cmp.i1823.i, label %switch.lookup.emit.exit1831.i_crit_edge, label %if.then.i1827.i

switch.lookup.emit.exit1831.i_crit_edge:          ; preds = %switch.lookup
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1831.i

if.then.i1827.i:                                  ; preds = %switch.lookup
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %338 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %338)
  %339 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1825.i = sext i32 %339 to i64
  %arrayidx.i1826.i = getelementptr i32, i32* %337, i64 %idxprom.i1825.i
  %340 = ptrtoint i32* %arrayidx.i1826.i to i64
  call void @__asan_store4_noabort(i64 %340)
  store i32 %call474.i, i32* %arrayidx.i1826.i, align 4
  br label %emit.exit1831.i

emit.exit1831.i:                                  ; preds = %switch.lookup.emit.exit1831.i_crit_edge, %if.then.i1827.i
  %341 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %341)
  %342 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1829.i = add i32 %342, 1
  store i32 %inc.i1829.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb475.i:                                       ; preds = %for.body.sw.bb475.i_crit_edge100, %for.body.sw.bb475.i_crit_edge
  %conv476.i = and i32 %9, 255
  %conv477.i = and i32 %11, 255
  %cond480.i = zext i1 %20 to i32
  %call481.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 31, i32 %conv476.i, i32 %conv477.i, i32 0, i32 %cond480.i, i32 6) #11
  %343 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %343)
  %344 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1813.i = icmp eq i32* %344, null
  br i1 %cmp.i1813.i, label %sw.bb475.i.emit_cond_jmp.i_crit_edge, label %if.then.i1817.i

sw.bb475.i.emit_cond_jmp.i_crit_edge:             ; preds = %sw.bb475.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1817.i:                                  ; preds = %sw.bb475.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %345 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %345)
  %346 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1815.i = sext i32 %346 to i64
  %arrayidx.i1816.i = getelementptr i32, i32* %344, i64 %idxprom.i1815.i
  %347 = ptrtoint i32* %arrayidx.i1816.i to i64
  call void @__asan_store4_noabort(i64 %347)
  store i32 %call481.i, i32* %arrayidx.i1816.i, align 4
  br label %emit_cond_jmp.i

sw.bb482.i:                                       ; preds = %for.body.sw.bb482.i_crit_edge119, %for.body.sw.bb482.i_crit_edge118, %for.body.sw.bb482.i_crit_edge117, %for.body.sw.bb482.i_crit_edge116, %for.body.sw.bb482.i_crit_edge115, %for.body.sw.bb482.i_crit_edge114, %for.body.sw.bb482.i_crit_edge113, %for.body.sw.bb482.i_crit_edge112, %for.body.sw.bb482.i_crit_edge111, %for.body.sw.bb482.i_crit_edge110, %for.body.sw.bb482.i_crit_edge109, %for.body.sw.bb482.i_crit_edge108, %for.body.sw.bb482.i_crit_edge107, %for.body.sw.bb482.i_crit_edge106, %for.body.sw.bb482.i_crit_edge105, %for.body.sw.bb482.i_crit_edge104, %for.body.sw.bb482.i_crit_edge103, %for.body.sw.bb482.i_crit_edge102, %for.body.sw.bb482.i_crit_edge101, %for.body.sw.bb482.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp4(i32 4096, i32 %15)
  %tobool.i1809.i = icmp ult i32 %15, 4096
  %and1.i1810.i = and i32 %15, -16773121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and1.i1810.i)
  %tobool2.i1811.i = icmp eq i32 %and1.i1810.i, 0
  %348 = or i1 %tobool.i1809.i, %tobool2.i1811.i
  br i1 %348, label %if.then484.i, label %if.else490.i

if.then484.i:                                     ; preds = %sw.bb482.i
  %conv485.i = and i32 %9, 255
  %cond488.i = zext i1 %20 to i32
  %call489.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 31, i32 %conv485.i, i32 %15, i32 %cond488.i, i32 3) #11
  %349 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %349)
  %350 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1800.i = icmp eq i32* %350, null
  br i1 %cmp.i1800.i, label %if.then484.i.emit_cond_jmp.i_crit_edge, label %if.then.i1804.i

if.then484.i.emit_cond_jmp.i_crit_edge:           ; preds = %if.then484.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1804.i:                                  ; preds = %if.then484.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %351 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %351)
  %352 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1802.i = sext i32 %352 to i64
  %arrayidx.i1803.i = getelementptr i32, i32* %350, i64 %idxprom.i1802.i
  %353 = ptrtoint i32* %arrayidx.i1803.i to i64
  call void @__asan_store4_noabort(i64 %353)
  store i32 %call489.i, i32* %arrayidx.i1803.i, align 4
  br label %emit_cond_jmp.i

if.else490.i:                                     ; preds = %sw.bb482.i
  %sub491.i = sub i32 0, %15
  call void @__sanitizer_cov_trace_const_cmp4(i32 4096, i32 %sub491.i)
  %tobool.i1796.i = icmp ult i32 %sub491.i, 4096
  %and1.i1797.i = and i32 %sub491.i, -16773121
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and1.i1797.i)
  %tobool2.i1798.i = icmp eq i32 %and1.i1797.i, 0
  %354 = or i1 %tobool.i1796.i, %tobool2.i1798.i
  br i1 %354, label %if.then493.i, label %if.else500.i

if.then493.i:                                     ; preds = %if.else490.i
  %conv494.i = and i32 %9, 255
  %cond498.i = zext i1 %20 to i32
  %call499.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 31, i32 %conv494.i, i32 %sub491.i, i32 %cond498.i, i32 2) #11
  %355 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %355)
  %356 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1787.i = icmp eq i32* %356, null
  br i1 %cmp.i1787.i, label %if.then493.i.emit_cond_jmp.i_crit_edge, label %if.then.i1791.i

if.then493.i.emit_cond_jmp.i_crit_edge:           ; preds = %if.then493.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1791.i:                                  ; preds = %if.then493.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %357 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %357)
  %358 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1789.i = sext i32 %358 to i64
  %arrayidx.i1790.i = getelementptr i32, i32* %356, i64 %idxprom.i1789.i
  %359 = ptrtoint i32* %arrayidx.i1790.i to i64
  call void @__asan_store4_noabort(i64 %359)
  store i32 %call499.i, i32* %arrayidx.i1790.i, align 4
  br label %emit_cond_jmp.i

if.else500.i:                                     ; preds = %if.else490.i
  %conv502.i = zext i1 %20 to i32
  call fastcc void @emit_a64_mov_i(i32 %conv502.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %conv504.i = and i32 %9, 255
  %call509.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 31, i32 %conv504.i, i32 10, i32 0, i32 %conv502.i, i32 3) #11
  %360 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %360)
  %361 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1767.i = icmp eq i32* %361, null
  br i1 %cmp.i1767.i, label %if.else500.i.emit_cond_jmp.i_crit_edge, label %if.then.i1771.i

if.else500.i.emit_cond_jmp.i_crit_edge:           ; preds = %if.else500.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1771.i:                                  ; preds = %if.else500.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %362 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %362)
  %363 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1769.i = sext i32 %363 to i64
  %arrayidx.i1770.i = getelementptr i32, i32* %361, i64 %idxprom.i1769.i
  %364 = ptrtoint i32* %arrayidx.i1770.i to i64
  call void @__asan_store4_noabort(i64 %364)
  store i32 %call509.i, i32* %arrayidx.i1770.i, align 4
  br label %emit_cond_jmp.i

sw.bb512.i:                                       ; preds = %for.body.sw.bb512.i_crit_edge120, %for.body.sw.bb512.i_crit_edge
  %conv517.i = sext i32 %15 to i64
  %conv519.i = zext i32 %15 to i64
  %cond521.i = select i1 %20, i64 %conv517.i, i64 %conv519.i
  %cond525.i = zext i1 %20 to i32
  %conv526.i = and i32 %9, 255
  %call527.i = call i32 @aarch64_insn_gen_logical_immediate(i32 6, i32 %cond525.i, i32 %conv526.i, i32 31, i64 %cond521.i) #11
  call void @__sanitizer_cov_trace_const_cmp4(i32 -736092160, i32 %call527.i)
  %cmp528.i = icmp eq i32 %call527.i, -736092160
  br i1 %cmp528.i, label %if.else531.i, label %if.then530.i

if.then530.i:                                     ; preds = %sw.bb512.i
  %365 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %365)
  %366 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1757.i = icmp eq i32* %366, null
  br i1 %cmp.i1757.i, label %if.then530.i.emit_cond_jmp.i_crit_edge, label %if.then.i1761.i

if.then530.i.emit_cond_jmp.i_crit_edge:           ; preds = %if.then530.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1761.i:                                  ; preds = %if.then530.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %367 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %367)
  %368 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1759.i = sext i32 %368 to i64
  %arrayidx.i1760.i = getelementptr i32, i32* %366, i64 %idxprom.i1759.i
  %369 = ptrtoint i32* %arrayidx.i1760.i to i64
  call void @__asan_store4_noabort(i64 %369)
  store i32 %call527.i, i32* %arrayidx.i1760.i, align 4
  br label %emit_cond_jmp.i

if.else531.i:                                     ; preds = %sw.bb512.i
  call fastcc void @emit_a64_mov_i(i32 %cond525.i, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %call540.i = call i32 @aarch64_insn_gen_logical_shifted_reg(i32 31, i32 %conv526.i, i32 10, i32 0, i32 %cond525.i, i32 6) #11
  %370 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %370)
  %371 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1737.i = icmp eq i32* %371, null
  br i1 %cmp.i1737.i, label %if.else531.i.emit_cond_jmp.i_crit_edge, label %if.then.i1741.i

if.else531.i.emit_cond_jmp.i_crit_edge:           ; preds = %if.else531.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_cond_jmp.i

if.then.i1741.i:                                  ; preds = %if.else531.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %372 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %372)
  %373 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1739.i = sext i32 %373 to i64
  %arrayidx.i1740.i = getelementptr i32, i32* %371, i64 %idxprom.i1739.i
  %374 = ptrtoint i32* %arrayidx.i1740.i to i64
  call void @__asan_store4_noabort(i64 %374)
  store i32 %call540.i, i32* %arrayidx.i1740.i, align 4
  br label %emit_cond_jmp.i

sw.bb542.i:                                       ; preds = %for.body
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %func_addr_fixed.i) #11
  %375 = ptrtoint i8* %func_addr_fixed.i to i64
  call void @__asan_store1_noabort(i64 %375)
  store i8 -86, i8* %func_addr_fixed.i, align 4
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #11
  %376 = ptrtoint i64* %func_addr.i to i64
  call void @__asan_store8_noabort(i64 %376)
  store i64 -6148914691236517206, i64* %func_addr.i, align 8
  %call546.i = call i32 @bpf_jit_get_func_addr(%struct.bpf_prog* %17, %struct.bpf_insn* %arrayidx, i1 %extra_pass, i64* nonnull %func_addr.i, i8* nonnull %func_addr_fixed.i) #11
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %call546.i)
  %cmp547.i = icmp slt i32 %call546.i, 0
  br i1 %cmp547.i, label %cleanup.i, label %if.end550.i

if.end550.i:                                      ; preds = %sw.bb542.i
  %377 = ptrtoint i64* %func_addr.i to i64
  call void @__asan_load8_noabort(i64 %377)
  %378 = load i64, i64* %func_addr.i, align 8
  %379 = trunc i64 %378 to i32
  %380 = and i32 %379, 65535
  %conv.i1697.i = xor i32 %380, 65535
  %call.i1698.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 %conv.i1697.i, i32 0, i32 1, i32 2) #11
  %381 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %381)
  %382 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i.i1700.i = icmp eq i32* %382, null
  br i1 %cmp.i.i1700.i, label %if.end550.i.emit.exit.i1705.i_crit_edge, label %if.then.i.i1704.i

if.end550.i.emit.exit.i1705.i_crit_edge:          ; preds = %if.end550.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit.i1705.i

if.then.i.i1704.i:                                ; preds = %if.end550.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %383 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %383)
  %384 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i.i1702.i = sext i32 %384 to i64
  %arrayidx.i.i1703.i = getelementptr i32, i32* %382, i64 %idxprom.i.i1702.i
  %385 = ptrtoint i32* %arrayidx.i.i1703.i to i64
  call void @__asan_store4_noabort(i64 %385)
  store i32 %call.i1698.i, i32* %arrayidx.i.i1703.i, align 4
  br label %emit.exit.i1705.i

emit.exit.i1705.i:                                ; preds = %if.end550.i.emit.exit.i1705.i_crit_edge, %if.then.i.i1704.i
  %386 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %386)
  %storemerge.in10.i.i = load i32, i32* %idx.i1283.i, align 8
  %storemerge11.i.i = add i32 %storemerge.in10.i.i, 1
  store i32 %storemerge11.i.i, i32* %idx.i1283.i, align 8
  %shr.i.i = lshr i64 %378, 16
  %387 = trunc i64 %shr.i.i to i32
  %conv3.i.i = and i32 %387, 65535
  %call4.i.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 %conv3.i.i, i32 16, i32 1, i32 1) #11
  %388 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %388)
  %389 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i2.i.i = icmp eq i32* %389, null
  br i1 %cmp.i2.i.i, label %emit.exit.i1705.i.emit.exit9.i.i_crit_edge, label %if.then.i6.i.i

emit.exit.i1705.i.emit.exit9.i.i_crit_edge:       ; preds = %emit.exit.i1705.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit9.i.i

if.then.i6.i.i:                                   ; preds = %emit.exit.i1705.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %390 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %390)
  %391 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i4.i.i = sext i32 %391 to i64
  %arrayidx.i5.i.i = getelementptr i32, i32* %389, i64 %idxprom.i4.i.i
  %392 = ptrtoint i32* %arrayidx.i5.i.i to i64
  call void @__asan_store4_noabort(i64 %392)
  store i32 %call4.i.i, i32* %arrayidx.i5.i.i, align 4
  br label %emit.exit9.i.i

emit.exit9.i.i:                                   ; preds = %emit.exit.i1705.i.emit.exit9.i.i_crit_edge, %if.then.i6.i.i
  %393 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %393)
  %storemerge.in.i.i = load i32, i32* %idx.i1283.i, align 8
  %storemerge.i.i = add i32 %storemerge.in.i.i, 1
  store i32 %storemerge.i.i, i32* %idx.i1283.i, align 8
  %shr.1.i.i = lshr i64 %378, 32
  %394 = trunc i64 %shr.1.i.i to i32
  %conv3.1.i.i = and i32 %394, 65535
  %call4.1.i.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 %conv3.1.i.i, i32 32, i32 1, i32 1) #11
  %395 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %395)
  %396 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i2.1.i.i = icmp eq i32* %396, null
  br i1 %cmp.i2.1.i.i, label %emit.exit9.i.i.emit_addr_mov_i64.exit.i_crit_edge, label %if.then.i6.1.i.i

emit.exit9.i.i.emit_addr_mov_i64.exit.i_crit_edge: ; preds = %emit.exit9.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_addr_mov_i64.exit.i

if.then.i6.1.i.i:                                 ; preds = %emit.exit9.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %397 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %397)
  %398 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i4.1.i.i = sext i32 %398 to i64
  %arrayidx.i5.1.i.i = getelementptr i32, i32* %396, i64 %idxprom.i4.1.i.i
  %399 = ptrtoint i32* %arrayidx.i5.1.i.i to i64
  call void @__asan_store4_noabort(i64 %399)
  store i32 %call4.1.i.i, i32* %arrayidx.i5.1.i.i, align 4
  br label %emit_addr_mov_i64.exit.i

emit_addr_mov_i64.exit.i:                         ; preds = %emit.exit9.i.i.emit_addr_mov_i64.exit.i_crit_edge, %if.then.i6.1.i.i
  %400 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %400)
  %storemerge.in.1.i.i = load i32, i32* %idx.i1283.i, align 8
  %storemerge.1.i.i = add i32 %storemerge.in.1.i.i, 1
  store i32 %storemerge.1.i.i, i32* %idx.i1283.i, align 8
  %call553.i = call i32 @aarch64_insn_gen_branch_reg(i32 10, i32 1) #11
  %401 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %401)
  %402 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1688.i = icmp eq i32* %402, null
  br i1 %cmp.i1688.i, label %emit_addr_mov_i64.exit.i.emit.exit1696.i_crit_edge, label %if.then.i1692.i

emit_addr_mov_i64.exit.i.emit.exit1696.i_crit_edge: ; preds = %emit_addr_mov_i64.exit.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1696.i

if.then.i1692.i:                                  ; preds = %emit_addr_mov_i64.exit.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %403 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %403)
  %404 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1690.i = sext i32 %404 to i64
  %arrayidx.i1691.i = getelementptr i32, i32* %402, i64 %idxprom.i1690.i
  %405 = ptrtoint i32* %arrayidx.i1691.i to i64
  call void @__asan_store4_noabort(i64 %405)
  store i32 %call553.i, i32* %arrayidx.i1691.i, align 4
  br label %emit.exit1696.i

emit.exit1696.i:                                  ; preds = %emit_addr_mov_i64.exit.i.emit.exit1696.i_crit_edge, %if.then.i1692.i
  %406 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %406)
  %407 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1694.i = add i32 %407, 1
  store i32 %inc.i1694.i, i32* %idx.i1283.i, align 8
  %call555.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 7, i32 0, i32 0, i32 1, i32 0) #11
  %408 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %408)
  %409 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1678.i = icmp eq i32* %409, null
  br i1 %cmp.i1678.i, label %emit.exit1696.i.emit.exit1686.i_crit_edge, label %if.then.i1682.i

emit.exit1696.i.emit.exit1686.i_crit_edge:        ; preds = %emit.exit1696.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1686.i

if.then.i1682.i:                                  ; preds = %emit.exit1696.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %410 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %410)
  %411 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1680.i = sext i32 %411 to i64
  %arrayidx.i1681.i = getelementptr i32, i32* %409, i64 %idxprom.i1680.i
  %412 = ptrtoint i32* %arrayidx.i1681.i to i64
  call void @__asan_store4_noabort(i64 %412)
  store i32 %call555.i, i32* %arrayidx.i1681.i, align 4
  br label %emit.exit1686.i

emit.exit1686.i:                                  ; preds = %emit.exit1696.i.emit.exit1686.i_crit_edge, %if.then.i1682.i
  %413 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %413)
  %414 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1684.i = add i32 %414, 1
  store i32 %inc.i1684.i, i32* %idx.i1283.i, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #11
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %func_addr_fixed.i) #11
  br label %if.end7

cleanup.i:                                        ; preds = %sw.bb542.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #11
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %func_addr_fixed.i) #11
  br label %if.end7

sw.bb559.i:                                       ; preds = %for.body
  %415 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %415)
  %416 = load i32, i32* %idx.i1283.i, align 8
  %call31.i.i.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 36, i32 0, i32 0, i32 0) #11
  %417 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %417)
  %418 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i71.i.i.i = icmp eq i32* %418, null
  br i1 %cmp.i71.i.i.i, label %sw.bb559.i.emit_a64_mov_i.exit.i.i_crit_edge, label %if.then.i75.i.i.i

sw.bb559.i.emit_a64_mov_i.exit.i.i_crit_edge:     ; preds = %sw.bb559.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_a64_mov_i.exit.i.i

if.then.i75.i.i.i:                                ; preds = %sw.bb559.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %419 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %419)
  %420 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i73.i.i.i = sext i32 %420 to i64
  %arrayidx.i74.i.i.i = getelementptr i32, i32* %418, i64 %idxprom.i73.i.i.i
  %421 = ptrtoint i32* %arrayidx.i74.i.i.i to i64
  call void @__asan_store4_noabort(i64 %421)
  store i32 %call31.i.i.i, i32* %arrayidx.i74.i.i.i, align 4
  br label %emit_a64_mov_i.exit.i.i

emit_a64_mov_i.exit.i.i:                          ; preds = %sw.bb559.i.emit_a64_mov_i.exit.i.i_crit_edge, %if.then.i75.i.i.i
  %422 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %422)
  %423 = load i32, i32* %idx.i1283.i, align 8
  %inc.i77.i.i.i = add i32 %423, 1
  store i32 %inc.i77.i.i.i, i32* %idx.i1283.i, align 8
  %call.i.i = call i32 @aarch64_insn_gen_load_store_reg(i32 10, i32 1, i32 10, i32 2, i32 0) #11
  %424 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %424)
  %425 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i.i1498.i = icmp eq i32* %425, null
  br i1 %cmp.i.i1498.i, label %emit_a64_mov_i.exit.i.i.emit.exit.i1503.i_crit_edge, label %if.then.i.i1501.i

emit_a64_mov_i.exit.i.i.emit.exit.i1503.i_crit_edge: ; preds = %emit_a64_mov_i.exit.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit.i1503.i

if.then.i.i1501.i:                                ; preds = %emit_a64_mov_i.exit.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %426 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %426)
  %427 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i.i1499.i = sext i32 %427 to i64
  %arrayidx.i.i1500.i = getelementptr i32, i32* %425, i64 %idxprom.i.i1499.i
  %428 = ptrtoint i32* %arrayidx.i.i1500.i to i64
  call void @__asan_store4_noabort(i64 %428)
  store i32 %call.i.i, i32* %arrayidx.i.i1500.i, align 4
  br label %emit.exit.i1503.i

emit.exit.i1503.i:                                ; preds = %emit_a64_mov_i.exit.i.i.emit.exit.i1503.i_crit_edge, %if.then.i.i1501.i
  %429 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %429)
  %430 = load i32, i32* %idx.i1283.i, align 8
  %inc.i.i1502.i = add i32 %430, 1
  store i32 %inc.i.i1502.i, i32* %idx.i1283.i, align 8
  %call11.i.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 2, i32 2, i32 0, i32 0, i32 0) #11
  %431 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %431)
  %432 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i205.i.i = icmp eq i32* %432, null
  br i1 %cmp.i205.i.i, label %emit.exit.i1503.i.emit.exit212.i.i_crit_edge, label %if.then.i209.i.i

emit.exit.i1503.i.emit.exit212.i.i_crit_edge:     ; preds = %emit.exit.i1503.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit212.i.i

if.then.i209.i.i:                                 ; preds = %emit.exit.i1503.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %433 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %433)
  %434 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i207.i.i = sext i32 %434 to i64
  %arrayidx.i208.i.i = getelementptr i32, i32* %432, i64 %idxprom.i207.i.i
  %435 = ptrtoint i32* %arrayidx.i208.i.i to i64
  call void @__asan_store4_noabort(i64 %435)
  store i32 %call11.i.i, i32* %arrayidx.i208.i.i, align 4
  br label %emit.exit212.i.i

emit.exit212.i.i:                                 ; preds = %emit.exit.i1503.i.emit.exit212.i.i_crit_edge, %if.then.i209.i.i
  %436 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %436)
  %437 = load i32, i32* %idx.i1283.i, align 8
  %inc.i211.i.i = add i32 %437, 1
  store i32 %inc.i211.i.i, i32* %idx.i1283.i, align 8
  %call14.i.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 31, i32 2, i32 10, i32 0, i32 0, i32 3) #11
  %438 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %438)
  %439 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i261.i.i = icmp eq i32* %439, null
  br i1 %cmp.i261.i.i, label %emit.exit212.i.i.emit.exit268.i.i_crit_edge, label %if.then.i265.i.i

emit.exit212.i.i.emit.exit268.i.i_crit_edge:      ; preds = %emit.exit212.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit268.i.i

if.then.i265.i.i:                                 ; preds = %emit.exit212.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %440 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %440)
  %441 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i263.i.i = sext i32 %441 to i64
  %arrayidx.i264.i.i = getelementptr i32, i32* %439, i64 %idxprom.i263.i.i
  %442 = ptrtoint i32* %arrayidx.i264.i.i to i64
  call void @__asan_store4_noabort(i64 %442)
  store i32 %call14.i.i, i32* %arrayidx.i264.i.i, align 4
  br label %emit.exit268.i.i

emit.exit268.i.i:                                 ; preds = %emit.exit212.i.i.emit.exit268.i.i_crit_edge, %if.then.i265.i.i
  %443 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %443)
  %444 = load i32, i32* %idx.i1283.i, align 8
  %inc.i267.i.i = add i32 %444, 1
  store i32 %inc.i267.i.i, i32* %idx.i1283.i, align 8
  %445 = load i32, i32* @out_offset, align 4
  %inc.i267.neg.i.i = xor i32 %444, 1073741823
  %sub153.i.i = add i32 %inc.i267.neg.i.i, %416
  %sub16.i.i = add i32 %sub153.i.i, %445
  %shl.i.i = shl i32 %sub16.i.i, 2
  %conv17.i.i = sext i32 %shl.i.i to i64
  %call18.i.i = call i32 @aarch64_insn_gen_cond_branch_imm(i64 0, i64 %conv17.i.i, i32 2) #11
  %446 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %446)
  %447 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i308.i.i = icmp eq i32* %447, null
  br i1 %cmp.i308.i.i, label %emit.exit268.i.i.emit.exit315.i.i_crit_edge, label %if.then.i312.i.i

emit.exit268.i.i.emit.exit315.i.i_crit_edge:      ; preds = %emit.exit268.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit315.i.i

if.then.i312.i.i:                                 ; preds = %emit.exit268.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %448 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %448)
  %449 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i310.i.i = sext i32 %449 to i64
  %arrayidx.i311.i.i = getelementptr i32, i32* %447, i64 %idxprom.i310.i.i
  %450 = ptrtoint i32* %arrayidx.i311.i.i to i64
  call void @__asan_store4_noabort(i64 %450)
  store i32 %call18.i.i, i32* %arrayidx.i311.i.i, align 4
  br label %emit.exit315.i.i

emit.exit315.i.i:                                 ; preds = %emit.exit268.i.i.emit.exit315.i.i_crit_edge, %if.then.i312.i.i
  %451 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %451)
  %452 = load i32, i32* %idx.i1283.i, align 8
  %inc.i314.i.i = add i32 %452, 1
  store i32 %inc.i314.i.i, i32* %idx.i1283.i, align 8
  %call31.i297.i.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 32, i32 0, i32 0, i32 0) #11
  %453 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %453)
  %454 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i71.i299.i.i = icmp eq i32* %454, null
  br i1 %cmp.i71.i299.i.i, label %emit.exit315.i.i.emit_a64_mov_i.exit306.i.i_crit_edge, label %if.then.i75.i303.i.i

emit.exit315.i.i.emit_a64_mov_i.exit306.i.i_crit_edge: ; preds = %emit.exit315.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_a64_mov_i.exit306.i.i

if.then.i75.i303.i.i:                             ; preds = %emit.exit315.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %455 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %455)
  %456 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i73.i301.i.i = sext i32 %456 to i64
  %arrayidx.i74.i302.i.i = getelementptr i32, i32* %454, i64 %idxprom.i73.i301.i.i
  %457 = ptrtoint i32* %arrayidx.i74.i302.i.i to i64
  call void @__asan_store4_noabort(i64 %457)
  store i32 %call31.i297.i.i, i32* %arrayidx.i74.i302.i.i, align 4
  br label %emit_a64_mov_i.exit306.i.i

emit_a64_mov_i.exit306.i.i:                       ; preds = %emit.exit315.i.i.emit_a64_mov_i.exit306.i.i_crit_edge, %if.then.i75.i303.i.i
  %458 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %458)
  %459 = load i32, i32* %idx.i1283.i, align 8
  %inc.i77.i305.i.i = add i32 %459, 1
  store i32 %inc.i77.i305.i.i, i32* %idx.i1283.i, align 8
  %call22.i.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 31, i32 26, i32 10, i32 0, i32 1, i32 3) #11
  %460 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %460)
  %461 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i288.i.i = icmp eq i32* %461, null
  br i1 %cmp.i288.i.i, label %emit_a64_mov_i.exit306.i.i.emit.exit295.i.i_crit_edge, label %if.then.i292.i.i

emit_a64_mov_i.exit306.i.i.emit.exit295.i.i_crit_edge: ; preds = %emit_a64_mov_i.exit306.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit295.i.i

if.then.i292.i.i:                                 ; preds = %emit_a64_mov_i.exit306.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %462 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %462)
  %463 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i290.i.i = sext i32 %463 to i64
  %arrayidx.i291.i.i = getelementptr i32, i32* %461, i64 %idxprom.i290.i.i
  %464 = ptrtoint i32* %arrayidx.i291.i.i to i64
  call void @__asan_store4_noabort(i64 %464)
  store i32 %call22.i.i, i32* %arrayidx.i291.i.i, align 4
  br label %emit.exit295.i.i

emit.exit295.i.i:                                 ; preds = %emit_a64_mov_i.exit306.i.i.emit.exit295.i.i_crit_edge, %if.then.i292.i.i
  %465 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %465)
  %466 = load i32, i32* %idx.i1283.i, align 8
  %inc.i294.i.i = add i32 %466, 1
  store i32 %inc.i294.i.i, i32* %idx.i1283.i, align 8
  %467 = load i32, i32* @out_offset, align 4
  %inc.i294.neg.i.i = xor i32 %466, 1073741823
  %sub24154.i.i = add i32 %inc.i294.neg.i.i, %416
  %sub25.i.i = add i32 %sub24154.i.i, %467
  %shl26.i.i = shl i32 %sub25.i.i, 2
  %conv27.i.i = sext i32 %shl26.i.i to i64
  %call28.i.i = call i32 @aarch64_insn_gen_cond_branch_imm(i64 0, i64 %conv27.i.i, i32 8) #11
  %468 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %468)
  %469 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i279.i.i = icmp eq i32* %469, null
  br i1 %cmp.i279.i.i, label %emit.exit295.i.i.emit.exit286.i.i_crit_edge, label %if.then.i283.i.i

emit.exit295.i.i.emit.exit286.i.i_crit_edge:      ; preds = %emit.exit295.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit286.i.i

if.then.i283.i.i:                                 ; preds = %emit.exit295.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %470 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %470)
  %471 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i281.i.i = sext i32 %471 to i64
  %arrayidx.i282.i.i = getelementptr i32, i32* %469, i64 %idxprom.i281.i.i
  %472 = ptrtoint i32* %arrayidx.i282.i.i to i64
  call void @__asan_store4_noabort(i64 %472)
  store i32 %call28.i.i, i32* %arrayidx.i282.i.i, align 4
  br label %emit.exit286.i.i

emit.exit286.i.i:                                 ; preds = %emit.exit295.i.i.emit.exit286.i.i_crit_edge, %if.then.i283.i.i
  %473 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %473)
  %474 = load i32, i32* %idx.i1283.i, align 8
  %inc.i285.i.i = add i32 %474, 1
  store i32 %inc.i285.i.i, i32* %idx.i1283.i, align 8
  %call31.i.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 26, i32 26, i32 1, i32 1, i32 0) #11
  %475 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %475)
  %476 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i270.i.i = icmp eq i32* %476, null
  br i1 %cmp.i270.i.i, label %emit.exit286.i.i.emit.exit277.i.i_crit_edge, label %if.then.i274.i.i

emit.exit286.i.i.emit.exit277.i.i_crit_edge:      ; preds = %emit.exit286.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit277.i.i

if.then.i274.i.i:                                 ; preds = %emit.exit286.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %477 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %477)
  %478 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i272.i.i = sext i32 %478 to i64
  %arrayidx.i273.i.i = getelementptr i32, i32* %476, i64 %idxprom.i272.i.i
  %479 = ptrtoint i32* %arrayidx.i273.i.i to i64
  call void @__asan_store4_noabort(i64 %479)
  store i32 %call31.i.i, i32* %arrayidx.i273.i.i, align 4
  br label %emit.exit277.i.i

emit.exit277.i.i:                                 ; preds = %emit.exit286.i.i.emit.exit277.i.i_crit_edge, %if.then.i274.i.i
  %480 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %480)
  %481 = load i32, i32* %idx.i1283.i, align 8
  %inc.i276.i.i = add i32 %481, 1
  store i32 %inc.i276.i.i, i32* %idx.i1283.i, align 8
  %call31.i250.i.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 464, i32 0, i32 0, i32 0) #11
  %482 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %482)
  %483 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i71.i252.i.i = icmp eq i32* %483, null
  br i1 %cmp.i71.i252.i.i, label %emit.exit277.i.i.emit_a64_mov_i.exit259.i.i_crit_edge, label %if.then.i75.i256.i.i

emit.exit277.i.i.emit_a64_mov_i.exit259.i.i_crit_edge: ; preds = %emit.exit277.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_a64_mov_i.exit259.i.i

if.then.i75.i256.i.i:                             ; preds = %emit.exit277.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %484 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %484)
  %485 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i73.i254.i.i = sext i32 %485 to i64
  %arrayidx.i74.i255.i.i = getelementptr i32, i32* %483, i64 %idxprom.i73.i254.i.i
  %486 = ptrtoint i32* %arrayidx.i74.i255.i.i to i64
  call void @__asan_store4_noabort(i64 %486)
  store i32 %call31.i250.i.i, i32* %arrayidx.i74.i255.i.i, align 4
  br label %emit_a64_mov_i.exit259.i.i

emit_a64_mov_i.exit259.i.i:                       ; preds = %emit.exit277.i.i.emit_a64_mov_i.exit259.i.i_crit_edge, %if.then.i75.i256.i.i
  %487 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %487)
  %488 = load i32, i32* %idx.i1283.i, align 8
  %inc.i77.i258.i.i = add i32 %488, 1
  store i32 %inc.i77.i258.i.i, i32* %idx.i1283.i, align 8
  %call36.i.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 10, i32 1, i32 10, i32 0, i32 1, i32 0) #11
  %489 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %489)
  %490 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i241.i.i = icmp eq i32* %490, null
  br i1 %cmp.i241.i.i, label %emit_a64_mov_i.exit259.i.i.emit.exit248.i.i_crit_edge, label %if.then.i245.i.i

emit_a64_mov_i.exit259.i.i.emit.exit248.i.i_crit_edge: ; preds = %emit_a64_mov_i.exit259.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit248.i.i

if.then.i245.i.i:                                 ; preds = %emit_a64_mov_i.exit259.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %491 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %491)
  %492 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i243.i.i = sext i32 %492 to i64
  %arrayidx.i244.i.i = getelementptr i32, i32* %490, i64 %idxprom.i243.i.i
  %493 = ptrtoint i32* %arrayidx.i244.i.i to i64
  call void @__asan_store4_noabort(i64 %493)
  store i32 %call36.i.i, i32* %arrayidx.i244.i.i, align 4
  br label %emit.exit248.i.i

emit.exit248.i.i:                                 ; preds = %emit_a64_mov_i.exit259.i.i.emit.exit248.i.i_crit_edge, %if.then.i245.i.i
  %494 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %494)
  %495 = load i32, i32* %idx.i1283.i, align 8
  %inc.i247.i.i = add i32 %495, 1
  store i32 %inc.i247.i.i, i32* %idx.i1283.i, align 8
  %call42.i.i = call i32 @aarch64_insn_gen_bitfield(i32 11, i32 2, i32 61, i32 60, i32 1, i32 1) #11
  %496 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %496)
  %497 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i232.i.i = icmp eq i32* %497, null
  br i1 %cmp.i232.i.i, label %emit.exit248.i.i.emit.exit239.i.i_crit_edge, label %if.then.i236.i.i

emit.exit248.i.i.emit.exit239.i.i_crit_edge:      ; preds = %emit.exit248.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit239.i.i

if.then.i236.i.i:                                 ; preds = %emit.exit248.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %498 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %498)
  %499 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i234.i.i = sext i32 %499 to i64
  %arrayidx.i235.i.i = getelementptr i32, i32* %497, i64 %idxprom.i234.i.i
  %500 = ptrtoint i32* %arrayidx.i235.i.i to i64
  call void @__asan_store4_noabort(i64 %500)
  store i32 %call42.i.i, i32* %arrayidx.i235.i.i, align 4
  br label %emit.exit239.i.i

emit.exit239.i.i:                                 ; preds = %emit.exit248.i.i.emit.exit239.i.i_crit_edge, %if.then.i236.i.i
  %501 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %501)
  %502 = load i32, i32* %idx.i1283.i, align 8
  %inc.i238.i.i = add i32 %502, 1
  store i32 %inc.i238.i.i, i32* %idx.i1283.i, align 8
  %call46.i.i = call i32 @aarch64_insn_gen_load_store_reg(i32 11, i32 10, i32 11, i32 3, i32 0) #11
  %503 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %503)
  %504 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i223.i.i = icmp eq i32* %504, null
  br i1 %cmp.i223.i.i, label %emit.exit239.i.i.emit.exit230.i.i_crit_edge, label %if.then.i227.i.i

emit.exit239.i.i.emit.exit230.i.i_crit_edge:      ; preds = %emit.exit239.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit230.i.i

if.then.i227.i.i:                                 ; preds = %emit.exit239.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %505 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %505)
  %506 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i225.i.i = sext i32 %506 to i64
  %arrayidx.i226.i.i = getelementptr i32, i32* %504, i64 %idxprom.i225.i.i
  %507 = ptrtoint i32* %arrayidx.i226.i.i to i64
  call void @__asan_store4_noabort(i64 %507)
  store i32 %call46.i.i, i32* %arrayidx.i226.i.i, align 4
  br label %emit.exit230.i.i

emit.exit230.i.i:                                 ; preds = %emit.exit239.i.i.emit.exit230.i.i_crit_edge, %if.then.i227.i.i
  %508 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %508)
  %509 = load i32, i32* %idx.i1283.i, align 8
  %inc.i229.i.i = add i32 %509, 1
  store i32 %inc.i229.i.i, i32* %idx.i1283.i, align 8
  %510 = load i32, i32* @out_offset, align 4
  %inc.i229.neg.i.i = xor i32 %509, 1073741823
  %sub48155.i.i = add i32 %inc.i229.neg.i.i, %416
  %sub49.i.i = add i32 %sub48155.i.i, %510
  %shl50.i.i = shl i32 %sub49.i.i, 2
  %conv51.i.i = sext i32 %shl50.i.i to i64
  %call53.i.i = call i32 @aarch64_insn_gen_comp_branch_imm(i64 0, i64 %conv51.i.i, i32 11, i32 1, i32 3) #11
  %511 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %511)
  %512 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i214.i.i = icmp eq i32* %512, null
  br i1 %cmp.i214.i.i, label %emit.exit230.i.i.emit.exit221.i.i_crit_edge, label %if.then.i218.i.i

emit.exit230.i.i.emit.exit221.i.i_crit_edge:      ; preds = %emit.exit230.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit221.i.i

if.then.i218.i.i:                                 ; preds = %emit.exit230.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %513 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %513)
  %514 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i216.i.i = sext i32 %514 to i64
  %arrayidx.i217.i.i = getelementptr i32, i32* %512, i64 %idxprom.i216.i.i
  %515 = ptrtoint i32* %arrayidx.i217.i.i to i64
  call void @__asan_store4_noabort(i64 %515)
  store i32 %call53.i.i, i32* %arrayidx.i217.i.i, align 4
  br label %emit.exit221.i.i

emit.exit221.i.i:                                 ; preds = %emit.exit230.i.i.emit.exit221.i.i_crit_edge, %if.then.i218.i.i
  %516 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %516)
  %517 = load i32, i32* %idx.i1283.i, align 8
  %inc.i220.i.i = add i32 %517, 1
  store i32 %inc.i220.i.i, i32* %idx.i1283.i, align 8
  %call31.i194.i.i = call i32 @aarch64_insn_gen_movewide(i32 10, i32 48, i32 0, i32 0, i32 0) #11
  %518 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %518)
  %519 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i71.i196.i.i = icmp eq i32* %519, null
  br i1 %cmp.i71.i196.i.i, label %emit.exit221.i.i.emit_a64_mov_i.exit203.i.i_crit_edge, label %if.then.i75.i200.i.i

emit.exit221.i.i.emit_a64_mov_i.exit203.i.i_crit_edge: ; preds = %emit.exit221.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit_a64_mov_i.exit203.i.i

if.then.i75.i200.i.i:                             ; preds = %emit.exit221.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %520 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %520)
  %521 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i73.i198.i.i = sext i32 %521 to i64
  %arrayidx.i74.i199.i.i = getelementptr i32, i32* %519, i64 %idxprom.i73.i198.i.i
  %522 = ptrtoint i32* %arrayidx.i74.i199.i.i to i64
  call void @__asan_store4_noabort(i64 %522)
  store i32 %call31.i194.i.i, i32* %arrayidx.i74.i199.i.i, align 4
  br label %emit_a64_mov_i.exit203.i.i

emit_a64_mov_i.exit203.i.i:                       ; preds = %emit.exit221.i.i.emit_a64_mov_i.exit203.i.i_crit_edge, %if.then.i75.i200.i.i
  %523 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %523)
  %524 = load i32, i32* %idx.i1283.i, align 8
  %inc.i77.i202.i.i = add i32 %524, 1
  store i32 %inc.i77.i202.i.i, i32* %idx.i1283.i, align 8
  %call58.i.i = call i32 @aarch64_insn_gen_load_store_reg(i32 10, i32 11, i32 10, i32 3, i32 0) #11
  %525 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %525)
  %526 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i185.i.i = icmp eq i32* %526, null
  br i1 %cmp.i185.i.i, label %emit_a64_mov_i.exit203.i.i.emit.exit192.i.i_crit_edge, label %if.then.i189.i.i

emit_a64_mov_i.exit203.i.i.emit.exit192.i.i_crit_edge: ; preds = %emit_a64_mov_i.exit203.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit192.i.i

if.then.i189.i.i:                                 ; preds = %emit_a64_mov_i.exit203.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %527 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %527)
  %528 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i187.i.i = sext i32 %528 to i64
  %arrayidx.i188.i.i = getelementptr i32, i32* %526, i64 %idxprom.i187.i.i
  %529 = ptrtoint i32* %arrayidx.i188.i.i to i64
  call void @__asan_store4_noabort(i64 %529)
  store i32 %call58.i.i, i32* %arrayidx.i188.i.i, align 4
  br label %emit.exit192.i.i

emit.exit192.i.i:                                 ; preds = %emit_a64_mov_i.exit203.i.i.emit.exit192.i.i_crit_edge, %if.then.i189.i.i
  %530 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %530)
  %531 = load i32, i32* %idx.i1283.i, align 8
  %inc.i191.i.i = add i32 %531, 1
  store i32 %inc.i191.i.i, i32* %idx.i1283.i, align 8
  %call61.i.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 10, i32 10, i32 28, i32 1, i32 0) #11
  %532 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %532)
  %533 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i176.i.i = icmp eq i32* %533, null
  br i1 %cmp.i176.i.i, label %emit.exit192.i.i.emit.exit183.i.i_crit_edge, label %if.then.i180.i.i

emit.exit192.i.i.emit.exit183.i.i_crit_edge:      ; preds = %emit.exit192.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit183.i.i

if.then.i180.i.i:                                 ; preds = %emit.exit192.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %534 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %534)
  %535 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i178.i.i = sext i32 %535 to i64
  %arrayidx.i179.i.i = getelementptr i32, i32* %533, i64 %idxprom.i178.i.i
  %536 = ptrtoint i32* %arrayidx.i179.i.i to i64
  call void @__asan_store4_noabort(i64 %536)
  store i32 %call61.i.i, i32* %arrayidx.i179.i.i, align 4
  br label %emit.exit183.i.i

emit.exit183.i.i:                                 ; preds = %emit.exit192.i.i.emit.exit183.i.i_crit_edge, %if.then.i180.i.i
  %537 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %537)
  %538 = load i32, i32* %idx.i1283.i, align 8
  %inc.i182.i.i = add i32 %538, 1
  store i32 %inc.i182.i.i, i32* %idx.i1283.i, align 8
  %539 = ptrtoint i32* %stack_size.i.i to i64
  call void @__asan_load4_noabort(i64 %539)
  %540 = load i32, i32* %stack_size.i.i, align 8
  %call62.i.i = call i32 @aarch64_insn_gen_add_sub_imm(i32 31, i32 31, i32 %540, i32 1, i32 0) #11
  %541 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %541)
  %542 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i167.i.i = icmp eq i32* %542, null
  br i1 %cmp.i167.i.i, label %emit.exit183.i.i.emit.exit174.i.i_crit_edge, label %if.then.i171.i.i

emit.exit183.i.i.emit.exit174.i.i_crit_edge:      ; preds = %emit.exit183.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit174.i.i

if.then.i171.i.i:                                 ; preds = %emit.exit183.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %543 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %543)
  %544 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i169.i.i = sext i32 %544 to i64
  %arrayidx.i170.i.i = getelementptr i32, i32* %542, i64 %idxprom.i169.i.i
  %545 = ptrtoint i32* %arrayidx.i170.i.i to i64
  call void @__asan_store4_noabort(i64 %545)
  store i32 %call62.i.i, i32* %arrayidx.i170.i.i, align 4
  br label %emit.exit174.i.i

emit.exit174.i.i:                                 ; preds = %emit.exit183.i.i.emit.exit174.i.i_crit_edge, %if.then.i171.i.i
  %546 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %546)
  %547 = load i32, i32* %idx.i1283.i, align 8
  %inc.i173.i.i = add i32 %547, 1
  store i32 %inc.i173.i.i, i32* %idx.i1283.i, align 8
  %call64.i.i = call i32 @aarch64_insn_gen_branch_reg(i32 10, i32 0) #11
  %548 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %548)
  %549 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i158.i.i = icmp eq i32* %549, null
  br i1 %cmp.i158.i.i, label %emit.exit174.i.i.emit.exit165.i.i_crit_edge, label %if.then.i162.i.i

emit.exit174.i.i.emit.exit165.i.i_crit_edge:      ; preds = %emit.exit174.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit165.i.i

if.then.i162.i.i:                                 ; preds = %emit.exit174.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %550 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %550)
  %551 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i160.i.i = sext i32 %551 to i64
  %arrayidx.i161.i.i = getelementptr i32, i32* %549, i64 %idxprom.i160.i.i
  %552 = ptrtoint i32* %arrayidx.i161.i.i to i64
  call void @__asan_store4_noabort(i64 %552)
  store i32 %call64.i.i, i32* %arrayidx.i161.i.i, align 4
  br label %emit.exit165.i.i

emit.exit165.i.i:                                 ; preds = %emit.exit174.i.i.emit.exit165.i.i_crit_edge, %if.then.i162.i.i
  %553 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %553)
  %554 = load i32, i32* %idx.i1283.i, align 8
  %inc.i164.i.i = add i32 %554, 1
  store i32 %inc.i164.i.i, i32* %idx.i1283.i, align 8
  %555 = load i32, i32* @out_offset, align 4
  call void @__sanitizer_cov_trace_const_cmp4(i32 -1, i32 %555)
  %cmp.i1504.i = icmp eq i32 %555, -1
  %sub67.i.i = sub i32 %inc.i164.i.i, %416
  br i1 %cmp.i1504.i, label %if.then.i1505.i, label %emit.exit165.i.i.if.end.i1506.i_crit_edge

emit.exit165.i.i.if.end.i1506.i_crit_edge:        ; preds = %emit.exit165.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end.i1506.i

if.then.i1505.i:                                  ; preds = %emit.exit165.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i32 %sub67.i.i, i32* @out_offset, align 4
  br label %if.end.i1506.i

if.end.i1506.i:                                   ; preds = %emit.exit165.i.i.if.end.i1506.i_crit_edge, %if.then.i1505.i
  %556 = load i32, i32* @out_offset, align 4
  call void @__sanitizer_cov_trace_cmp4(i32 %sub67.i.i, i32 %556)
  %cmp70.i.i = icmp eq i32 %sub67.i.i, %556
  br i1 %cmp70.i.i, label %if.end.i1506.i.if.end7_crit_edge, label %if.then72.i.i

if.end.i1506.i.if.end7_crit_edge:                 ; preds = %if.end.i1506.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

if.then72.i.i:                                    ; preds = %if.end.i1506.i
  %.b156.i.i = load i1, i1* @emit_bpf_tail_call.__print_once, align 1
  br i1 %.b156.i.i, label %if.then72.i.i.if.end7_crit_edge, label %if.then74.i.i

if.then72.i.i.if.end7_crit_edge:                  ; preds = %if.then72.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

if.then74.i.i:                                    ; preds = %if.then72.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @emit_bpf_tail_call.__print_once, align 1
  %call77.i.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.3, i64 0, i64 0), i32 %sub67.i.i, i32 %556) #12
  br label %if.end7

sw.bb564.i:                                       ; preds = %for.body
  %len.i = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %17, i64 0, i32 4
  %557 = ptrtoint i32* %len.i to i64
  call void @__asan_load4_noabort(i64 %557)
  %558 = load i32, i32* %len.i, align 4
  %sub566.i = add i32 %558, -1
  call void @__sanitizer_cov_trace_cmp4(i32 %sub566.i, i32 %conv11.i)
  %cmp567.i = icmp eq i32 %sub566.i, %conv11.i
  br i1 %cmp567.i, label %sw.bb564.i.if.end7_crit_edge, label %if.end570.i

sw.bb564.i.if.end7_crit_edge:                     ; preds = %sw.bb564.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

if.end570.i:                                      ; preds = %sw.bb564.i
  %559 = ptrtoint i32* %epilogue_offset.i.i to i64
  call void @__asan_load4_noabort(i64 %559)
  %560 = load i32, i32* %epilogue_offset.i.i, align 4
  %561 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %561)
  %562 = load i32, i32* %idx.i1283.i, align 8
  %sub.i.i = sub i32 %560, %562
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub.i.i)
  %cmp573.i = icmp sgt i32 %sub.i.i, 0
  call void @__sanitizer_cov_trace_const_cmp4(i32 67108863, i32 %sub.i.i)
  %tobool577.i = icmp ugt i32 %sub.i.i, 67108863
  %or.cond1234.i = and i1 %cmp573.i, %tobool577.i
  br i1 %or.cond1234.i, label %if.end570.i.if.then585.i_crit_edge, label %lor.lhs.false578.i

if.end570.i.if.then585.i_crit_edge:               ; preds = %if.end570.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then585.i

lor.lhs.false578.i:                               ; preds = %if.end570.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %sub.i.i)
  %cmp579.i = icmp slt i32 %sub.i.i, 0
  call void @__sanitizer_cov_trace_const_cmp4(i32 -67108864, i32 %sub.i.i)
  %tobool584.i = icmp ult i32 %sub.i.i, -67108864
  %or.cond1235.i = and i1 %cmp579.i, %tobool584.i
  br i1 %or.cond1235.i, label %lor.lhs.false578.i.if.then585.i_crit_edge, label %do.end589.i

lor.lhs.false578.i.if.then585.i_crit_edge:        ; preds = %lor.lhs.false578.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then585.i

if.then585.i:                                     ; preds = %lor.lhs.false578.i.if.then585.i_crit_edge, %if.end570.i.if.then585.i_crit_edge
  %call586.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i32 %conv11.i, i32 %sub.i.i, i32 %sub.i.i) #12
  br label %if.end7

do.end589.i:                                      ; preds = %lor.lhs.false578.i
  %shl590.i = shl i32 %sub.i.i, 2
  %conv591.i = sext i32 %shl590.i to i64
  %call592.i = call i32 @aarch64_insn_gen_branch_imm(i64 0, i64 %conv591.i, i32 0) #11
  %563 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %563)
  %564 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1487.i = icmp eq i32* %564, null
  br i1 %cmp.i1487.i, label %do.end589.i.emit.exit1495.i_crit_edge, label %if.then.i1491.i

do.end589.i.emit.exit1495.i_crit_edge:            ; preds = %do.end589.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1495.i

if.then.i1491.i:                                  ; preds = %do.end589.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %565 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %565)
  %566 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1489.i = sext i32 %566 to i64
  %arrayidx.i1490.i = getelementptr i32, i32* %564, i64 %idxprom.i1489.i
  %567 = ptrtoint i32* %arrayidx.i1490.i to i64
  call void @__asan_store4_noabort(i64 %567)
  store i32 %call592.i, i32* %arrayidx.i1490.i, align 4
  br label %emit.exit1495.i

emit.exit1495.i:                                  ; preds = %do.end589.i.emit.exit1495.i_crit_edge, %if.then.i1491.i
  %568 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %568)
  %569 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1493.i = add i32 %569, 1
  store i32 %inc.i1493.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb593.i:                                       ; preds = %for.body
  %insn1.sroa.6.0..sroa_idx781.i = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %arrayidx, i64 1, i32 3
  %570 = ptrtoint i32* %insn1.sroa.6.0..sroa_idx781.i to i64
  call void @__asan_load4_noabort(i64 %570)
  %insn1.sroa.6.0.copyload.i = load i32, i32* %insn1.sroa.6.0..sroa_idx781.i, align 4
  %conv5971229.i = zext i32 %insn1.sroa.6.0.copyload.i to i64
  %shl598.i = shl nuw i64 %conv5971229.i, 32
  %conv599.i = zext i32 %15 to i64
  %or.i = or i64 %shl598.i, %conv599.i
  %conv600.i = and i32 %9, 255
  %neg.i.i = xor i64 %or.i, -1
  call void @__sanitizer_cov_trace_const_cmp8(i64 4294967295, i64 %or.i)
  %tobool.i1443.i = icmp ugt i64 %or.i, 4294967295
  br i1 %tobool.i1443.i, label %if.end.i.i, label %if.then.i1444.i

if.then.i1444.i:                                  ; preds = %sw.bb593.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call fastcc void @emit_a64_mov_i(i32 0, i32 %conv600.i, i32 %15, %struct.jit_ctx* %ctx) #11
  br label %if.then

if.end.i.i:                                       ; preds = %sw.bb593.i
  %and.i.i.i = and i64 %conv599.i, 65535
  call void @__sanitizer_cov_trace_const_cmp8(i64 65535, i64 %and.i.i.i)
  %cmp.i.i.i = icmp ne i64 %and.i.i.i, 65535
  %conv1.i.i.i = zext i1 %cmp.i.i.i to i32
  %shr2.i.i.i = lshr i64 %conv599.i, 16
  call void @__sanitizer_cov_trace_const_cmp8(i64 65535, i64 %shr2.i.i.i)
  %cmp8.i.i.i = icmp ne i64 %shr2.i.i.i, 65535
  %conv9.i.i.i = zext i1 %cmp8.i.i.i to i32
  %and11.i.i.i = and i64 %conv5971229.i, 65535
  call void @__sanitizer_cov_trace_const_cmp8(i64 65535, i64 %and11.i.i.i)
  %cmp16.i.i.i = icmp ne i64 %and11.i.i.i, 65535
  %conv17.i.i.i = zext i1 %cmp16.i.i.i to i32
  %shr19.i.i.i = lshr i64 %conv5971229.i, 16
  call void @__sanitizer_cov_trace_const_cmp8(i64 65535, i64 %shr19.i.i.i)
  %cmp25.i.i.i = icmp ne i64 %shr19.i.i.i, 65535
  %conv26.i.i.i = zext i1 %cmp25.i.i.i to i32
  %add.i.i.i = add nuw nsw i32 %conv9.i.i.i, %conv1.i.i.i
  %add18.i.i.i = add nuw nsw i32 %add.i.i.i, %conv26.i.i.i
  %add27.i.i.i = add nuw nsw i32 %add18.i.i.i, %conv17.i.i.i
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and.i.i.i)
  %cmp.i105.i.i = icmp ne i64 %and.i.i.i, 0
  %conv1.i106.i.i = zext i1 %cmp.i105.i.i to i32
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %shr2.i.i.i)
  %cmp8.i109.i.i = icmp ne i64 %shr2.i.i.i, 0
  %conv9.i110.i.i = zext i1 %cmp8.i109.i.i to i32
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and11.i.i.i)
  %cmp16.i114.i.i = icmp ne i64 %and11.i.i.i, 0
  %conv17.i115.i.i = zext i1 %cmp16.i114.i.i to i32
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %shr19.i.i.i)
  %cmp25.i118.i.i = icmp ne i64 %shr19.i.i.i, 0
  %conv26.i119.i.i = zext i1 %cmp25.i118.i.i to i32
  %add.i111.i.i = add nuw nsw i32 %conv9.i110.i.i, %conv1.i106.i.i
  %add18.i116.i.i = add nuw nsw i32 %add.i111.i.i, %conv26.i119.i.i
  %add27.i120.i.i = add nuw nsw i32 %add18.i116.i.i, %conv17.i115.i.i
  call void @__sanitizer_cov_trace_cmp4(i32 %add27.i.i.i, i32 %add27.i120.i.i)
  %cmp.i1445.i = icmp ult i32 %add27.i.i.i, %add27.i120.i.i
  br i1 %cmp.i1445.i, label %if.then15.i.i, label %if.else.i.i

if.then15.i.i:                                    ; preds = %if.end.i.i
  call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %or.i)
  %cmp.i101.i.i = icmp eq i64 %or.i, -1
  %571 = call i64 @llvm.ctlz.i64(i64 %neg.i.i, i1 false) #11, !range !31
  %572 = trunc i64 %571 to i32
  %conv.i102.op.i.i = sub nsw i32 63, %572
  %conv.i102.op.op.i.i = and i32 %conv.i102.op.i.i, -16
  %and123.i.i = select i1 %cmp.i101.i.i, i32 -16, i32 %conv.i102.op.op.i.i
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and123.i.i)
  %cmp8124.i.i = icmp sgt i32 %and123.i.i, 0
  %and.125.i.i = select i1 %cmp8124.i.i, i32 %and123.i.i, i32 0
  %sh_prom126.i.i = zext i32 %and.125.i.i to i64
  %shr16.i.i = lshr i64 %neg.i.i, %sh_prom126.i.i
  %573 = trunc i64 %shr16.i.i to i32
  %conv18.i.i = and i32 %573, 65535
  %call19.i.i = call i32 @aarch64_insn_gen_movewide(i32 %conv600.i, i32 %conv18.i.i, i32 %and.125.i.i, i32 1, i32 2) #11
  %574 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %574)
  %575 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i92.i.i = icmp eq i32* %575, null
  br i1 %cmp.i92.i.i, label %if.then15.i.i.if.end25.i.i_crit_edge, label %if.then.i96.i.i

if.then15.i.i.if.end25.i.i_crit_edge:             ; preds = %if.then15.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end25.i.i

if.then.i96.i.i:                                  ; preds = %if.then15.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %576 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %576)
  %577 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i94.i.i = sext i32 %577 to i64
  %arrayidx.i95.i.i = getelementptr i32, i32* %575, i64 %idxprom.i94.i.i
  %578 = ptrtoint i32* %arrayidx.i95.i.i to i64
  call void @__asan_store4_noabort(i64 %578)
  store i32 %call19.i.i, i32* %arrayidx.i95.i.i, align 4
  br label %if.end25.i.i

if.else.i.i:                                      ; preds = %if.end.i.i
  %579 = call i64 @llvm.ctlz.i64(i64 %or.i, i1 false) #11, !range !31
  %580 = trunc i64 %579 to i32
  %cond.i.i = sub nsw i32 63, %580
  %and.i.i = and i32 %cond.i.i, -16
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %and.i.i)
  %cmp8.i.i = icmp sgt i32 %and.i.i, 0
  %and..i.i = select i1 %cmp8.i.i, i32 %and.i.i, i32 0
  %sh_prom.i.i = zext i32 %and..i.i to i64
  %shr21.i.i = lshr i64 %or.i, %sh_prom.i.i
  %581 = trunc i64 %shr21.i.i to i32
  %conv23.i.i = and i32 %581, 65535
  %call24.i.i = call i32 @aarch64_insn_gen_movewide(i32 %conv600.i, i32 %conv23.i.i, i32 %and..i.i, i32 1, i32 0) #11
  %582 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %582)
  %583 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i83.i.i = icmp eq i32* %583, null
  br i1 %cmp.i83.i.i, label %if.else.i.i.if.end25.i.i_crit_edge, label %if.then.i87.i.i

if.else.i.i.if.end25.i.i_crit_edge:               ; preds = %if.else.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end25.i.i

if.then.i87.i.i:                                  ; preds = %if.else.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %584 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %584)
  %585 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i85.i.i = sext i32 %585 to i64
  %arrayidx.i86.i.i = getelementptr i32, i32* %583, i64 %idxprom.i85.i.i
  %586 = ptrtoint i32* %arrayidx.i86.i.i to i64
  call void @__asan_store4_noabort(i64 %586)
  store i32 %call24.i.i, i32* %arrayidx.i86.i.i, align 4
  br label %if.end25.i.i

if.end25.i.i:                                     ; preds = %if.else.i.i.if.end25.i.i_crit_edge, %if.then15.i.i.if.end25.i.i_crit_edge, %if.then.i87.i.i, %if.then.i96.i.i
  %and.127.i.i = phi i32 [ %and.125.i.i, %if.then.i96.i.i ], [ %and.125.i.i, %if.then15.i.i.if.end25.i.i_crit_edge ], [ %and..i.i, %if.then.i87.i.i ], [ %and..i.i, %if.else.i.i.if.end25.i.i_crit_edge ]
  %587 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %587)
  %storemerge.in = load i32, i32* %idx.i1283.i, align 8
  %storemerge = add i32 %storemerge.in, 1
  store i32 %storemerge, i32* %idx.i1283.i, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 15, i32 %and.127.i.i)
  %cmp27131.i.i = icmp ugt i32 %and.127.i.i, 15
  br i1 %cmp27131.i.i, label %while.body.lr.ph.i.i, label %if.end25.i.i.if.then_crit_edge

if.end25.i.i.if.then_crit_edge:                   ; preds = %if.end25.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then

while.body.lr.ph.i.i:                             ; preds = %if.end25.i.i
  %shift.0130.i.i = add nsw i32 %and.127.i.i, -16
  %cond34.i.i = select i1 %cmp.i1445.i, i64 65535, i64 0
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %if.end44.i.i.while.body.i.i_crit_edge, %while.body.lr.ph.i.i
  %shift.0132.i.i = phi i32 [ %shift.0130.i.i, %while.body.lr.ph.i.i ], [ %shift.0.i.i, %if.end44.i.i.while.body.i.i_crit_edge ]
  %sh_prom29.i.i = zext i32 %shift.0132.i.i to i64
  %shr30.i.i = lshr i64 %or.i, %sh_prom29.i.i
  %and31.i.i = and i64 %shr30.i.i, 65535
  call void @__sanitizer_cov_trace_cmp8(i64 %and31.i.i, i64 %cond34.i.i)
  %cmp36.i.i = icmp eq i64 %and31.i.i, %cond34.i.i
  br i1 %cmp36.i.i, label %while.body.i.i.if.end44.i.i_crit_edge, label %if.then38.i.i

while.body.i.i.if.end44.i.i_crit_edge:            ; preds = %while.body.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end44.i.i

if.then38.i.i:                                    ; preds = %while.body.i.i
  %conv42.i.i = trunc i64 %and31.i.i to i32
  %call43.i.i = call i32 @aarch64_insn_gen_movewide(i32 %conv600.i, i32 %conv42.i.i, i32 %shift.0132.i.i, i32 1, i32 1) #11
  %588 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %588)
  %589 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i81.i.i = icmp eq i32* %589, null
  br i1 %cmp.i81.i.i, label %if.then38.i.i.emit.exit.i.i_crit_edge, label %if.then.i.i.i

if.then38.i.i.emit.exit.i.i_crit_edge:            ; preds = %if.then38.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit.i.i

if.then.i.i.i:                                    ; preds = %if.then38.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %590 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %590)
  %591 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i.i.i = sext i32 %591 to i64
  %arrayidx.i.i.i = getelementptr i32, i32* %589, i64 %idxprom.i.i.i
  %592 = ptrtoint i32* %arrayidx.i.i.i to i64
  call void @__asan_store4_noabort(i64 %592)
  store i32 %call43.i.i, i32* %arrayidx.i.i.i, align 4
  br label %emit.exit.i.i

emit.exit.i.i:                                    ; preds = %if.then38.i.i.emit.exit.i.i_crit_edge, %if.then.i.i.i
  %593 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %593)
  %594 = load i32, i32* %idx.i1283.i, align 8
  %inc.i.i.i = add i32 %594, 1
  store i32 %inc.i.i.i, i32* %idx.i1283.i, align 8
  br label %if.end44.i.i

if.end44.i.i:                                     ; preds = %while.body.i.i.if.end44.i.i_crit_edge, %emit.exit.i.i
  %shift.0.i.i = add i32 %shift.0132.i.i, -16
  %cmp27.i.i = icmp sgt i32 %shift.0.i.i, -1
  br i1 %cmp27.i.i, label %if.end44.i.i.while.body.i.i_crit_edge, label %if.end44.i.i.if.then_crit_edge

if.end44.i.i.if.then_crit_edge:                   ; preds = %if.end44.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.then

if.end44.i.i.while.body.i.i_crit_edge:            ; preds = %if.end44.i.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %while.body.i.i

sw.bb603.i:                                       ; preds = %for.body.sw.bb603.i_crit_edge123, %for.body.sw.bb603.i_crit_edge122, %for.body.sw.bb603.i_crit_edge121, %for.body.sw.bb603.i_crit_edge
  %conv605.i = sext i16 %13 to i32
  call fastcc void @emit_a64_mov_i(i32 1, i32 10, i32 %conv605.i, %struct.jit_ctx* %ctx) #11
  %595 = lshr exact i32 %and20.i, 3
  %596 = zext i32 %595 to i64
  call void @__sanitizer_cov_trace_switch(i64 %596, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.11, i32 0, i32 0))
  switch i32 %595, label %sw.epilog628775.i [
    i32 0, label %sw.bb608.i
    i32 1, label %sw.bb613.i
    i32 2, label %sw.bb618.i
    i32 3, label %sw.bb623.i
  ]

sw.bb608.i:                                       ; preds = %sw.bb603.i
  %conv609.i = and i32 %9, 255
  %conv610.i = and i32 %11, 255
  %call612.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv609.i, i32 %conv610.i, i32 10, i32 2, i32 0) #11
  %597 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %597)
  %598 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1426.i = icmp eq i32* %598, null
  br i1 %cmp.i1426.i, label %sw.bb608.i.emit.exit1433.i_crit_edge, label %if.then.i1430.i

sw.bb608.i.emit.exit1433.i_crit_edge:             ; preds = %sw.bb608.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1433.i

if.then.i1430.i:                                  ; preds = %sw.bb608.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %599 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %599)
  %600 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1428.i = sext i32 %600 to i64
  %arrayidx.i1429.i = getelementptr i32, i32* %598, i64 %idxprom.i1428.i
  %601 = ptrtoint i32* %arrayidx.i1429.i to i64
  call void @__asan_store4_noabort(i64 %601)
  store i32 %call612.i, i32* %arrayidx.i1429.i, align 4
  br label %emit.exit1433.i

emit.exit1433.i:                                  ; preds = %sw.bb608.i.emit.exit1433.i_crit_edge, %if.then.i1430.i
  %602 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %602)
  %603 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1432.i = add i32 %603, 1
  store i32 %inc.i1432.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb613.i:                                       ; preds = %sw.bb603.i
  %conv614.i = and i32 %9, 255
  %conv615.i = and i32 %11, 255
  %call617.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv614.i, i32 %conv615.i, i32 10, i32 1, i32 0) #11
  %604 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %604)
  %605 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1417.i = icmp eq i32* %605, null
  br i1 %cmp.i1417.i, label %sw.bb613.i.emit.exit1424.i_crit_edge, label %if.then.i1421.i

sw.bb613.i.emit.exit1424.i_crit_edge:             ; preds = %sw.bb613.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1424.i

if.then.i1421.i:                                  ; preds = %sw.bb613.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %606 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %606)
  %607 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1419.i = sext i32 %607 to i64
  %arrayidx.i1420.i = getelementptr i32, i32* %605, i64 %idxprom.i1419.i
  %608 = ptrtoint i32* %arrayidx.i1420.i to i64
  call void @__asan_store4_noabort(i64 %608)
  store i32 %call617.i, i32* %arrayidx.i1420.i, align 4
  br label %emit.exit1424.i

emit.exit1424.i:                                  ; preds = %sw.bb613.i.emit.exit1424.i_crit_edge, %if.then.i1421.i
  %609 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %609)
  %610 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1423.i = add i32 %610, 1
  store i32 %inc.i1423.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb618.i:                                       ; preds = %sw.bb603.i
  %conv619.i = and i32 %9, 255
  %conv620.i = and i32 %11, 255
  %call622.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv619.i, i32 %conv620.i, i32 10, i32 0, i32 0) #11
  %611 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %611)
  %612 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1408.i = icmp eq i32* %612, null
  br i1 %cmp.i1408.i, label %sw.bb618.i.emit.exit1415.i_crit_edge, label %if.then.i1412.i

sw.bb618.i.emit.exit1415.i_crit_edge:             ; preds = %sw.bb618.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1415.i

if.then.i1412.i:                                  ; preds = %sw.bb618.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %613 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %613)
  %614 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1410.i = sext i32 %614 to i64
  %arrayidx.i1411.i = getelementptr i32, i32* %612, i64 %idxprom.i1410.i
  %615 = ptrtoint i32* %arrayidx.i1411.i to i64
  call void @__asan_store4_noabort(i64 %615)
  store i32 %call622.i, i32* %arrayidx.i1411.i, align 4
  br label %emit.exit1415.i

emit.exit1415.i:                                  ; preds = %sw.bb618.i.emit.exit1415.i_crit_edge, %if.then.i1412.i
  %616 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %616)
  %617 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1414.i = add i32 %617, 1
  store i32 %inc.i1414.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb623.i:                                       ; preds = %sw.bb603.i
  %conv624.i = and i32 %9, 255
  %conv625.i = and i32 %11, 255
  %call627.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv624.i, i32 %conv625.i, i32 10, i32 3, i32 0) #11
  %618 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %618)
  %619 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1399.i = icmp eq i32* %619, null
  br i1 %cmp.i1399.i, label %sw.bb623.i.emit.exit1406.i_crit_edge, label %if.then.i1403.i

sw.bb623.i.emit.exit1406.i_crit_edge:             ; preds = %sw.bb623.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1406.i

if.then.i1403.i:                                  ; preds = %sw.bb623.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %620 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %620)
  %621 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1401.i = sext i32 %621 to i64
  %arrayidx.i1402.i = getelementptr i32, i32* %619, i64 %idxprom.i1401.i
  %622 = ptrtoint i32* %arrayidx.i1402.i to i64
  call void @__asan_store4_noabort(i64 %622)
  store i32 %call627.i, i32* %arrayidx.i1402.i, align 4
  br label %emit.exit1406.i

emit.exit1406.i:                                  ; preds = %sw.bb623.i.emit.exit1406.i_crit_edge, %if.then.i1403.i
  %623 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %623)
  %624 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1405.i = add i32 %624, 1
  store i32 %inc.i1405.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.epilog628775.i:                                ; preds = %sw.bb603.i
  unreachable

sw.bb629.i:                                       ; preds = %for.body.sw.bb629.i_crit_edge126, %for.body.sw.bb629.i_crit_edge125, %for.body.sw.bb629.i_crit_edge124, %for.body.sw.bb629.i_crit_edge
  %conv631.i = sext i16 %13 to i32
  call fastcc void @emit_a64_mov_i(i32 1, i32 11, i32 %conv631.i, %struct.jit_ctx* %ctx) #11
  call fastcc void @emit_a64_mov_i(i32 1, i32 10, i32 %15, %struct.jit_ctx* %ctx) #11
  %625 = lshr exact i32 %and20.i, 3
  %626 = zext i32 %625 to i64
  call void @__sanitizer_cov_trace_switch(i64 %626, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.12, i32 0, i32 0))
  switch i32 %625, label %sw.epilog655776.i [
    i32 0, label %sw.bb635.i
    i32 1, label %sw.bb640.i
    i32 2, label %sw.bb645.i
    i32 3, label %sw.bb650.i
  ]

sw.bb635.i:                                       ; preds = %sw.bb629.i
  %conv637.i = and i32 %9, 255
  %call639.i = call i32 @aarch64_insn_gen_load_store_reg(i32 10, i32 %conv637.i, i32 11, i32 2, i32 1) #11
  %627 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %627)
  %628 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1372.i = icmp eq i32* %628, null
  br i1 %cmp.i1372.i, label %sw.bb635.i.emit.exit1379.i_crit_edge, label %if.then.i1376.i

sw.bb635.i.emit.exit1379.i_crit_edge:             ; preds = %sw.bb635.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1379.i

if.then.i1376.i:                                  ; preds = %sw.bb635.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %629 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %629)
  %630 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1374.i = sext i32 %630 to i64
  %arrayidx.i1375.i = getelementptr i32, i32* %628, i64 %idxprom.i1374.i
  %631 = ptrtoint i32* %arrayidx.i1375.i to i64
  call void @__asan_store4_noabort(i64 %631)
  store i32 %call639.i, i32* %arrayidx.i1375.i, align 4
  br label %emit.exit1379.i

emit.exit1379.i:                                  ; preds = %sw.bb635.i.emit.exit1379.i_crit_edge, %if.then.i1376.i
  %632 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %632)
  %633 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1378.i = add i32 %633, 1
  store i32 %inc.i1378.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb640.i:                                       ; preds = %sw.bb629.i
  %conv642.i = and i32 %9, 255
  %call644.i = call i32 @aarch64_insn_gen_load_store_reg(i32 10, i32 %conv642.i, i32 11, i32 1, i32 1) #11
  %634 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %634)
  %635 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1363.i = icmp eq i32* %635, null
  br i1 %cmp.i1363.i, label %sw.bb640.i.emit.exit1370.i_crit_edge, label %if.then.i1367.i

sw.bb640.i.emit.exit1370.i_crit_edge:             ; preds = %sw.bb640.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1370.i

if.then.i1367.i:                                  ; preds = %sw.bb640.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %636 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %636)
  %637 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1365.i = sext i32 %637 to i64
  %arrayidx.i1366.i = getelementptr i32, i32* %635, i64 %idxprom.i1365.i
  %638 = ptrtoint i32* %arrayidx.i1366.i to i64
  call void @__asan_store4_noabort(i64 %638)
  store i32 %call644.i, i32* %arrayidx.i1366.i, align 4
  br label %emit.exit1370.i

emit.exit1370.i:                                  ; preds = %sw.bb640.i.emit.exit1370.i_crit_edge, %if.then.i1367.i
  %639 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %639)
  %640 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1369.i = add i32 %640, 1
  store i32 %inc.i1369.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb645.i:                                       ; preds = %sw.bb629.i
  %conv647.i = and i32 %9, 255
  %call649.i = call i32 @aarch64_insn_gen_load_store_reg(i32 10, i32 %conv647.i, i32 11, i32 0, i32 1) #11
  %641 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %641)
  %642 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1354.i = icmp eq i32* %642, null
  br i1 %cmp.i1354.i, label %sw.bb645.i.emit.exit1361.i_crit_edge, label %if.then.i1358.i

sw.bb645.i.emit.exit1361.i_crit_edge:             ; preds = %sw.bb645.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1361.i

if.then.i1358.i:                                  ; preds = %sw.bb645.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %643 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %643)
  %644 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1356.i = sext i32 %644 to i64
  %arrayidx.i1357.i = getelementptr i32, i32* %642, i64 %idxprom.i1356.i
  %645 = ptrtoint i32* %arrayidx.i1357.i to i64
  call void @__asan_store4_noabort(i64 %645)
  store i32 %call649.i, i32* %arrayidx.i1357.i, align 4
  br label %emit.exit1361.i

emit.exit1361.i:                                  ; preds = %sw.bb645.i.emit.exit1361.i_crit_edge, %if.then.i1358.i
  %646 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %646)
  %647 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1360.i = add i32 %647, 1
  store i32 %inc.i1360.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb650.i:                                       ; preds = %sw.bb629.i
  %conv652.i = and i32 %9, 255
  %call654.i = call i32 @aarch64_insn_gen_load_store_reg(i32 10, i32 %conv652.i, i32 11, i32 3, i32 1) #11
  %648 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %648)
  %649 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1345.i = icmp eq i32* %649, null
  br i1 %cmp.i1345.i, label %sw.bb650.i.emit.exit1352.i_crit_edge, label %if.then.i1349.i

sw.bb650.i.emit.exit1352.i_crit_edge:             ; preds = %sw.bb650.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1352.i

if.then.i1349.i:                                  ; preds = %sw.bb650.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %650 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %650)
  %651 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1347.i = sext i32 %651 to i64
  %arrayidx.i1348.i = getelementptr i32, i32* %649, i64 %idxprom.i1347.i
  %652 = ptrtoint i32* %arrayidx.i1348.i to i64
  call void @__asan_store4_noabort(i64 %652)
  store i32 %call654.i, i32* %arrayidx.i1348.i, align 4
  br label %emit.exit1352.i

emit.exit1352.i:                                  ; preds = %sw.bb650.i.emit.exit1352.i_crit_edge, %if.then.i1349.i
  %653 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %653)
  %654 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1351.i = add i32 %654, 1
  store i32 %inc.i1351.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.epilog655776.i:                                ; preds = %sw.bb629.i
  unreachable

sw.bb656.i:                                       ; preds = %for.body.sw.bb656.i_crit_edge129, %for.body.sw.bb656.i_crit_edge128, %for.body.sw.bb656.i_crit_edge127, %for.body.sw.bb656.i_crit_edge
  %conv658.i = sext i16 %13 to i32
  call fastcc void @emit_a64_mov_i(i32 1, i32 10, i32 %conv658.i, %struct.jit_ctx* %ctx) #11
  %655 = lshr exact i32 %and20.i, 3
  %656 = zext i32 %655 to i64
  call void @__sanitizer_cov_trace_switch(i64 %656, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__sancov_gen_cov_switch_values.13, i32 0, i32 0))
  switch i32 %655, label %sw.epilog681777.i [
    i32 0, label %sw.bb661.i
    i32 1, label %sw.bb666.i
    i32 2, label %sw.bb671.i
    i32 3, label %sw.bb676.i
  ]

sw.bb661.i:                                       ; preds = %sw.bb656.i
  %conv662.i = and i32 %11, 255
  %conv663.i = and i32 %9, 255
  %call665.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv662.i, i32 %conv663.i, i32 10, i32 2, i32 1) #11
  %657 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %657)
  %658 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1327.i = icmp eq i32* %658, null
  br i1 %cmp.i1327.i, label %sw.bb661.i.emit.exit1334.i_crit_edge, label %if.then.i1331.i

sw.bb661.i.emit.exit1334.i_crit_edge:             ; preds = %sw.bb661.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1334.i

if.then.i1331.i:                                  ; preds = %sw.bb661.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %659 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %659)
  %660 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1329.i = sext i32 %660 to i64
  %arrayidx.i1330.i = getelementptr i32, i32* %658, i64 %idxprom.i1329.i
  %661 = ptrtoint i32* %arrayidx.i1330.i to i64
  call void @__asan_store4_noabort(i64 %661)
  store i32 %call665.i, i32* %arrayidx.i1330.i, align 4
  br label %emit.exit1334.i

emit.exit1334.i:                                  ; preds = %sw.bb661.i.emit.exit1334.i_crit_edge, %if.then.i1331.i
  %662 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %662)
  %663 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1333.i = add i32 %663, 1
  store i32 %inc.i1333.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb666.i:                                       ; preds = %sw.bb656.i
  %conv667.i = and i32 %11, 255
  %conv668.i = and i32 %9, 255
  %call670.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv667.i, i32 %conv668.i, i32 10, i32 1, i32 1) #11
  %664 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %664)
  %665 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1318.i = icmp eq i32* %665, null
  br i1 %cmp.i1318.i, label %sw.bb666.i.emit.exit1325.i_crit_edge, label %if.then.i1322.i

sw.bb666.i.emit.exit1325.i_crit_edge:             ; preds = %sw.bb666.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1325.i

if.then.i1322.i:                                  ; preds = %sw.bb666.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %666 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %666)
  %667 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1320.i = sext i32 %667 to i64
  %arrayidx.i1321.i = getelementptr i32, i32* %665, i64 %idxprom.i1320.i
  %668 = ptrtoint i32* %arrayidx.i1321.i to i64
  call void @__asan_store4_noabort(i64 %668)
  store i32 %call670.i, i32* %arrayidx.i1321.i, align 4
  br label %emit.exit1325.i

emit.exit1325.i:                                  ; preds = %sw.bb666.i.emit.exit1325.i_crit_edge, %if.then.i1322.i
  %669 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %669)
  %670 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1324.i = add i32 %670, 1
  store i32 %inc.i1324.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb671.i:                                       ; preds = %sw.bb656.i
  %conv672.i = and i32 %11, 255
  %conv673.i = and i32 %9, 255
  %call675.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv672.i, i32 %conv673.i, i32 10, i32 0, i32 1) #11
  %671 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %671)
  %672 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1309.i = icmp eq i32* %672, null
  br i1 %cmp.i1309.i, label %sw.bb671.i.emit.exit1316.i_crit_edge, label %if.then.i1313.i

sw.bb671.i.emit.exit1316.i_crit_edge:             ; preds = %sw.bb671.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1316.i

if.then.i1313.i:                                  ; preds = %sw.bb671.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %673 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %673)
  %674 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1311.i = sext i32 %674 to i64
  %arrayidx.i1312.i = getelementptr i32, i32* %672, i64 %idxprom.i1311.i
  %675 = ptrtoint i32* %arrayidx.i1312.i to i64
  call void @__asan_store4_noabort(i64 %675)
  store i32 %call675.i, i32* %arrayidx.i1312.i, align 4
  br label %emit.exit1316.i

emit.exit1316.i:                                  ; preds = %sw.bb671.i.emit.exit1316.i_crit_edge, %if.then.i1313.i
  %676 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %676)
  %677 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1315.i = add i32 %677, 1
  store i32 %inc.i1315.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.bb676.i:                                       ; preds = %sw.bb656.i
  %conv677.i = and i32 %11, 255
  %conv678.i = and i32 %9, 255
  %call680.i = call i32 @aarch64_insn_gen_load_store_reg(i32 %conv677.i, i32 %conv678.i, i32 10, i32 3, i32 1) #11
  %678 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %678)
  %679 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1300.i = icmp eq i32* %679, null
  br i1 %cmp.i1300.i, label %sw.bb676.i.emit.exit1307.i_crit_edge, label %if.then.i1304.i

sw.bb676.i.emit.exit1307.i_crit_edge:             ; preds = %sw.bb676.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1307.i

if.then.i1304.i:                                  ; preds = %sw.bb676.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %680 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %680)
  %681 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1302.i = sext i32 %681 to i64
  %arrayidx.i1303.i = getelementptr i32, i32* %679, i64 %idxprom.i1302.i
  %682 = ptrtoint i32* %arrayidx.i1303.i to i64
  call void @__asan_store4_noabort(i64 %682)
  store i32 %call680.i, i32* %arrayidx.i1303.i, align 4
  br label %emit.exit1307.i

emit.exit1307.i:                                  ; preds = %sw.bb676.i.emit.exit1307.i_crit_edge, %if.then.i1304.i
  %683 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %683)
  %684 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1306.i = add i32 %684, 1
  store i32 %inc.i1306.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.epilog681777.i:                                ; preds = %sw.bb656.i
  unreachable

sw.bb682.i:                                       ; preds = %for.body.sw.bb682.i_crit_edge130, %for.body.sw.bb682.i_crit_edge
  call void @__sanitizer_cov_trace_const_cmp2(i16 0, i16 %13)
  %tobool683.i = icmp eq i16 %13, 0
  br i1 %tobool683.i, label %if.then684.i, label %if.else685.i

if.then684.i:                                     ; preds = %sw.bb682.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %phitmp.i = and i32 %9, 255
  br label %if.end692.i

if.else685.i:                                     ; preds = %sw.bb682.i
  %conv687.i = sext i16 %13 to i32
  call fastcc void @emit_a64_mov_i(i32 1, i32 10, i32 %conv687.i, %struct.jit_ctx* %ctx) #11
  %conv690.i = and i32 %9, 255
  %call691.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 10, i32 10, i32 %conv690.i, i32 0, i32 1, i32 0) #11
  %685 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %685)
  %686 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1282.i = icmp eq i32* %686, null
  br i1 %cmp.i1282.i, label %if.else685.i.emit.exit1289.i_crit_edge, label %if.then.i1286.i

if.else685.i.emit.exit1289.i_crit_edge:           ; preds = %if.else685.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1289.i

if.then.i1286.i:                                  ; preds = %if.else685.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %687 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %687)
  %688 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1284.i = sext i32 %688 to i64
  %arrayidx.i1285.i = getelementptr i32, i32* %686, i64 %idxprom.i1284.i
  %689 = ptrtoint i32* %arrayidx.i1285.i to i64
  call void @__asan_store4_noabort(i64 %689)
  store i32 %call691.i, i32* %arrayidx.i1285.i, align 4
  br label %emit.exit1289.i

emit.exit1289.i:                                  ; preds = %if.else685.i.emit.exit1289.i_crit_edge, %if.then.i1286.i
  %690 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %690)
  %691 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1288.i = add i32 %691, 1
  store i32 %inc.i1288.i, i32* %idx.i1283.i, align 8
  br label %if.end692.i

if.end692.i:                                      ; preds = %emit.exit1289.i, %if.then684.i
  %reg.0.i = phi i32 [ 10, %emit.exit1289.i ], [ %phitmp.i, %if.then684.i ]
  call void @__asan_load8_noabort(i64 ptrtoint ([1 x i64]* @cpu_hwcaps to i64))
  %692 = load volatile i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @cpu_hwcaps, i64 0, i64 0), align 8
  %conv.i1.i.i = and i64 %692, 32
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %conv.i1.i.i)
  %tobool.i.i = icmp eq i64 %conv.i1.i.i, 0
  br i1 %tobool.i.i, label %if.else701.i, label %if.then694.i

if.then694.i:                                     ; preds = %if.end692.i
  %conv696.i = and i32 %11, 255
  %cond699.i = select i1 %cmp21.i, i32 3, i32 2
  %call700.i = call i32 @aarch64_insn_gen_stadd(i32 %reg.0.i, i32 %conv696.i, i32 %cond699.i) #11
  %693 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %693)
  %694 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1273.i = icmp eq i32* %694, null
  br i1 %cmp.i1273.i, label %if.then694.i.emit.exit1280.i_crit_edge, label %if.then.i1277.i

if.then694.i.emit.exit1280.i_crit_edge:           ; preds = %if.then694.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1280.i

if.then.i1277.i:                                  ; preds = %if.then694.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %695 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %695)
  %696 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1275.i = sext i32 %696 to i64
  %arrayidx.i1276.i = getelementptr i32, i32* %694, i64 %idxprom.i1275.i
  %697 = ptrtoint i32* %arrayidx.i1276.i to i64
  call void @__asan_store4_noabort(i64 %697)
  store i32 %call700.i, i32* %arrayidx.i1276.i, align 4
  br label %emit.exit1280.i

emit.exit1280.i:                                  ; preds = %if.then694.i.emit.exit1280.i_crit_edge, %if.then.i1277.i
  %698 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %698)
  %699 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1279.i = add i32 %699, 1
  store i32 %inc.i1279.i, i32* %idx.i1283.i, align 8
  br label %if.end7

if.else701.i:                                     ; preds = %if.end692.i
  %cond706.i = select i1 %cmp21.i, i32 3, i32 2
  %call707.i = call i32 @aarch64_insn_gen_load_store_ex(i32 11, i32 %reg.0.i, i32 31, i32 %cond706.i, i32 6) #11
  %700 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %700)
  %701 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1264.i = icmp eq i32* %701, null
  br i1 %cmp.i1264.i, label %if.else701.i.emit.exit1271.i_crit_edge, label %if.then.i1268.i

if.else701.i.emit.exit1271.i_crit_edge:           ; preds = %if.else701.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1271.i

if.then.i1268.i:                                  ; preds = %if.else701.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %702 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %702)
  %703 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1266.i = sext i32 %703 to i64
  %arrayidx.i1267.i = getelementptr i32, i32* %701, i64 %idxprom.i1266.i
  %704 = ptrtoint i32* %arrayidx.i1267.i to i64
  call void @__asan_store4_noabort(i64 %704)
  store i32 %call707.i, i32* %arrayidx.i1267.i, align 4
  br label %emit.exit1271.i

emit.exit1271.i:                                  ; preds = %if.else701.i.emit.exit1271.i_crit_edge, %if.then.i1268.i
  %705 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %705)
  %706 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1270.i = add i32 %706, 1
  store i32 %inc.i1270.i, i32* %idx.i1283.i, align 8
  %conv710.i = and i32 %11, 255
  %cond713.i = zext i1 %cmp21.i to i32
  %call714.i = call i32 @aarch64_insn_gen_add_sub_shifted_reg(i32 11, i32 11, i32 %conv710.i, i32 0, i32 %cond713.i, i32 0) #11
  %707 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %707)
  %708 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1255.i = icmp eq i32* %708, null
  br i1 %cmp.i1255.i, label %emit.exit1271.i.emit.exit1262.i_crit_edge, label %if.then.i1259.i

emit.exit1271.i.emit.exit1262.i_crit_edge:        ; preds = %emit.exit1271.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1262.i

if.then.i1259.i:                                  ; preds = %emit.exit1271.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %709 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %709)
  %710 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1257.i = sext i32 %710 to i64
  %arrayidx.i1258.i = getelementptr i32, i32* %708, i64 %idxprom.i1257.i
  %711 = ptrtoint i32* %arrayidx.i1258.i to i64
  call void @__asan_store4_noabort(i64 %711)
  store i32 %call714.i, i32* %arrayidx.i1258.i, align 4
  br label %emit.exit1262.i

emit.exit1262.i:                                  ; preds = %emit.exit1271.i.emit.exit1262.i_crit_edge, %if.then.i1259.i
  %712 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %712)
  %713 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1261.i = add i32 %713, 1
  store i32 %inc.i1261.i, i32* %idx.i1283.i, align 8
  %call721.i = call i32 @aarch64_insn_gen_load_store_ex(i32 11, i32 %reg.0.i, i32 12, i32 %cond706.i, i32 7) #11
  %714 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %714)
  %715 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1246.i = icmp eq i32* %715, null
  br i1 %cmp.i1246.i, label %emit.exit1262.i.emit.exit1253.i_crit_edge, label %if.then.i1250.i

emit.exit1262.i.emit.exit1253.i_crit_edge:        ; preds = %emit.exit1262.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1253.i

if.then.i1250.i:                                  ; preds = %emit.exit1262.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %716 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %716)
  %717 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1248.i = sext i32 %717 to i64
  %arrayidx.i1249.i = getelementptr i32, i32* %715, i64 %idxprom.i1248.i
  %718 = ptrtoint i32* %arrayidx.i1249.i to i64
  call void @__asan_store4_noabort(i64 %718)
  store i32 %call721.i, i32* %arrayidx.i1249.i, align 4
  br label %emit.exit1253.i

emit.exit1253.i:                                  ; preds = %emit.exit1262.i.emit.exit1253.i_crit_edge, %if.then.i1250.i
  %719 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %719)
  %720 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1252.i = add i32 %720, 1
  store i32 %inc.i1252.i, i32* %idx.i1283.i, align 8
  %call743.i = call i32 @aarch64_insn_gen_comp_branch_imm(i64 0, i64 -12, i32 12, i32 0, i32 4) #11
  %721 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %721)
  %722 = load i32*, i32** %image.i1281.i, align 8
  %cmp.i1237.i = icmp eq i32* %722, null
  br i1 %cmp.i1237.i, label %emit.exit1253.i.emit.exit1244.i_crit_edge, label %if.then.i1241.i

emit.exit1253.i.emit.exit1244.i_crit_edge:        ; preds = %emit.exit1253.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit1244.i

if.then.i1241.i:                                  ; preds = %emit.exit1253.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %723 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %723)
  %724 = load i32, i32* %idx.i1283.i, align 8
  %idxprom.i1239.i = sext i32 %724 to i64
  %arrayidx.i1240.i = getelementptr i32, i32* %722, i64 %idxprom.i1239.i
  %725 = ptrtoint i32* %arrayidx.i1240.i to i64
  call void @__asan_store4_noabort(i64 %725)
  store i32 %call743.i, i32* %arrayidx.i1240.i, align 4
  br label %emit.exit1244.i

emit.exit1244.i:                                  ; preds = %emit.exit1253.i.emit.exit1244.i_crit_edge, %if.then.i1241.i
  %726 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %726)
  %727 = load i32, i32* %idx.i1283.i, align 8
  %inc.i1243.i = add i32 %727, 1
  store i32 %inc.i1243.i, i32* %idx.i1283.i, align 8
  br label %if.end7

sw.default745.i:                                  ; preds = %for.body
  %.b1230.i = load i1, i1* @build_insn.__print_once, align 1
  br i1 %.b1230.i, label %sw.default745.i.if.end7_crit_edge, label %if.then749.i

sw.default745.i.if.end7_crit_edge:                ; preds = %sw.default745.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end7

if.then749.i:                                     ; preds = %sw.default745.i
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @build_insn.__print_once, align 1
  %call751.i = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %conv12.i) #12
  br label %if.end7

if.then:                                          ; preds = %if.end44.i.i.if.then_crit_edge, %if.end25.i.i.if.then_crit_edge, %if.then.i1444.i
  %inc = add i32 %i.052, 1
  %728 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %728)
  %729 = load i32*, i32** %image.i1281.i, align 8
  %cmp3 = icmp eq i32* %729, null
  br i1 %cmp3, label %if.then4, label %if.then.for.inc_crit_edge

if.then.for.inc_crit_edge:                        ; preds = %if.then
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.inc

if.then4:                                         ; preds = %if.then
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %730 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %730)
  %731 = load i32, i32* %idx.i1283.i, align 8
  %732 = ptrtoint i32** %offset to i64
  call void @__asan_load8_noabort(i64 %732)
  %733 = load i32*, i32** %offset, align 8
  %idxprom5 = sext i32 %inc to i64
  %arrayidx6 = getelementptr i32, i32* %733, i64 %idxprom5
  %734 = ptrtoint i32* %arrayidx6 to i64
  call void @__asan_store4_noabort(i64 %734)
  store i32 %731, i32* %arrayidx6, align 4
  br label %for.inc

if.end7:                                          ; preds = %sw.default745.i.if.end7_crit_edge, %sw.bb564.i.if.end7_crit_edge, %if.then72.i.i.if.end7_crit_edge, %if.end.i1506.i.if.end7_crit_edge, %switch.hole_check.if.end7_crit_edge, %do.end457.i.if.end7_crit_edge, %emit_bswap_uxt.i.if.end7_crit_edge, %if.end.i.if.end7_crit_edge, %sw.bb76.i.if.end7_crit_edge, %if.then585.i, %cleanup.i, %if.then453.i, %if.then425.i, %if.then749.i, %emit.exit1686.i, %emit.exit1280.i, %emit.exit1244.i, %emit.exit1334.i, %emit.exit1325.i, %emit.exit1316.i, %emit.exit1307.i, %emit.exit1379.i, %emit.exit1370.i, %emit.exit1361.i, %emit.exit1352.i, %emit.exit1433.i, %emit.exit1424.i, %emit.exit1415.i, %emit.exit1406.i, %emit.exit1785.i, %emit.exit1920.i, %emit.exit1735.i, %emit.exit1755.i, %emit.exit1715.i, %emit.exit1725.i, %emit.exit1653.i, %emit.exit1676.i, %emit.exit1666.i, %emit.exit1617.i, %emit.exit1640.i, %emit.exit1630.i, %emit.exit1596.i, %emit.exit1606.i, %emit.exit1566.i, %emit.exit1576.i, %emit.exit1586.i, %emit.exit1465.i, %emit.exit1485.i, %emit.exit1495.i, %emit.exit1831.i, %emit.exit1853.i, %emit.exit1870.i, %emit.exit1880.i, %emit.exit1890.i, %emit.exit1900.i, %emit.exit1930.i, %emit.exit1940.i, %sw.bb179.i, %emit.exit1546.i, %emit.exit1536.i, %emit.exit1526.i, %emit.exit1516.i, %emit.exit1455.i, %emit.exit1442.i, %emit.exit1397.i, %emit.exit1388.i, %emit.exit1343.i, %emit.exit1298.i, %emit.exit.i, %if.then74.i.i
  %retval.1.i.ph = phi i32 [ -14, %if.then72.i.i.if.end7_crit_edge ], [ -14, %if.then74.i.i ], [ 0, %emit.exit.i ], [ 0, %emit.exit1298.i ], [ 0, %emit.exit1343.i ], [ 0, %emit.exit1388.i ], [ 0, %emit.exit1397.i ], [ 0, %emit.exit1442.i ], [ 0, %emit.exit1455.i ], [ 0, %emit.exit1516.i ], [ 0, %emit.exit1526.i ], [ 0, %emit.exit1536.i ], [ 0, %emit.exit1546.i ], [ 0, %sw.bb179.i ], [ 0, %emit.exit1940.i ], [ 0, %emit.exit1930.i ], [ 0, %emit.exit1900.i ], [ 0, %emit.exit1890.i ], [ 0, %emit.exit1880.i ], [ 0, %emit.exit1870.i ], [ 0, %emit.exit1853.i ], [ 0, %emit.exit1831.i ], [ 0, %emit.exit1495.i ], [ 0, %sw.bb76.i.if.end7_crit_edge ], [ 0, %emit.exit1485.i ], [ 0, %emit.exit1465.i ], [ 0, %if.end.i.if.end7_crit_edge ], [ 0, %emit.exit1586.i ], [ 0, %emit.exit1576.i ], [ 0, %emit.exit1566.i ], [ 0, %emit_bswap_uxt.i.if.end7_crit_edge ], [ 0, %emit.exit1606.i ], [ 0, %emit.exit1596.i ], [ 0, %emit.exit1630.i ], [ 0, %emit.exit1640.i ], [ 0, %emit.exit1617.i ], [ 0, %emit.exit1666.i ], [ 0, %emit.exit1676.i ], [ 0, %emit.exit1653.i ], [ 0, %emit.exit1725.i ], [ 0, %emit.exit1715.i ], [ 0, %emit.exit1755.i ], [ 0, %emit.exit1735.i ], [ 0, %emit.exit1920.i ], [ 0, %emit.exit1785.i ], [ 0, %sw.bb564.i.if.end7_crit_edge ], [ 0, %emit.exit1406.i ], [ 0, %emit.exit1415.i ], [ 0, %emit.exit1424.i ], [ 0, %emit.exit1433.i ], [ 0, %emit.exit1352.i ], [ 0, %emit.exit1361.i ], [ 0, %emit.exit1370.i ], [ 0, %emit.exit1379.i ], [ 0, %emit.exit1307.i ], [ 0, %emit.exit1316.i ], [ 0, %emit.exit1325.i ], [ 0, %emit.exit1334.i ], [ 0, %emit.exit1244.i ], [ 0, %emit.exit1280.i ], [ 0, %emit.exit1686.i ], [ 0, %if.end.i1506.i.if.end7_crit_edge ], [ -22, %sw.default745.i.if.end7_crit_edge ], [ -22, %if.then749.i ], [ -14, %do.end457.i.if.end7_crit_edge ], [ -22, %if.then425.i ], [ -22, %if.then453.i ], [ %call546.i, %cleanup.i ], [ -22, %if.then585.i ], [ -14, %switch.hole_check.if.end7_crit_edge ]
  %735 = ptrtoint i32** %image.i1281.i to i64
  call void @__asan_load8_noabort(i64 %735)
  %736 = load i32*, i32** %image.i1281.i, align 8
  %cmp9 = icmp eq i32* %736, null
  br i1 %cmp9, label %if.then10, label %if.end7.if.end15_crit_edge

if.end7.if.end15_crit_edge:                       ; preds = %if.end7
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end15

if.then10:                                        ; preds = %if.end7
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %737 = ptrtoint i32* %idx.i1283.i to i64
  call void @__asan_load4_noabort(i64 %737)
  %738 = load i32, i32* %idx.i1283.i, align 8
  %739 = ptrtoint i32** %offset to i64
  call void @__asan_load8_noabort(i64 %739)
  %740 = load i32*, i32** %offset, align 8
  %arrayidx14 = getelementptr i32, i32* %740, i64 %idxprom
  %741 = ptrtoint i32* %arrayidx14 to i64
  call void @__asan_store4_noabort(i64 %741)
  store i32 %738, i32* %arrayidx14, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end7.if.end15_crit_edge, %if.then10
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %retval.1.i.ph)
  %tobool16 = icmp eq i32 %retval.1.i.ph, 0
  br i1 %tobool16, label %if.end15.for.inc_crit_edge, label %if.end15.cleanup21_crit_edge

if.end15.cleanup21_crit_edge:                     ; preds = %if.end15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup21

if.end15.for.inc_crit_edge:                       ; preds = %if.end15
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.inc

for.inc:                                          ; preds = %if.end15.for.inc_crit_edge, %if.then.for.inc_crit_edge, %if.then4
  %i.1.ph = phi i32 [ %inc, %if.then.for.inc_crit_edge ], [ %inc, %if.then4 ], [ %i.052, %if.end15.for.inc_crit_edge ]
  %inc20 = add i32 %i.1.ph, 1
  %742 = ptrtoint i32* %len to i64
  call void @__asan_load4_noabort(i64 %742)
  %743 = load i32, i32* %len, align 4
  %cmp = icmp ult i32 %inc20, %743
  br i1 %cmp, label %for.inc.for.body_crit_edge, label %for.inc.cleanup21_crit_edge

for.inc.cleanup21_crit_edge:                      ; preds = %for.inc
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup21

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body

cleanup21:                                        ; preds = %for.inc.cleanup21_crit_edge, %if.end15.cleanup21_crit_edge, %entry.cleanup21_crit_edge
  %retval.2 = phi i32 [ 0, %entry.cleanup21_crit_edge ], [ %retval.1.i.ph, %if.end15.cleanup21_crit_edge ], [ 0, %for.inc.cleanup21_crit_edge ]
  ret i32 %retval.2
}

; Function Attrs: nounwind sanitize_address shadowcallstack sspstrong
define internal fastcc i32 @build_prologue(%struct.jit_ctx* %ctx, i1 %ebpf_from_cbpf) unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %prog1 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 0
  %0 = ptrtoint %struct.bpf_prog** %prog1 to i64
  call void @__asan_load8_noabort(i64 %0)
  %1 = load %struct.bpf_prog*, %struct.bpf_prog** %prog1, align 8
  %idx = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %2 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %2)
  %3 = load i32, i32* %idx, align 8
  %call = call i32 @aarch64_insn_gen_load_store_pair(i32 29, i32 30, i32 31, i32 -16, i32 1, i32 3) #11
  %image.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %4 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %4)
  %5 = load i32*, i32** %image.i, align 8
  %cmp.i = icmp eq i32* %5, null
  br i1 %cmp.i, label %entry.emit.exit_crit_edge, label %if.then.i

entry.emit.exit_crit_edge:                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit

if.then.i:                                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %6 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %6)
  %7 = load i32, i32* %idx, align 8
  %idxprom.i = sext i32 %7 to i64
  %arrayidx.i = getelementptr i32, i32* %5, i64 %idxprom.i
  %8 = ptrtoint i32* %arrayidx.i to i64
  call void @__asan_store4_noabort(i64 %8)
  store i32 %call, i32* %arrayidx.i, align 4
  br label %emit.exit

emit.exit:                                        ; preds = %entry.emit.exit_crit_edge, %if.then.i
  %9 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %9)
  %10 = load i32, i32* %idx, align 8
  %inc.i = add i32 %10, 1
  store i32 %inc.i, i32* %idx, align 8
  %call7 = call i32 @aarch64_insn_gen_add_sub_imm(i32 29, i32 31, i32 0, i32 1, i32 0) #11
  %11 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %11)
  %12 = load i32*, i32** %image.i, align 8
  %cmp.i119 = icmp eq i32* %12, null
  br i1 %cmp.i119, label %emit.exit.emit.exit126_crit_edge, label %if.then.i123

emit.exit.emit.exit126_crit_edge:                 ; preds = %emit.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit126

if.then.i123:                                     ; preds = %emit.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %13 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %13)
  %14 = load i32, i32* %idx, align 8
  %idxprom.i121 = sext i32 %14 to i64
  %arrayidx.i122 = getelementptr i32, i32* %12, i64 %idxprom.i121
  %15 = ptrtoint i32* %arrayidx.i122 to i64
  call void @__asan_store4_noabort(i64 %15)
  store i32 %call7, i32* %arrayidx.i122, align 4
  br label %emit.exit126

emit.exit126:                                     ; preds = %emit.exit.emit.exit126_crit_edge, %if.then.i123
  %16 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %16)
  %17 = load i32, i32* %idx, align 8
  %inc.i125 = add i32 %17, 1
  store i32 %inc.i125, i32* %idx, align 8
  %call10 = call i32 @aarch64_insn_gen_load_store_pair(i32 19, i32 20, i32 31, i32 -16, i32 1, i32 3) #11
  %18 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %18)
  %19 = load i32*, i32** %image.i, align 8
  %cmp.i110 = icmp eq i32* %19, null
  br i1 %cmp.i110, label %emit.exit126.emit.exit117_crit_edge, label %if.then.i114

emit.exit126.emit.exit117_crit_edge:              ; preds = %emit.exit126
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit117

if.then.i114:                                     ; preds = %emit.exit126
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %20 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %20)
  %21 = load i32, i32* %idx, align 8
  %idxprom.i112 = sext i32 %21 to i64
  %arrayidx.i113 = getelementptr i32, i32* %19, i64 %idxprom.i112
  %22 = ptrtoint i32* %arrayidx.i113 to i64
  call void @__asan_store4_noabort(i64 %22)
  store i32 %call10, i32* %arrayidx.i113, align 4
  br label %emit.exit117

emit.exit117:                                     ; preds = %emit.exit126.emit.exit117_crit_edge, %if.then.i114
  %23 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %23)
  %24 = load i32, i32* %idx, align 8
  %inc.i116 = add i32 %24, 1
  store i32 %inc.i116, i32* %idx, align 8
  %call13 = call i32 @aarch64_insn_gen_load_store_pair(i32 21, i32 22, i32 31, i32 -16, i32 1, i32 3) #11
  %25 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %25)
  %26 = load i32*, i32** %image.i, align 8
  %cmp.i101 = icmp eq i32* %26, null
  br i1 %cmp.i101, label %emit.exit117.emit.exit108_crit_edge, label %if.then.i105

emit.exit117.emit.exit108_crit_edge:              ; preds = %emit.exit117
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit108

if.then.i105:                                     ; preds = %emit.exit117
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %27 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %27)
  %28 = load i32, i32* %idx, align 8
  %idxprom.i103 = sext i32 %28 to i64
  %arrayidx.i104 = getelementptr i32, i32* %26, i64 %idxprom.i103
  %29 = ptrtoint i32* %arrayidx.i104 to i64
  call void @__asan_store4_noabort(i64 %29)
  store i32 %call13, i32* %arrayidx.i104, align 4
  br label %emit.exit108

emit.exit108:                                     ; preds = %emit.exit117.emit.exit108_crit_edge, %if.then.i105
  %30 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %30)
  %31 = load i32, i32* %idx, align 8
  %inc.i107 = add i32 %31, 1
  store i32 %inc.i107, i32* %idx, align 8
  %call16 = call i32 @aarch64_insn_gen_load_store_pair(i32 25, i32 26, i32 31, i32 -16, i32 1, i32 3) #11
  %32 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %32)
  %33 = load i32*, i32** %image.i, align 8
  %cmp.i92 = icmp eq i32* %33, null
  br i1 %cmp.i92, label %emit.exit108.emit.exit99_crit_edge, label %if.then.i96

emit.exit108.emit.exit99_crit_edge:               ; preds = %emit.exit108
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit99

if.then.i96:                                      ; preds = %emit.exit108
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %34 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %34)
  %35 = load i32, i32* %idx, align 8
  %idxprom.i94 = sext i32 %35 to i64
  %arrayidx.i95 = getelementptr i32, i32* %33, i64 %idxprom.i94
  %36 = ptrtoint i32* %arrayidx.i95 to i64
  call void @__asan_store4_noabort(i64 %36)
  store i32 %call16, i32* %arrayidx.i95, align 4
  br label %emit.exit99

emit.exit99:                                      ; preds = %emit.exit108.emit.exit99_crit_edge, %if.then.i96
  %37 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %37)
  %38 = load i32, i32* %idx, align 8
  %inc.i98 = add i32 %38, 1
  store i32 %inc.i98, i32* %idx, align 8
  %call18 = call i32 @aarch64_insn_gen_add_sub_imm(i32 25, i32 31, i32 0, i32 1, i32 0) #11
  %39 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %39)
  %40 = load i32*, i32** %image.i, align 8
  %cmp.i83 = icmp eq i32* %40, null
  br i1 %cmp.i83, label %emit.exit99.emit.exit90_crit_edge, label %if.then.i87

emit.exit99.emit.exit90_crit_edge:                ; preds = %emit.exit99
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit90

if.then.i87:                                      ; preds = %emit.exit99
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %41 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %41)
  %42 = load i32, i32* %idx, align 8
  %idxprom.i85 = sext i32 %42 to i64
  %arrayidx.i86 = getelementptr i32, i32* %40, i64 %idxprom.i85
  %43 = ptrtoint i32* %arrayidx.i86 to i64
  call void @__asan_store4_noabort(i64 %43)
  store i32 %call18, i32* %arrayidx.i86, align 4
  br label %emit.exit90

emit.exit90:                                      ; preds = %emit.exit99.emit.exit90_crit_edge, %if.then.i87
  %44 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %44)
  %45 = load i32, i32* %idx, align 8
  %inc.i89 = add i32 %45, 1
  store i32 %inc.i89, i32* %idx, align 8
  br i1 %ebpf_from_cbpf, label %emit.exit90.if.end34_crit_edge, label %if.then

emit.exit90.if.end34_crit_edge:                   ; preds = %emit.exit90
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end34

if.then:                                          ; preds = %emit.exit90
  %call20 = call i32 @aarch64_insn_gen_movewide(i32 26, i32 0, i32 0, i32 1, i32 0) #11
  %46 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %46)
  %47 = load i32*, i32** %image.i, align 8
  %cmp.i74 = icmp eq i32* %47, null
  br i1 %cmp.i74, label %if.then.emit.exit81_crit_edge, label %if.then.i78

if.then.emit.exit81_crit_edge:                    ; preds = %if.then
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit81

if.then.i78:                                      ; preds = %if.then
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %48 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %48)
  %49 = load i32, i32* %idx, align 8
  %idxprom.i76 = sext i32 %49 to i64
  %arrayidx.i77 = getelementptr i32, i32* %47, i64 %idxprom.i76
  %50 = ptrtoint i32* %arrayidx.i77 to i64
  call void @__asan_store4_noabort(i64 %50)
  store i32 %call20, i32* %arrayidx.i77, align 4
  br label %emit.exit81

emit.exit81:                                      ; preds = %if.then.emit.exit81_crit_edge, %if.then.i78
  %51 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %51)
  %52 = load i32, i32* %idx, align 8
  %inc.i80 = add i32 %52, 1
  store i32 %inc.i80, i32* %idx, align 8
  %sub = sub i32 %inc.i80, %3
  call void @__sanitizer_cov_trace_const_cmp4(i32 7, i32 %sub)
  %cmp = icmp eq i32 %sub, 7
  br i1 %cmp, label %emit.exit81.if.end34_crit_edge, label %if.then23

emit.exit81.if.end34_crit_edge:                   ; preds = %emit.exit81
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end34

if.then23:                                        ; preds = %emit.exit81
  %.b63 = load i1, i1* @build_prologue.__print_once, align 1
  br i1 %.b63, label %if.then23.cleanup_crit_edge, label %if.then27

if.then23.cleanup_crit_edge:                      ; preds = %if.then23
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %cleanup

if.then27:                                        ; preds = %if.then23
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  store i1 true, i1* @build_prologue.__print_once, align 1
  %call28 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.4, i64 0, i64 0), i32 %sub, i32 7) #12
  br label %cleanup

if.end34:                                         ; preds = %emit.exit81.if.end34_crit_edge, %emit.exit90.if.end34_crit_edge
  %aux = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %1, i64 0, i32 7
  %53 = ptrtoint %struct.bpf_prog_aux** %aux to i64
  call void @__asan_load8_noabort(i64 %53)
  %54 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %aux, align 8
  %stack_depth = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %54, i64 0, i32 5
  %55 = ptrtoint i32* %stack_depth to i64
  call void @__asan_load4_noabort(i64 %55)
  %56 = load i32, i32* %stack_depth, align 8
  %add = add i32 %56, 15
  %and = and i32 %add, -16
  %stack_size = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 5
  %57 = ptrtoint i32* %stack_size to i64
  call void @__asan_store4_noabort(i64 %57)
  store i32 %and, i32* %stack_size, align 8
  %call36 = call i32 @aarch64_insn_gen_add_sub_imm(i32 31, i32 31, i32 %and, i32 1, i32 1) #11
  %58 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %58)
  %59 = load i32*, i32** %image.i, align 8
  %cmp.i65 = icmp eq i32* %59, null
  br i1 %cmp.i65, label %if.end34.emit.exit72_crit_edge, label %if.then.i69

if.end34.emit.exit72_crit_edge:                   ; preds = %if.end34
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit72

if.then.i69:                                      ; preds = %if.end34
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %60 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %60)
  %61 = load i32, i32* %idx, align 8
  %idxprom.i67 = sext i32 %61 to i64
  %arrayidx.i68 = getelementptr i32, i32* %59, i64 %idxprom.i67
  %62 = ptrtoint i32* %arrayidx.i68 to i64
  call void @__asan_store4_noabort(i64 %62)
  store i32 %call36, i32* %arrayidx.i68, align 4
  br label %emit.exit72

emit.exit72:                                      ; preds = %if.end34.emit.exit72_crit_edge, %if.then.i69
  %63 = ptrtoint i32* %idx to i64
  call void @__asan_load4_noabort(i64 %63)
  %64 = load i32, i32* %idx, align 8
  %inc.i71 = add i32 %64, 1
  store i32 %inc.i71, i32* %idx, align 8
  br label %cleanup

cleanup:                                          ; preds = %if.then23.cleanup_crit_edge, %if.then27, %emit.exit72
  %retval.0 = phi i32 [ 0, %emit.exit72 ], [ -1, %if.then27 ], [ -1, %if.then23.cleanup_crit_edge ]
  ret i32 %retval.0
}

; Function Attrs: nounwind sanitize_address shadowcallstack sspstrong
define internal fastcc void @build_epilogue(%struct.jit_ctx* %ctx) unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %stack_size = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 5
  %0 = ptrtoint i32* %stack_size to i64
  call void @__asan_load4_noabort(i64 %0)
  %1 = load i32, i32* %stack_size, align 8
  %call = call i32 @aarch64_insn_gen_add_sub_imm(i32 31, i32 31, i32 %1, i32 1, i32 0) #11
  %image.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %2 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %2)
  %3 = load i32*, i32** %image.i, align 8
  %cmp.i = icmp eq i32* %3, null
  br i1 %cmp.i, label %entry.emit.exit_crit_edge, label %if.then.i

entry.emit.exit_crit_edge:                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit

if.then.i:                                        ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idx.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %4 = ptrtoint i32* %idx.i to i64
  call void @__asan_load4_noabort(i64 %4)
  %5 = load i32, i32* %idx.i, align 8
  %idxprom.i = sext i32 %5 to i64
  %arrayidx.i = getelementptr i32, i32* %3, i64 %idxprom.i
  %6 = ptrtoint i32* %arrayidx.i to i64
  call void @__asan_store4_noabort(i64 %6)
  store i32 %call, i32* %arrayidx.i, align 4
  br label %emit.exit

emit.exit:                                        ; preds = %entry.emit.exit_crit_edge, %if.then.i
  %idx2.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %7 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %7)
  %8 = load i32, i32* %idx2.i, align 8
  %inc.i = add i32 %8, 1
  store i32 %inc.i, i32* %idx2.i, align 8
  %call7 = call i32 @aarch64_insn_gen_load_store_pair(i32 25, i32 26, i32 31, i32 16, i32 1, i32 4) #11
  %9 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %9)
  %10 = load i32*, i32** %image.i, align 8
  %cmp.i71 = icmp eq i32* %10, null
  br i1 %cmp.i71, label %emit.exit.emit.exit78_crit_edge, label %if.then.i75

emit.exit.emit.exit78_crit_edge:                  ; preds = %emit.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit78

if.then.i75:                                      ; preds = %emit.exit
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %11 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %11)
  %12 = load i32, i32* %idx2.i, align 8
  %idxprom.i73 = sext i32 %12 to i64
  %arrayidx.i74 = getelementptr i32, i32* %10, i64 %idxprom.i73
  %13 = ptrtoint i32* %arrayidx.i74 to i64
  call void @__asan_store4_noabort(i64 %13)
  store i32 %call7, i32* %arrayidx.i74, align 4
  br label %emit.exit78

emit.exit78:                                      ; preds = %emit.exit.emit.exit78_crit_edge, %if.then.i75
  %14 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %14)
  %15 = load i32, i32* %idx2.i, align 8
  %inc.i77 = add i32 %15, 1
  store i32 %inc.i77, i32* %idx2.i, align 8
  %call10 = call i32 @aarch64_insn_gen_load_store_pair(i32 21, i32 22, i32 31, i32 16, i32 1, i32 4) #11
  %16 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %16)
  %17 = load i32*, i32** %image.i, align 8
  %cmp.i62 = icmp eq i32* %17, null
  br i1 %cmp.i62, label %emit.exit78.emit.exit69_crit_edge, label %if.then.i66

emit.exit78.emit.exit69_crit_edge:                ; preds = %emit.exit78
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit69

if.then.i66:                                      ; preds = %emit.exit78
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %18 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %18)
  %19 = load i32, i32* %idx2.i, align 8
  %idxprom.i64 = sext i32 %19 to i64
  %arrayidx.i65 = getelementptr i32, i32* %17, i64 %idxprom.i64
  %20 = ptrtoint i32* %arrayidx.i65 to i64
  call void @__asan_store4_noabort(i64 %20)
  store i32 %call10, i32* %arrayidx.i65, align 4
  br label %emit.exit69

emit.exit69:                                      ; preds = %emit.exit78.emit.exit69_crit_edge, %if.then.i66
  %21 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %21)
  %22 = load i32, i32* %idx2.i, align 8
  %inc.i68 = add i32 %22, 1
  store i32 %inc.i68, i32* %idx2.i, align 8
  %call13 = call i32 @aarch64_insn_gen_load_store_pair(i32 19, i32 20, i32 31, i32 16, i32 1, i32 4) #11
  %23 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %23)
  %24 = load i32*, i32** %image.i, align 8
  %cmp.i53 = icmp eq i32* %24, null
  br i1 %cmp.i53, label %emit.exit69.emit.exit60_crit_edge, label %if.then.i57

emit.exit69.emit.exit60_crit_edge:                ; preds = %emit.exit69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit60

if.then.i57:                                      ; preds = %emit.exit69
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %25 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %25)
  %26 = load i32, i32* %idx2.i, align 8
  %idxprom.i55 = sext i32 %26 to i64
  %arrayidx.i56 = getelementptr i32, i32* %24, i64 %idxprom.i55
  %27 = ptrtoint i32* %arrayidx.i56 to i64
  call void @__asan_store4_noabort(i64 %27)
  store i32 %call13, i32* %arrayidx.i56, align 4
  br label %emit.exit60

emit.exit60:                                      ; preds = %emit.exit69.emit.exit60_crit_edge, %if.then.i57
  %28 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %28)
  %29 = load i32, i32* %idx2.i, align 8
  %inc.i59 = add i32 %29, 1
  store i32 %inc.i59, i32* %idx2.i, align 8
  %call14 = call i32 @aarch64_insn_gen_load_store_pair(i32 29, i32 30, i32 31, i32 16, i32 1, i32 4) #11
  %30 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %30)
  %31 = load i32*, i32** %image.i, align 8
  %cmp.i44 = icmp eq i32* %31, null
  br i1 %cmp.i44, label %emit.exit60.emit.exit51_crit_edge, label %if.then.i48

emit.exit60.emit.exit51_crit_edge:                ; preds = %emit.exit60
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit51

if.then.i48:                                      ; preds = %emit.exit60
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %32 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %32)
  %33 = load i32, i32* %idx2.i, align 8
  %idxprom.i46 = sext i32 %33 to i64
  %arrayidx.i47 = getelementptr i32, i32* %31, i64 %idxprom.i46
  %34 = ptrtoint i32* %arrayidx.i47 to i64
  call void @__asan_store4_noabort(i64 %34)
  store i32 %call14, i32* %arrayidx.i47, align 4
  br label %emit.exit51

emit.exit51:                                      ; preds = %emit.exit60.emit.exit51_crit_edge, %if.then.i48
  %35 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %35)
  %36 = load i32, i32* %idx2.i, align 8
  %inc.i50 = add i32 %36, 1
  store i32 %inc.i50, i32* %idx2.i, align 8
  %call16 = call i32 @aarch64_insn_gen_add_sub_imm(i32 0, i32 7, i32 0, i32 1, i32 0) #11
  %37 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %37)
  %38 = load i32*, i32** %image.i, align 8
  %cmp.i35 = icmp eq i32* %38, null
  br i1 %cmp.i35, label %emit.exit51.emit.exit42_crit_edge, label %if.then.i39

emit.exit51.emit.exit42_crit_edge:                ; preds = %emit.exit51
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit42

if.then.i39:                                      ; preds = %emit.exit51
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %39 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %39)
  %40 = load i32, i32* %idx2.i, align 8
  %idxprom.i37 = sext i32 %40 to i64
  %arrayidx.i38 = getelementptr i32, i32* %38, i64 %idxprom.i37
  %41 = ptrtoint i32* %arrayidx.i38 to i64
  call void @__asan_store4_noabort(i64 %41)
  store i32 %call16, i32* %arrayidx.i38, align 4
  br label %emit.exit42

emit.exit42:                                      ; preds = %emit.exit51.emit.exit42_crit_edge, %if.then.i39
  %42 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %42)
  %43 = load i32, i32* %idx2.i, align 8
  %inc.i41 = add i32 %43, 1
  store i32 %inc.i41, i32* %idx2.i, align 8
  %call17 = call i32 @aarch64_insn_gen_branch_reg(i32 30, i32 2) #11
  %44 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %44)
  %45 = load i32*, i32** %image.i, align 8
  %cmp.i26 = icmp eq i32* %45, null
  br i1 %cmp.i26, label %emit.exit42.emit.exit33_crit_edge, label %if.then.i30

emit.exit42.emit.exit33_crit_edge:                ; preds = %emit.exit42
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit33

if.then.i30:                                      ; preds = %emit.exit42
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %46 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %46)
  %47 = load i32, i32* %idx2.i, align 8
  %idxprom.i28 = sext i32 %47 to i64
  %arrayidx.i29 = getelementptr i32, i32* %45, i64 %idxprom.i28
  %48 = ptrtoint i32* %arrayidx.i29 to i64
  call void @__asan_store4_noabort(i64 %48)
  store i32 %call17, i32* %arrayidx.i29, align 4
  br label %emit.exit33

emit.exit33:                                      ; preds = %emit.exit42.emit.exit33_crit_edge, %if.then.i30
  %49 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %49)
  %50 = load i32, i32* %idx2.i, align 8
  %inc.i32 = add i32 %50, 1
  store i32 %inc.i32, i32* %idx2.i, align 8
  ret void
}

declare dso_local %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32, i8**, i32, void (i8*, i32)*) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind sanitize_address shadowcallstack sspstrong writeonly
define internal void @jit_fill_hole(i8* nocapture %area, i32 %size) #4 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__sanitizer_cov_trace_const_cmp4(i32 3, i32 %size)
  %cmp6 = icmp ugt i32 %size, 3
  br i1 %cmp6, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = bitcast i8* %area to i32*
  %1 = add i32 %size, -4
  %2 = lshr i32 %1, 2
  %narrow = add nuw nsw i32 %2, 1
  %3 = zext i32 %narrow to i64
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %2)
  %min.iters.check = icmp eq i32 %2, 0
  br i1 %min.iters.check, label %for.body.preheader.for.body.preheader13_crit_edge, label %vector.ph

for.body.preheader.for.body.preheader13_crit_edge: ; preds = %for.body.preheader
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.preheader13

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %3, 2147483646
  %ind.end = getelementptr i32, i32* %0, i64 %n.vec
  %cast.crd = trunc i64 %n.vec to i32
  %4 = mul i32 %cast.crd, -4
  %ind.end10 = add i32 %4, %size
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %next.gep = getelementptr i32, i32* %0, i64 %index
  %5 = or i64 %index, 1
  %next.gep11 = getelementptr i32, i32* %0, i64 %5
  %6 = ptrtoint i32* %next.gep to i64
  call void @__asan_store4_noabort(i64 %6)
  store i32 -736092160, i32* %next.gep, align 4
  %7 = ptrtoint i32* %next.gep11 to i64
  call void @__asan_store4_noabort(i64 %7)
  store i32 -736092160, i32* %next.gep11, align 4
  %index.next = add i64 %index, 2
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !32

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  call void @__sanitizer_cov_trace_cmp8(i64 %n.vec, i64 %3)
  %cmp.n = icmp eq i64 %n.vec, %3
  br i1 %cmp.n, label %middle.block.for.end_crit_edge, label %middle.block.for.body.preheader13_crit_edge

middle.block.for.body.preheader13_crit_edge:      ; preds = %middle.block
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body.preheader13

middle.block.for.end_crit_edge:                   ; preds = %middle.block
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end

for.body.preheader13:                             ; preds = %middle.block.for.body.preheader13_crit_edge, %for.body.preheader.for.body.preheader13_crit_edge
  %ptr.08.ph = phi i32* [ %0, %for.body.preheader.for.body.preheader13_crit_edge ], [ %ind.end, %middle.block.for.body.preheader13_crit_edge ]
  %size.addr.07.ph = phi i32 [ %size, %for.body.preheader.for.body.preheader13_crit_edge ], [ %ind.end10, %middle.block.for.body.preheader13_crit_edge ]
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader13
  %ptr.08 = phi i32* [ %incdec.ptr, %for.body.for.body_crit_edge ], [ %ptr.08.ph, %for.body.preheader13 ]
  %size.addr.07 = phi i32 [ %sub, %for.body.for.body_crit_edge ], [ %size.addr.07.ph, %for.body.preheader13 ]
  %incdec.ptr = getelementptr i32, i32* %ptr.08, i64 1
  %9 = ptrtoint i32* %ptr.08 to i64
  call void @__asan_store4_noabort(i64 %9)
  store i32 -736092160, i32* %ptr.08, align 4
  %sub = add i32 %size.addr.07, -4
  %cmp = icmp ugt i32 %sub, 3
  br i1 %cmp, label %for.body.for.body_crit_edge, label %for.body.for.end_crit_edge, !llvm.loop !34

for.body.for.end_crit_edge:                       ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.end

for.body.for.body_crit_edge:                      ; preds = %for.body
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %for.body

for.end:                                          ; preds = %for.body.for.end_crit_edge, %middle.block.for.end_crit_edge, %entry.for.end_crit_edge
  ret void
}

declare dso_local void @bpf_jit_binary_free(%struct.bpf_binary_header*) local_unnamed_addr #2

; Function Attrs: cold
declare dso_local i32 @printk(i8*, ...) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local void @bpf_prog_fill_jited_linfo(%struct.bpf_prog*, i32*) local_unnamed_addr #2

declare dso_local void @kfree(i8*) local_unnamed_addr #2

declare dso_local void @bpf_jit_prog_release_other(%struct.bpf_prog*, %struct.bpf_prog*) local_unnamed_addr #2

; Function Attrs: nounwind sanitize_address shadowcallstack sspstrong
define dso_local i8* @bpf_jit_alloc_exec(i64 %size) local_unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @__asan_load1_noabort(i64 ptrtoint (i8* @arm64_use_ng_mappings to i64))
  %0 = load i8, i8* @arm64_use_ng_mappings, align 1, !range !35
  call void @__sanitizer_cov_trace_const_cmp1(i8 0, i8 %0)
  %tobool = icmp eq i8 %0, 0
  %or4 = select i1 %tobool, i64 29273397577910035, i64 29273397577912083
  %1 = call i8* @llvm.returnaddress(i32 0)
  %2 = ptrtoint i8* %1 to i64
  %and = and i64 %2, 36028797018963968
  call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %and)
  %tobool5 = icmp eq i64 %and, 0
  call void @__asan_load8_noabort(i64 ptrtoint (i64* @vabits_actual to i64))
  %3 = load i64, i64* @vabits_actual, align 8
  %add = shl nsw i64 -1, %3
  %or7 = or i64 %add, %2
  %and11 = and i64 %add, 36028797018963967
  %neg = xor i64 %and11, -1
  %and13 = and i64 %neg, %2
  %cond14 = select i1 %tobool5, i64 %and13, i64 %or7
  %4 = inttoptr i64 %cond14 to i8*
  %call = call i8* @__vmalloc_node_range(i64 %size, i64 4096, i64 -206158430208, i64 -206024212480, i32 3264, i64 %or4, i64 0, i32 -1, i8* %4) #11
  ret i8* %call
}

declare dso_local i8* @__vmalloc_node_range(i64, i64, i64, i64, i32, i64, i64, i32, i8*) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32 immarg) #6

; Function Attrs: nounwind sanitize_address shadowcallstack sspstrong
define dso_local void @bpf_jit_free_exec(i8* %addr) local_unnamed_addr #0 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  call void @vfree(i8* %addr) #11
  ret void
}

declare dso_local void @vfree(i8*) local_unnamed_addr #2

declare dso_local noalias i8* @kmem_cache_alloc_trace(%struct.kmem_cache*, i32, i64) local_unnamed_addr #2

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #7

declare dso_local noalias i8* @__kmalloc(i64, i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #8

declare dso_local i32 @aarch64_insn_gen_add_sub_imm(i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_add_sub_shifted_reg(i32, i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_logical_shifted_reg(i32, i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_data3(i32, i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_data2(i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_data1(i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_bitfield(i32, i32, i32, i32, i32, i32) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind sanitize_address shadowcallstack sspstrong
define internal fastcc void @emit_a64_mov_i(i32 %is64, i32 %reg, i32 %val, %struct.jit_ctx* nocapture %ctx) unnamed_addr #9 {
entry:
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %0 = lshr i32 %val, 16
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %val)
  %tobool = icmp slt i32 %val, 0
  br i1 %tobool, label %if.then, label %if.else27

if.then:                                          ; preds = %entry
  call void @__sanitizer_cov_trace_const_cmp4(i32 65535, i32 %0)
  %cmp = icmp eq i32 %0, 65535
  br i1 %cmp, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %conv8 = and i32 %val, 65535
  %conv9 = xor i32 %conv8, 65535
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %is64)
  %tobool10 = icmp ne i32 %is64, 0
  %cond = zext i1 %tobool10 to i32
  %call = call i32 @aarch64_insn_gen_movewide(i32 %reg, i32 %conv9, i32 0, i32 %cond, i32 2) #11
  %image.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %1 = ptrtoint i32** %image.i to i64
  call void @__asan_load8_noabort(i64 %1)
  %2 = load i32*, i32** %image.i, align 8
  %cmp.i = icmp eq i32* %2, null
  br i1 %cmp.i, label %if.then6.emit.exit_crit_edge, label %if.then.i

if.then6.emit.exit_crit_edge:                     ; preds = %if.then6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit

if.then.i:                                        ; preds = %if.then6
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idx.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %3 = ptrtoint i32* %idx.i to i64
  call void @__asan_load4_noabort(i64 %3)
  %4 = load i32, i32* %idx.i, align 8
  %idxprom.i = sext i32 %4 to i64
  %arrayidx.i = getelementptr i32, i32* %2, i64 %idxprom.i
  %5 = ptrtoint i32* %arrayidx.i to i64
  call void @__asan_store4_noabort(i64 %5)
  store i32 %call, i32* %arrayidx.i, align 4
  br label %emit.exit

emit.exit:                                        ; preds = %if.then6.emit.exit_crit_edge, %if.then.i
  %idx2.i = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %6 = ptrtoint i32* %idx2.i to i64
  call void @__asan_load4_noabort(i64 %6)
  %7 = load i32, i32* %idx2.i, align 8
  %inc.i = add i32 %7, 1
  store i32 %inc.i, i32* %idx2.i, align 8
  br label %if.end39

if.else:                                          ; preds = %if.then
  %conv13 = xor i32 %0, 65535
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %is64)
  %tobool15 = icmp ne i32 %is64, 0
  %cond16 = zext i1 %tobool15 to i32
  %call17 = call i32 @aarch64_insn_gen_movewide(i32 %reg, i32 %conv13, i32 16, i32 %cond16, i32 2) #11
  %image.i88 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %8 = ptrtoint i32** %image.i88 to i64
  call void @__asan_load8_noabort(i64 %8)
  %9 = load i32*, i32** %image.i88, align 8
  %cmp.i89 = icmp eq i32* %9, null
  br i1 %cmp.i89, label %if.else.emit.exit96_crit_edge, label %if.then.i93

if.else.emit.exit96_crit_edge:                    ; preds = %if.else
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit96

if.then.i93:                                      ; preds = %if.else
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idx.i90 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %10 = ptrtoint i32* %idx.i90 to i64
  call void @__asan_load4_noabort(i64 %10)
  %11 = load i32, i32* %idx.i90, align 8
  %idxprom.i91 = sext i32 %11 to i64
  %arrayidx.i92 = getelementptr i32, i32* %9, i64 %idxprom.i91
  %12 = ptrtoint i32* %arrayidx.i92 to i64
  call void @__asan_store4_noabort(i64 %12)
  store i32 %call17, i32* %arrayidx.i92, align 4
  br label %emit.exit96

emit.exit96:                                      ; preds = %if.else.emit.exit96_crit_edge, %if.then.i93
  %idx2.i94 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %13 = ptrtoint i32* %idx2.i94 to i64
  call void @__asan_load4_noabort(i64 %13)
  %14 = load i32, i32* %idx2.i94, align 8
  %inc.i95 = add i32 %14, 1
  store i32 %inc.i95, i32* %idx2.i94, align 8
  %conv18 = and i32 %val, 65535
  call void @__sanitizer_cov_trace_const_cmp4(i32 65535, i32 %conv18)
  %cmp19 = icmp eq i32 %conv18, 65535
  br i1 %cmp19, label %emit.exit96.if.end39_crit_edge, label %if.then21

emit.exit96.if.end39_crit_edge:                   ; preds = %emit.exit96
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end39

if.then21:                                        ; preds = %emit.exit96
  %call25 = call i32 @aarch64_insn_gen_movewide(i32 %reg, i32 %conv18, i32 0, i32 %cond16, i32 1) #11
  %15 = ptrtoint i32** %image.i88 to i64
  call void @__asan_load8_noabort(i64 %15)
  %16 = load i32*, i32** %image.i88, align 8
  %cmp.i80 = icmp eq i32* %16, null
  br i1 %cmp.i80, label %if.then21.emit.exit87_crit_edge, label %if.then.i84

if.then21.emit.exit87_crit_edge:                  ; preds = %if.then21
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit87

if.then.i84:                                      ; preds = %if.then21
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %17 = ptrtoint i32* %idx2.i94 to i64
  call void @__asan_load4_noabort(i64 %17)
  %18 = load i32, i32* %idx2.i94, align 8
  %idxprom.i82 = sext i32 %18 to i64
  %arrayidx.i83 = getelementptr i32, i32* %16, i64 %idxprom.i82
  %19 = ptrtoint i32* %arrayidx.i83 to i64
  call void @__asan_store4_noabort(i64 %19)
  store i32 %call25, i32* %arrayidx.i83, align 4
  br label %emit.exit87

emit.exit87:                                      ; preds = %if.then21.emit.exit87_crit_edge, %if.then.i84
  %20 = ptrtoint i32* %idx2.i94 to i64
  call void @__asan_load4_noabort(i64 %20)
  %21 = load i32, i32* %idx2.i94, align 8
  %inc.i86 = add i32 %21, 1
  store i32 %inc.i86, i32* %idx2.i94, align 8
  br label %if.end39

if.else27:                                        ; preds = %entry
  %conv28 = and i32 %val, 65535
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %is64)
  %tobool29 = icmp ne i32 %is64, 0
  %cond30 = zext i1 %tobool29 to i32
  %call31 = call i32 @aarch64_insn_gen_movewide(i32 %reg, i32 %conv28, i32 0, i32 %cond30, i32 0) #11
  %image.i70 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 4
  %22 = ptrtoint i32** %image.i70 to i64
  call void @__asan_load8_noabort(i64 %22)
  %23 = load i32*, i32** %image.i70, align 8
  %cmp.i71 = icmp eq i32* %23, null
  br i1 %cmp.i71, label %if.else27.emit.exit78_crit_edge, label %if.then.i75

if.else27.emit.exit78_crit_edge:                  ; preds = %if.else27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit78

if.then.i75:                                      ; preds = %if.else27
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %idx.i72 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %24 = ptrtoint i32* %idx.i72 to i64
  call void @__asan_load4_noabort(i64 %24)
  %25 = load i32, i32* %idx.i72, align 8
  %idxprom.i73 = sext i32 %25 to i64
  %arrayidx.i74 = getelementptr i32, i32* %23, i64 %idxprom.i73
  %26 = ptrtoint i32* %arrayidx.i74 to i64
  call void @__asan_store4_noabort(i64 %26)
  store i32 %call31, i32* %arrayidx.i74, align 4
  br label %emit.exit78

emit.exit78:                                      ; preds = %if.else27.emit.exit78_crit_edge, %if.then.i75
  %idx2.i76 = getelementptr inbounds %struct.jit_ctx, %struct.jit_ctx* %ctx, i64 0, i32 1
  %27 = ptrtoint i32* %idx2.i76 to i64
  call void @__asan_load4_noabort(i64 %27)
  %28 = load i32, i32* %idx2.i76, align 8
  %inc.i77 = add i32 %28, 1
  store i32 %inc.i77, i32* %idx2.i76, align 8
  call void @__sanitizer_cov_trace_const_cmp4(i32 0, i32 %0)
  %tobool32 = icmp eq i32 %0, 0
  br i1 %tobool32, label %emit.exit78.if.end39_crit_edge, label %if.then33

emit.exit78.if.end39_crit_edge:                   ; preds = %emit.exit78
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %if.end39

if.then33:                                        ; preds = %emit.exit78
  %call37 = call i32 @aarch64_insn_gen_movewide(i32 %reg, i32 %0, i32 16, i32 %cond30, i32 1) #11
  %29 = ptrtoint i32** %image.i70 to i64
  call void @__asan_load8_noabort(i64 %29)
  %30 = load i32*, i32** %image.i70, align 8
  %cmp.i62 = icmp eq i32* %30, null
  br i1 %cmp.i62, label %if.then33.emit.exit69_crit_edge, label %if.then.i66

if.then33.emit.exit69_crit_edge:                  ; preds = %if.then33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  br label %emit.exit69

if.then.i66:                                      ; preds = %if.then33
  call void @__sanitizer_cov_trace_pc()
  call void asm sideeffect "", ""()
  %31 = ptrtoint i32* %idx2.i76 to i64
  call void @__asan_load4_noabort(i64 %31)
  %32 = load i32, i32* %idx2.i76, align 8
  %idxprom.i64 = sext i32 %32 to i64
  %arrayidx.i65 = getelementptr i32, i32* %30, i64 %idxprom.i64
  %33 = ptrtoint i32* %arrayidx.i65 to i64
  call void @__asan_store4_noabort(i64 %33)
  store i32 %call37, i32* %arrayidx.i65, align 4
  br label %emit.exit69

emit.exit69:                                      ; preds = %if.then33.emit.exit69_crit_edge, %if.then.i66
  %34 = ptrtoint i32* %idx2.i76 to i64
  call void @__asan_load4_noabort(i64 %34)
  %35 = load i32, i32* %idx2.i76, align 8
  %inc.i68 = add i32 %35, 1
  store i32 %inc.i68, i32* %idx2.i76, align 8
  br label %if.end39

if.end39:                                         ; preds = %emit.exit78.if.end39_crit_edge, %emit.exit96.if.end39_crit_edge, %emit.exit69, %emit.exit, %emit.exit87
  ret void
}

declare dso_local i32 @aarch64_insn_gen_logical_immediate(i32, i32, i32, i32, i64) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_branch_imm(i64, i64, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_cond_branch_imm(i64, i64, i32) local_unnamed_addr #2

declare dso_local i32 @bpf_jit_get_func_addr(%struct.bpf_prog*, %struct.bpf_insn*, i1, i64*, i8*) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_branch_reg(i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_load_store_reg(i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_stadd(i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_load_store_ex(i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_comp_branch_imm(i64, i64, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_movewide(i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local i32 @aarch64_insn_gen_load_store_pair(i32, i32, i32, i32, i32, i32) local_unnamed_addr #2

declare dso_local void @print_hex_dump(i8*, i8*, i32, i32, i32, i8*, i64, i1) local_unnamed_addr #2

declare dso_local void @__flush_icache_range(i64, i64) local_unnamed_addr #2

declare dso_local void @kick_all_cpus_sync() local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #10

declare dso_local i1 @__kasan_check_read(i8*, i32) local_unnamed_addr #2

declare dso_local i32 @set_memory_ro(i64, i32) local_unnamed_addr #2

declare dso_local i32 @set_memory_x(i64, i32) local_unnamed_addr #2

declare dso_local %struct.vm_struct* @find_vm_area(i8*) local_unnamed_addr #2

declare void @__sanitizer_cov_trace_pc_indir(i64)

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

declare void @__sanitizer_cov_trace_gep(i64)

declare void @__sanitizer_cov_trace_switch(i64, i64*)

declare void @__sanitizer_cov_trace_pc()

declare void @__sanitizer_cov_trace_pc_guard(i32*)

declare void @__asan_report_load_n_noabort(i64, i64)

declare void @__asan_loadN_noabort(i64, i64)

declare void @__asan_report_load1_noabort(i64)

declare void @__asan_load1_noabort(i64)

declare void @__asan_report_load2_noabort(i64)

declare void @__asan_load2_noabort(i64)

declare void @__asan_report_load4_noabort(i64)

declare void @__asan_load4_noabort(i64)

declare void @__asan_report_load8_noabort(i64)

declare void @__asan_load8_noabort(i64)

declare void @__asan_report_load16_noabort(i64)

declare void @__asan_load16_noabort(i64)

declare void @__asan_report_store_n_noabort(i64, i64)

declare void @__asan_storeN_noabort(i64, i64)

declare void @__asan_report_store1_noabort(i64)

declare void @__asan_store1_noabort(i64)

declare void @__asan_report_store2_noabort(i64)

declare void @__asan_store2_noabort(i64)

declare void @__asan_report_store4_noabort(i64)

declare void @__asan_store4_noabort(i64)

declare void @__asan_report_store8_noabort(i64)

declare void @__asan_store8_noabort(i64)

declare void @__asan_report_store16_noabort(i64)

declare void @__asan_store16_noabort(i64)

declare void @__asan_report_exp_load_n_noabort(i64, i64, i32)

declare void @__asan_exp_loadN_noabort(i64, i64, i32)

declare void @__asan_report_exp_load1_noabort(i64, i32)

declare void @__asan_exp_load1_noabort(i64, i32)

declare void @__asan_report_exp_load2_noabort(i64, i32)

declare void @__asan_exp_load2_noabort(i64, i32)

declare void @__asan_report_exp_load4_noabort(i64, i32)

declare void @__asan_exp_load4_noabort(i64, i32)

declare void @__asan_report_exp_load8_noabort(i64, i32)

declare void @__asan_exp_load8_noabort(i64, i32)

declare void @__asan_report_exp_load16_noabort(i64, i32)

declare void @__asan_exp_load16_noabort(i64, i32)

declare void @__asan_report_exp_store_n_noabort(i64, i64, i32)

declare void @__asan_exp_storeN_noabort(i64, i64, i32)

declare void @__asan_report_exp_store1_noabort(i64, i32)

declare void @__asan_exp_store1_noabort(i64, i32)

declare void @__asan_report_exp_store2_noabort(i64, i32)

declare void @__asan_exp_store2_noabort(i64, i32)

declare void @__asan_report_exp_store4_noabort(i64, i32)

declare void @__asan_exp_store4_noabort(i64, i32)

declare void @__asan_report_exp_store8_noabort(i64, i32)

declare void @__asan_exp_store8_noabort(i64, i32)

declare void @__asan_report_exp_store16_noabort(i64, i32)

declare void @__asan_exp_store16_noabort(i64, i32)

declare i8* @memmove(i8*, i8*, i64)

declare i8* @memcpy(i8*, i8*, i64)

declare void @__asan_handle_no_return()

declare void @__sanitizer_ptr_cmp(i64, i64)

declare void @__sanitizer_ptr_sub(i64, i64)

declare void @__asan_before_dynamic_init(i64)

declare void @__asan_after_dynamic_init()

declare void @__asan_register_globals(i64, i64)

declare void @__asan_unregister_globals(i64, i64)

declare void @__asan_register_image_globals(i64)

declare void @__asan_unregister_image_globals(i64)

declare void @__asan_register_elf_globals(i64, i64, i64)

declare void @__asan_unregister_elf_globals(i64, i64, i64)

attributes #0 = { nounwind sanitize_address shadowcallstack sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "patchable-function-entry"="2" "sign-return-address"="all" "sign-return-address-key"="a_key" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+reserve-x18,-aes,-crypto,-fp-armv8,-neon,-sha2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "sign-return-address"="all" "sign-return-address-key"="a_key" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+reserve-x18,-aes,-crypto,-fp-armv8,-neon,-sha2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nobuiltin nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "sign-return-address"="all" "sign-return-address-key"="a_key" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+reserve-x18,-aes,-crypto,-fp-armv8,-neon,-sha2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree norecurse nounwind sanitize_address shadowcallstack sspstrong writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "patchable-function-entry"="2" "sign-return-address"="all" "sign-return-address-key"="a_key" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+reserve-x18,-aes,-crypto,-fp-armv8,-neon,-sha2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { cold "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "sign-return-address"="all" "sign-return-address-key"="a_key" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+reserve-x18,-aes,-crypto,-fp-armv8,-neon,-sha2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind willreturn }
attributes #8 = { nounwind readnone speculatable willreturn }
attributes #9 = { inlinehint nounwind sanitize_address shadowcallstack sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "sign-return-address"="all" "sign-return-address-key"="a_key" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+reserve-x18,-aes,-crypto,-fp-armv8,-neon,-sha2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind readonly }
attributes #11 = { nounwind }
attributes #12 = { cold nounwind }

!llvm.asan.globals = !{!0, !2, !3, !5, !7, !8, !10, !12, !13, !15, !17, !18, !20, !22}
!llvm.named.register.sp = !{!24}
!llvm.module.flags = !{!25}
!llvm.ident = !{!26}

!0 = distinct !{null, !1, !"__print_once", i1 false, i1 false}
!1 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 993, i32 4}
!2 = !{[40 x i8]* @.str, !1, !"<string literal>", i1 false, i1 false}
!3 = !{[44 x i8]* @.str.1, !4, !"<string literal>", i1 false, i1 false}
!4 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 582, i32 3}
!5 = distinct !{null, !6, !"__print_once", i1 false, i1 false}
!6 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 828, i32 3}
!7 = !{[32 x i8]* @.str.2, !6, !"<string literal>", i1 false, i1 false}
!8 = !{[16 x i32]* @bpf2a64, !9, !"bpf2a64", i1 false, i1 false}
!9 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 28, i32 18}
!10 = distinct !{null, !11, !"__print_once", i1 false, i1 false}
!11 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 317, i32 3}
!12 = !{[52 x i8]* @.str.3, !11, !"<string literal>", i1 false, i1 false}
!13 = !{i32* @out_offset, !14, !"out_offset", i1 false, i1 false}
!14 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 260, i32 12}
!15 = distinct !{null, !16, !"__print_once", i1 false, i1 false}
!16 = !{!"/home/lukenels/repo/linux/arch/arm64/net/bpf_jit_comp.c", i32 243, i32 4}
!17 = !{[47 x i8]* @.str.4, !16, !"<string literal>", i1 false, i1 false}
!18 = !{[64 x i8]* @.str.5, !19, !"<string literal>", i1 false, i1 false}
!19 = !{!"/home/lukenels/repo/linux/include/linux/filter.h", i32 1003, i32 2}
!20 = !{[3 x i8]* @.str.6, !21, !"<string literal>", i1 false, i1 false}
!21 = !{!"/home/lukenels/repo/linux/include/linux/filter.h", i32 1007, i32 18}
!22 = !{[11 x i8]* @.str.7, !23, !"<string literal>", i1 false, i1 false}
!23 = !{!"/home/lukenels/repo/linux/include/linux/filter.h", i32 1007, i32 28}
!24 = !{!"sp"}
!25 = !{i32 1, !"wchar_size", i32 2}
!26 = !{!"clang version 10.0.0-4ubuntu1 "}
!27 = !{i32 2082086}
!28 = !{i32 -2145198682, i32 -2145198635, i32 -2145198629, i32 -2145198592, i32 -2145198574, i32 -2145197237, i32 -2145197189, i32 -2145197141, i32 -2145197078, i32 -2145197029, i32 -2145198496, i32 -2145198471, i32 -2145198420, i32 -2145198414, i32 -2145197571, i32 -2145197531, i32 -2145197513, i32 -2145197481, i32 -2145197453, i32 -2145197399, i32 -2145197379, i32 -2145197282, i32 -2145198391, i32 -2145198377, i32 -2145198371, i32 -2145198344, i32 -2145198295, i32 -2145198241}
!29 = !{i32 -2145196473, i32 -2145196426, i32 -2145196420, i32 -2145196383, i32 -2145196365, i32 -2145195396, i32 -2145195348, i32 -2145195300, i32 -2145195237, i32 -2145195188, i32 -2145196287, i32 -2145196262, i32 -2145196211, i32 -2145196205, i32 -2145196168, i32 -2145196162, i32 -2145196135, i32 -2145196086, i32 -2145196032}
!30 = !{i32 -2144609409, i32 -2144609362, i32 -2144609356, i32 -2144609319, i32 -2144609301, i32 -2144608348, i32 -2144608300, i32 -2144608252, i32 -2144608189, i32 -2144608140, i32 -2144609223, i32 -2144609198, i32 -2144609147, i32 -2144609141, i32 -2144609104, i32 -2144609098, i32 -2144609071, i32 -2144609022, i32 -2144608968}
!31 = !{i64 0, i64 65}
!32 = distinct !{!32, !33}
!33 = !{!"llvm.loop.isvectorized", i32 1}
!34 = distinct !{!34, !33}
!35 = !{i8 0, i8 2}
