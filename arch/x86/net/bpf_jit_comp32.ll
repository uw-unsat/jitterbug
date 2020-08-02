; ModuleID = '/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp32.c'
source_filename = "/home/lukenels/repo/linux/arch/x86/net/bpf_jit_comp32.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct.task_struct = type { %struct.thread_info, i32, i8*, %struct.refcount_struct, i32, i32, %struct.llist_node, i32, i32, i32, i32, i32, %struct.task_struct*, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, [40 x i8], %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, [2 x %struct.uclamp_se], [2 x %struct.uclamp_se], %struct.hlist_head, i32, i32, i32, %struct.cpumask*, %struct.cpumask, i32, i8, i8, i32, %struct.list_head, i32, i32, %union.rcu_special, i8, %struct.list_head, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, %struct.vmacache, %struct.task_rss_stat, i32, i32, i32, i32, i32, i32, i8, [3 x i8], i16, i32, %struct.restart_block, i32, i32, i32, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.pid*, [4 x %struct.hlist_node], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, %struct.prev_cputime, i32, i32, i64, i64, i32, i32, %struct.posix_cputimers, %struct.cred*, %struct.cred*, %struct.cred*, %struct.key*, [16 x i8], %struct.nameidata*, %struct.sysv_sem, %struct.sysv_shm, i32, i32, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i32, i32, i32, %struct.callback_head*, %struct.audit_context*, %struct.kuid_t, i32, %struct.seccomp, i64, i64, %struct.spinlock, %struct.raw_spinlock, %struct.wake_q_node, %struct.rb_root_cached, %struct.task_struct*, %struct.rt_mutex_waiter*, %struct.mutex_waiter*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, [48 x %struct.held_lock], i32, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, %struct.capture_control*, i32, %struct.kernel_siginfo*, %struct.task_io_accounting, i32, i64, i64, i64, %struct.nodemask_t, %struct.seqcount, i32, i32, %struct.css_set*, %struct.list_head, i32, i32, %struct.robust_list_head*, %struct.list_head, %struct.futex_pi_state*, %struct.mutex, i32, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, %struct.rseq*, i32, i32, %struct.tlbflush_unmap_batch, %union.anon.105, %struct.pipe_inode_info*, %struct.page_frag, %struct.task_delay_info*, i32, i32, i32, i32, i32, i32, [32 x %struct.latency_record], i64, i64, i32, i32, %struct.ftrace_ret_stack*, i64, %struct.atomic_t, %struct.atomic_t, i32, i32, %struct.mem_cgroup*, i32, i32, i32, %struct.mem_cgroup*, %struct.request_queue*, %struct.uprobe_task*, i32, i32, i32, i32, %struct.task_struct*, %struct.refcount_struct, i8*, i64, i64, %struct.callback_head, [52 x i8], %struct.thread_struct }
%struct.thread_info = type { i32, i32 }
%struct.llist_node = type { %struct.llist_node* }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, i32, [12 x i8], %struct.sched_avg }
%struct.load_weight = type { i32, i32 }
%struct.sched_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i64, i64, i64, i32, i32, i32, i32, i32, [4 x i8], %struct.util_est, [8 x i8] }
%struct.util_est = type { i32, i32 }
%struct.sched_rt_entity = type { %struct.list_head, i32, i32, i32, i16, i16, %struct.sched_rt_entity*, %struct.sched_rt_entity*, %struct.rt_rq*, %struct.rt_rq* }
%struct.rt_rq = type opaque
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i64, i32, i8, %struct.hrtimer, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, i64, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i8, i8, i8, i8 }
%struct.timerqueue_node = type { %struct.rb_node, i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.seqcount, %struct.hrtimer*, %struct.timerqueue_head, i64 ()*, i64 }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, i8, i32, i16, i16, i32, i64, %struct.hrtimer*, i64, %struct.hrtimer*, [8 x %struct.hrtimer_clock_base] }
%struct.timerqueue_head = type { %struct.rb_root_cached }
%struct.uclamp_se = type { i16, [2 x i8] }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.cpumask = type { [1 x i32] }
%union.rcu_special = type { i32 }
%struct.sched_info = type { i32, i64, i64, i64 }
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.rb_node = type { i32, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.anon.29, [0 x i32] }
%struct.anon.29 = type { %struct.vm_area_struct*, %struct.rb_root, i64, i32 (%struct.file*, i32, i32, i32, i32)*, i32, i32, i32, i32, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i32, i32, i32, i32, %struct.atomic64_t, i32, i32, i32, i32, %struct.spinlock, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [46 x i32], %struct.mm_rss_stat, %struct.linux_binfmt*, [4 x i8], %struct.mm_context_t, i32, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.task_struct*, %struct.user_namespace*, %struct.file*, %struct.mmu_notifier_subscriptions*, %struct.page*, %struct.atomic_t, i8, %struct.uprobes_state, %struct.atomic_t, %struct.work_struct }
%struct.vm_area_struct = type { i32, i32, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i32, %struct.mm_struct*, %struct.pgprot, i32, %struct.anon.113, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i32, %struct.file*, i8*, %struct.atomic_t, %struct.vm_userfaultfd_ctx }
%struct.pgprot = type { i32 }
%struct.anon.113 = type { %struct.rb_node, i32 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i32)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*, i32)*, void (%struct.vm_fault*, i32, i32)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i32, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, %struct.page* (%struct.vm_area_struct*, i32)* }
%struct.vm_fault = type { %struct.vm_area_struct*, i32, i32, i32, i32, %struct.pmd_t*, %struct.pud_t*, %union.pte_t, %struct.page*, %struct.page*, %union.pte_t*, %struct.spinlock*, %struct.page* }
%struct.pmd_t = type { %struct.pud_t }
%struct.pud_t = type { %struct.p4d_t }
%struct.p4d_t = type { %struct.pgd_t }
%struct.pgd_t = type { i32 }
%union.pte_t = type { i32 }
%struct.vm_userfaultfd_ctx = type { %struct.userfaultfd_ctx* }
%struct.userfaultfd_ctx = type opaque
%struct.rb_root = type { %struct.rb_node* }
%struct.rw_semaphore = type { %struct.atomic_t, %struct.atomic_t, %struct.optimistic_spin_queue, %struct.raw_spinlock, %struct.list_head, i8*, %struct.lockdep_map }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.lockdep_map = type { %struct.lock_class_key*, [2 x %struct.lock_class*], i8*, i16, i16, i32, i32 }
%struct.lock_class_key = type { %union.anon.2 }
%union.anon.2 = type { %struct.hlist_node }
%struct.lock_class = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.lockdep_subclass_key*, i32, i32, i32, [9 x %struct.lock_trace*], i32, i8*, i16, i16, [4 x i32], [4 x i32] }
%struct.lockdep_subclass_key = type { i8 }
%struct.lock_trace = type opaque
%struct.atomic64_t = type { i64 }
%struct.mm_rss_stat = type { [4 x %struct.atomic_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i64, %struct.atomic64_t, %struct.rw_semaphore, %struct.ldt_struct*, %struct.mutex, i8*, %struct.vdso_image*, %struct.atomic_t, [4 x i8] }
%struct.ldt_struct = type opaque
%struct.vdso_image = type { i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.swait_queue_head }
%struct.swait_queue_head = type { %struct.raw_spinlock, %struct.list_head }
%struct.kioctx_table = type opaque
%struct.user_namespace = type { %struct.uid_gid_map, %struct.uid_gid_map, %struct.uid_gid_map, %struct.atomic_t, %struct.user_namespace*, i32, %struct.kuid_t, %struct.kgid_t, %struct.ns_common, i32, %struct.list_head, %struct.key*, %struct.rw_semaphore, %struct.key*, %struct.work_struct, %struct.ctl_table_set, %struct.ctl_table_header*, %struct.ucounts*, [10 x i32] }
%struct.uid_gid_map = type { i32, %union.anon.44 }
%union.anon.44 = type { [5 x %struct.uid_gid_extent] }
%struct.uid_gid_extent = type { i32, i32, i32 }
%struct.kgid_t = type { i32 }
%struct.ns_common = type { %struct.atomic_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.ctl_table_set = type { i32 (%struct.ctl_table_set*)*, %struct.ctl_dir }
%struct.ctl_dir = type { %struct.ctl_table_header, %struct.rb_root }
%struct.ctl_table_header = type { %union.anon.46, %struct.completion*, %struct.ctl_table*, %struct.ctl_table_root*, %struct.ctl_table_set*, %struct.ctl_dir*, %struct.ctl_node*, %struct.hlist_head }
%union.anon.46 = type { %struct.anon.47 }
%struct.anon.47 = type { %struct.ctl_table*, i32, i32, i32 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i32*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.wait_queue_head }
%struct.wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.ctl_table_root = type { %struct.ctl_table_set, %struct.ctl_table_set* (%struct.ctl_table_root*)*, void (%struct.ctl_table_header*, %struct.ctl_table*, %struct.kuid_t*, %struct.kgid_t*)*, i32 (%struct.ctl_table_header*, %struct.ctl_table*)* }
%struct.ctl_node = type { %struct.rb_node, %struct.ctl_table_header* }
%struct.ucounts = type { %struct.hlist_node, %struct.user_namespace*, %struct.kuid_t, i32, [10 x %struct.atomic_t] }
%struct.file = type { %union.anon.26, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, i32, %struct.atomic_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.26 = type { %struct.callback_head }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.vfsmount = type opaque
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [36 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i32, i8*, %union.anon.125, %struct.list_head, %struct.list_head, %union.anon.126 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.27, i8* }
%union.anon.27 = type { %struct.anon.28 }
%struct.anon.28 = type { i32, i32 }
%struct.lockref = type { %union.anon.123 }
%union.anon.123 = type { %struct.anon.124 }
%struct.anon.124 = type { %struct.spinlock, i32 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.path*, i1)*, %struct.dentry* (%struct.dentry*, %struct.inode*)*, [12 x i8] }
%struct.super_block = type { %struct.list_head, i32, i8, i32, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i32, i32, i32, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.fscrypt_operations*, %struct.key*, %struct.fsverity_operations*, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, i8*, i32, i64, i64, i32, %struct.fsnotify_mark_connector*, [32 x i8], %struct.uuid_t, i32, i32, %struct.mutex, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic_t, %struct.atomic_t, i32, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.user_namespace*, %struct.list_lru, %struct.list_lru, %struct.callback_head, %struct.work_struct, %struct.mutex, i32, %struct.spinlock, %struct.list_head, %struct.spinlock, %struct.list_head, [24 x i8] }
%struct.file_system_type = type { i8*, i32, i32 (%struct.fs_context*)*, %struct.fs_parameter_spec*, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.fs_context = type opaque
%struct.fs_parameter_spec = type opaque
%struct.module = type { i32, %struct.list_head, [60 x i8], %struct.module_kobject, %struct.module_attribute*, i8*, i8*, %struct.kobject*, %struct.kernel_symbol*, i32*, i32, %struct.mutex, %struct.kernel_param*, i32, i32, %struct.kernel_symbol*, i32*, %struct.kernel_symbol*, i32*, i32, i32, %struct.kernel_symbol*, i32*, i8, i8, %struct.kernel_symbol*, i32*, i32, i32, %struct.exception_table_entry*, i32 ()*, [32 x i8], %struct.module_layout, %struct.module_layout, %struct.mod_arch_specific, i32, i32, %struct.list_head, %struct.bug_entry*, %struct.mod_kallsyms*, %struct.mod_kallsyms, %struct.module_sect_attrs*, %struct.module_notes_attrs*, i8*, i8*, i32, i8*, i32, i32, i32*, i32, %struct.srcu_struct**, i32, %struct.bpf_raw_event_map*, %struct.jump_entry*, i32, i32, i8**, %struct.trace_event_call**, i32, %struct.trace_eval_map**, i32, i32, i32*, i8*, i32, i32*, i32, %struct.list_head, %struct.list_head, void ()*, %struct.atomic_t, void ()**, i32, %struct.error_injection_entry*, i32, [36 x i8] }
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
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.sock = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.lockdep_map, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.71, i8*, i64, i16, i16, %struct.kernfs_iattrs* }
%union.anon.71 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32, i8, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)*, %struct.lock_class_key }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, %struct.seq_file*, i8*, %struct.mutex, %struct.mutex, i32, %struct.list_head, i8*, i32, i8, %struct.vm_operations_struct* }
%struct.seq_file = type { i8*, i32, i32, i32, i32, i64, i64, %struct.mutex, %struct.seq_operations*, i32, %struct.file*, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.poll_table_struct = type opaque
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.refcount_struct }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.timer_list = type { %struct.hlist_node, i32, void (%struct.timer_list*)*, i32, %struct.lockdep_map }
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i32 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i32 (%struct.module_attribute*, %struct.module_kobject*, i8*, i32)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.module*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.114 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.114 = type { i8* }
%struct.kernel_symbol = type { i32, i32, i32 }
%struct.exception_table_entry = type { i32, i32, i32 }
%struct.module_layout = type { i8*, i32, i32, i32, i32, %struct.mod_tree_node }
%struct.mod_tree_node = type { %struct.module*, %struct.latch_tree_node }
%struct.latch_tree_node = type { [2 x %struct.rb_node] }
%struct.mod_arch_specific = type {}
%struct.bug_entry = type { i32, i8*, i16, i16 }
%struct.mod_kallsyms = type { %struct.elf32_sym*, i32, i8*, i8* }
%struct.elf32_sym = type { i32, i32, i32, i8, i8, i16 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.srcu_struct = type { [3 x %struct.srcu_node], [3 x %struct.srcu_node*], %struct.mutex, %struct.spinlock, %struct.mutex, i32, i32, i32, i32, i32, %struct.srcu_data*, i32, %struct.mutex, %struct.completion, %struct.atomic_t, %struct.delayed_work, %struct.lockdep_map }
%struct.srcu_node = type { %struct.spinlock, [4 x i32], [4 x i32], i32, %struct.srcu_node*, i32, i32 }
%struct.srcu_data = type { [2 x i32], [2 x i32], [48 x i8], %struct.spinlock, %struct.rcu_segcblist, i32, i32, i8, %struct.timer_list, %struct.work_struct, %struct.callback_head, %struct.srcu_node*, i32, i32, %struct.srcu_struct*, [40 x i8] }
%struct.rcu_segcblist = type { %struct.callback_head*, [4 x %struct.callback_head**], [4 x i32], %struct.atomic_t, i8, i8 }
%struct.bpf_raw_event_map = type { %struct.tracepoint*, i8*, i32, i32, [16 x i8] }
%struct.tracepoint = type { i8*, %struct.static_key, i32 ()*, void ()*, %struct.tracepoint_func* }
%struct.static_key = type { %struct.atomic_t, %union.anon.115 }
%union.anon.115 = type { i32 }
%struct.tracepoint_func = type { i8*, i8*, i32 }
%struct.jump_entry = type { i32, i32, i32 }
%struct.trace_event_call = type opaque
%struct.trace_eval_map = type opaque
%struct.error_injection_entry = type { i32, i32 }
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.super_block*, i32, i8*, i32, i64)*, i32 (%struct.super_block*, i32, i8*, i32, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i32 (%struct.super_block*, %struct.shrink_control*)*, i32 (%struct.super_block*, %struct.shrink_control*)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.spinlock, %struct.atomic_t, %struct.super_block*, %struct.kqid, i64, i32, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.116, i32 }
%union.anon.116 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.shrink_control = type { i32, i32, i32, i32, %struct.mem_cgroup* }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)*, i32 (%struct.inode*, %struct.kprojid_t*)*, i32 (%struct.inode*, i64*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.kprojid_t = type { i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.qc_info*)*, i32 (%struct.super_block*, i32, i32, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.kqid*, %struct.qc_dqblk*)*, i32 (%struct.super_block*, i32, i32, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.qc_state*)*, i32 (%struct.super_block*, i32)* }
%struct.qc_info = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.qc_dqblk = type { i32, i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, i64, i32 }
%struct.qc_state = type { i32, [3 x %struct.qc_type_state] }
%struct.qc_type_state = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64 }
%struct.export_operations = type opaque
%struct.xattr_handler = type opaque
%struct.fscrypt_operations = type opaque
%struct.fsverity_operations = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, i8, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.backing_dev_info*, %struct.list_head, i32, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
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
%struct.list_lru = type { %struct.list_lru_node*, %struct.list_head, i32, i8 }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_lru_one, %struct.list_lru_memcg*, i32 }
%struct.list_lru_one = type { %struct.list_head, i32 }
%struct.list_lru_memcg = type { %struct.callback_head, [0 x %struct.list_lru_one*] }
%union.anon.125 = type { %struct.list_head }
%union.anon.126 = type { %struct.hlist_node }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i32, %union.anon.117, i32, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.spinlock, i16, i8, i8, i64, %struct.seqcount, i32, %struct.rw_semaphore, i32, i32, %struct.hlist_node, %struct.list_head, %struct.bdi_writeback*, i32, i16, i16, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.118, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %union.anon.119, %struct.file_lock_context*, %struct.address_space, %struct.list_head, %union.anon.122, i32, i32, %struct.fsnotify_mark_connector*, %struct.fscrypt_info*, %struct.fsverity_info*, i8* }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.inode*, %struct.delayed_call*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.path*, %struct.kstat*, i32, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec64*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, [44 x i8] }
%struct.delayed_call = type { void (i8*)*, i8* }
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.file* }
%struct.kstat = type { i32, i16, i32, i32, i64, i64, i64, i32, i32, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.timespec64, i64, i64 }
%struct.fiemap_extent_info = type opaque
%union.anon.117 = type { i32 }
%struct.timespec64 = type { i64, i32 }
%struct.bdi_writeback = type opaque
%union.anon.118 = type { %struct.callback_head }
%union.anon.119 = type { %struct.file_operations* }
%struct.file_lock_context = type { %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head }
%struct.address_space = type { %struct.inode*, %struct.xarray, i32, %struct.atomic_t, %struct.atomic_t, %struct.rb_root_cached, %struct.rw_semaphore, i32, i32, i32, %struct.address_space_operations*, i32, i32, %struct.spinlock, %struct.list_head, i8* }
%struct.xarray = type { %struct.spinlock, i32, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, void (%struct.readahead_control*)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i1 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.page*)*, i32 (%struct.page*, i32, i32)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.readahead_control = type opaque
%struct.kiocb = type { %struct.file*, i64, void (%struct.kiocb*, i32, i32)*, i8*, i32, i16, i16, i32 }
%struct.iov_iter = type { i32, i32, i32, %union.anon.74, %union.anon.75 }
%union.anon.74 = type { %struct.iovec* }
%struct.iovec = type { i8*, i32 }
%union.anon.75 = type { %struct.anon.76 }
%struct.anon.76 = type { i32, i32 }
%struct.swap_info_struct = type opaque
%union.anon.122 = type { %struct.pipe_inode_info* }
%struct.fscrypt_info = type opaque
%struct.fsverity_info = type opaque
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, i1)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.vm_area_struct*)*, i32, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.file*, %struct.page*, i32, i32, i64*, i32)*, i32 (%struct.file*, i32, i32, i32, i32)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.pipe_inode_info*, %struct.file*, i64*, i32, i32)*, i32 (%struct.file*, i64*, %struct.pipe_inode_info*, i32, i32)*, i32 (%struct.file*, i32, %struct.file_lock**, i8**)*, i32 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)*, i32 (%struct.file*, i64, %struct.file*, i64, i32, i32)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i32 (%struct.file*, i64, i64, i32)* }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, i8*, i32, i8, i32, i32, %struct.wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i32, i32, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.120 }
%struct.fasync_struct = type { %struct.rwlock_t, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.rwlock_t = type { %struct.qrwlock, i32, i32, i8*, %struct.lockdep_map }
%struct.qrwlock = type { %union.anon.63, %struct.qspinlock }
%union.anon.63 = type { %struct.atomic_t }
%struct.qspinlock = type { %union.anon.0 }
%union.anon.0 = type { %struct.atomic_t }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i8* (i8*)*, void (i8*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock*, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)*, i1 (%struct.file_lock*)* }
%union.anon.120 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.file_ra_state = type { i32, i32, i32, i32, i32, i64 }
%struct.mmu_notifier_subscriptions = type opaque
%struct.page = type { i32, %union.anon.72, %union.anon.88, %struct.atomic_t, %struct.mem_cgroup*, [4 x i8] }
%union.anon.72 = type { %struct.anon.73 }
%struct.anon.73 = type { %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.88 = type { %struct.atomic_t }
%struct.uprobes_state = type { %struct.xol_area* }
%struct.xol_area = type opaque
%struct.work_struct = type { %struct.atomic_t, %struct.list_head, void (%struct.work_struct*)*, %struct.lockdep_map }
%struct.vmacache = type { i64, [4 x %struct.vm_area_struct*] }
%struct.task_rss_stat = type { i32, [4 x i32] }
%struct.restart_block = type { i32 (%struct.restart_block*)*, %union.anon.31 }
%union.anon.31 = type { %struct.anon.32 }
%struct.anon.32 = type { i32*, i32, i32, i32, i64, i32* }
%struct.pid = type { %struct.refcount_struct, i32, %struct.spinlock, [4 x %struct.hlist_head], %struct.hlist_head, %struct.wait_queue_head, %struct.callback_head, [1 x %struct.upid] }
%struct.upid = type { i32, %struct.pid_namespace* }
%struct.pid_namespace = type opaque
%struct.prev_cputime = type { i64, i64, %struct.raw_spinlock }
%struct.posix_cputimers = type { [3 x %struct.posix_cputimer_base], i32, i32 }
%struct.posix_cputimer_base = type { i64, %struct.timerqueue_head }
%struct.cred = type { %struct.atomic_t, %struct.atomic_t, i8*, i32, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %union.anon.48 }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.user_struct = type { %struct.refcount_struct, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, i32, i32, %struct.atomic_t, %struct.hlist_node, %struct.kuid_t, %struct.atomic_t, %struct.ratelimit_state }
%struct.ratelimit_state = type { %struct.raw_spinlock, i32, i32, i32, i32, i32, i32 }
%struct.group_info = type { %struct.atomic_t, i32, [0 x %struct.kgid_t] }
%union.anon.48 = type { %struct.callback_head }
%struct.key = type { %struct.refcount_struct, i32, %union.anon.36, %struct.watch_list*, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.37, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i16, i32, %union.anon.38, %union.anon.42, %struct.key_restriction* }
%union.anon.36 = type { %struct.rb_node }
%struct.watch_list = type opaque
%struct.key_user = type opaque
%union.anon.37 = type { i64 }
%union.anon.38 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { i32, %union.anon.39, %struct.key_type*, %struct.key_tag*, i8* }
%union.anon.39 = type { i32 }
%struct.key_type = type opaque
%struct.key_tag = type { %struct.callback_head, %struct.refcount_struct, i8 }
%union.anon.42 = type { %union.key_payload }
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
%struct.net = type { %struct.refcount_struct, %struct.refcount_struct, %struct.spinlock, i32, i32, i32, %struct.spinlock, %struct.atomic_t, %struct.list_head, %struct.list_head, %struct.llist_node, %struct.key_tag*, %struct.user_namespace*, %struct.ucounts*, %struct.idr, %struct.ns_common, %struct.list_head, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.ctl_table_set, %struct.sock*, %struct.sock*, %struct.uevent_sock*, %struct.hlist_head*, %struct.hlist_head*, %struct.raw_notifier_head, i32, %struct.net_device*, %struct.list_head, %struct.netns_core, %struct.netns_mib, %struct.netns_packet, %struct.netns_unix, %struct.netns_nexthop, [4 x i8], %struct.netns_ipv4, %struct.netns_ipv6, %struct.netns_ieee802154_lowpan, %struct.netns_sctp, %struct.netns_dccp, %struct.netns_nf, %struct.netns_xt, %struct.netns_ct, %struct.netns_nftables, %struct.netns_nf_frag, %struct.ctl_table_header*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.list_head, %struct.sk_buff_head, %struct.net_generic*, %struct.netns_bpf, [40 x i8], %struct.netns_xfrm, %struct.atomic64_t, %struct.netns_ipvs*, %struct.netns_mpls, %struct.netns_can, %struct.netns_xdp, %struct.sock*, %struct.sock*, [32 x i8] }
%struct.idr = type { %struct.xarray, i32, i32 }
%struct.proc_dir_entry = type opaque
%struct.uevent_sock = type opaque
%struct.raw_notifier_head = type { %struct.notifier_block* }
%struct.notifier_block = type { i32 (%struct.notifier_block*, i32, i8*)*, %struct.notifier_block*, i32 }
%struct.net_device = type { [16 x i8], %struct.netdev_name_node*, %struct.dev_ifalias*, i32, i32, i32, i32, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.anon.127, i64, i64, i64, i64, i64, i64, i64, i32, i32, %struct.net_device_stats, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.iw_handler_def*, %struct.iw_public_data*, %struct.net_device_ops*, %struct.ethtool_ops*, %struct.l3mdev_ops*, %struct.ndisc_ops*, %struct.xfrmdev_ops*, %struct.tlsdev_ops*, %struct.header_ops*, i32, i32, i16, i16, i8, i8, i8, i8, i32, i32, i32, i16, i16, i8, i16, i16, [32 x i8], i8, i8, i8, i8, i16, i16, i16, %struct.spinlock, i8, i8, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.kset*, i32, i32, %struct.vlan_info*, %struct.dsa_port*, %struct.tipc_bearer*, i8*, %struct.in_device*, %struct.dn_dev*, %struct.inet6_dev*, i8*, %struct.wireless_dev*, %struct.wpan_dev*, %struct.mpls_dev*, i8*, %struct.netdev_rx_queue*, i32, i32, %struct.bpf_prog*, i32, i32, i32 (%struct.sk_buff**)*, i8*, %struct.mini_Qdisc*, %struct.netdev_queue*, %struct.nf_hook_entries*, [32 x i8], %struct.cpu_rmap*, %struct.hlist_node, [8 x i8], %struct.netdev_queue*, i32, i32, %struct.Qdisc*, i32, %struct.spinlock, %struct.xdp_dev_bulk_queue*, %struct.xps_dev_maps*, %struct.xps_dev_maps*, %struct.mini_Qdisc*, [16 x %struct.hlist_head], %struct.timer_list, i32, %struct.list_head, i32*, %struct.list_head, i8, i8, i16, i8, void (%struct.net_device*)*, %struct.netpoll_info*, %struct.possible_net_t, %union.anon.143, %struct.garp_port*, %struct.mrp_port*, %struct.device, [4 x %struct.attribute_group*], %struct.attribute_group*, %struct.rtnl_link_ops*, i32, i16, %struct.dcbnl_rtnl_ops*, i16, [16 x %struct.netdev_tc_txq], [16 x i8], i32, %struct.netprio_map*, %struct.phy_device*, %struct.sfp_bus*, %struct.lock_class_key*, %struct.lock_class_key*, i8, i8, %struct.list_head, %struct.macsec_ops*, [32 x i8] }
%struct.netdev_name_node = type { %struct.hlist_node, %struct.list_head, %struct.net_device*, i8* }
%struct.dev_ifalias = type { %struct.callback_head, [0 x i8] }
%struct.anon.127 = type { %struct.list_head, %struct.list_head }
%struct.net_device_stats = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.iw_handler_def = type opaque
%struct.iw_public_data = type opaque
%struct.net_device_ops = type { i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.sk_buff*, %struct.net_device*, i64)*, i16 (%struct.net_device*, %struct.sk_buff*, %struct.net_device*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ifreq*, i32)*, i32 (%struct.net_device*, %struct.ifmap*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.neigh_parms*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.rtnl_link_stats64*)*, i1 (%struct.net_device*, i32)*, i32 (i32, %struct.net_device*, i8*)*, %struct.net_device_stats* (%struct.net_device*)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i16, i16)*, void (%struct.net_device*)*, i32 (%struct.net_device*, %struct.netpoll_info*)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i16, i8, i16)*, i32 (%struct.net_device*, i32, i32, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_info*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_stats*)*, i32 (%struct.net_device*, i32, %struct.nlattr**)*, i32 (%struct.net_device*, i32, %struct.sk_buff*)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_guid*, %struct.ifla_vf_guid*)*, i32 (%struct.net_device*, i32, i64, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, i16)*, i32 (%struct.net_device*, i16, %struct.scatterlist*, i32)*, i32 (%struct.net_device*, %struct.netdev_fcoe_hbainfo*)*, i32 (%struct.net_device*, i64*, i32)*, i32 (%struct.net_device*, %struct.sk_buff*, i16, i32)*, i32 (%struct.net_device*, %struct.net_device*, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, %struct.net_device* (%struct.net_device*, %struct.sk_buff*, i1)*, i64 (%struct.net_device*, i64)*, i32 (%struct.net_device*, i64)*, i32 (%struct.net_device*, %struct.neighbour*)*, void (%struct.net_device*, %struct.neighbour*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16, i16, %struct.netlink_ext_ack*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16)*, i32 (%struct.sk_buff*, %struct.netlink_callback*, %struct.net_device*, %struct.net_device*, i32*)*, i32 (%struct.sk_buff*, %struct.nlattr**, %struct.net_device*, i8*, i16, i32, i32, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16, %struct.netlink_ext_ack*)*, i32 (%struct.sk_buff*, i32, i32, %struct.net_device*, i32, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*, i16)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, i32 (%struct.net_device*, i8*, i32)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, void (%struct.net_device*, %struct.udp_tunnel_info*)*, i8* (%struct.net_device*, %struct.net_device*)*, void (%struct.net_device*, i8*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.sk_buff*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.netdev_bpf*)*, i32 (%struct.net_device*, i32, %struct.xdp_frame**, i32)*, i32 (%struct.net_device*, i32, i32)*, %struct.devlink_port* (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ip_tunnel_parm*, i32)* }
%struct.sk_buff = type <{ %union.anon.51, %union.anon.54, %union.anon.55, [48 x i8], %union.anon.56, i32, i32, i32, i16, i16, i16, [0 x i8], i8, i8, [0 x i32], [0 x i8], i16, [0 x i8], i24, i16, %union.anon.58, i32, i32, i32, i16, i16, %union.anon.60, i32, %union.anon.61, %union.anon.62, i16, i16, i16, i16, i16, i16, i16, [0 x i32], i8*, i8*, i8*, i8*, i32, %struct.refcount_struct, %struct.skb_ext* }>
%union.anon.51 = type { %struct.anon.52 }
%struct.anon.52 = type { %struct.sk_buff*, %struct.sk_buff*, %union.anon.53 }
%union.anon.53 = type { %struct.net_device* }
%union.anon.54 = type { %struct.sock* }
%union.anon.55 = type { i64 }
%union.anon.56 = type { %struct.anon.57 }
%struct.anon.57 = type { i32, void (%struct.sk_buff*)* }
%union.anon.58 = type { i32 }
%union.anon.60 = type { i32 }
%union.anon.61 = type { i32 }
%union.anon.62 = type { i16 }
%struct.skb_ext = type { %struct.refcount_struct, [4 x i8], i8, [7 x i8], [0 x i8] }
%struct.ifreq = type { %union.anon.128, %union.anon.129 }
%union.anon.128 = type { [16 x i8] }
%union.anon.129 = type { %struct.ifmap }
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
%struct.netlink_callback = type { %struct.sk_buff*, %struct.nlmsghdr*, i32 (%struct.sk_buff*, %struct.netlink_callback*)*, i32 (%struct.netlink_callback*)*, i8*, %struct.module*, %struct.netlink_ext_ack*, i16, i16, i32, i32, i32, i8, %union.anon.131 }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%union.anon.131 = type { [6 x i32], [24 x i8] }
%struct.netdev_phys_item_id = type { [32 x i8], i8 }
%struct.udp_tunnel_info = type opaque
%struct.netdev_bpf = type { i32, %union.anon.132 }
%union.anon.132 = type { %struct.anon.133 }
%struct.anon.133 = type { i32, %struct.bpf_prog*, %struct.netlink_ext_ack* }
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
%struct.ethtool_rxnfc = type { i32, i32, i64, %struct.ethtool_rx_flow_spec, %union.anon.137, [0 x i32] }
%struct.ethtool_rx_flow_spec = type { i32, %union.ethtool_flow_union, %struct.ethtool_flow_ext, %union.ethtool_flow_union, %struct.ethtool_flow_ext, i64, i32 }
%union.ethtool_flow_union = type { %struct.ethtool_tcpip6_spec, [12 x i8] }
%struct.ethtool_tcpip6_spec = type { [4 x i32], [4 x i32], i16, i16, i8 }
%struct.ethtool_flow_ext = type { [2 x i8], [6 x i8], i16, i16, [2 x i32] }
%union.anon.137 = type { i32 }
%struct.ethtool_flash = type { i32, i32, [128 x i8] }
%struct.ethtool_channels = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_dump = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_ts_info = type { i32, i32, i32, i32, [3 x i32], i32, [3 x i32] }
%struct.ethtool_modinfo = type { i32, i32, i32, [8 x i32] }
%struct.ethtool_eeprom = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_eee = type { i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%struct.ethtool_tunable = type { i32, i32, i32, i32, [0 x i8*] }
%struct.ethtool_link_ksettings = type { %struct.ethtool_link_settings, %struct.anon.138 }
%struct.ethtool_link_settings = type { i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [1 x i8], [7 x i32], [0 x i32] }
%struct.anon.138 = type { [3 x i32], [3 x i32], [3 x i32] }
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
%struct.netdev_rx_queue = type { %struct.rps_map*, %struct.rps_dev_flow_table*, %struct.kobject, %struct.net_device*, [44 x i8], %struct.xdp_rxq_info, %struct.xdp_umem*, [60 x i8] }
%struct.rps_map = type { i32, %struct.callback_head, [0 x i16] }
%struct.rps_dev_flow_table = type { i32, %struct.callback_head, [0 x %struct.rps_dev_flow] }
%struct.rps_dev_flow = type { i16, i16, i32 }
%struct.xdp_rxq_info = type { %struct.net_device*, i32, i32, %struct.xdp_mem_info, [44 x i8] }
%struct.xdp_umem = type opaque
%struct.bpf_prog = type { i16, i16, i32, i32, i32, i32, [8 x i8], %struct.bpf_prog_aux*, %struct.sock_fprog_kern*, i32 (i8*, %struct.bpf_insn*)*, [0 x %struct.sock_filter], [0 x %struct.bpf_insn] }
%struct.bpf_prog_aux = type { %struct.atomic64_t, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.bpf_ctx_arg_aux*, %struct.bpf_prog*, i8, i8, i8, i8, i32, %struct.bpf_trampoline*, %struct.hlist_node, %struct.btf_type*, i8*, %struct.bpf_prog**, i8*, %struct.bpf_jit_poke_descriptor*, i32, %struct.bpf_ksym, %struct.bpf_prog_ops*, %struct.bpf_map**, %struct.bpf_prog*, %struct.user_struct*, i64, [2 x %struct.bpf_map*], [16 x i8], i8*, %struct.bpf_prog_offload*, %struct.btf*, %struct.bpf_func_info*, %struct.bpf_func_info_aux*, %struct.bpf_line_info*, i8**, i32, i32, i32, i32, %struct.exception_table_entry*, %struct.bpf_prog_stats*, %union.anon.146 }
%struct.bpf_ctx_arg_aux = type { i32, i32 }
%struct.bpf_trampoline = type { %struct.hlist_node, %struct.mutex, %struct.refcount_struct, i64, %struct.anon.4, %struct.bpf_prog*, [3 x %struct.hlist_head], [3 x i32], i8*, i64, %struct.bpf_ksym }
%struct.anon.4 = type { %struct.btf_func_model, i8*, i8 }
%struct.btf_func_model = type { i8, i8, [12 x i8] }
%struct.btf_type = type opaque
%struct.bpf_jit_poke_descriptor = type { i8*, %union.anon.5, i8, i8, i16 }
%union.anon.5 = type { %struct.anon.6 }
%struct.anon.6 = type { %struct.bpf_map*, i32 }
%struct.bpf_map = type { %struct.bpf_map_ops*, %struct.bpf_map*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.btf*, %struct.bpf_map_memory, [16 x i8], i32, i8, i8, [42 x i8], %struct.atomic64_t, %struct.atomic64_t, %struct.work_struct, %struct.mutex, i64, [32 x i8] }
%struct.bpf_map_ops = type { i32 (%union.bpf_attr*)*, %struct.bpf_map* (%union.bpf_attr*)*, void (%struct.bpf_map*, %struct.file*)*, void (%struct.bpf_map*)*, i32 (%struct.bpf_map*, i8*, i8*)*, void (%struct.bpf_map*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i32 (%struct.bpf_map*, %union.bpf_attr*, %union.bpf_attr*)*, i8* (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*, i64)*, i32 (%struct.bpf_map*, i8*)*, i32 (%struct.bpf_map*, i8*)*, i8* (%struct.bpf_map*, %struct.file*, i32)*, void (i8*)*, i32 (%struct.bpf_map*, %struct.bpf_insn*)*, i32 (i8*)*, void (%struct.bpf_map*, i8*, %struct.seq_file*)*, i32 (%struct.bpf_map*, %struct.btf*, %struct.btf_type*, %struct.btf_type*)*, i32 (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, %struct.bpf_prog_aux*)*, void (%struct.bpf_map*, i32, %struct.bpf_prog*, %struct.bpf_prog*)*, i32 (%struct.bpf_map*, i64*, i32)*, i32 (%struct.bpf_map*, i64, i32*)*, i32 (%struct.bpf_map*, %struct.vm_area_struct*)*, i32 (%struct.bpf_map*, %struct.file*, %struct.poll_table_struct*)* }
%union.bpf_attr = type { %struct.anon.11 }
%struct.anon.11 = type { i32, i32, i64, i64, i32, i32, i64, i32, i32, [16 x i8], i32, i32, i32, i32, i64, i32, i32, i64, i32, i32, i32, [4 x i8] }
%struct.bpf_insn = type { i8, i8, i16, i32 }
%struct.bpf_map_memory = type { i32, %struct.user_struct* }
%struct.bpf_ksym = type { i32, i32, [128 x i8], %struct.list_head, %struct.latch_tree_node, i8 }
%struct.bpf_prog_ops = type { i32 (%struct.bpf_prog*, %union.bpf_attr*, %union.bpf_attr*)* }
%struct.bpf_prog_offload = type { %struct.bpf_prog*, %struct.net_device*, %struct.bpf_offload_dev*, i8*, %struct.list_head, i8, i8, i8*, i32 }
%struct.bpf_offload_dev = type opaque
%struct.btf = type opaque
%struct.bpf_func_info = type { i32, i32 }
%struct.bpf_func_info_aux = type { i16, i8 }
%struct.bpf_line_info = type { i32, i32, i32, i32 }
%struct.bpf_prog_stats = type { i64, i64, %struct.u64_stats_sync }
%struct.u64_stats_sync = type { %struct.seqcount }
%union.anon.146 = type { %struct.work_struct }
%struct.sock_fprog_kern = type { i16, %struct.sock_filter* }
%struct.sock_filter = type { i16, i8, i8, i32 }
%struct.nf_hook_entries = type opaque
%struct.cpu_rmap = type opaque
%struct.netdev_queue = type { %struct.net_device*, %struct.Qdisc*, %struct.Qdisc*, %struct.kobject, i32, i32, %struct.net_device*, %struct.xdp_umem*, [28 x i8], %struct.spinlock, i32, i32, i32, [8 x i8], %struct.dql }
%struct.dql = type { i32, i32, i32, [52 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [24 x i8] }
%struct.Qdisc = type { i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, i32, i32, %struct.Qdisc_ops*, %struct.qdisc_size_table*, %struct.hlist_node, i32, i32, %struct.netdev_queue*, %struct.net_rate_estimator*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, i32, %struct.refcount_struct, %struct.sk_buff_head, %struct.qdisc_skb_head, %struct.gnet_stats_basic_packed, %struct.seqcount, %struct.gnet_stats_queue, i32, %struct.Qdisc*, %struct.sk_buff_head, [12 x i8], %struct.spinlock, %struct.spinlock, i8, %struct.callback_head, [28 x i8] }
%struct.Qdisc_ops = type { %struct.Qdisc_ops*, %struct.Qdisc_class_ops*, [16 x i8], i32, i32, i32 (%struct.sk_buff*, %struct.Qdisc*, %struct.sk_buff**)*, %struct.sk_buff* (%struct.Qdisc*)*, %struct.sk_buff* (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, %struct.nlattr*, %struct.netlink_ext_ack*)*, void (%struct.Qdisc*)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, %struct.sk_buff*)*, i32 (%struct.Qdisc*, %struct.gnet_dump*)*, void (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*)*, i32 (%struct.Qdisc*)*, %struct.module* }
%struct.Qdisc_class_ops = type { i32, %struct.netdev_queue* (%struct.Qdisc*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i32, %struct.Qdisc*, %struct.Qdisc**, %struct.netlink_ext_ack*)*, %struct.Qdisc* (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, i32, %struct.nlattr**, i32*, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i32)*, void (%struct.Qdisc*, %struct.qdisc_walker*)*, %struct.tcf_block* (%struct.Qdisc*, i32, %struct.netlink_ext_ack*)*, i32 (%struct.Qdisc*, i32, i32)*, void (%struct.Qdisc*, i32)*, i32 (%struct.Qdisc*, i32, %struct.sk_buff*, %struct.tcmsg*)*, i32 (%struct.Qdisc*, i32, %struct.gnet_dump*)* }
%struct.tcmsg = type { i8, i8, i16, i32, i32, i32, i32 }
%struct.qdisc_walker = type opaque
%struct.tcf_block = type { %struct.mutex, %struct.list_head, i32, i32, %struct.refcount_struct, %struct.net*, %struct.Qdisc*, %struct.rw_semaphore, %struct.flow_block, %struct.list_head, i8, %struct.atomic_t, i32, i32, %struct.anon.142, %struct.callback_head, [128 x %struct.hlist_head], %struct.mutex }
%struct.flow_block = type { %struct.list_head }
%struct.anon.142 = type { %struct.tcf_chain*, %struct.list_head }
%struct.tcf_chain = type { %struct.mutex, %struct.tcf_proto*, %struct.list_head, %struct.tcf_block*, i32, i32, i32, i8, i8, %struct.tcf_proto_ops*, i8*, %struct.callback_head }
%struct.tcf_proto = type { %struct.tcf_proto*, i8*, i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i16, i32, i8*, %struct.tcf_proto_ops*, %struct.tcf_chain*, %struct.spinlock, i8, %struct.refcount_struct, %struct.callback_head, %struct.hlist_node }
%struct.tcf_result = type { %union.anon.139 }
%union.anon.139 = type { %struct.anon.140 }
%struct.anon.140 = type { i32, i32 }
%struct.tcf_proto_ops = type { %struct.list_head, [16 x i8], i32 (%struct.sk_buff*, %struct.tcf_proto*, %struct.tcf_result*)*, i32 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, i1, %struct.netlink_ext_ack*)*, i8* (%struct.tcf_proto*, i32)*, void (%struct.tcf_proto*, i8*)*, i32 (%struct.net*, %struct.sk_buff*, %struct.tcf_proto*, i32, i32, %struct.nlattr**, i8**, i1, i1, %struct.netlink_ext_ack*)*, i32 (%struct.tcf_proto*, i8*, i8*, i1, %struct.netlink_ext_ack*)*, i1 (%struct.tcf_proto*)*, void (%struct.tcf_proto*, %struct.tcf_walker*, i1)*, i32 (%struct.tcf_proto*, i1, i32 (i32, i8*, i8*)*, i8*, %struct.netlink_ext_ack*)*, void (%struct.tcf_proto*, i8*)*, void (%struct.tcf_proto*, i8*)*, void (i8*, i32, i32, i8*, i32)*, i8* (%struct.net*, %struct.tcf_chain*, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (i8*)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.net*, %struct.tcf_proto*, i8*, %struct.sk_buff*, %struct.tcmsg*, i1)*, i32 (%struct.sk_buff*, %struct.net*, i8*)*, %struct.module*, i32 }
%struct.tcf_walker = type opaque
%struct.gnet_dump = type { %struct.spinlock*, %struct.sk_buff*, %struct.nlattr*, i32, i32, i32, i8*, i32, %struct.tc_stats }
%struct.tc_stats = type { i64, i32, i32, i32, i32, i32, i32, i32 }
%struct.qdisc_size_table = type { %struct.callback_head, %struct.list_head, %struct.tc_sizespec, i32, [0 x i16] }
%struct.tc_sizespec = type { i8, i8, i16, i32, i32, i32, i32, i32 }
%struct.net_rate_estimator = type opaque
%struct.gnet_stats_basic_cpu = type { %struct.gnet_stats_basic_packed, %struct.u64_stats_sync }
%struct.qdisc_skb_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.gnet_stats_basic_packed = type { i64, i64 }
%struct.gnet_stats_queue = type { i32, i32, i32, i32, i32 }
%struct.xdp_dev_bulk_queue = type opaque
%struct.xps_dev_maps = type { %struct.callback_head, [0 x %struct.xps_map*] }
%struct.xps_map = type { i32, i32, %struct.callback_head, [0 x i16] }
%struct.mini_Qdisc = type { %struct.tcf_proto*, %struct.tcf_block*, %struct.gnet_stats_basic_cpu*, %struct.gnet_stats_queue*, %struct.callback_head }
%struct.netpoll_info = type opaque
%struct.possible_net_t = type { %struct.net* }
%union.anon.143 = type { i8* }
%struct.garp_port = type opaque
%struct.mrp_port = type opaque
%struct.device = type { %struct.kobject, %struct.device*, %struct.device_private*, i8*, %struct.device_type*, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.mutex, %struct.mutex, %struct.dev_links_info, %struct.dev_pm_info, %struct.dev_pm_domain*, %struct.irq_domain*, %struct.dev_pin_info*, %struct.list_head, %struct.dma_map_ops*, i64*, i64, i64, i32, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.cma*, %struct.dev_archdata, %struct.device_node*, %struct.fwnode_handle*, i32, i32, %struct.spinlock, %struct.list_head, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, %struct.dev_iommu*, i8 }
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
%struct.device_dma_parameters = type { i32, i32 }
%struct.dma_coherent_mem = type opaque
%struct.cma = type opaque
%struct.dev_archdata = type { i8* }
%struct.device_node = type opaque
%struct.fwnode_handle = type { %struct.fwnode_handle*, %struct.fwnode_operations*, %struct.device* }
%struct.fwnode_operations = type { %struct.fwnode_handle* (%struct.fwnode_handle*)*, void (%struct.fwnode_handle*)*, i1 (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*, %struct.device*)*, i1 (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i32, i8*, i32)*, i32 (%struct.fwnode_handle*, i8*, i8**, i32)*, i8* (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i8*, i32, i32, %struct.fwnode_reference_args*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, i32 (%struct.fwnode_handle*, %struct.fwnode_endpoint*)*, i32 (%struct.fwnode_handle*, %struct.device*)* }
%struct.fwnode_reference_args = type { %struct.fwnode_handle*, i32, [8 x i64] }
%struct.fwnode_endpoint = type { i32, i32, %struct.fwnode_handle* }
%struct.class = type { i8*, %struct.module*, %struct.attribute_group**, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, void (%struct.device*, %struct.kuid_t*, %struct.kgid_t*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.iommu_group = type opaque
%struct.dev_iommu = type opaque
%struct.rtnl_link_ops = type { %struct.list_head, i8*, i32, void (%struct.net_device*)*, i32, %struct.nla_policy*, i32 (%struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, void (%struct.net_device*, %struct.list_head*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 ()*, i32 ()*, i32, %struct.nla_policy*, i32 (%struct.net_device*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**, %struct.netlink_ext_ack*)*, i32 (%struct.net_device*, %struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*, %struct.net_device*)*, %struct.net* (%struct.net_device*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.sk_buff*, %struct.net_device*, i32*, i32)* }
%struct.nla_policy = type { i8, i8, i16, %union.anon.144 }
%union.anon.144 = type { i32 }
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
%struct.netns_ipv4 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ipv4_devconf*, %struct.ipv4_devconf*, %struct.ip_ra_chain*, %struct.mutex, %struct.fib_rules_ops*, i8, i32, %struct.fib_table*, %struct.fib_table*, i8, i32, %struct.hlist_head*, i8, %struct.sock*, %struct.sock**, %struct.sock*, %struct.inet_peer_base*, %struct.sock**, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, i32, i32, i32, i32, i32, i32, %struct.local_ports, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, [20 x i8], %struct.inet_timewait_death_row, i32, i32, %struct.tcp_congestion_ops*, %struct.tcp_fastopen_context*, %struct.spinlock, i32, %struct.atomic_t, i32, i32, i32, i32, i32, i32, i32, i32, %struct.ping_group_range, %struct.atomic_t, i32*, i32, %struct.list_head, %struct.fib_rules_ops*, i32, i32, %struct.fib_notifier_ops*, i32, %struct.fib_notifier_ops*, i32, %struct.atomic_t, %struct.siphash_key_t, [4 x i8] }
%struct.ipv4_devconf = type opaque
%struct.ip_ra_chain = type opaque
%struct.fib_table = type opaque
%struct.inet_peer_base = type opaque
%struct.fqdir = type { i32, i32, i32, i32, %struct.inet_frags*, %struct.net*, i8, [39 x i8], %struct.rhashtable, [28 x i8], %struct.atomic_t, %struct.work_struct, [16 x i8] }
%struct.inet_frags = type { i32, void (%struct.inet_frag_queue*, i8*)*, void (%struct.inet_frag_queue*)*, void (%struct.timer_list*)*, %struct.kmem_cache*, i8*, %struct.rhashtable_params, %struct.refcount_struct, %struct.completion }
%struct.inet_frag_queue = type { %struct.rhash_head, %union.anon.49, %struct.timer_list, %struct.spinlock, %struct.refcount_struct, %struct.rb_root, %struct.sk_buff*, %struct.sk_buff*, i64, i32, i32, i8, i16, %struct.fqdir*, %struct.callback_head }
%struct.rhash_head = type { %struct.rhash_head* }
%union.anon.49 = type { %struct.frag_v6_compare_key }
%struct.frag_v6_compare_key = type { %struct.in6_addr, %struct.in6_addr, i32, i32, i32 }
%struct.in6_addr = type { %union.anon.50 }
%union.anon.50 = type { [4 x i32] }
%struct.kmem_cache = type opaque
%struct.rhashtable_params = type { i16, i16, i16, i16, i32, i16, i8, i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)*, i32 (%struct.rhashtable_compare_arg*, i8*)* }
%struct.rhashtable_compare_arg = type { %struct.rhashtable*, i8* }
%struct.rhashtable = type { %struct.bucket_table*, i32, i32, %struct.rhashtable_params, i8, %struct.work_struct, %struct.mutex, %struct.spinlock, %struct.atomic_t }
%struct.bucket_table = type { i32, i32, i32, %struct.list_head, %struct.callback_head, %struct.bucket_table*, %struct.lockdep_map, [4 x i8], [0 x %struct.rhash_lock_head*] }
%struct.rhash_lock_head = type {}
%struct.xt_table = type opaque
%struct.local_ports = type { %struct.seqlock_t, [2 x i32], i8 }
%struct.inet_timewait_death_row = type { %struct.atomic_t, [60 x i8], %struct.inet_hashinfo*, i32, [56 x i8] }
%struct.inet_hashinfo = type opaque
%struct.tcp_congestion_ops = type opaque
%struct.tcp_fastopen_context = type opaque
%struct.ping_group_range = type { %struct.seqlock_t, [2 x %struct.kgid_t] }
%struct.fib_rules_ops = type opaque
%struct.fib_notifier_ops = type opaque
%struct.siphash_key_t = type { [2 x i64] }
%struct.netns_ipv6 = type { %struct.netns_sysctl_ipv6, %struct.ipv6_devconf*, %struct.ipv6_devconf*, %struct.inet_peer_base*, %struct.fqdir*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.fib6_info*, %struct.rt6_info*, %struct.rt6_statistics*, %struct.timer_list, %struct.hlist_head*, %struct.fib6_table*, %struct.list_head, [36 x i8], %struct.dst_ops, %struct.rwlock_t, %struct.spinlock, i32, i32, i32, i8, i32, %struct.rt6_info*, %struct.rt6_info*, %struct.fib6_table*, %struct.fib_rules_ops*, %struct.sock**, %struct.sock*, %struct.sock*, %struct.sock*, %struct.sock*, %struct.list_head, %struct.fib_rules_ops*, %struct.atomic_t, %struct.atomic_t, %struct.seg6_pernet_data*, %struct.fib_notifier_ops*, %struct.fib_notifier_ops*, i32, %struct.anon.65, [20 x i8] }
%struct.netns_sysctl_ipv6 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x i32], i32*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8 }
%struct.ipv6_devconf = type opaque
%struct.fib6_info = type opaque
%struct.rt6_statistics = type opaque
%struct.dst_ops = type { i16, i32, i32 (%struct.dst_ops*)*, %struct.dst_entry* (%struct.dst_entry*, i32)*, i32 (%struct.dst_entry*)*, i32 (%struct.dst_entry*)*, i32* (%struct.dst_entry*, i32)*, void (%struct.dst_entry*)*, void (%struct.dst_entry*, %struct.net_device*, i32)*, %struct.dst_entry* (%struct.dst_entry*)*, void (%struct.sk_buff*)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*, i32, i1)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*)*, i32 (%struct.net*, %struct.sock*, %struct.sk_buff*)*, %struct.neighbour* (%struct.dst_entry*, %struct.sk_buff*, i8*)*, void (%struct.dst_entry*, i8*)*, %struct.kmem_cache*, [60 x i8], %struct.percpu_counter }
%struct.dst_entry = type opaque
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.rt6_info = type opaque
%struct.fib6_table = type opaque
%struct.seg6_pernet_data = type opaque
%struct.anon.65 = type { %struct.hlist_head, %struct.spinlock, i32 }
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
%struct.bpf_link = type { %struct.atomic64_t, i32, i32, %struct.bpf_link_ops*, %struct.bpf_prog*, %struct.work_struct, [4 x i8] }
%struct.bpf_link_ops = type { void (%struct.bpf_link*)*, void (%struct.bpf_link*)*, i32 (%struct.bpf_link*, %struct.bpf_prog*, %struct.bpf_prog*)*, void (%struct.bpf_link*, %struct.seq_file*)*, i32 (%struct.bpf_link*, %struct.bpf_link_info*)* }
%struct.bpf_link_info = type { i32, i32, i32, [4 x i8], %union.anon.66 }
%union.anon.66 = type { %struct.anon.67 }
%struct.anon.67 = type { i64, i32, [4 x i8] }
%struct.netns_xfrm = type { %struct.list_head, %struct.hlist_head*, %struct.hlist_head*, %struct.hlist_head*, i32, i32, %struct.work_struct, %struct.list_head, %struct.hlist_head*, i32, [3 x %struct.hlist_head], [3 x %struct.xfrm_policy_hash], [6 x i32], %struct.work_struct, %struct.xfrm_policy_hthresh, %struct.list_head, %struct.sock*, %struct.sock*, i32, i32, i32, i32, %struct.ctl_table_header*, [20 x i8], %struct.dst_ops, %struct.dst_ops, %struct.spinlock, %struct.spinlock, %struct.mutex, [12 x i8] }
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
%struct.time_namespace = type opaque
%struct.cgroup_namespace = type { %struct.refcount_struct, %struct.ns_common, %struct.user_namespace*, %struct.ucounts*, %struct.css_set* }
%struct.signal_struct = type { %struct.refcount_struct, %struct.atomic_t, i32, %struct.list_head, %struct.wait_queue_head, %struct.task_struct*, %struct.sigpending, %struct.hlist_head, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, i64, [2 x %struct.cpu_itimer], [4 x i8], %struct.thread_group_cputimer, %struct.posix_cputimers, [4 x %struct.pid*], %struct.pid*, i32, %struct.tty_struct*, %struct.autogroup*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.prev_cputime, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, %struct.tty_audit_buf*, i8, i16, i16, %struct.mm_struct*, %struct.mutex, %struct.mutex, [4 x i8] }
%struct.cpu_itimer = type { i64, i64 }
%struct.thread_group_cputimer = type { %struct.task_cputime_atomic }
%struct.task_cputime_atomic = type { %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t }
%struct.tty_struct = type opaque
%struct.autogroup = type opaque
%struct.rlimit = type { i32, i32 }
%struct.pacct_struct = type { i32, i32, i32, i64, i64, i32, i32 }
%struct.taskstats = type { i16, i32, i8, i8, [6 x i8], i64, i64, i64, i64, i64, i64, i64, i64, [32 x i8], i8, [3 x i8], [4 x i8], i32, i32, i32, i32, i32, [4 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.spinlock, %struct.refcount_struct, %struct.wait_queue_head, [64 x %struct.k_sigaction] }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i32, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [2 x i32] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.kuid_t = type { i32 }
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.spinlock = type { %union.anon }
%union.anon = type { %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.qspinlock, i32, i32, i8*, %struct.lockdep_map }
%struct.wake_q_node = type { %struct.wake_q_node* }
%struct.rb_root_cached = type { %struct.rb_root, %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.mutex_waiter = type { %struct.list_head, %struct.task_struct*, %struct.ww_acquire_ctx*, i8* }
%struct.ww_acquire_ctx = type opaque
%struct.held_lock = type { i64, i32, %struct.lockdep_map*, %struct.lockdep_map*, i64, i64, i32, i32 }
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.backing_dev_info = type opaque
%struct.io_context = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i16, i32, i32, %struct.xarray, %struct.io_cq*, %struct.hlist_head, %struct.work_struct }
%struct.io_cq = type { %struct.request_queue*, %struct.io_context*, %union.anon.90, %union.anon.91, i32 }
%union.anon.90 = type { %struct.list_head }
%union.anon.91 = type { %struct.hlist_node }
%struct.capture_control = type opaque
%struct.kernel_siginfo = type { %struct.anon.92 }
%struct.anon.92 = type { i32, i32, i32, %union.__sifields }
%union.__sifields = type { %struct.anon.96 }
%struct.anon.96 = type { i32, i32, i32, i32, i32 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i32] }
%struct.seqcount = type { i32, %struct.lockdep_map }
%struct.css_set = type { [14 x %struct.cgroup_subsys_state*], %struct.refcount_struct, %struct.css_set*, %struct.cgroup*, i32, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, [14 x %struct.list_head], %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.cgroup*, %struct.cgroup*, %struct.css_set*, i8, %struct.callback_head }
%struct.cgroup_subsys_state = type { %struct.cgroup*, %struct.cgroup_subsys*, %struct.percpu_ref, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i64, %struct.atomic_t, %struct.work_struct, %struct.rcu_work, %struct.cgroup_subsys_state* }
%struct.cgroup_subsys = type { %struct.cgroup_subsys_state* (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*, i32)*, i32 (%struct.seq_file*, %struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void (%struct.cgroup_taskset*)*, void ()*, i32 (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*, %struct.css_set*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.task_struct*)*, void (%struct.cgroup_subsys_state*)*, i8, i32, i8*, i8*, %struct.cgroup_root*, %struct.idr, %struct.list_head, %struct.cftype*, %struct.cftype*, i32 }
%struct.cgroup_taskset = type opaque
%struct.cgroup_root = type { %struct.kernfs_root*, i32, i32, %struct.cgroup, i64, %struct.atomic_t, %struct.list_head, i32, [4096 x i8], [64 x i8] }
%struct.kernfs_root = type { %struct.kernfs_node*, i32, %struct.idr, i32, i32, %struct.kernfs_syscall_ops*, %struct.list_head, %struct.wait_queue_head }
%struct.kernfs_syscall_ops = type { i32 (%struct.seq_file*, %struct.kernfs_root*)*, i32 (%struct.kernfs_node*, i8*, i16)*, i32 (%struct.kernfs_node*)*, i32 (%struct.kernfs_node*, %struct.kernfs_node*, i8*)*, i32 (%struct.seq_file*, %struct.kernfs_node*, %struct.kernfs_root*)* }
%struct.cgroup = type { %struct.cgroup_subsys_state, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.kernfs_node*, %struct.cgroup_file, %struct.cgroup_file, i16, i16, i16, i16, [14 x %struct.cgroup_subsys_state*], %struct.cgroup_root*, %struct.list_head, [14 x %struct.list_head], %struct.cgroup*, %struct.cgroup*, %struct.cgroup_rstat_cpu*, %struct.list_head, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.prev_cputime, %struct.list_head, %struct.mutex, %struct.wait_queue_head, %struct.work_struct, %struct.psi_group, %struct.cgroup_bpf, %struct.atomic_t, %struct.cgroup_freezer_state, [0 x i64] }
%struct.cgroup_file = type { %struct.kernfs_node*, i32, %struct.timer_list }
%struct.cgroup_rstat_cpu = type { %struct.u64_stats_sync, %struct.cgroup_base_stat, %struct.cgroup_base_stat, %struct.cgroup*, %struct.cgroup* }
%struct.cgroup_base_stat = type { %struct.task_cputime }
%struct.task_cputime = type { i64, i64, i64 }
%struct.psi_group = type { %struct.mutex, %struct.psi_group_cpu*, [5 x i64], i64, i64, %struct.delayed_work, [2 x [5 x i64]], [5 x [3 x i32]], %struct.atomic_t, %struct.kthread_worker*, %struct.kthread_delayed_work, %struct.mutex, %struct.list_head, [5 x i32], i32, i64, [5 x i64], i64, i64 }
%struct.psi_group_cpu = type { %struct.seqcount, [4 x i32], i32, [6 x i32], i64, [44 x i8], [2 x [6 x i32]], [16 x i8] }
%struct.kthread_worker = type { i32, %struct.raw_spinlock, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.kthread_work* }
%struct.kthread_work = type { %struct.list_head, void (%struct.kthread_work*)*, %struct.kthread_worker*, i32 }
%struct.kthread_delayed_work = type { %struct.kthread_work, %struct.timer_list }
%struct.cgroup_bpf = type { [34 x %struct.bpf_prog_array*], [34 x %struct.list_head], [34 x i32], %struct.bpf_prog_array*, %struct.percpu_ref, %struct.work_struct }
%struct.bpf_prog_array = type { %struct.callback_head, [0 x %struct.bpf_prog_array_item] }
%struct.bpf_prog_array_item = type { %struct.bpf_prog*, [2 x %struct.bpf_cgroup_storage*] }
%struct.bpf_cgroup_storage = type { %union.anon.89, %struct.bpf_cgroup_storage_map*, %struct.bpf_cgroup_storage_key, %struct.list_head, %struct.rb_node, %struct.callback_head }
%union.anon.89 = type { %struct.bpf_storage_buffer* }
%struct.bpf_storage_buffer = type { %struct.callback_head, [0 x i8] }
%struct.bpf_cgroup_storage_map = type opaque
%struct.bpf_cgroup_storage_key = type { i64, i32 }
%struct.cgroup_freezer_state = type { i8, i32, i32, i32 }
%struct.cftype = type { [64 x i8], i32, i32, i32, i32, %struct.cgroup_subsys*, %struct.list_head, %struct.kernfs_ops*, i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, %struct.lock_class_key }
%struct.percpu_ref = type { %struct.atomic_t, i32, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head }
%struct.rcu_work = type { %struct.work_struct, %struct.callback_head, %struct.workqueue_struct* }
%struct.robust_list_head = type opaque
%struct.futex_pi_state = type opaque
%struct.perf_event_context = type opaque
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.optimistic_spin_queue, %struct.list_head, i8*, %struct.lockdep_map }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.rseq = type { i32, i32, %union.anon.103, i32, [12 x i8] }
%union.anon.103 = type { i64 }
%struct.tlbflush_unmap_batch = type { %struct.arch_tlbflush_unmap_batch, i8, i8 }
%struct.arch_tlbflush_unmap_batch = type { %struct.cpumask }
%union.anon.105 = type { %struct.callback_head }
%struct.pipe_inode_info = type { %struct.mutex, %struct.wait_queue_head, %struct.wait_queue_head, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer*, %struct.user_struct*, %struct.watch_queue* }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i32 }
%struct.pipe_buf_operations = type { i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i1 (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.watch_queue = type opaque
%struct.page_frag = type { %struct.page*, i16, i16 }
%struct.task_delay_info = type opaque
%struct.latency_record = type { [12 x i32], i32, i32, i32 }
%struct.ftrace_ret_stack = type opaque
%struct.atomic_t = type { i32 }
%struct.mem_cgroup = type opaque
%struct.request_queue = type opaque
%struct.uprobe_task = type { i32, %union.anon.106, %struct.uprobe*, i32, %struct.return_instance*, i32 }
%union.anon.106 = type { %struct.anon.107 }
%struct.anon.107 = type { %struct.arch_uprobe_task, i32 }
%struct.arch_uprobe_task = type { i32, i32 }
%struct.uprobe = type opaque
%struct.return_instance = type { %struct.uprobe*, i32, i32, i32, i8, %struct.return_instance* }
%struct.refcount_struct = type { %struct.atomic_t }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.thread_struct = type { [3 x %struct.desc_struct], i32, i32, i32, i32, i32, [4 x %struct.perf_event*], i32, i32, i32, i32, i32, %struct.vm86*, %struct.io_bitmap*, i32, %struct.mm_segment_t, i8, [31 x i8], %struct.fpu }
%struct.desc_struct = type { i16, i16, i32 }
%struct.perf_event = type opaque
%struct.vm86 = type opaque
%struct.io_bitmap = type opaque
%struct.mm_segment_t = type { i32 }
%struct.fpu = type { i32, i32, [56 x i8], %union.fpregs_state }
%union.fpregs_state = type { %struct.xregs_state, [3520 x i8] }
%struct.xregs_state = type { %struct.fxregs_state, %struct.xstate_header, [0 x i8] }
%struct.fxregs_state = type { i16, i16, i16, i16, %union.anon.109, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.112 }
%union.anon.109 = type { %struct.anon.110 }
%struct.anon.110 = type { i64, i64 }
%union.anon.112 = type { [12 x i32] }
%struct.xstate_header = type { i64, i64, [6 x i64] }
%struct.bpf_binary_header = type { i32, [4 x i8], [0 x i8] }
%struct.vm_struct = type { %struct.vm_struct*, i8*, i32, i32, %struct.page**, i32, i32, i8* }

@.str = private unnamed_addr constant [40 x i8] c"\013bpf_jit: proglen=%d != oldproglen=%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"arch/x86/net/bpf_jit_comp32.c\00", align 1
@bpf_jit_enable = external dso_local local_unnamed_addr global i32, align 4
@bpf2ia32 = internal unnamed_addr constant [13 x [2 x i8]] [[2 x i8] c"\00\04", [2 x i8] c"\08\0C", [2 x i8] c"\10\14", [2 x i8] c"\18\1C", [2 x i8] c" $", [2 x i8] c"(,", [2 x i8] c"04", [2 x i8] c"8<", [2 x i8] c"@D", [2 x i8] c"HL", [2 x i8] c"PT", [2 x i8] c"\06\07", [2 x i8] c"X\\"], align 1
@.str.3 = private unnamed_addr constant [44 x i8] c"\013unsupported BPF func %d addr %p image %p\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"\013cond_jmp gen bug %llx\0A\00", align 1
@do_jit.__print_once = internal unnamed_addr global i1 false, section ".data.once", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\016*** NOT YET: opcode %02x ***\0A\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"\013bpf_jit: unknown opcode %02x\0A\00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"\013bpf_jit: fatal insn size error\0A\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"\013bpf_jit: fatal error\0A\00", align 1
@emit_bpf_tail_call.jmp_label1 = internal unnamed_addr global i1 false, align 4
@.str.10 = private unnamed_addr constant [55 x i8] c"\013flen=%u proglen=%u pass=%u image=%pK from=%s pid=%d\0A\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"\013\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"JIT code: \00", align 1
@current_task = external dso_local global %struct.task_struct*, section ".data..percpu", align 4
@switch.table.bpf_int_jit_compile = private unnamed_addr constant [13 x i32] [i32 116, i32 119, i32 115, i32 117, i32 117, i32 127, i32 125, i32 116, i32 116, i32 114, i32 118, i32 124, i32 126], align 4
@switch.table.bpf_int_jit_compile.13 = private unnamed_addr constant [13 x i16] [i16 -31729, i16 -30961, i16 -31985, i16 -31473, i16 -31473, i16 -30961, i16 -31985, i16 -31729, i16 -31729, i16 -32241, i16 -31217, i16 -32241, i16 -31217], align 2
@switch.table.bpf_int_jit_compile.14 = private unnamed_addr constant [13 x i16] [i16 -31729, i16 -30961, i16 -31985, i16 -31473, i16 -31473, i16 -28913, i16 -29425, i16 -31729, i16 -31729, i16 -32241, i16 -31217, i16 -29681, i16 -29169], align 2
@switch.table.bpf_int_jit_compile.15 = private unnamed_addr constant [11 x i16] [i16 1, i16 41, i16 1, i16 1, i16 9, i16 33, i16 1, i16 1, i16 1, i16 1, i16 49], align 2
@switch.table.bpf_int_jit_compile.16 = private unnamed_addr constant [11 x i16] [i16 17, i16 25, i16 17, i16 17, i16 9, i16 33, i16 17, i16 17, i16 17, i16 17, i16 49], align 2

; Function Attrs: noimplicitfloat norecurse nounwind readnone sspstrong
define dso_local zeroext i1 @bpf_jit_needs_zext() local_unnamed_addr #0 {
  ret i1 true
}

; Function Attrs: noimplicitfloat nounwind sspstrong
define dso_local %struct.bpf_prog* @bpf_int_jit_compile(%struct.bpf_prog* inreg %0) local_unnamed_addr #1 {
  %2 = alloca i8*, align 4
  %3 = alloca [192 x i8], align 1
  %4 = alloca i8*, align 4
  %5 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #8
  store i8* null, i8** %4, align 4
  %6 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %0, i32 0, i32 1
  %7 = load i16, i16* %6, align 2
  %8 = and i16 %7, 2
  %9 = icmp eq i16 %8, 0
  br i1 %9, label %3249, label %10

10:                                               ; preds = %1
  %11 = call %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog* inreg %0) #9
  %12 = icmp ugt %struct.bpf_prog* %11, inttoptr (i32 -4096 to %struct.bpf_prog*)
  br i1 %12, label %3249, label %13

13:                                               ; preds = %10
  %14 = icmp eq %struct.bpf_prog* %11, %0
  %15 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %11, i32 0, i32 4
  %16 = load i32, i32* %15, align 4
  %17 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %16, i32 4) #8
  %18 = extractvalue { i32, i1 } %17, 1
  br i1 %18, label %3244, label %19, !prof !3, !misexpect !4

19:                                               ; preds = %13
  %20 = extractvalue { i32, i1 } %17, 0
  %21 = call noalias i8* @__kmalloc(i32 inreg %20, i32 inreg 3264) #9
  %22 = ptrtoint i8* %21 to i32
  %23 = and i32 %22, 7
  %24 = icmp eq i32 %23, 0
  call void @llvm.assume(i1 %24) #8
  %25 = bitcast i8* %21 to i32*
  %26 = icmp eq i8* %21, null
  br i1 %26, label %3244, label %27

27:                                               ; preds = %19
  %28 = load i32, i32* %15, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %67

30:                                               ; preds = %67, %27
  %31 = phi i32 [ 0, %27 ], [ %73, %67 ]
  %32 = phi i32 [ 0, %27 ], [ %70, %67 ]
  %33 = load i8*, i8** %4, align 4
  %34 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 0
  %35 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 12
  %36 = ptrtoint [192 x i8]* %3 to i32
  %37 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %11, i32 0, i32 7
  %38 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 1
  %39 = bitcast i8* %38 to i16*
  %40 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 3
  %41 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 4
  %42 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 5
  %43 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 6
  %44 = bitcast i8* %43 to i16*
  %45 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 8
  %46 = bitcast i8* %45 to i32*
  %47 = bitcast i8* %35 to i32*
  %48 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 15
  %49 = bitcast i8* %48 to i16*
  %50 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 17
  %51 = bitcast i8* %50 to i32*
  %52 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 20
  %53 = bitcast i8* %52 to i32*
  %54 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 23
  %55 = bitcast i8* %54 to i32*
  %56 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 26
  %57 = bitcast i8* %56 to i32*
  %58 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 29
  %59 = bitcast i8* %58 to i32*
  %60 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 32
  %61 = bitcast i8* %60 to i32*
  %62 = getelementptr inbounds [192 x i8], [192 x i8]* %3, i32 0, i32 35
  %63 = ptrtoint i8* %62 to i32
  %64 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %11, i32 0, i32 11, i32 0
  %65 = bitcast i8** %2 to i8*
  %66 = bitcast i8** %2 to i32*
  br label %75

67:                                               ; preds = %27, %67
  %68 = phi i32 [ %72, %67 ], [ 0, %27 ]
  %69 = phi i32 [ %70, %67 ], [ 0, %27 ]
  %70 = add i32 %69, 64
  %71 = getelementptr i32, i32* %25, i32 %68
  store i32 %70, i32* %71, align 4
  %72 = add nuw i32 %68, 1
  %73 = load i32, i32* %15, align 4
  %74 = icmp ult i32 %72, %73
  br i1 %74, label %67, label %30

75:                                               ; preds = %3198, %30
  %76 = phi i32 [ %31, %30 ], [ %3199, %3198 ]
  %77 = phi i8* [ %33, %30 ], [ %3195, %3198 ]
  %78 = phi i32 [ 0, %30 ], [ %3193, %3198 ]
  %79 = phi i32 [ 0, %30 ], [ %3160, %3198 ]
  %80 = phi %struct.bpf_binary_header* [ null, %30 ], [ %3191, %3198 ]
  %81 = phi i32 [ %32, %30 ], [ %3150, %3198 ]
  call void @llvm.lifetime.start.p0i8(i64 192, i8* nonnull %34) #8
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(192) %35, i8 -1, i32 180, i1 false) #8
  %82 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %83 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %82, i32 0, i32 5
  %84 = load i32, i32* %83, align 8
  store i8 85, i8* %34, align 1
  store i16 -6775, i16* %39, align 2
  store i8 87, i8* %40, align 1
  store i8 86, i8* %41, align 1
  store i8 83, i8* %42, align 1
  store i16 -4991, i16* %44, align 2
  %85 = add i32 %84, 103
  %86 = and i32 %85, -8
  store i32 %86, i32* %46, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i32 7138691, i32* %47, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i16 -9423, i16* %49, align 2
  store i32 5270921, i32* %51, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i32 5528969, i32* %53, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i32 542089, i32* %55, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i32 810377, i32* %57, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i32 5791113, i32* %59, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  store i32 6053257, i32* %61, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %87 = icmp sgt i32 %76, 0
  br i1 %87, label %88, label %3173

88:                                               ; preds = %75
  %89 = icmp eq i8* %77, null
  br label %90

90:                                               ; preds = %3168, %88
  %91 = phi i32 [ %81, %88 ], [ %3150, %3168 ]
  %92 = phi i8* [ %62, %88 ], [ %34, %3168 ]
  %93 = phi %struct.bpf_insn* [ %64, %88 ], [ %3171, %3168 ]
  %94 = phi i8 [ 0, %88 ], [ %3153, %3168 ]
  %95 = phi i32 [ 0, %88 ], [ %3160, %3168 ]
  %96 = phi i32 [ 0, %88 ], [ %3170, %3168 ]
  %97 = phi i32 [ %63, %88 ], [ %36, %3168 ]
  %98 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 3
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 0
  %101 = load i8, i8* %100, align 4
  %102 = zext i8 %101 to i32
  %103 = and i32 %102, 7
  %104 = icmp eq i32 %103, 7
  %105 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 1
  %106 = load i8, i8* %105, align 1
  %107 = and i8 %106, 15
  %108 = zext i8 %107 to i32
  %109 = icmp ne i8 %107, 11
  %110 = lshr i8 %106, 4
  %111 = zext i8 %110 to i32
  %112 = icmp ne i8 %110, 11
  %113 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 0
  %114 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 0
  switch i8 %101, label %3146 [
    i8 -76, label %115
    i8 -68, label %115
    i8 -73, label %115
    i8 -65, label %115
    i8 4, label %325
    i8 12, label %325
    i8 20, label %325
    i8 28, label %325
    i8 68, label %325
    i8 76, label %325
    i8 84, label %325
    i8 92, label %325
    i8 -92, label %325
    i8 -84, label %325
    i8 7, label %325
    i8 15, label %325
    i8 23, label %325
    i8 31, label %325
    i8 71, label %325
    i8 79, label %325
    i8 87, label %325
    i8 95, label %325
    i8 -89, label %325
    i8 -81, label %325
    i8 36, label %498
    i8 44, label %498
    i8 108, label %606
    i8 124, label %606
    i8 -60, label %606
    i8 -52, label %606
    i8 52, label %730
    i8 60, label %730
    i8 -108, label %730
    i8 -100, label %730
    i8 55, label %3141
    i8 63, label %3141
    i8 -105, label %3141
    i8 -97, label %3141
    i8 116, label %885
    i8 100, label %885
    i8 103, label %952
    i8 119, label %1064
    i8 111, label %1176
    i8 127, label %1266
    i8 -49, label %1356
    i8 -57, label %1443
    i8 -124, label %1546
    i8 -121, label %1605
    i8 47, label %1669
    i8 39, label %1669
    i8 -44, label %1884
    i8 -36, label %1974
    i8 24, label %2096
    i8 106, label %2183
    i8 114, label %2183
    i8 98, label %2183
    i8 122, label %2183
    i8 115, label %2252
    i8 107, label %2252
    i8 99, label %2252
    i8 123, label %2252
    i8 113, label %2350
    i8 105, label %2350
    i8 97, label %2350
    i8 121, label %2350
    i8 -123, label %2464
    i8 -11, label %2522
    i8 29, label %2588
    i8 93, label %2588
    i8 45, label %2588
    i8 -83, label %2588
    i8 61, label %2588
    i8 -67, label %2588
    i8 30, label %2588
    i8 94, label %2588
    i8 46, label %2588
    i8 -82, label %2588
    i8 62, label %2588
    i8 -66, label %2588
    i8 110, label %2588
    i8 -34, label %2588
    i8 -50, label %2588
    i8 126, label %2588
    i8 109, label %2664
    i8 -35, label %2664
    i8 -51, label %2664
    i8 125, label %2664
    i8 77, label %2732
    i8 78, label %2732
    i8 69, label %2824
    i8 70, label %2824
    i8 21, label %2879
    i8 85, label %2879
    i8 37, label %2879
    i8 -91, label %2879
    i8 53, label %2879
    i8 -75, label %2879
    i8 22, label %2879
    i8 86, label %2879
    i8 38, label %2879
    i8 -90, label %2879
    i8 54, label %2879
    i8 -74, label %2879
    i8 102, label %2879
    i8 -42, label %2879
    i8 -58, label %2879
    i8 118, label %2879
    i8 101, label %2974
    i8 -43, label %2974
    i8 -59, label %2974
    i8 117, label %2974
    i8 5, label %3085
    i8 -61, label %3141
    i8 -37, label %3141
    i8 -107, label %3117
  ]

115:                                              ; preds = %90, %90, %90, %90
  %116 = and i32 %102, 8
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %241, label %118

118:                                              ; preds = %115
  %119 = icmp eq i32 %99, 1
  br i1 %119, label %120, label %143

120:                                              ; preds = %118
  %121 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %122 = load i8, i8* %121, align 1
  %123 = inttoptr i32 %97 to i8*
  br i1 %109, label %124, label %131

124:                                              ; preds = %120
  %125 = inttoptr i32 %97 to i16*
  store i16 -16333, i16* %125, align 2
  %126 = getelementptr i8, i8* %123, i32 2
  %127 = zext i8 %122 to i32
  %128 = shl nuw nsw i32 %127, 16
  %129 = or i32 %128, 17801
  %130 = bitcast i8* %126 to i32*
  store i32 %129, i32* %130, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %139

131:                                              ; preds = %120
  %132 = add i8 %122, -64
  %133 = shl i8 %122, 3
  %134 = add i8 %132, %133
  %135 = zext i8 %134 to i16
  %136 = shl nuw i16 %135, 8
  %137 = or i16 %136, 51
  %138 = inttoptr i32 %97 to i16*
  store i16 %137, i16* %138, align 2
  br label %139

139:                                              ; preds = %131, %124
  %140 = phi i32 [ 2, %131 ], [ 5, %124 ]
  %141 = getelementptr i8, i8* %123, i32 %140
  %142 = ptrtoint i8* %141 to i32
  br label %3149

143:                                              ; preds = %118
  %144 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %145 = load i8, i8* %113, align 1
  %146 = load i8, i8* %114, align 1
  %147 = inttoptr i32 %97 to i8*
  %148 = select i1 %112, i8 0, i8 %146
  br i1 %112, label %149, label %155

149:                                              ; preds = %143
  %150 = zext i8 %146 to i32
  %151 = shl nuw nsw i32 %150, 16
  %152 = or i32 %151, 17803
  %153 = inttoptr i32 %97 to i32*
  store i32 %152, i32* %153, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %154 = getelementptr i8, i8* %147, i32 3
  br label %155

155:                                              ; preds = %149, %143
  %156 = phi i8* [ %154, %149 ], [ %147, %143 ]
  br i1 %109, label %157, label %167

157:                                              ; preds = %155
  %158 = shl i8 %148, 3
  %159 = add i8 %158, 69
  %160 = zext i8 %159 to i32
  %161 = shl nuw nsw i32 %160, 8
  %162 = zext i8 %145 to i32
  %163 = shl nuw nsw i32 %162, 16
  %164 = or i32 %163, %161
  %165 = or i32 %164, 137
  %166 = bitcast i8* %156 to i32*
  store i32 %165, i32* %166, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %175

167:                                              ; preds = %155
  %168 = add i8 %145, -64
  %169 = shl i8 %148, 3
  %170 = add i8 %168, %169
  %171 = zext i8 %170 to i16
  %172 = shl nuw i16 %171, 8
  %173 = or i16 %172, 137
  %174 = bitcast i8* %156 to i16*
  store i16 %173, i16* %174, align 2
  br label %175

175:                                              ; preds = %167, %157
  %176 = phi i32 [ 2, %167 ], [ 3, %157 ]
  %177 = getelementptr i8, i8* %156, i32 %176
  br i1 %104, label %178, label %214

178:                                              ; preds = %175
  %179 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %180 = load i8, i8* %179, align 1
  %181 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %182 = load i8, i8* %181, align 1
  %183 = select i1 %112, i8 0, i8 %182
  br i1 %112, label %184, label %190

184:                                              ; preds = %178
  %185 = zext i8 %182 to i32
  %186 = shl nuw nsw i32 %185, 16
  %187 = or i32 %186, 17803
  %188 = bitcast i8* %177 to i32*
  store i32 %187, i32* %188, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %189 = getelementptr i8, i8* %177, i32 3
  br label %190

190:                                              ; preds = %184, %178
  %191 = phi i8* [ %189, %184 ], [ %177, %178 ]
  br i1 %109, label %192, label %202

192:                                              ; preds = %190
  %193 = shl i8 %183, 3
  %194 = add i8 %193, 69
  %195 = zext i8 %194 to i32
  %196 = shl nuw nsw i32 %195, 8
  %197 = zext i8 %180 to i32
  %198 = shl nuw nsw i32 %197, 16
  %199 = or i32 %198, %196
  %200 = or i32 %199, 137
  %201 = bitcast i8* %191 to i32*
  store i32 %200, i32* %201, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %210

202:                                              ; preds = %190
  %203 = add i8 %180, -64
  %204 = shl i8 %183, 3
  %205 = add i8 %203, %204
  %206 = zext i8 %205 to i16
  %207 = shl nuw i16 %206, 8
  %208 = or i16 %207, 137
  %209 = bitcast i8* %191 to i16*
  store i16 %208, i16* %209, align 2
  br label %210

210:                                              ; preds = %202, %192
  %211 = phi i32 [ 2, %202 ], [ 3, %192 ]
  %212 = getelementptr i8, i8* %191, i32 %211
  %213 = ptrtoint i8* %212 to i32
  br label %3149

214:                                              ; preds = %175
  %215 = ptrtoint i8* %177 to i32
  %216 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %144, i32 0, i32 13
  %217 = load i8, i8* %216, align 8, !range !6
  %218 = icmp eq i8 %217, 0
  br i1 %218, label %219, label %3149

219:                                              ; preds = %214
  %220 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %221 = load i8, i8* %220, align 1
  br i1 %109, label %222, label %229

222:                                              ; preds = %219
  %223 = bitcast i8* %177 to i16*
  store i16 -16333, i16* %223, align 2
  %224 = getelementptr i8, i8* %177, i32 2
  %225 = zext i8 %221 to i32
  %226 = shl nuw nsw i32 %225, 16
  %227 = or i32 %226, 17801
  %228 = bitcast i8* %224 to i32*
  store i32 %227, i32* %228, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %237

229:                                              ; preds = %219
  %230 = add i8 %221, -64
  %231 = shl i8 %221, 3
  %232 = add i8 %230, %231
  %233 = zext i8 %232 to i16
  %234 = shl nuw i16 %233, 8
  %235 = or i16 %234, 51
  %236 = bitcast i8* %177 to i16*
  store i16 %235, i16* %236, align 2
  br label %237

237:                                              ; preds = %229, %222
  %238 = phi i32 [ 2, %229 ], [ 5, %222 ]
  %239 = getelementptr i8, i8* %177, i32 %238
  %240 = ptrtoint i8* %239 to i32
  br label %3149

241:                                              ; preds = %115
  %242 = icmp slt i32 %99, 0
  %243 = and i1 %242, %104
  %244 = sext i1 %243 to i32
  %245 = load i8, i8* %113, align 1
  %246 = inttoptr i32 %97 to i8*
  %247 = icmp eq i32 %99, 0
  br i1 %109, label %248, label %263

248:                                              ; preds = %241
  br i1 %247, label %249, label %256

249:                                              ; preds = %248
  %250 = inttoptr i32 %97 to i16*
  store i16 -16333, i16* %250, align 2
  %251 = getelementptr i8, i8* %246, i32 2
  %252 = zext i8 %245 to i32
  %253 = shl nuw nsw i32 %252, 16
  %254 = or i32 %253, 17801
  %255 = bitcast i8* %251 to i32*
  store i32 %254, i32* %255, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %279

256:                                              ; preds = %248
  %257 = zext i8 %245 to i32
  %258 = shl nuw nsw i32 %257, 16
  %259 = or i32 %258, 17863
  %260 = inttoptr i32 %97 to i32*
  store i32 %259, i32* %260, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %261 = getelementptr i8, i8* %246, i32 3
  %262 = bitcast i8* %261 to i32*
  store i32 %99, i32* %262, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %279

263:                                              ; preds = %241
  %264 = add i8 %245, -64
  br i1 %247, label %265, label %272

265:                                              ; preds = %263
  %266 = shl i8 %245, 3
  %267 = add i8 %264, %266
  %268 = zext i8 %267 to i16
  %269 = shl nuw i16 %268, 8
  %270 = or i16 %269, 51
  %271 = inttoptr i32 %97 to i16*
  store i16 %270, i16* %271, align 2
  br label %300

272:                                              ; preds = %263
  %273 = zext i8 %264 to i16
  %274 = shl nuw i16 %273, 8
  %275 = or i16 %274, 199
  %276 = inttoptr i32 %97 to i16*
  store i16 %275, i16* %276, align 2
  %277 = getelementptr i8, i8* %246, i32 2
  %278 = bitcast i8* %277 to i32*
  store i32 %99, i32* %278, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %300

279:                                              ; preds = %256, %249
  %280 = phi i32 [ 7, %256 ], [ 5, %249 ]
  %281 = getelementptr i8, i8* %246, i32 %280
  %282 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %283 = load i8, i8* %282, align 1
  br i1 %243, label %292, label %284

284:                                              ; preds = %279
  %285 = bitcast i8* %281 to i16*
  store i16 -16333, i16* %285, align 2
  %286 = getelementptr i8, i8* %281, i32 2
  %287 = zext i8 %283 to i32
  %288 = shl nuw nsw i32 %287, 16
  %289 = or i32 %288, 17801
  %290 = bitcast i8* %286 to i32*
  store i32 %289, i32* %290, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %291 = getelementptr i8, i8* %281, i32 5
  br label %322

292:                                              ; preds = %279
  %293 = zext i8 %283 to i32
  %294 = shl nuw nsw i32 %293, 16
  %295 = or i32 %294, 17863
  %296 = bitcast i8* %281 to i32*
  store i32 %295, i32* %296, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %297 = getelementptr i8, i8* %281, i32 3
  %298 = bitcast i8* %297 to i32*
  store i32 %244, i32* %298, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %299 = getelementptr i8, i8* %281, i32 7
  br label %322

300:                                              ; preds = %272, %265
  %301 = phi i32 [ 6, %272 ], [ 2, %265 ]
  %302 = getelementptr i8, i8* %246, i32 %301
  %303 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %304 = load i8, i8* %303, align 1
  %305 = add i8 %304, -64
  br i1 %243, label %314, label %306

306:                                              ; preds = %300
  %307 = shl i8 %304, 3
  %308 = add i8 %305, %307
  %309 = zext i8 %308 to i16
  %310 = shl nuw i16 %309, 8
  %311 = or i16 %310, 51
  %312 = bitcast i8* %302 to i16*
  store i16 %311, i16* %312, align 2
  %313 = getelementptr i8, i8* %302, i32 2
  br label %322

314:                                              ; preds = %300
  %315 = zext i8 %305 to i16
  %316 = shl nuw i16 %315, 8
  %317 = or i16 %316, 199
  %318 = bitcast i8* %302 to i16*
  store i16 %317, i16* %318, align 2
  %319 = getelementptr i8, i8* %302, i32 2
  %320 = bitcast i8* %319 to i32*
  store i32 %244, i32* %320, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %321 = getelementptr i8, i8* %302, i32 6
  br label %322

322:                                              ; preds = %314, %306, %292, %284
  %323 = phi i8* [ %291, %284 ], [ %299, %292 ], [ %313, %306 ], [ %321, %314 ]
  %324 = ptrtoint i8* %323 to i32
  br label %3149

325:                                              ; preds = %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90
  %326 = and i32 %102, 8
  %327 = icmp eq i32 %326, 0
  %328 = and i8 %101, -16
  %329 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  br i1 %327, label %464, label %330

330:                                              ; preds = %325
  %331 = inttoptr i32 %97 to i8*
  %332 = load i8, i8* %113, align 1
  %333 = load i8, i8* %114, align 1
  %334 = zext i8 %332 to i32
  %335 = select i1 %109, i8 2, i8 %332
  br i1 %112, label %336, label %342

336:                                              ; preds = %330
  %337 = zext i8 %333 to i32
  %338 = shl nuw nsw i32 %337, 16
  %339 = or i32 %338, 17803
  %340 = inttoptr i32 %97 to i32*
  store i32 %339, i32* %340, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %341 = getelementptr i8, i8* %331, i32 3
  br label %342

342:                                              ; preds = %336, %330
  %343 = phi i8* [ %341, %336 ], [ %331, %330 ]
  br i1 %109, label %344, label %349

344:                                              ; preds = %342
  %345 = shl nuw nsw i32 %334, 16
  %346 = or i32 %345, 21899
  %347 = bitcast i8* %343 to i32*
  store i32 %346, i32* %347, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %348 = getelementptr i8, i8* %343, i32 3
  br label %349

349:                                              ; preds = %344, %342
  %350 = phi i8* [ %348, %344 ], [ %343, %342 ]
  %351 = lshr i8 %101, 4
  %352 = zext i8 %351 to i32
  %353 = icmp ult i8 %101, -80
  br i1 %353, label %354, label %371

354:                                              ; preds = %349
  %355 = zext i8 %351 to i16
  %356 = lshr i16 1075, %355
  %357 = and i16 %356, 1
  %358 = icmp eq i16 %357, 0
  br i1 %358, label %371, label %359

359:                                              ; preds = %354
  %360 = getelementptr inbounds [11 x i16], [11 x i16]* @switch.table.bpf_int_jit_compile.15, i32 0, i32 %352
  %361 = load i16, i16* %360, align 2
  %362 = add i8 %335, -64
  %363 = shl i8 %333, 3
  %364 = select i1 %112, i8 0, i8 %363
  %365 = add i8 %362, %364
  %366 = zext i8 %365 to i16
  %367 = shl nuw i16 %366, 8
  %368 = or i16 %367, %361
  %369 = bitcast i8* %350 to i16*
  store i16 %368, i16* %369, align 2
  %370 = getelementptr i8, i8* %350, i32 2
  br label %371

371:                                              ; preds = %354, %349, %359
  %372 = phi i8* [ %350, %349 ], [ %370, %359 ], [ %350, %354 ]
  br i1 %109, label %373, label %383

373:                                              ; preds = %371
  %374 = shl i8 %335, 3
  %375 = add i8 %374, 69
  %376 = zext i8 %375 to i32
  %377 = shl nuw nsw i32 %376, 8
  %378 = shl nuw nsw i32 %334, 16
  %379 = or i32 %378, %377
  %380 = or i32 %379, 137
  %381 = bitcast i8* %372 to i32*
  store i32 %380, i32* %381, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %382 = getelementptr i8, i8* %372, i32 3
  br label %383

383:                                              ; preds = %373, %371
  %384 = phi i8* [ %382, %373 ], [ %372, %371 ]
  br i1 %104, label %385, label %437

385:                                              ; preds = %383
  %386 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %387 = load i8, i8* %386, align 1
  %388 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %389 = load i8, i8* %388, align 1
  %390 = zext i8 %387 to i32
  %391 = select i1 %109, i8 2, i8 %387
  br i1 %112, label %392, label %398

392:                                              ; preds = %385
  %393 = zext i8 %389 to i32
  %394 = shl nuw nsw i32 %393, 16
  %395 = or i32 %394, 17803
  %396 = bitcast i8* %384 to i32*
  store i32 %395, i32* %396, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %397 = getelementptr i8, i8* %384, i32 3
  br label %398

398:                                              ; preds = %392, %385
  %399 = phi i8* [ %397, %392 ], [ %384, %385 ]
  br i1 %109, label %400, label %405

400:                                              ; preds = %398
  %401 = shl nuw nsw i32 %390, 16
  %402 = or i32 %401, 21899
  %403 = bitcast i8* %399 to i32*
  store i32 %402, i32* %403, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %404 = getelementptr i8, i8* %399, i32 3
  br label %405

405:                                              ; preds = %400, %398
  %406 = phi i8* [ %404, %400 ], [ %399, %398 ]
  %407 = icmp ult i8 %101, -80
  br i1 %407, label %408, label %425

408:                                              ; preds = %405
  %409 = zext i8 %351 to i16
  %410 = lshr i16 1075, %409
  %411 = and i16 %410, 1
  %412 = icmp eq i16 %411, 0
  br i1 %412, label %425, label %413

413:                                              ; preds = %408
  %414 = getelementptr inbounds [11 x i16], [11 x i16]* @switch.table.bpf_int_jit_compile.16, i32 0, i32 %352
  %415 = load i16, i16* %414, align 2
  %416 = add i8 %391, -64
  %417 = shl i8 %389, 3
  %418 = select i1 %112, i8 0, i8 %417
  %419 = add i8 %416, %418
  %420 = zext i8 %419 to i16
  %421 = shl nuw i16 %420, 8
  %422 = or i16 %421, %415
  %423 = bitcast i8* %406 to i16*
  store i16 %422, i16* %423, align 2
  %424 = getelementptr i8, i8* %406, i32 2
  br label %425

425:                                              ; preds = %408, %405, %413
  %426 = phi i8* [ %406, %405 ], [ %424, %413 ], [ %406, %408 ]
  br i1 %109, label %427, label %461

427:                                              ; preds = %425
  %428 = shl i8 %391, 3
  %429 = add i8 %428, 69
  %430 = zext i8 %429 to i32
  %431 = shl nuw nsw i32 %430, 8
  %432 = shl nuw nsw i32 %390, 16
  %433 = or i32 %432, %431
  %434 = or i32 %433, 137
  %435 = bitcast i8* %426 to i32*
  store i32 %434, i32* %435, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %436 = getelementptr i8, i8* %426, i32 3
  br label %461

437:                                              ; preds = %383
  %438 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %329, i32 0, i32 13
  %439 = load i8, i8* %438, align 8, !range !6
  %440 = icmp eq i8 %439, 0
  br i1 %440, label %441, label %461

441:                                              ; preds = %437
  %442 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %443 = load i8, i8* %442, align 1
  br i1 %109, label %444, label %452

444:                                              ; preds = %441
  %445 = bitcast i8* %384 to i16*
  store i16 -16333, i16* %445, align 2
  %446 = getelementptr i8, i8* %384, i32 2
  %447 = zext i8 %443 to i32
  %448 = shl nuw nsw i32 %447, 16
  %449 = or i32 %448, 17801
  %450 = bitcast i8* %446 to i32*
  store i32 %449, i32* %450, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %451 = getelementptr i8, i8* %384, i32 5
  br label %461

452:                                              ; preds = %441
  %453 = add i8 %443, -64
  %454 = shl i8 %443, 3
  %455 = add i8 %453, %454
  %456 = zext i8 %455 to i16
  %457 = shl nuw i16 %456, 8
  %458 = or i16 %457, 51
  %459 = bitcast i8* %384 to i16*
  store i16 %458, i16* %459, align 2
  %460 = getelementptr i8, i8* %384, i32 2
  br label %461

461:                                              ; preds = %452, %444, %437, %427, %425
  %462 = phi i8* [ %384, %437 ], [ %436, %427 ], [ %426, %425 ], [ %451, %444 ], [ %460, %452 ]
  %463 = ptrtoint i8* %462 to i32
  br label %3149

464:                                              ; preds = %325
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %65) #8
  store i32 %97, i32* %66, align 4
  %465 = load i8, i8* %113, align 1
  call fastcc void @emit_ia32_alu_i(i1 inreg zeroext %104, i1 inreg zeroext false, i8 inreg zeroext %328, i8 zeroext %465, i32 %99, i1 zeroext %109, i8** nonnull %2) #9
  br i1 %104, label %466, label %470

466:                                              ; preds = %464
  %467 = ashr i32 %99, 31
  %468 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %469 = load i8, i8* %468, align 1
  call fastcc void @emit_ia32_alu_i(i1 inreg zeroext true, i1 inreg zeroext true, i8 inreg zeroext %328, i8 zeroext %469, i32 %467, i1 zeroext %109, i8** nonnull %2) #9
  br label %496

470:                                              ; preds = %464
  %471 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %329, i32 0, i32 13
  %472 = load i8, i8* %471, align 8, !range !6
  %473 = icmp eq i8 %472, 0
  br i1 %473, label %474, label %496

474:                                              ; preds = %470
  %475 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %476 = load i8, i8* %475, align 1
  %477 = load i8*, i8** %2, align 4
  br i1 %109, label %478, label %485

478:                                              ; preds = %474
  %479 = bitcast i8* %477 to i16*
  store i16 -16333, i16* %479, align 2
  %480 = getelementptr i8, i8* %477, i32 2
  %481 = zext i8 %476 to i32
  %482 = shl nuw nsw i32 %481, 16
  %483 = or i32 %482, 17801
  %484 = bitcast i8* %480 to i32*
  store i32 %483, i32* %484, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %493

485:                                              ; preds = %474
  %486 = add i8 %476, -64
  %487 = shl i8 %476, 3
  %488 = add i8 %486, %487
  %489 = zext i8 %488 to i16
  %490 = shl nuw i16 %489, 8
  %491 = or i16 %490, 51
  %492 = bitcast i8* %477 to i16*
  store i16 %491, i16* %492, align 2
  br label %493

493:                                              ; preds = %485, %478
  %494 = phi i32 [ 2, %485 ], [ 5, %478 ]
  %495 = getelementptr i8, i8* %477, i32 %494
  store i8* %495, i8** %2, align 4
  br label %496

496:                                              ; preds = %493, %470, %466
  %497 = load i32, i32* %66, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %65) #8
  br label %3149

498:                                              ; preds = %90, %90
  %499 = and i32 %102, 8
  %500 = icmp eq i32 %499, 0
  br i1 %500, label %547, label %501

501:                                              ; preds = %498
  %502 = load i8, i8* %113, align 1
  %503 = load i8, i8* %114, align 1
  %504 = inttoptr i32 %97 to i8*
  br i1 %112, label %505, label %511

505:                                              ; preds = %501
  %506 = zext i8 %503 to i32
  %507 = shl nuw nsw i32 %506, 16
  %508 = or i32 %507, 19851
  %509 = inttoptr i32 %97 to i32*
  store i32 %508, i32* %509, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %510 = getelementptr i8, i8* %504, i32 3
  br label %511

511:                                              ; preds = %505, %501
  %512 = phi i8* [ %510, %505 ], [ %504, %501 ]
  br i1 %109, label %513, label %518

513:                                              ; preds = %511
  %514 = zext i8 %502 to i32
  %515 = shl nuw nsw i32 %514, 16
  %516 = or i32 %515, 17803
  %517 = bitcast i8* %512 to i32*
  store i32 %516, i32* %517, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %524

518:                                              ; preds = %511
  %519 = add i8 %502, -64
  %520 = zext i8 %519 to i16
  %521 = shl nuw i16 %520, 8
  %522 = or i16 %521, 139
  %523 = bitcast i8* %512 to i16*
  store i16 %522, i16* %523, align 2
  br label %524

524:                                              ; preds = %518, %513
  %525 = phi i32 [ 2, %518 ], [ 3, %513 ]
  %526 = getelementptr i8, i8* %512, i32 %525
  %527 = add i8 %503, -32
  %528 = zext i8 %527 to i16
  %529 = shl nuw i16 %528, 8
  %530 = or i16 %529, 247
  %531 = select i1 %112, i16 -7689, i16 %530
  %532 = bitcast i8* %526 to i16*
  store i16 %531, i16* %532, align 2
  %533 = getelementptr i8, i8* %526, i32 2
  br i1 %109, label %534, label %540

534:                                              ; preds = %524
  %535 = zext i8 %502 to i32
  %536 = shl nuw nsw i32 %535, 16
  %537 = or i32 %536, 17801
  %538 = bitcast i8* %533 to i32*
  store i32 %537, i32* %538, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %539 = getelementptr i8, i8* %526, i32 5
  br label %577

540:                                              ; preds = %524
  %541 = add i8 %502, -64
  %542 = zext i8 %541 to i16
  %543 = shl nuw i16 %542, 8
  %544 = or i16 %543, 137
  %545 = bitcast i8* %533 to i16*
  store i16 %544, i16* %545, align 2
  %546 = getelementptr i8, i8* %526, i32 4
  br label %577

547:                                              ; preds = %498
  %548 = inttoptr i32 %97 to i8*
  %549 = inttoptr i32 %97 to i16*
  store i16 -15929, i16* %549, align 2
  %550 = getelementptr i8, i8* %548, i32 2
  %551 = bitcast i8* %550 to i32*
  store i32 %99, i32* %551, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %552 = getelementptr i8, i8* %548, i32 6
  %553 = load i8, i8* %113, align 1
  br i1 %109, label %554, label %565

554:                                              ; preds = %547
  %555 = zext i8 %553 to i32
  %556 = shl nuw nsw i32 %555, 16
  %557 = or i32 %556, 17803
  %558 = bitcast i8* %552 to i32*
  store i32 %557, i32* %558, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %559 = getelementptr i8, i8* %548, i32 9
  %560 = bitcast i8* %559 to i16*
  store i16 -7689, i16* %560, align 2
  %561 = getelementptr i8, i8* %548, i32 11
  %562 = or i32 %556, 17801
  %563 = bitcast i8* %561 to i32*
  store i32 %562, i32* %563, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %564 = getelementptr i8, i8* %548, i32 14
  br label %577

565:                                              ; preds = %547
  %566 = add i8 %553, -64
  %567 = zext i8 %566 to i16
  %568 = shl nuw i16 %567, 8
  %569 = or i16 %568, 139
  %570 = bitcast i8* %552 to i16*
  store i16 %569, i16* %570, align 2
  %571 = getelementptr i8, i8* %548, i32 8
  %572 = bitcast i8* %571 to i16*
  store i16 -7689, i16* %572, align 2
  %573 = getelementptr i8, i8* %548, i32 10
  %574 = or i16 %568, 137
  %575 = bitcast i8* %573 to i16*
  store i16 %574, i16* %575, align 2
  %576 = getelementptr i8, i8* %548, i32 12
  br label %577

577:                                              ; preds = %565, %554, %540, %534
  %578 = phi i8* [ %539, %534 ], [ %546, %540 ], [ %564, %554 ], [ %576, %565 ]
  %579 = ptrtoint i8* %578 to i32
  %580 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %581 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %580, i32 0, i32 13
  %582 = load i8, i8* %581, align 8, !range !6
  %583 = icmp eq i8 %582, 0
  br i1 %583, label %584, label %3149

584:                                              ; preds = %577
  %585 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %586 = load i8, i8* %585, align 1
  br i1 %109, label %587, label %594

587:                                              ; preds = %584
  %588 = bitcast i8* %578 to i16*
  store i16 -16333, i16* %588, align 2
  %589 = getelementptr i8, i8* %578, i32 2
  %590 = zext i8 %586 to i32
  %591 = shl nuw nsw i32 %590, 16
  %592 = or i32 %591, 17801
  %593 = bitcast i8* %589 to i32*
  store i32 %592, i32* %593, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %602

594:                                              ; preds = %584
  %595 = add i8 %586, -64
  %596 = shl i8 %586, 3
  %597 = add i8 %595, %596
  %598 = zext i8 %597 to i16
  %599 = shl nuw i16 %598, 8
  %600 = or i16 %599, 51
  %601 = bitcast i8* %578 to i16*
  store i16 %600, i16* %601, align 2
  br label %602

602:                                              ; preds = %594, %587
  %603 = phi i32 [ 2, %594 ], [ 5, %587 ]
  %604 = getelementptr i8, i8* %578, i32 %603
  %605 = ptrtoint i8* %604 to i32
  br label %3149

606:                                              ; preds = %90, %90, %90, %90
  %607 = and i32 %102, 8
  %608 = icmp eq i32 %607, 0
  br i1 %608, label %660, label %609

609:                                              ; preds = %606
  %610 = and i8 %101, -16
  %611 = load i8, i8* %113, align 1
  %612 = load i8, i8* %114, align 1
  %613 = inttoptr i32 %97 to i8*
  %614 = zext i8 %611 to i32
  br i1 %109, label %615, label %620

615:                                              ; preds = %609
  %616 = shl nuw nsw i32 %614, 16
  %617 = or i32 %616, 17803
  %618 = inttoptr i32 %97 to i32*
  store i32 %617, i32* %618, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %619 = getelementptr i8, i8* %613, i32 3
  br label %620

620:                                              ; preds = %615, %609
  %621 = phi i8* [ %619, %615 ], [ %613, %609 ]
  br i1 %112, label %622, label %627

622:                                              ; preds = %620
  %623 = zext i8 %612 to i32
  %624 = shl nuw nsw i32 %623, 16
  %625 = or i32 %624, 19851
  %626 = bitcast i8* %621 to i32*
  store i32 %625, i32* %626, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %633

627:                                              ; preds = %620
  %628 = add i8 %612, -56
  %629 = zext i8 %628 to i16
  %630 = shl nuw i16 %629, 8
  %631 = or i16 %630, 139
  %632 = bitcast i8* %621 to i16*
  store i16 %631, i16* %632, align 2
  br label %633

633:                                              ; preds = %627, %622
  %634 = phi i32 [ 2, %627 ], [ 3, %622 ]
  %635 = getelementptr i8, i8* %621, i32 %634
  switch i8 %610, label %701 [
    i8 96, label %638
    i8 112, label %636
    i8 -64, label %637
  ]

636:                                              ; preds = %633
  br label %638

637:                                              ; preds = %633
  br label %638

638:                                              ; preds = %637, %636, %633
  %639 = phi i32 [ 248, %637 ], [ 232, %636 ], [ 224, %633 ]
  %640 = select i1 %109, i8 0, i8 %611
  %641 = zext i8 %640 to i32
  %642 = add nuw nsw i32 %639, %641
  %643 = trunc i32 %642 to i16
  %644 = shl i16 %643, 8
  %645 = or i16 %644, 211
  %646 = bitcast i8* %635 to i16*
  store i16 %645, i16* %646, align 2
  %647 = getelementptr i8, i8* %635, i32 2
  br i1 %109, label %648, label %657

648:                                              ; preds = %638
  %649 = shl nuw nsw i32 %641, 11
  %650 = add nuw nsw i32 %649, 17664
  %651 = and i32 %650, 64768
  %652 = shl nuw nsw i32 %614, 16
  %653 = or i32 %652, %651
  %654 = or i32 %653, 137
  %655 = bitcast i8* %647 to i32*
  store i32 %654, i32* %655, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %656 = getelementptr i8, i8* %635, i32 5
  br label %657

657:                                              ; preds = %648, %638
  %658 = phi i8* [ %656, %648 ], [ %647, %638 ]
  %659 = ptrtoint i8* %658 to i32
  br label %701

660:                                              ; preds = %606
  %661 = inttoptr i32 %97 to i8*
  %662 = inttoptr i32 %97 to i16*
  store i16 -15929, i16* %662, align 2
  %663 = getelementptr i8, i8* %661, i32 2
  %664 = bitcast i8* %663 to i32*
  store i32 %99, i32* %664, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %665 = getelementptr i8, i8* %661, i32 6
  %666 = ptrtoint i8* %665 to i32
  %667 = and i8 %101, -16
  %668 = load i8, i8* %113, align 1
  %669 = zext i8 %668 to i32
  br i1 %109, label %670, label %675

670:                                              ; preds = %660
  %671 = shl nuw nsw i32 %669, 16
  %672 = or i32 %671, 17803
  %673 = bitcast i8* %665 to i32*
  store i32 %672, i32* %673, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %674 = getelementptr i8, i8* %661, i32 9
  br label %675

675:                                              ; preds = %670, %660
  %676 = phi i8* [ %674, %670 ], [ %665, %660 ]
  switch i8 %667, label %701 [
    i8 96, label %679
    i8 112, label %677
    i8 -64, label %678
  ]

677:                                              ; preds = %675
  br label %679

678:                                              ; preds = %675
  br label %679

679:                                              ; preds = %678, %677, %675
  %680 = phi i32 [ 248, %678 ], [ 232, %677 ], [ 224, %675 ]
  %681 = select i1 %109, i8 0, i8 %668
  %682 = zext i8 %681 to i32
  %683 = add nuw nsw i32 %680, %682
  %684 = trunc i32 %683 to i16
  %685 = shl i16 %684, 8
  %686 = or i16 %685, 211
  %687 = bitcast i8* %676 to i16*
  store i16 %686, i16* %687, align 2
  %688 = getelementptr i8, i8* %676, i32 2
  br i1 %109, label %689, label %698

689:                                              ; preds = %679
  %690 = shl nuw nsw i32 %682, 11
  %691 = add nuw nsw i32 %690, 17664
  %692 = and i32 %691, 64768
  %693 = shl nuw nsw i32 %669, 16
  %694 = or i32 %693, %692
  %695 = or i32 %694, 137
  %696 = bitcast i8* %688 to i32*
  store i32 %695, i32* %696, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %697 = getelementptr i8, i8* %676, i32 5
  br label %698

698:                                              ; preds = %689, %679
  %699 = phi i8* [ %697, %689 ], [ %688, %679 ]
  %700 = ptrtoint i8* %699 to i32
  br label %701

701:                                              ; preds = %698, %675, %657, %633
  %702 = phi i32 [ %97, %633 ], [ %659, %657 ], [ %666, %675 ], [ %700, %698 ]
  %703 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %704 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %703, i32 0, i32 13
  %705 = load i8, i8* %704, align 8, !range !6
  %706 = icmp eq i8 %705, 0
  br i1 %706, label %707, label %3149

707:                                              ; preds = %701
  %708 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %709 = load i8, i8* %708, align 1
  %710 = inttoptr i32 %702 to i8*
  br i1 %109, label %711, label %718

711:                                              ; preds = %707
  %712 = inttoptr i32 %702 to i16*
  store i16 -16333, i16* %712, align 2
  %713 = getelementptr i8, i8* %710, i32 2
  %714 = zext i8 %709 to i32
  %715 = shl nuw nsw i32 %714, 16
  %716 = or i32 %715, 17801
  %717 = bitcast i8* %713 to i32*
  store i32 %716, i32* %717, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %726

718:                                              ; preds = %707
  %719 = add i8 %709, -64
  %720 = shl i8 %709, 3
  %721 = add i8 %719, %720
  %722 = zext i8 %721 to i16
  %723 = shl nuw i16 %722, 8
  %724 = or i16 %723, 51
  %725 = inttoptr i32 %702 to i16*
  store i16 %724, i16* %725, align 2
  br label %726

726:                                              ; preds = %718, %711
  %727 = phi i32 [ 2, %718 ], [ 5, %711 ]
  %728 = getelementptr i8, i8* %710, i32 %727
  %729 = ptrtoint i8* %728 to i32
  br label %3149

730:                                              ; preds = %90, %90, %90, %90
  %731 = and i32 %102, 8
  %732 = icmp eq i32 %731, 0
  br i1 %732, label %800, label %733

733:                                              ; preds = %730
  %734 = and i8 %101, -16
  %735 = load i8, i8* %113, align 1
  %736 = load i8, i8* %114, align 1
  %737 = inttoptr i32 %97 to i8*
  br i1 %112, label %738, label %743

738:                                              ; preds = %733
  %739 = zext i8 %736 to i32
  %740 = shl nuw nsw i32 %739, 16
  %741 = or i32 %740, 19851
  %742 = inttoptr i32 %97 to i32*
  store i32 %741, i32* %742, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %749

743:                                              ; preds = %733
  %744 = add i8 %736, -56
  %745 = zext i8 %744 to i16
  %746 = shl nuw i16 %745, 8
  %747 = or i16 %746, 139
  %748 = inttoptr i32 %97 to i16*
  store i16 %747, i16* %748, align 2
  br label %749

749:                                              ; preds = %743, %738
  %750 = phi i32 [ 2, %743 ], [ 3, %738 ]
  %751 = getelementptr i8, i8* %737, i32 %750
  br i1 %109, label %752, label %758

752:                                              ; preds = %749
  %753 = zext i8 %735 to i32
  %754 = shl nuw nsw i32 %753, 16
  %755 = or i32 %754, 17803
  %756 = bitcast i8* %751 to i32*
  store i32 %755, i32* %756, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %757 = getelementptr i8, i8* %751, i32 3
  br label %766

758:                                              ; preds = %749
  %759 = add i8 %735, -64
  %760 = zext i8 %759 to i16
  %761 = shl nuw i16 %760, 8
  %762 = or i16 %761, 139
  %763 = bitcast i8* %751 to i16*
  store i16 %762, i16* %763, align 2
  %764 = getelementptr i8, i8* %751, i32 2
  %765 = zext i8 %735 to i32
  br label %766

766:                                              ; preds = %758, %752
  %767 = phi i32 [ %753, %752 ], [ %765, %758 ]
  %768 = phi i8* [ %757, %752 ], [ %764, %758 ]
  %769 = bitcast i8* %768 to i16*
  store i16 -11727, i16* %769, align 2
  %770 = getelementptr i8, i8* %768, i32 2
  %771 = bitcast i8* %770 to i16*
  store i16 -3593, i16* %771, align 2
  %772 = getelementptr i8, i8* %768, i32 4
  %773 = icmp eq i8 %734, -112
  br i1 %773, label %774, label %787

774:                                              ; preds = %766
  br i1 %109, label %775, label %780

775:                                              ; preds = %774
  %776 = shl nuw nsw i32 %767, 16
  %777 = or i32 %776, 21897
  %778 = bitcast i8* %772 to i32*
  store i32 %777, i32* %778, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %779 = getelementptr i8, i8* %768, i32 7
  br label %856

780:                                              ; preds = %774
  %781 = add i8 %735, -48
  %782 = zext i8 %781 to i16
  %783 = shl nuw i16 %782, 8
  %784 = or i16 %783, 137
  %785 = bitcast i8* %772 to i16*
  store i16 %784, i16* %785, align 2
  %786 = getelementptr i8, i8* %768, i32 6
  br label %856

787:                                              ; preds = %766
  br i1 %109, label %788, label %793

788:                                              ; preds = %787
  %789 = shl nuw nsw i32 %767, 16
  %790 = or i32 %789, 17801
  %791 = bitcast i8* %772 to i32*
  store i32 %790, i32* %791, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %792 = getelementptr i8, i8* %768, i32 7
  br label %856

793:                                              ; preds = %787
  %794 = add i8 %735, -64
  %795 = zext i8 %794 to i16
  %796 = shl nuw i16 %795, 8
  %797 = or i16 %796, 137
  %798 = bitcast i8* %772 to i16*
  store i16 %797, i16* %798, align 2
  %799 = getelementptr i8, i8* %768, i32 6
  br label %856

800:                                              ; preds = %730
  %801 = inttoptr i32 %97 to i8*
  %802 = inttoptr i32 %97 to i16*
  store i16 -15929, i16* %802, align 2
  %803 = getelementptr i8, i8* %801, i32 2
  %804 = bitcast i8* %803 to i32*
  store i32 %99, i32* %804, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %805 = getelementptr i8, i8* %801, i32 6
  %806 = and i8 %101, -16
  %807 = load i8, i8* %113, align 1
  br i1 %109, label %808, label %814

808:                                              ; preds = %800
  %809 = zext i8 %807 to i32
  %810 = shl nuw nsw i32 %809, 16
  %811 = or i32 %810, 17803
  %812 = bitcast i8* %805 to i32*
  store i32 %811, i32* %812, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %813 = getelementptr i8, i8* %801, i32 9
  br label %822

814:                                              ; preds = %800
  %815 = add i8 %807, -64
  %816 = zext i8 %815 to i16
  %817 = shl nuw i16 %816, 8
  %818 = or i16 %817, 139
  %819 = bitcast i8* %805 to i16*
  store i16 %818, i16* %819, align 2
  %820 = getelementptr i8, i8* %801, i32 8
  %821 = zext i8 %807 to i32
  br label %822

822:                                              ; preds = %814, %808
  %823 = phi i32 [ %809, %808 ], [ %821, %814 ]
  %824 = phi i8* [ %813, %808 ], [ %820, %814 ]
  %825 = bitcast i8* %824 to i16*
  store i16 -11727, i16* %825, align 2
  %826 = getelementptr i8, i8* %824, i32 2
  %827 = bitcast i8* %826 to i16*
  store i16 -3593, i16* %827, align 2
  %828 = getelementptr i8, i8* %824, i32 4
  %829 = icmp eq i8 %806, -112
  br i1 %829, label %830, label %843

830:                                              ; preds = %822
  br i1 %109, label %831, label %836

831:                                              ; preds = %830
  %832 = shl nuw nsw i32 %823, 16
  %833 = or i32 %832, 21897
  %834 = bitcast i8* %828 to i32*
  store i32 %833, i32* %834, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %835 = getelementptr i8, i8* %824, i32 7
  br label %856

836:                                              ; preds = %830
  %837 = add i8 %807, -48
  %838 = zext i8 %837 to i16
  %839 = shl nuw i16 %838, 8
  %840 = or i16 %839, 137
  %841 = bitcast i8* %828 to i16*
  store i16 %840, i16* %841, align 2
  %842 = getelementptr i8, i8* %824, i32 6
  br label %856

843:                                              ; preds = %822
  br i1 %109, label %844, label %849

844:                                              ; preds = %843
  %845 = shl nuw nsw i32 %823, 16
  %846 = or i32 %845, 17801
  %847 = bitcast i8* %828 to i32*
  store i32 %846, i32* %847, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %848 = getelementptr i8, i8* %824, i32 7
  br label %856

849:                                              ; preds = %843
  %850 = add i8 %807, -64
  %851 = zext i8 %850 to i16
  %852 = shl nuw i16 %851, 8
  %853 = or i16 %852, 137
  %854 = bitcast i8* %828 to i16*
  store i16 %853, i16* %854, align 2
  %855 = getelementptr i8, i8* %824, i32 6
  br label %856

856:                                              ; preds = %849, %844, %836, %831, %793, %788, %780, %775
  %857 = phi i8* [ %779, %775 ], [ %786, %780 ], [ %792, %788 ], [ %799, %793 ], [ %835, %831 ], [ %842, %836 ], [ %848, %844 ], [ %855, %849 ]
  %858 = ptrtoint i8* %857 to i32
  %859 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %860 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %859, i32 0, i32 13
  %861 = load i8, i8* %860, align 8, !range !6
  %862 = icmp eq i8 %861, 0
  br i1 %862, label %863, label %3149

863:                                              ; preds = %856
  %864 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %865 = load i8, i8* %864, align 1
  br i1 %109, label %866, label %873

866:                                              ; preds = %863
  %867 = bitcast i8* %857 to i16*
  store i16 -16333, i16* %867, align 2
  %868 = getelementptr i8, i8* %857, i32 2
  %869 = zext i8 %865 to i32
  %870 = shl nuw nsw i32 %869, 16
  %871 = or i32 %870, 17801
  %872 = bitcast i8* %868 to i32*
  store i32 %871, i32* %872, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %881

873:                                              ; preds = %863
  %874 = add i8 %865, -64
  %875 = shl i8 %865, 3
  %876 = add i8 %874, %875
  %877 = zext i8 %876 to i16
  %878 = shl nuw i16 %877, 8
  %879 = or i16 %878, 51
  %880 = bitcast i8* %857 to i16*
  store i16 %879, i16* %880, align 2
  br label %881

881:                                              ; preds = %873, %866
  %882 = phi i32 [ 2, %873 ], [ 5, %866 ]
  %883 = getelementptr i8, i8* %857, i32 %882
  %884 = ptrtoint i8* %883 to i32
  br label %3149

885:                                              ; preds = %90, %90
  %886 = icmp sgt i32 %99, 31
  br i1 %886, label %3173, label %887, !prof !3, !misexpect !4

887:                                              ; preds = %885
  %888 = inttoptr i32 %97 to i8*
  %889 = inttoptr i32 %97 to i16*
  store i16 -15929, i16* %889, align 2
  %890 = getelementptr i8, i8* %888, i32 2
  %891 = bitcast i8* %890 to i32*
  store i32 %99, i32* %891, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %892 = getelementptr i8, i8* %888, i32 6
  %893 = and i8 %101, -16
  %894 = load i8, i8* %113, align 1
  %895 = zext i8 %894 to i32
  br i1 %109, label %896, label %901

896:                                              ; preds = %887
  %897 = shl nuw nsw i32 %895, 16
  %898 = or i32 %897, 17803
  %899 = bitcast i8* %892 to i32*
  store i32 %898, i32* %899, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %900 = getelementptr i8, i8* %888, i32 9
  br label %901

901:                                              ; preds = %896, %887
  %902 = phi i8* [ %900, %896 ], [ %892, %887 ]
  switch i8 %893, label %923 [
    i8 96, label %904
    i8 112, label %903
  ]

903:                                              ; preds = %901
  br label %904

904:                                              ; preds = %903, %901
  %905 = phi i32 [ 232, %903 ], [ 224, %901 ]
  %906 = select i1 %109, i8 0, i8 %894
  %907 = zext i8 %906 to i32
  %908 = add nuw nsw i32 %905, %907
  %909 = trunc i32 %908 to i16
  %910 = shl i16 %909, 8
  %911 = or i16 %910, 211
  %912 = bitcast i8* %902 to i16*
  store i16 %911, i16* %912, align 2
  %913 = getelementptr i8, i8* %902, i32 2
  br i1 %109, label %914, label %923

914:                                              ; preds = %904
  %915 = shl nuw nsw i32 %907, 11
  %916 = add nuw nsw i32 %915, 17664
  %917 = and i32 %916, 64768
  %918 = shl nuw nsw i32 %895, 16
  %919 = or i32 %918, %917
  %920 = or i32 %919, 137
  %921 = bitcast i8* %913 to i32*
  store i32 %920, i32* %921, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %922 = getelementptr i8, i8* %902, i32 5
  br label %923

923:                                              ; preds = %914, %904, %901
  %924 = phi i8* [ %892, %901 ], [ %922, %914 ], [ %913, %904 ]
  %925 = ptrtoint i8* %924 to i32
  %926 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %927 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %926, i32 0, i32 13
  %928 = load i8, i8* %927, align 8, !range !6
  %929 = icmp eq i8 %928, 0
  br i1 %929, label %930, label %3149

930:                                              ; preds = %923
  %931 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %932 = load i8, i8* %931, align 1
  br i1 %109, label %933, label %940

933:                                              ; preds = %930
  %934 = bitcast i8* %924 to i16*
  store i16 -16333, i16* %934, align 2
  %935 = getelementptr i8, i8* %924, i32 2
  %936 = zext i8 %932 to i32
  %937 = shl nuw nsw i32 %936, 16
  %938 = or i32 %937, 17801
  %939 = bitcast i8* %935 to i32*
  store i32 %938, i32* %939, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %948

940:                                              ; preds = %930
  %941 = add i8 %932, -64
  %942 = shl i8 %932, 3
  %943 = add i8 %941, %942
  %944 = zext i8 %943 to i16
  %945 = shl nuw i16 %944, 8
  %946 = or i16 %945, 51
  %947 = bitcast i8* %924 to i16*
  store i16 %946, i16* %947, align 2
  br label %948

948:                                              ; preds = %940, %933
  %949 = phi i32 [ 2, %940 ], [ 5, %933 ]
  %950 = getelementptr i8, i8* %924, i32 %949
  %951 = ptrtoint i8* %950 to i32
  br label %3149

952:                                              ; preds = %90
  %953 = icmp sgt i32 %99, 63
  br i1 %953, label %3173, label %954, !prof !3, !misexpect !4

954:                                              ; preds = %952
  %955 = inttoptr i32 %97 to i8*
  %956 = load i8, i8* %113, align 1
  %957 = zext i8 %956 to i32
  br i1 %109, label %962, label %958

958:                                              ; preds = %954
  %959 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %960 = load i8, i8* %959, align 1
  %961 = zext i8 %960 to i32
  br label %974

962:                                              ; preds = %954
  %963 = shl nuw nsw i32 %957, 16
  %964 = or i32 %963, 17803
  %965 = inttoptr i32 %97 to i32*
  store i32 %964, i32* %965, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %966 = getelementptr i8, i8* %955, i32 3
  %967 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %968 = load i8, i8* %967, align 1
  %969 = zext i8 %968 to i32
  %970 = shl nuw nsw i32 %969, 16
  %971 = or i32 %970, 21899
  %972 = bitcast i8* %966 to i32*
  store i32 %971, i32* %972, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %973 = getelementptr i8, i8* %955, i32 6
  br label %974

974:                                              ; preds = %962, %958
  %975 = phi i8 [ %968, %962 ], [ %960, %958 ]
  %976 = phi i32 [ 2, %962 ], [ %961, %958 ]
  %977 = phi i32 [ 0, %962 ], [ %957, %958 ]
  %978 = phi i8* [ %973, %962 ], [ %955, %958 ]
  %979 = icmp ult i32 %99, 32
  br i1 %979, label %980, label %998

980:                                              ; preds = %974
  %981 = add nuw nsw i32 %976, 192
  %982 = shl nuw nsw i32 %977, 3
  %983 = add nuw nsw i32 %981, %982
  %984 = shl nuw nsw i32 %983, 16
  %985 = and i32 %984, 16711680
  %986 = shl nuw nsw i32 %99, 24
  %987 = or i32 %986, %985
  %988 = or i32 %987, 41999
  %989 = bitcast i8* %978 to i32*
  store i32 %988, i32* %989, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %990 = getelementptr i8, i8* %978, i32 4
  %991 = shl nuw nsw i32 %977, 8
  %992 = add nuw nsw i32 %991, 57344
  %993 = and i32 %992, 65280
  %994 = shl nuw nsw i32 %99, 16
  %995 = or i32 %994, %993
  %996 = or i32 %995, 193
  %997 = bitcast i8* %990 to i32*
  store i32 %996, i32* %997, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1040

998:                                              ; preds = %974
  %999 = icmp ult i32 %99, 64
  br i1 %999, label %1000, label %1024

1000:                                             ; preds = %998
  %1001 = shl nuw nsw i32 %977, 8
  %1002 = add nuw nsw i32 %1001, 57344
  %1003 = and i32 %1002, 65280
  %1004 = shl nuw nsw i32 %99, 16
  %1005 = add nsw i32 %1004, -2097152
  %1006 = or i32 %1005, %1003
  %1007 = or i32 %1006, 193
  %1008 = bitcast i8* %978 to i32*
  store i32 %1007, i32* %1008, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1009 = getelementptr i8, i8* %978, i32 3
  %1010 = add nuw nsw i32 %976, 192
  %1011 = shl nuw nsw i32 %977, 3
  %1012 = add nuw nsw i32 %1010, %1011
  %1013 = trunc i32 %1012 to i16
  %1014 = shl i16 %1013, 8
  %1015 = or i16 %1014, 137
  %1016 = bitcast i8* %1009 to i16*
  store i16 %1015, i16* %1016, align 2
  %1017 = getelementptr i8, i8* %978, i32 5
  %1018 = add nuw nsw i32 %977, 192
  %1019 = add nuw nsw i32 %1018, %1011
  %1020 = trunc i32 %1019 to i16
  %1021 = shl i16 %1020, 8
  %1022 = or i16 %1021, 51
  %1023 = bitcast i8* %1017 to i16*
  store i16 %1022, i16* %1023, align 2
  br label %1040

1024:                                             ; preds = %998
  %1025 = add nuw nsw i32 %977, 192
  %1026 = shl nuw nsw i32 %977, 3
  %1027 = add nuw nsw i32 %1025, %1026
  %1028 = trunc i32 %1027 to i16
  %1029 = shl i16 %1028, 8
  %1030 = or i16 %1029, 51
  %1031 = bitcast i8* %978 to i16*
  store i16 %1030, i16* %1031, align 2
  %1032 = getelementptr i8, i8* %978, i32 2
  %1033 = add nuw nsw i32 %976, 192
  %1034 = shl nuw nsw i32 %976, 3
  %1035 = add nuw nsw i32 %1033, %1034
  %1036 = trunc i32 %1035 to i16
  %1037 = shl i16 %1036, 8
  %1038 = or i16 %1037, 51
  %1039 = bitcast i8* %1032 to i16*
  store i16 %1038, i16* %1039, align 2
  br label %1040

1040:                                             ; preds = %1024, %1000, %980
  %1041 = phi i32 [ 4, %1024 ], [ 7, %1000 ], [ 7, %980 ]
  %1042 = getelementptr i8, i8* %978, i32 %1041
  br i1 %109, label %1043, label %1061

1043:                                             ; preds = %1040
  %1044 = shl nuw nsw i32 %977, 11
  %1045 = add nuw nsw i32 %1044, 17664
  %1046 = and i32 %1045, 64768
  %1047 = shl nuw nsw i32 %957, 16
  %1048 = or i32 %1047, %1046
  %1049 = or i32 %1048, 137
  %1050 = bitcast i8* %1042 to i32*
  store i32 %1049, i32* %1050, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1051 = getelementptr i8, i8* %1042, i32 3
  %1052 = shl nuw nsw i32 %976, 11
  %1053 = add nuw nsw i32 %1052, 17664
  %1054 = and i32 %1053, 64768
  %1055 = zext i8 %975 to i32
  %1056 = shl nuw nsw i32 %1055, 16
  %1057 = or i32 %1056, %1054
  %1058 = or i32 %1057, 137
  %1059 = bitcast i8* %1051 to i32*
  store i32 %1058, i32* %1059, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1060 = getelementptr i8, i8* %1042, i32 6
  br label %1061

1061:                                             ; preds = %1043, %1040
  %1062 = phi i8* [ %1060, %1043 ], [ %1042, %1040 ]
  %1063 = ptrtoint i8* %1062 to i32
  br label %3149

1064:                                             ; preds = %90
  %1065 = icmp sgt i32 %99, 63
  br i1 %1065, label %3173, label %1066, !prof !3, !misexpect !4

1066:                                             ; preds = %1064
  %1067 = inttoptr i32 %97 to i8*
  %1068 = load i8, i8* %113, align 1
  %1069 = zext i8 %1068 to i32
  br i1 %109, label %1074, label %1070

1070:                                             ; preds = %1066
  %1071 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1072 = load i8, i8* %1071, align 1
  %1073 = zext i8 %1072 to i32
  br label %1086

1074:                                             ; preds = %1066
  %1075 = shl nuw nsw i32 %1069, 16
  %1076 = or i32 %1075, 17803
  %1077 = inttoptr i32 %97 to i32*
  store i32 %1076, i32* %1077, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1078 = getelementptr i8, i8* %1067, i32 3
  %1079 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1080 = load i8, i8* %1079, align 1
  %1081 = zext i8 %1080 to i32
  %1082 = shl nuw nsw i32 %1081, 16
  %1083 = or i32 %1082, 21899
  %1084 = bitcast i8* %1078 to i32*
  store i32 %1083, i32* %1084, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1085 = getelementptr i8, i8* %1067, i32 6
  br label %1086

1086:                                             ; preds = %1074, %1070
  %1087 = phi i8 [ %1080, %1074 ], [ %1072, %1070 ]
  %1088 = phi i32 [ 2, %1074 ], [ %1073, %1070 ]
  %1089 = phi i32 [ 0, %1074 ], [ %1069, %1070 ]
  %1090 = phi i8* [ %1085, %1074 ], [ %1067, %1070 ]
  %1091 = icmp ult i32 %99, 32
  br i1 %1091, label %1092, label %1110

1092:                                             ; preds = %1086
  %1093 = add nuw nsw i32 %1089, 192
  %1094 = shl nuw nsw i32 %1088, 3
  %1095 = add nuw nsw i32 %1093, %1094
  %1096 = shl nuw nsw i32 %1095, 16
  %1097 = and i32 %1096, 16711680
  %1098 = shl nuw nsw i32 %99, 24
  %1099 = or i32 %1098, %1097
  %1100 = or i32 %1099, 44047
  %1101 = bitcast i8* %1090 to i32*
  store i32 %1100, i32* %1101, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1102 = getelementptr i8, i8* %1090, i32 4
  %1103 = shl nuw nsw i32 %1088, 8
  %1104 = add nuw nsw i32 %1103, 59392
  %1105 = and i32 %1104, 65280
  %1106 = shl nuw nsw i32 %99, 16
  %1107 = or i32 %1106, %1105
  %1108 = or i32 %1107, 193
  %1109 = bitcast i8* %1102 to i32*
  store i32 %1108, i32* %1109, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1152

1110:                                             ; preds = %1086
  %1111 = icmp ult i32 %99, 64
  br i1 %1111, label %1112, label %1136

1112:                                             ; preds = %1110
  %1113 = shl nuw nsw i32 %1088, 8
  %1114 = add nuw nsw i32 %1113, 59392
  %1115 = and i32 %1114, 65280
  %1116 = shl nuw nsw i32 %99, 16
  %1117 = add nsw i32 %1116, -2097152
  %1118 = or i32 %1117, %1115
  %1119 = or i32 %1118, 193
  %1120 = bitcast i8* %1090 to i32*
  store i32 %1119, i32* %1120, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1121 = getelementptr i8, i8* %1090, i32 3
  %1122 = add nuw nsw i32 %1089, 192
  %1123 = shl nuw nsw i32 %1088, 3
  %1124 = add nuw nsw i32 %1122, %1123
  %1125 = trunc i32 %1124 to i16
  %1126 = shl i16 %1125, 8
  %1127 = or i16 %1126, 137
  %1128 = bitcast i8* %1121 to i16*
  store i16 %1127, i16* %1128, align 2
  %1129 = getelementptr i8, i8* %1090, i32 5
  %1130 = add nuw nsw i32 %1088, 192
  %1131 = add nuw nsw i32 %1130, %1123
  %1132 = trunc i32 %1131 to i16
  %1133 = shl i16 %1132, 8
  %1134 = or i16 %1133, 51
  %1135 = bitcast i8* %1129 to i16*
  store i16 %1134, i16* %1135, align 2
  br label %1152

1136:                                             ; preds = %1110
  %1137 = add nuw nsw i32 %1089, 192
  %1138 = shl nuw nsw i32 %1089, 3
  %1139 = add nuw nsw i32 %1137, %1138
  %1140 = trunc i32 %1139 to i16
  %1141 = shl i16 %1140, 8
  %1142 = or i16 %1141, 51
  %1143 = bitcast i8* %1090 to i16*
  store i16 %1142, i16* %1143, align 2
  %1144 = getelementptr i8, i8* %1090, i32 2
  %1145 = add nuw nsw i32 %1088, 192
  %1146 = shl nuw nsw i32 %1088, 3
  %1147 = add nuw nsw i32 %1145, %1146
  %1148 = trunc i32 %1147 to i16
  %1149 = shl i16 %1148, 8
  %1150 = or i16 %1149, 51
  %1151 = bitcast i8* %1144 to i16*
  store i16 %1150, i16* %1151, align 2
  br label %1152

1152:                                             ; preds = %1136, %1112, %1092
  %1153 = phi i32 [ 4, %1136 ], [ 7, %1112 ], [ 7, %1092 ]
  %1154 = getelementptr i8, i8* %1090, i32 %1153
  br i1 %109, label %1155, label %1173

1155:                                             ; preds = %1152
  %1156 = shl nuw nsw i32 %1089, 11
  %1157 = add nuw nsw i32 %1156, 17664
  %1158 = and i32 %1157, 64768
  %1159 = shl nuw nsw i32 %1069, 16
  %1160 = or i32 %1159, %1158
  %1161 = or i32 %1160, 137
  %1162 = bitcast i8* %1154 to i32*
  store i32 %1161, i32* %1162, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1163 = getelementptr i8, i8* %1154, i32 3
  %1164 = shl nuw nsw i32 %1088, 11
  %1165 = add nuw nsw i32 %1164, 17664
  %1166 = and i32 %1165, 64768
  %1167 = zext i8 %1087 to i32
  %1168 = shl nuw nsw i32 %1167, 16
  %1169 = or i32 %1168, %1166
  %1170 = or i32 %1169, 137
  %1171 = bitcast i8* %1163 to i32*
  store i32 %1170, i32* %1171, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1172 = getelementptr i8, i8* %1154, i32 6
  br label %1173

1173:                                             ; preds = %1155, %1152
  %1174 = phi i8* [ %1172, %1155 ], [ %1154, %1152 ]
  %1175 = ptrtoint i8* %1174 to i32
  br label %3149

1176:                                             ; preds = %90
  %1177 = inttoptr i32 %97 to i8*
  %1178 = load i8, i8* %113, align 1
  %1179 = zext i8 %1178 to i32
  br i1 %109, label %1184, label %1180

1180:                                             ; preds = %1176
  %1181 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1182 = load i8, i8* %1181, align 1
  %1183 = zext i8 %1182 to i32
  br label %1196

1184:                                             ; preds = %1176
  %1185 = shl nuw nsw i32 %1179, 16
  %1186 = or i32 %1185, 17803
  %1187 = inttoptr i32 %97 to i32*
  store i32 %1186, i32* %1187, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1188 = getelementptr i8, i8* %1177, i32 3
  %1189 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1190 = load i8, i8* %1189, align 1
  %1191 = zext i8 %1190 to i32
  %1192 = shl nuw nsw i32 %1191, 16
  %1193 = or i32 %1192, 21899
  %1194 = bitcast i8* %1188 to i32*
  store i32 %1193, i32* %1194, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1195 = getelementptr i8, i8* %1177, i32 6
  br label %1196

1196:                                             ; preds = %1184, %1180
  %1197 = phi i8 [ %1190, %1184 ], [ %1182, %1180 ]
  %1198 = phi i32 [ 2, %1184 ], [ %1183, %1180 ]
  %1199 = phi i32 [ 0, %1184 ], [ %1179, %1180 ]
  %1200 = phi i8* [ %1195, %1184 ], [ %1177, %1180 ]
  %1201 = load i8, i8* %114, align 1
  br i1 %112, label %1202, label %1207

1202:                                             ; preds = %1196
  %1203 = zext i8 %1201 to i32
  %1204 = shl nuw nsw i32 %1203, 16
  %1205 = or i32 %1204, 19851
  %1206 = bitcast i8* %1200 to i32*
  store i32 %1205, i32* %1206, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1213

1207:                                             ; preds = %1196
  %1208 = add i8 %1201, -56
  %1209 = zext i8 %1208 to i16
  %1210 = shl nuw i16 %1209, 8
  %1211 = or i16 %1210, 139
  %1212 = bitcast i8* %1200 to i16*
  store i16 %1211, i16* %1212, align 2
  br label %1213

1213:                                             ; preds = %1207, %1202
  %1214 = phi i32 [ 2, %1207 ], [ 3, %1202 ]
  %1215 = getelementptr i8, i8* %1200, i32 %1214
  %1216 = shl nuw nsw i32 %1199, 3
  %1217 = add nuw nsw i32 %1216, 192
  %1218 = add nuw nsw i32 %1217, %1198
  %1219 = shl nuw nsw i32 %1218, 16
  %1220 = and i32 %1219, 16711680
  %1221 = or i32 %1220, 42255
  %1222 = bitcast i8* %1215 to i32*
  store i32 %1221, i32* %1222, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1223 = getelementptr i8, i8* %1215, i32 3
  %1224 = trunc i32 %1199 to i16
  %1225 = shl nuw i16 %1224, 8
  %1226 = add i16 %1225, -8192
  %1227 = or i16 %1226, 211
  %1228 = bitcast i8* %1223 to i16*
  store i16 %1227, i16* %1228, align 2
  %1229 = getelementptr i8, i8* %1215, i32 5
  %1230 = bitcast i8* %1229 to i32*
  store i32 2161027, i32* %1230, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1231 = getelementptr i8, i8* %1215, i32 8
  %1232 = bitcast i8* %1231 to i16*
  store i16 1138, i16* %1232, align 2
  %1233 = getelementptr i8, i8* %1215, i32 10
  %1234 = trunc i32 %1218 to i16
  %1235 = shl i16 %1234, 8
  %1236 = or i16 %1235, 137
  %1237 = bitcast i8* %1233 to i16*
  store i16 %1236, i16* %1237, align 2
  %1238 = getelementptr i8, i8* %1215, i32 12
  %1239 = add nuw nsw i32 %1217, %1199
  %1240 = trunc i32 %1239 to i16
  %1241 = shl i16 %1240, 8
  %1242 = or i16 %1241, 51
  %1243 = bitcast i8* %1238 to i16*
  store i16 %1242, i16* %1243, align 2
  %1244 = getelementptr i8, i8* %1215, i32 14
  br i1 %109, label %1245, label %1263

1245:                                             ; preds = %1213
  %1246 = shl nuw nsw i32 %1199, 11
  %1247 = add nuw nsw i32 %1246, 17664
  %1248 = and i32 %1247, 64768
  %1249 = shl nuw nsw i32 %1179, 16
  %1250 = or i32 %1249, %1248
  %1251 = or i32 %1250, 137
  %1252 = bitcast i8* %1244 to i32*
  store i32 %1251, i32* %1252, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1253 = getelementptr i8, i8* %1215, i32 17
  %1254 = shl nuw nsw i32 %1198, 11
  %1255 = add nuw nsw i32 %1254, 17664
  %1256 = and i32 %1255, 64768
  %1257 = zext i8 %1197 to i32
  %1258 = shl nuw nsw i32 %1257, 16
  %1259 = or i32 %1258, %1256
  %1260 = or i32 %1259, 137
  %1261 = bitcast i8* %1253 to i32*
  store i32 %1260, i32* %1261, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1262 = getelementptr i8, i8* %1215, i32 20
  br label %1263

1263:                                             ; preds = %1245, %1213
  %1264 = phi i8* [ %1262, %1245 ], [ %1244, %1213 ]
  %1265 = ptrtoint i8* %1264 to i32
  br label %3149

1266:                                             ; preds = %90
  %1267 = inttoptr i32 %97 to i8*
  %1268 = load i8, i8* %113, align 1
  %1269 = zext i8 %1268 to i32
  br i1 %109, label %1274, label %1270

1270:                                             ; preds = %1266
  %1271 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1272 = load i8, i8* %1271, align 1
  %1273 = zext i8 %1272 to i32
  br label %1286

1274:                                             ; preds = %1266
  %1275 = shl nuw nsw i32 %1269, 16
  %1276 = or i32 %1275, 17803
  %1277 = inttoptr i32 %97 to i32*
  store i32 %1276, i32* %1277, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1278 = getelementptr i8, i8* %1267, i32 3
  %1279 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1280 = load i8, i8* %1279, align 1
  %1281 = zext i8 %1280 to i32
  %1282 = shl nuw nsw i32 %1281, 16
  %1283 = or i32 %1282, 21899
  %1284 = bitcast i8* %1278 to i32*
  store i32 %1283, i32* %1284, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1285 = getelementptr i8, i8* %1267, i32 6
  br label %1286

1286:                                             ; preds = %1274, %1270
  %1287 = phi i8 [ %1280, %1274 ], [ %1272, %1270 ]
  %1288 = phi i32 [ 2, %1274 ], [ %1273, %1270 ]
  %1289 = phi i32 [ 0, %1274 ], [ %1269, %1270 ]
  %1290 = phi i8* [ %1285, %1274 ], [ %1267, %1270 ]
  %1291 = load i8, i8* %114, align 1
  br i1 %112, label %1292, label %1297

1292:                                             ; preds = %1286
  %1293 = zext i8 %1291 to i32
  %1294 = shl nuw nsw i32 %1293, 16
  %1295 = or i32 %1294, 19851
  %1296 = bitcast i8* %1290 to i32*
  store i32 %1295, i32* %1296, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1303

1297:                                             ; preds = %1286
  %1298 = add i8 %1291, -56
  %1299 = zext i8 %1298 to i16
  %1300 = shl nuw i16 %1299, 8
  %1301 = or i16 %1300, 139
  %1302 = bitcast i8* %1290 to i16*
  store i16 %1301, i16* %1302, align 2
  br label %1303

1303:                                             ; preds = %1297, %1292
  %1304 = phi i32 [ 2, %1297 ], [ 3, %1292 ]
  %1305 = getelementptr i8, i8* %1290, i32 %1304
  %1306 = shl nuw nsw i32 %1288, 3
  %1307 = add nuw nsw i32 %1306, 192
  %1308 = add nuw nsw i32 %1307, %1289
  %1309 = shl nuw nsw i32 %1308, 16
  %1310 = and i32 %1309, 16711680
  %1311 = or i32 %1310, 44303
  %1312 = bitcast i8* %1305 to i32*
  store i32 %1311, i32* %1312, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1313 = getelementptr i8, i8* %1305, i32 3
  %1314 = trunc i32 %1288 to i16
  %1315 = shl nuw i16 %1314, 8
  %1316 = add i16 %1315, -6144
  %1317 = or i16 %1316, 211
  %1318 = bitcast i8* %1313 to i16*
  store i16 %1317, i16* %1318, align 2
  %1319 = getelementptr i8, i8* %1305, i32 5
  %1320 = bitcast i8* %1319 to i32*
  store i32 2161027, i32* %1320, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1321 = getelementptr i8, i8* %1305, i32 8
  %1322 = bitcast i8* %1321 to i16*
  store i16 1138, i16* %1322, align 2
  %1323 = getelementptr i8, i8* %1305, i32 10
  %1324 = trunc i32 %1308 to i16
  %1325 = shl i16 %1324, 8
  %1326 = or i16 %1325, 137
  %1327 = bitcast i8* %1323 to i16*
  store i16 %1326, i16* %1327, align 2
  %1328 = getelementptr i8, i8* %1305, i32 12
  %1329 = add nuw nsw i32 %1307, %1288
  %1330 = trunc i32 %1329 to i16
  %1331 = shl i16 %1330, 8
  %1332 = or i16 %1331, 51
  %1333 = bitcast i8* %1328 to i16*
  store i16 %1332, i16* %1333, align 2
  %1334 = getelementptr i8, i8* %1305, i32 14
  br i1 %109, label %1335, label %1353

1335:                                             ; preds = %1303
  %1336 = shl nuw nsw i32 %1289, 11
  %1337 = add nuw nsw i32 %1336, 17664
  %1338 = and i32 %1337, 64768
  %1339 = shl nuw nsw i32 %1269, 16
  %1340 = or i32 %1339, %1338
  %1341 = or i32 %1340, 137
  %1342 = bitcast i8* %1334 to i32*
  store i32 %1341, i32* %1342, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1343 = getelementptr i8, i8* %1305, i32 17
  %1344 = shl nuw nsw i32 %1288, 11
  %1345 = add nuw nsw i32 %1344, 17664
  %1346 = and i32 %1345, 64768
  %1347 = zext i8 %1287 to i32
  %1348 = shl nuw nsw i32 %1347, 16
  %1349 = or i32 %1348, %1346
  %1350 = or i32 %1349, 137
  %1351 = bitcast i8* %1343 to i32*
  store i32 %1350, i32* %1351, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1352 = getelementptr i8, i8* %1305, i32 20
  br label %1353

1353:                                             ; preds = %1335, %1303
  %1354 = phi i8* [ %1352, %1335 ], [ %1334, %1303 ]
  %1355 = ptrtoint i8* %1354 to i32
  br label %3149

1356:                                             ; preds = %90
  %1357 = inttoptr i32 %97 to i8*
  %1358 = load i8, i8* %113, align 1
  %1359 = zext i8 %1358 to i32
  br i1 %109, label %1364, label %1360

1360:                                             ; preds = %1356
  %1361 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1362 = load i8, i8* %1361, align 1
  %1363 = zext i8 %1362 to i32
  br label %1376

1364:                                             ; preds = %1356
  %1365 = shl nuw nsw i32 %1359, 16
  %1366 = or i32 %1365, 17803
  %1367 = inttoptr i32 %97 to i32*
  store i32 %1366, i32* %1367, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1368 = getelementptr i8, i8* %1357, i32 3
  %1369 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1370 = load i8, i8* %1369, align 1
  %1371 = zext i8 %1370 to i32
  %1372 = shl nuw nsw i32 %1371, 16
  %1373 = or i32 %1372, 21899
  %1374 = bitcast i8* %1368 to i32*
  store i32 %1373, i32* %1374, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1375 = getelementptr i8, i8* %1357, i32 6
  br label %1376

1376:                                             ; preds = %1364, %1360
  %1377 = phi i8 [ %1370, %1364 ], [ %1362, %1360 ]
  %1378 = phi i32 [ 2, %1364 ], [ %1363, %1360 ]
  %1379 = phi i32 [ 0, %1364 ], [ %1359, %1360 ]
  %1380 = phi i8* [ %1375, %1364 ], [ %1357, %1360 ]
  %1381 = load i8, i8* %114, align 1
  br i1 %112, label %1382, label %1387

1382:                                             ; preds = %1376
  %1383 = zext i8 %1381 to i32
  %1384 = shl nuw nsw i32 %1383, 16
  %1385 = or i32 %1384, 19851
  %1386 = bitcast i8* %1380 to i32*
  store i32 %1385, i32* %1386, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1393

1387:                                             ; preds = %1376
  %1388 = add i8 %1381, -56
  %1389 = zext i8 %1388 to i16
  %1390 = shl nuw i16 %1389, 8
  %1391 = or i16 %1390, 139
  %1392 = bitcast i8* %1380 to i16*
  store i16 %1391, i16* %1392, align 2
  br label %1393

1393:                                             ; preds = %1387, %1382
  %1394 = phi i32 [ 2, %1387 ], [ 3, %1382 ]
  %1395 = getelementptr i8, i8* %1380, i32 %1394
  %1396 = add nuw nsw i32 %1379, 192
  %1397 = shl nuw nsw i32 %1378, 3
  %1398 = add nuw nsw i32 %1396, %1397
  %1399 = shl nuw nsw i32 %1398, 16
  %1400 = and i32 %1399, 16711680
  %1401 = or i32 %1400, 44303
  %1402 = bitcast i8* %1395 to i32*
  store i32 %1401, i32* %1402, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1403 = getelementptr i8, i8* %1395, i32 3
  %1404 = shl nuw nsw i32 %1378, 8
  %1405 = add nuw nsw i32 %1404, 63488
  %1406 = trunc i32 %1405 to i16
  %1407 = or i16 %1406, 211
  %1408 = bitcast i8* %1403 to i16*
  store i16 %1407, i16* %1408, align 2
  %1409 = getelementptr i8, i8* %1395, i32 5
  %1410 = bitcast i8* %1409 to i32*
  store i32 2161027, i32* %1410, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1411 = getelementptr i8, i8* %1395, i32 8
  %1412 = bitcast i8* %1411 to i16*
  store i16 1394, i16* %1412, align 2
  %1413 = getelementptr i8, i8* %1395, i32 10
  %1414 = trunc i32 %1398 to i16
  %1415 = shl i16 %1414, 8
  %1416 = or i16 %1415, 137
  %1417 = bitcast i8* %1413 to i16*
  store i16 %1416, i16* %1417, align 2
  %1418 = getelementptr i8, i8* %1395, i32 12
  %1419 = or i32 %1405, 2031809
  %1420 = bitcast i8* %1418 to i32*
  store i32 %1419, i32* %1420, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1421 = getelementptr i8, i8* %1395, i32 15
  br i1 %109, label %1422, label %1440

1422:                                             ; preds = %1393
  %1423 = shl nuw nsw i32 %1379, 11
  %1424 = add nuw nsw i32 %1423, 17664
  %1425 = and i32 %1424, 64768
  %1426 = shl nuw nsw i32 %1359, 16
  %1427 = or i32 %1426, %1425
  %1428 = or i32 %1427, 137
  %1429 = bitcast i8* %1421 to i32*
  store i32 %1428, i32* %1429, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1430 = getelementptr i8, i8* %1395, i32 18
  %1431 = shl nuw nsw i32 %1378, 11
  %1432 = add nuw nsw i32 %1431, 17664
  %1433 = and i32 %1432, 64768
  %1434 = zext i8 %1377 to i32
  %1435 = shl nuw nsw i32 %1434, 16
  %1436 = or i32 %1435, %1433
  %1437 = or i32 %1436, 137
  %1438 = bitcast i8* %1430 to i32*
  store i32 %1437, i32* %1438, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1439 = getelementptr i8, i8* %1395, i32 21
  br label %1440

1440:                                             ; preds = %1422, %1393
  %1441 = phi i8* [ %1439, %1422 ], [ %1421, %1393 ]
  %1442 = ptrtoint i8* %1441 to i32
  br label %3149

1443:                                             ; preds = %90
  %1444 = icmp sgt i32 %99, 63
  br i1 %1444, label %3173, label %1445, !prof !3, !misexpect !4

1445:                                             ; preds = %1443
  %1446 = inttoptr i32 %97 to i8*
  %1447 = load i8, i8* %113, align 1
  %1448 = zext i8 %1447 to i32
  br i1 %109, label %1453, label %1449

1449:                                             ; preds = %1445
  %1450 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1451 = load i8, i8* %1450, align 1
  %1452 = zext i8 %1451 to i32
  br label %1465

1453:                                             ; preds = %1445
  %1454 = shl nuw nsw i32 %1448, 16
  %1455 = or i32 %1454, 17803
  %1456 = inttoptr i32 %97 to i32*
  store i32 %1455, i32* %1456, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1457 = getelementptr i8, i8* %1446, i32 3
  %1458 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1459 = load i8, i8* %1458, align 1
  %1460 = zext i8 %1459 to i32
  %1461 = shl nuw nsw i32 %1460, 16
  %1462 = or i32 %1461, 21899
  %1463 = bitcast i8* %1457 to i32*
  store i32 %1462, i32* %1463, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1464 = getelementptr i8, i8* %1446, i32 6
  br label %1465

1465:                                             ; preds = %1453, %1449
  %1466 = phi i8 [ %1459, %1453 ], [ %1451, %1449 ]
  %1467 = phi i32 [ 2, %1453 ], [ %1452, %1449 ]
  %1468 = phi i32 [ 0, %1453 ], [ %1448, %1449 ]
  %1469 = phi i8* [ %1464, %1453 ], [ %1446, %1449 ]
  %1470 = icmp ult i32 %99, 32
  br i1 %1470, label %1471, label %1489

1471:                                             ; preds = %1465
  %1472 = add nuw nsw i32 %1468, 192
  %1473 = shl nuw nsw i32 %1467, 3
  %1474 = add nuw nsw i32 %1472, %1473
  %1475 = shl nuw nsw i32 %1474, 16
  %1476 = and i32 %1475, 16711680
  %1477 = shl nuw nsw i32 %99, 24
  %1478 = or i32 %1477, %1476
  %1479 = or i32 %1478, 44047
  %1480 = bitcast i8* %1469 to i32*
  store i32 %1479, i32* %1480, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1481 = getelementptr i8, i8* %1469, i32 4
  %1482 = shl nuw nsw i32 %1467, 8
  %1483 = add nuw nsw i32 %1482, 63488
  %1484 = and i32 %1483, 65280
  %1485 = shl nuw nsw i32 %99, 16
  %1486 = or i32 %1485, %1484
  %1487 = or i32 %1486, 193
  %1488 = bitcast i8* %1481 to i32*
  store i32 %1487, i32* %1488, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1522

1489:                                             ; preds = %1465
  %1490 = icmp ult i32 %99, 64
  %1491 = shl nuw nsw i32 %1467, 8
  %1492 = add nuw nsw i32 %1491, 63488
  br i1 %1490, label %1493, label %1511

1493:                                             ; preds = %1489
  %1494 = and i32 %1492, 65280
  %1495 = shl nuw nsw i32 %99, 16
  %1496 = add nsw i32 %1495, -2097152
  %1497 = or i32 %1496, %1494
  %1498 = or i32 %1497, 193
  %1499 = bitcast i8* %1469 to i32*
  store i32 %1498, i32* %1499, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1500 = getelementptr i8, i8* %1469, i32 3
  %1501 = add nuw nsw i32 %1468, 192
  %1502 = shl nuw nsw i32 %1467, 3
  %1503 = add nuw nsw i32 %1501, %1502
  %1504 = trunc i32 %1503 to i16
  %1505 = shl i16 %1504, 8
  %1506 = or i16 %1505, 137
  %1507 = bitcast i8* %1500 to i16*
  store i16 %1506, i16* %1507, align 2
  %1508 = getelementptr i8, i8* %1469, i32 5
  %1509 = or i32 %1492, 2031809
  %1510 = bitcast i8* %1508 to i32*
  store i32 %1509, i32* %1510, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1522

1511:                                             ; preds = %1489
  %1512 = or i32 %1492, 2031809
  %1513 = bitcast i8* %1469 to i32*
  store i32 %1512, i32* %1513, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1514 = getelementptr i8, i8* %1469, i32 3
  %1515 = add nuw nsw i32 %1468, 192
  %1516 = shl nuw nsw i32 %1467, 3
  %1517 = add nuw nsw i32 %1515, %1516
  %1518 = trunc i32 %1517 to i16
  %1519 = shl i16 %1518, 8
  %1520 = or i16 %1519, 137
  %1521 = bitcast i8* %1514 to i16*
  store i16 %1520, i16* %1521, align 2
  br label %1522

1522:                                             ; preds = %1511, %1493, %1471
  %1523 = phi i32 [ 5, %1511 ], [ 8, %1493 ], [ 7, %1471 ]
  %1524 = getelementptr i8, i8* %1469, i32 %1523
  br i1 %109, label %1525, label %1543

1525:                                             ; preds = %1522
  %1526 = shl nuw nsw i32 %1468, 11
  %1527 = add nuw nsw i32 %1526, 17664
  %1528 = and i32 %1527, 64768
  %1529 = shl nuw nsw i32 %1448, 16
  %1530 = or i32 %1529, %1528
  %1531 = or i32 %1530, 137
  %1532 = bitcast i8* %1524 to i32*
  store i32 %1531, i32* %1532, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1533 = getelementptr i8, i8* %1524, i32 3
  %1534 = shl nuw nsw i32 %1467, 11
  %1535 = add nuw nsw i32 %1534, 17664
  %1536 = and i32 %1535, 64768
  %1537 = zext i8 %1466 to i32
  %1538 = shl nuw nsw i32 %1537, 16
  %1539 = or i32 %1538, %1536
  %1540 = or i32 %1539, 137
  %1541 = bitcast i8* %1533 to i32*
  store i32 %1540, i32* %1541, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1542 = getelementptr i8, i8* %1524, i32 6
  br label %1543

1543:                                             ; preds = %1525, %1522
  %1544 = phi i8* [ %1542, %1525 ], [ %1524, %1522 ]
  %1545 = ptrtoint i8* %1544 to i32
  br label %3149

1546:                                             ; preds = %90
  %1547 = load i8, i8* %113, align 1
  %1548 = inttoptr i32 %97 to i8*
  %1549 = select i1 %109, i8 0, i8 %1547
  br i1 %109, label %1556, label %1550

1550:                                             ; preds = %1546
  %1551 = add i8 %1549, -40
  %1552 = zext i8 %1551 to i16
  %1553 = shl nuw i16 %1552, 8
  %1554 = or i16 %1553, 247
  %1555 = inttoptr i32 %97 to i16*
  store i16 %1554, i16* %1555, align 2
  br label %1575

1556:                                             ; preds = %1546
  %1557 = zext i8 %1547 to i32
  %1558 = shl nuw nsw i32 %1557, 16
  %1559 = or i32 %1558, 17803
  %1560 = inttoptr i32 %97 to i32*
  store i32 %1559, i32* %1560, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1561 = getelementptr i8, i8* %1548, i32 3
  %1562 = add i8 %1549, -40
  %1563 = zext i8 %1562 to i16
  %1564 = shl nuw i16 %1563, 8
  %1565 = or i16 %1564, 247
  %1566 = bitcast i8* %1561 to i16*
  store i16 %1565, i16* %1566, align 2
  %1567 = getelementptr i8, i8* %1548, i32 5
  %1568 = shl i8 %1549, 3
  %1569 = add i8 %1568, 69
  %1570 = zext i8 %1569 to i32
  %1571 = shl nuw nsw i32 %1570, 8
  %1572 = or i32 %1558, %1571
  %1573 = or i32 %1572, 137
  %1574 = bitcast i8* %1567 to i32*
  store i32 %1573, i32* %1574, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1575

1575:                                             ; preds = %1556, %1550
  %1576 = phi i32 [ 8, %1556 ], [ 2, %1550 ]
  %1577 = getelementptr i8, i8* %1548, i32 %1576
  %1578 = ptrtoint i8* %1577 to i32
  %1579 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %1580 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1579, i32 0, i32 13
  %1581 = load i8, i8* %1580, align 8, !range !6
  %1582 = icmp eq i8 %1581, 0
  br i1 %1582, label %1583, label %3149

1583:                                             ; preds = %1575
  %1584 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1585 = load i8, i8* %1584, align 1
  br i1 %109, label %1586, label %1593

1586:                                             ; preds = %1583
  %1587 = bitcast i8* %1577 to i16*
  store i16 -16333, i16* %1587, align 2
  %1588 = getelementptr i8, i8* %1577, i32 2
  %1589 = zext i8 %1585 to i32
  %1590 = shl nuw nsw i32 %1589, 16
  %1591 = or i32 %1590, 17801
  %1592 = bitcast i8* %1588 to i32*
  store i32 %1591, i32* %1592, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1601

1593:                                             ; preds = %1583
  %1594 = add i8 %1585, -64
  %1595 = shl i8 %1585, 3
  %1596 = add i8 %1594, %1595
  %1597 = zext i8 %1596 to i16
  %1598 = shl nuw i16 %1597, 8
  %1599 = or i16 %1598, 51
  %1600 = bitcast i8* %1577 to i16*
  store i16 %1599, i16* %1600, align 2
  br label %1601

1601:                                             ; preds = %1593, %1586
  %1602 = phi i32 [ 2, %1593 ], [ 5, %1586 ]
  %1603 = getelementptr i8, i8* %1577, i32 %1602
  %1604 = ptrtoint i8* %1603 to i32
  br label %3149

1605:                                             ; preds = %90
  %1606 = inttoptr i32 %97 to i8*
  %1607 = load i8, i8* %113, align 1
  %1608 = zext i8 %1607 to i32
  br i1 %109, label %1613, label %1609

1609:                                             ; preds = %1605
  %1610 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1611 = load i8, i8* %1610, align 1
  %1612 = zext i8 %1611 to i32
  br label %1625

1613:                                             ; preds = %1605
  %1614 = shl nuw nsw i32 %1608, 16
  %1615 = or i32 %1614, 17803
  %1616 = inttoptr i32 %97 to i32*
  store i32 %1615, i32* %1616, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1617 = getelementptr i8, i8* %1606, i32 3
  %1618 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1619 = load i8, i8* %1618, align 1
  %1620 = zext i8 %1619 to i32
  %1621 = shl nuw nsw i32 %1620, 16
  %1622 = or i32 %1621, 21899
  %1623 = bitcast i8* %1617 to i32*
  store i32 %1622, i32* %1623, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1624 = getelementptr i8, i8* %1606, i32 6
  br label %1625

1625:                                             ; preds = %1613, %1609
  %1626 = phi i8 [ %1619, %1613 ], [ %1611, %1609 ]
  %1627 = phi i32 [ 2, %1613 ], [ %1612, %1609 ]
  %1628 = phi i32 [ 0, %1613 ], [ %1608, %1609 ]
  %1629 = phi i8* [ %1624, %1613 ], [ %1606, %1609 ]
  %1630 = trunc i32 %1628 to i16
  %1631 = shl nuw i16 %1630, 8
  %1632 = add i16 %1631, -10240
  %1633 = or i16 %1632, 247
  %1634 = bitcast i8* %1629 to i16*
  store i16 %1633, i16* %1634, align 2
  %1635 = getelementptr i8, i8* %1629, i32 2
  %1636 = shl nuw nsw i32 %1627, 8
  %1637 = add nuw nsw i32 %1636, 53248
  %1638 = and i32 %1637, 65280
  %1639 = or i32 %1638, 131
  %1640 = bitcast i8* %1635 to i32*
  store i32 %1639, i32* %1640, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1641 = getelementptr i8, i8* %1629, i32 5
  %1642 = trunc i32 %1627 to i16
  %1643 = shl nuw i16 %1642, 8
  %1644 = add i16 %1643, -10240
  %1645 = or i16 %1644, 247
  %1646 = bitcast i8* %1641 to i16*
  store i16 %1645, i16* %1646, align 2
  %1647 = getelementptr i8, i8* %1629, i32 7
  br i1 %109, label %1648, label %1666

1648:                                             ; preds = %1625
  %1649 = shl nuw nsw i32 %1628, 11
  %1650 = add nuw nsw i32 %1649, 17664
  %1651 = and i32 %1650, 64768
  %1652 = shl nuw nsw i32 %1608, 16
  %1653 = or i32 %1652, %1651
  %1654 = or i32 %1653, 137
  %1655 = bitcast i8* %1647 to i32*
  store i32 %1654, i32* %1655, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1656 = getelementptr i8, i8* %1629, i32 10
  %1657 = shl nuw nsw i32 %1627, 11
  %1658 = add nuw nsw i32 %1657, 17664
  %1659 = and i32 %1658, 64768
  %1660 = zext i8 %1626 to i32
  %1661 = shl nuw nsw i32 %1660, 16
  %1662 = or i32 %1661, %1659
  %1663 = or i32 %1662, 137
  %1664 = bitcast i8* %1656 to i32*
  store i32 %1663, i32* %1664, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1665 = getelementptr i8, i8* %1629, i32 13
  br label %1666

1666:                                             ; preds = %1648, %1625
  %1667 = phi i8* [ %1665, %1648 ], [ %1647, %1625 ]
  %1668 = ptrtoint i8* %1667 to i32
  br label %3149

1669:                                             ; preds = %90, %90
  %1670 = and i32 %102, 8
  %1671 = icmp eq i32 %1670, 0
  %1672 = inttoptr i32 %97 to i8*
  br i1 %1671, label %1796, label %1673

1673:                                             ; preds = %1669
  %1674 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1675 = load i8, i8* %1674, align 1
  br i1 %109, label %1676, label %1681

1676:                                             ; preds = %1673
  %1677 = zext i8 %1675 to i32
  %1678 = shl nuw nsw i32 %1677, 16
  %1679 = or i32 %1678, 17803
  %1680 = inttoptr i32 %97 to i32*
  store i32 %1679, i32* %1680, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1687

1681:                                             ; preds = %1673
  %1682 = add i8 %1675, -64
  %1683 = zext i8 %1682 to i16
  %1684 = shl nuw i16 %1683, 8
  %1685 = or i16 %1684, 139
  %1686 = inttoptr i32 %97 to i16*
  store i16 %1685, i16* %1686, align 2
  br label %1687

1687:                                             ; preds = %1681, %1676
  %1688 = phi i32 [ 2, %1681 ], [ 3, %1676 ]
  %1689 = getelementptr i8, i8* %1672, i32 %1688
  %1690 = load i8, i8* %114, align 1
  br i1 %112, label %1691, label %1696

1691:                                             ; preds = %1687
  %1692 = zext i8 %1690 to i32
  %1693 = shl nuw nsw i32 %1692, 16
  %1694 = or i32 %1693, 26103
  %1695 = bitcast i8* %1689 to i32*
  store i32 %1694, i32* %1695, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1702

1696:                                             ; preds = %1687
  %1697 = add i8 %1690, -32
  %1698 = zext i8 %1697 to i16
  %1699 = shl nuw i16 %1698, 8
  %1700 = or i16 %1699, 247
  %1701 = bitcast i8* %1689 to i16*
  store i16 %1700, i16* %1701, align 2
  br label %1702

1702:                                             ; preds = %1696, %1691
  %1703 = phi i32 [ 2, %1696 ], [ 3, %1691 ]
  %1704 = getelementptr i8, i8* %1689, i32 %1703
  %1705 = bitcast i8* %1704 to i16*
  store i16 -15991, i16* %1705, align 2
  %1706 = getelementptr i8, i8* %1704, i32 2
  %1707 = load i8, i8* %113, align 1
  br i1 %109, label %1708, label %1713

1708:                                             ; preds = %1702
  %1709 = zext i8 %1707 to i32
  %1710 = shl nuw nsw i32 %1709, 16
  %1711 = or i32 %1710, 17803
  %1712 = bitcast i8* %1706 to i32*
  store i32 %1711, i32* %1712, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1719

1713:                                             ; preds = %1702
  %1714 = add i8 %1707, -64
  %1715 = zext i8 %1714 to i16
  %1716 = shl nuw i16 %1715, 8
  %1717 = or i16 %1716, 139
  %1718 = bitcast i8* %1706 to i16*
  store i16 %1717, i16* %1718, align 2
  br label %1719

1719:                                             ; preds = %1713, %1708
  %1720 = phi i32 [ 4, %1713 ], [ 5, %1708 ]
  %1721 = getelementptr i8, i8* %1704, i32 %1720
  %1722 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %1723 = load i8, i8* %1722, align 1
  br i1 %112, label %1724, label %1729

1724:                                             ; preds = %1719
  %1725 = zext i8 %1723 to i32
  %1726 = shl nuw nsw i32 %1725, 16
  %1727 = or i32 %1726, 26103
  %1728 = bitcast i8* %1721 to i32*
  store i32 %1727, i32* %1728, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1735

1729:                                             ; preds = %1719
  %1730 = add i8 %1723, -32
  %1731 = zext i8 %1730 to i16
  %1732 = shl nuw i16 %1731, 8
  %1733 = or i16 %1732, 247
  %1734 = bitcast i8* %1721 to i16*
  store i16 %1733, i16* %1734, align 2
  br label %1735

1735:                                             ; preds = %1729, %1724
  %1736 = phi i32 [ 2, %1729 ], [ 3, %1724 ]
  %1737 = getelementptr i8, i8* %1721, i32 %1736
  %1738 = bitcast i8* %1737 to i16*
  store i16 -16127, i16* %1738, align 2
  %1739 = getelementptr i8, i8* %1737, i32 2
  br i1 %109, label %1740, label %1745

1740:                                             ; preds = %1735
  %1741 = zext i8 %1707 to i32
  %1742 = shl nuw nsw i32 %1741, 16
  %1743 = or i32 %1742, 17803
  %1744 = bitcast i8* %1739 to i32*
  store i32 %1743, i32* %1744, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1751

1745:                                             ; preds = %1735
  %1746 = add i8 %1707, -64
  %1747 = zext i8 %1746 to i16
  %1748 = shl nuw i16 %1747, 8
  %1749 = or i16 %1748, 139
  %1750 = bitcast i8* %1739 to i16*
  store i16 %1749, i16* %1750, align 2
  br label %1751

1751:                                             ; preds = %1745, %1740
  %1752 = phi i32 [ 4, %1745 ], [ 5, %1740 ]
  %1753 = getelementptr i8, i8* %1737, i32 %1752
  br i1 %112, label %1754, label %1759

1754:                                             ; preds = %1751
  %1755 = zext i8 %1690 to i32
  %1756 = shl nuw nsw i32 %1755, 16
  %1757 = or i32 %1756, 26103
  %1758 = bitcast i8* %1753 to i32*
  store i32 %1757, i32* %1758, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1765

1759:                                             ; preds = %1751
  %1760 = add i8 %1690, -32
  %1761 = zext i8 %1760 to i16
  %1762 = shl nuw i16 %1761, 8
  %1763 = or i16 %1762, 247
  %1764 = bitcast i8* %1753 to i16*
  store i16 %1763, i16* %1764, align 2
  br label %1765

1765:                                             ; preds = %1759, %1754
  %1766 = phi i32 [ 2, %1759 ], [ 3, %1754 ]
  %1767 = getelementptr i8, i8* %1753, i32 %1766
  %1768 = bitcast i8* %1767 to i16*
  store i16 -12031, i16* %1768, align 2
  %1769 = getelementptr i8, i8* %1767, i32 2
  br i1 %109, label %1770, label %1780

1770:                                             ; preds = %1765
  %1771 = zext i8 %1707 to i32
  %1772 = shl nuw nsw i32 %1771, 16
  %1773 = or i32 %1772, 17801
  %1774 = bitcast i8* %1769 to i32*
  store i32 %1773, i32* %1774, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1775 = getelementptr i8, i8* %1767, i32 5
  %1776 = zext i8 %1675 to i32
  %1777 = shl nuw nsw i32 %1776, 16
  %1778 = or i32 %1777, 19849
  %1779 = bitcast i8* %1775 to i32*
  store i32 %1778, i32* %1779, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1792

1780:                                             ; preds = %1765
  %1781 = add i8 %1707, -64
  %1782 = zext i8 %1781 to i16
  %1783 = shl nuw i16 %1782, 8
  %1784 = or i16 %1783, 137
  %1785 = bitcast i8* %1769 to i16*
  store i16 %1784, i16* %1785, align 2
  %1786 = getelementptr i8, i8* %1767, i32 4
  %1787 = add i8 %1675, -56
  %1788 = zext i8 %1787 to i16
  %1789 = shl nuw i16 %1788, 8
  %1790 = or i16 %1789, 137
  %1791 = bitcast i8* %1786 to i16*
  store i16 %1790, i16* %1791, align 2
  br label %1792

1792:                                             ; preds = %1780, %1770
  %1793 = phi i32 [ 6, %1780 ], [ 8, %1770 ]
  %1794 = getelementptr i8, i8* %1767, i32 %1793
  %1795 = ptrtoint i8* %1794 to i32
  br label %3149

1796:                                             ; preds = %1669
  %1797 = ashr i32 %99, 31
  %1798 = inttoptr i32 %97 to i16*
  store i16 -16185, i16* %1798, align 2
  %1799 = getelementptr i8, i8* %1672, i32 2
  %1800 = bitcast i8* %1799 to i32*
  store i32 %99, i32* %1800, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1801 = getelementptr i8, i8* %1672, i32 6
  %1802 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1803 = load i8, i8* %1802, align 1
  br i1 %109, label %1804, label %1809

1804:                                             ; preds = %1796
  %1805 = zext i8 %1803 to i32
  %1806 = shl nuw nsw i32 %1805, 16
  %1807 = or i32 %1806, 26103
  %1808 = bitcast i8* %1801 to i32*
  store i32 %1807, i32* %1808, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1815

1809:                                             ; preds = %1796
  %1810 = add i8 %1803, -32
  %1811 = zext i8 %1810 to i16
  %1812 = shl nuw i16 %1811, 8
  %1813 = or i16 %1812, 247
  %1814 = bitcast i8* %1801 to i16*
  store i16 %1813, i16* %1814, align 2
  br label %1815

1815:                                             ; preds = %1809, %1804
  %1816 = phi i32 [ 8, %1809 ], [ 9, %1804 ]
  %1817 = getelementptr i8, i8* %1672, i32 %1816
  %1818 = bitcast i8* %1817 to i16*
  store i16 -15991, i16* %1818, align 2
  %1819 = getelementptr i8, i8* %1817, i32 2
  %1820 = bitcast i8* %1819 to i16*
  store i16 -16185, i16* %1820, align 2
  %1821 = getelementptr i8, i8* %1817, i32 4
  %1822 = bitcast i8* %1821 to i32*
  store i32 %1797, i32* %1822, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1823 = getelementptr i8, i8* %1817, i32 8
  %1824 = load i8, i8* %113, align 1
  br i1 %109, label %1825, label %1830

1825:                                             ; preds = %1815
  %1826 = zext i8 %1824 to i32
  %1827 = shl nuw nsw i32 %1826, 16
  %1828 = or i32 %1827, 26103
  %1829 = bitcast i8* %1823 to i32*
  store i32 %1828, i32* %1829, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1836

1830:                                             ; preds = %1815
  %1831 = add i8 %1824, -32
  %1832 = zext i8 %1831 to i16
  %1833 = shl nuw i16 %1832, 8
  %1834 = or i16 %1833, 247
  %1835 = bitcast i8* %1823 to i16*
  store i16 %1834, i16* %1835, align 2
  br label %1836

1836:                                             ; preds = %1830, %1825
  %1837 = phi i32 [ 10, %1830 ], [ 11, %1825 ]
  %1838 = getelementptr i8, i8* %1817, i32 %1837
  %1839 = bitcast i8* %1838 to i16*
  store i16 -16127, i16* %1839, align 2
  %1840 = getelementptr i8, i8* %1838, i32 2
  %1841 = bitcast i8* %1840 to i16*
  store i16 -16185, i16* %1841, align 2
  %1842 = getelementptr i8, i8* %1838, i32 4
  %1843 = bitcast i8* %1842 to i32*
  store i32 %99, i32* %1843, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1844 = getelementptr i8, i8* %1838, i32 8
  br i1 %109, label %1845, label %1860

1845:                                             ; preds = %1836
  %1846 = zext i8 %1824 to i32
  %1847 = shl nuw nsw i32 %1846, 16
  %1848 = or i32 %1847, 26103
  %1849 = bitcast i8* %1844 to i32*
  store i32 %1848, i32* %1849, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1850 = getelementptr i8, i8* %1838, i32 11
  %1851 = bitcast i8* %1850 to i16*
  store i16 -12031, i16* %1851, align 2
  %1852 = getelementptr i8, i8* %1838, i32 13
  %1853 = or i32 %1847, 17801
  %1854 = bitcast i8* %1852 to i32*
  store i32 %1853, i32* %1854, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1855 = getelementptr i8, i8* %1838, i32 16
  %1856 = zext i8 %1803 to i32
  %1857 = shl nuw nsw i32 %1856, 16
  %1858 = or i32 %1857, 19849
  %1859 = bitcast i8* %1855 to i32*
  store i32 %1858, i32* %1859, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %1880

1860:                                             ; preds = %1836
  %1861 = add i8 %1824, -32
  %1862 = zext i8 %1861 to i16
  %1863 = shl nuw i16 %1862, 8
  %1864 = or i16 %1863, 247
  %1865 = bitcast i8* %1844 to i16*
  store i16 %1864, i16* %1865, align 2
  %1866 = getelementptr i8, i8* %1838, i32 10
  %1867 = bitcast i8* %1866 to i16*
  store i16 -12031, i16* %1867, align 2
  %1868 = getelementptr i8, i8* %1838, i32 12
  %1869 = add i8 %1824, -64
  %1870 = zext i8 %1869 to i16
  %1871 = shl nuw i16 %1870, 8
  %1872 = or i16 %1871, 137
  %1873 = bitcast i8* %1868 to i16*
  store i16 %1872, i16* %1873, align 2
  %1874 = getelementptr i8, i8* %1838, i32 14
  %1875 = add i8 %1803, -56
  %1876 = zext i8 %1875 to i16
  %1877 = shl nuw i16 %1876, 8
  %1878 = or i16 %1877, 137
  %1879 = bitcast i8* %1874 to i16*
  store i16 %1878, i16* %1879, align 2
  br label %1880

1880:                                             ; preds = %1860, %1845
  %1881 = phi i32 [ 16, %1860 ], [ 19, %1845 ]
  %1882 = getelementptr i8, i8* %1838, i32 %1881
  %1883 = ptrtoint i8* %1882 to i32
  br label %3149

1884:                                             ; preds = %90
  %1885 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %1886 = inttoptr i32 %97 to i8*
  br i1 %109, label %1893, label %1887

1887:                                             ; preds = %1884
  %1888 = load i8, i8* %113, align 1
  %1889 = zext i8 %1888 to i32
  %1890 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1891 = load i8, i8* %1890, align 1
  %1892 = zext i8 %1891 to i32
  br label %1909

1893:                                             ; preds = %1884
  %1894 = icmp eq i32 %99, 64
  br i1 %1894, label %1971, label %1895

1895:                                             ; preds = %1893
  %1896 = load i8, i8* %113, align 1
  %1897 = zext i8 %1896 to i32
  %1898 = shl nuw nsw i32 %1897, 16
  %1899 = or i32 %1898, 17803
  %1900 = inttoptr i32 %97 to i32*
  store i32 %1899, i32* %1900, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1901 = getelementptr i8, i8* %1886, i32 3
  %1902 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1903 = load i8, i8* %1902, align 1
  %1904 = zext i8 %1903 to i32
  %1905 = shl nuw nsw i32 %1904, 16
  %1906 = or i32 %1905, 21899
  %1907 = bitcast i8* %1901 to i32*
  store i32 %1906, i32* %1907, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1908 = getelementptr i8, i8* %1886, i32 6
  br label %1909

1909:                                             ; preds = %1895, %1887
  %1910 = phi i8 [ %1903, %1895 ], [ %1891, %1887 ]
  %1911 = phi i8 [ %1896, %1895 ], [ %1888, %1887 ]
  %1912 = phi i1 [ true, %1895 ], [ false, %1887 ]
  %1913 = phi i32 [ 2, %1895 ], [ %1892, %1887 ]
  %1914 = phi i32 [ 0, %1895 ], [ %1889, %1887 ]
  %1915 = phi i8* [ %1908, %1895 ], [ %1886, %1887 ]
  switch i32 %99, label %1949 [
    i32 16, label %1916
    i32 32, label %1936
  ]

1916:                                             ; preds = %1909
  %1917 = bitcast i8* %1915 to i16*
  store i16 -18673, i16* %1917, align 2
  %1918 = getelementptr i8, i8* %1915, i32 2
  %1919 = add nuw nsw i32 %1914, 192
  %1920 = shl nuw nsw i32 %1914, 3
  %1921 = add nuw nsw i32 %1919, %1920
  %1922 = trunc i32 %1921 to i8
  store i8 %1922, i8* %1918, align 1
  %1923 = getelementptr i8, i8* %1915, i32 3
  %1924 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1885, i32 0, i32 13
  %1925 = load i8, i8* %1924, align 8, !range !6
  %1926 = icmp eq i8 %1925, 0
  br i1 %1926, label %1927, label %1949

1927:                                             ; preds = %1916
  %1928 = add nuw nsw i32 %1913, 192
  %1929 = shl nuw nsw i32 %1913, 3
  %1930 = add nuw nsw i32 %1928, %1929
  %1931 = trunc i32 %1930 to i16
  %1932 = shl i16 %1931, 8
  %1933 = or i16 %1932, 51
  %1934 = bitcast i8* %1923 to i16*
  store i16 %1933, i16* %1934, align 2
  %1935 = getelementptr i8, i8* %1915, i32 5
  br i1 %1912, label %1951, label %1971

1936:                                             ; preds = %1909
  %1937 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1885, i32 0, i32 13
  %1938 = load i8, i8* %1937, align 8, !range !6
  %1939 = icmp eq i8 %1938, 0
  br i1 %1939, label %1940, label %1949

1940:                                             ; preds = %1936
  %1941 = add nuw nsw i32 %1913, 192
  %1942 = shl nuw nsw i32 %1913, 3
  %1943 = add nuw nsw i32 %1941, %1942
  %1944 = trunc i32 %1943 to i16
  %1945 = shl i16 %1944, 8
  %1946 = or i16 %1945, 51
  %1947 = bitcast i8* %1915 to i16*
  store i16 %1946, i16* %1947, align 2
  %1948 = getelementptr i8, i8* %1915, i32 2
  br i1 %1912, label %1951, label %1971

1949:                                             ; preds = %1936, %1916, %1909
  %1950 = phi i8* [ %1915, %1909 ], [ %1915, %1936 ], [ %1923, %1916 ]
  br i1 %1912, label %1951, label %1971

1951:                                             ; preds = %1949, %1940, %1927
  %1952 = phi i8* [ %1948, %1940 ], [ %1950, %1949 ], [ %1935, %1927 ]
  %1953 = shl nuw nsw i32 %1914, 11
  %1954 = add nuw nsw i32 %1953, 17664
  %1955 = and i32 %1954, 64768
  %1956 = zext i8 %1911 to i32
  %1957 = shl nuw nsw i32 %1956, 16
  %1958 = or i32 %1957, %1955
  %1959 = or i32 %1958, 137
  %1960 = bitcast i8* %1952 to i32*
  store i32 %1959, i32* %1960, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1961 = getelementptr i8, i8* %1952, i32 3
  %1962 = shl nuw nsw i32 %1913, 11
  %1963 = add nuw nsw i32 %1962, 17664
  %1964 = and i32 %1963, 64768
  %1965 = zext i8 %1910 to i32
  %1966 = shl nuw nsw i32 %1965, 16
  %1967 = or i32 %1966, %1964
  %1968 = or i32 %1967, 137
  %1969 = bitcast i8* %1961 to i32*
  store i32 %1968, i32* %1969, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1970 = getelementptr i8, i8* %1952, i32 6
  br label %1971

1971:                                             ; preds = %1951, %1949, %1940, %1927, %1893
  %1972 = phi i8* [ %1970, %1951 ], [ %1950, %1949 ], [ %1948, %1940 ], [ %1935, %1927 ], [ %1886, %1893 ]
  %1973 = ptrtoint i8* %1972 to i32
  br label %3149

1974:                                             ; preds = %90
  %1975 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %1976 = inttoptr i32 %97 to i8*
  %1977 = load i8, i8* %113, align 1
  %1978 = zext i8 %1977 to i32
  br i1 %109, label %1983, label %1979

1979:                                             ; preds = %1974
  %1980 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1981 = load i8, i8* %1980, align 1
  %1982 = zext i8 %1981 to i32
  br label %1995

1983:                                             ; preds = %1974
  %1984 = shl nuw nsw i32 %1978, 16
  %1985 = or i32 %1984, 17803
  %1986 = inttoptr i32 %97 to i32*
  store i32 %1985, i32* %1986, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1987 = getelementptr i8, i8* %1976, i32 3
  %1988 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %1989 = load i8, i8* %1988, align 1
  %1990 = zext i8 %1989 to i32
  %1991 = shl nuw nsw i32 %1990, 16
  %1992 = or i32 %1991, 21899
  %1993 = bitcast i8* %1987 to i32*
  store i32 %1992, i32* %1993, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %1994 = getelementptr i8, i8* %1976, i32 6
  br label %1995

1995:                                             ; preds = %1983, %1979
  %1996 = phi i8 [ %1989, %1983 ], [ %1981, %1979 ]
  %1997 = phi i32 [ 2, %1983 ], [ %1982, %1979 ]
  %1998 = phi i32 [ 0, %1983 ], [ %1978, %1979 ]
  %1999 = phi i8* [ %1994, %1983 ], [ %1976, %1979 ]
  switch i32 %99, label %2073 [
    i32 16, label %2000
    i32 32, label %2027
    i32 64, label %2044
  ]

2000:                                             ; preds = %1995
  store i8 102, i8* %1999, align 1
  %2001 = getelementptr i8, i8* %1999, i32 1
  %2002 = shl nuw nsw i32 %1998, 8
  %2003 = add nuw nsw i32 %2002, 51200
  %2004 = and i32 %2003, 65280
  %2005 = or i32 %2004, 524481
  %2006 = bitcast i8* %2001 to i32*
  store i32 %2005, i32* %2006, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2007 = getelementptr i8, i8* %1999, i32 4
  %2008 = bitcast i8* %2007 to i16*
  store i16 -18673, i16* %2008, align 2
  %2009 = getelementptr i8, i8* %1999, i32 6
  %2010 = add nuw nsw i32 %1998, 192
  %2011 = shl nuw nsw i32 %1998, 3
  %2012 = add nuw nsw i32 %2010, %2011
  %2013 = trunc i32 %2012 to i8
  store i8 %2013, i8* %2009, align 1
  %2014 = getelementptr i8, i8* %1999, i32 7
  %2015 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1975, i32 0, i32 13
  %2016 = load i8, i8* %2015, align 8, !range !6
  %2017 = icmp eq i8 %2016, 0
  br i1 %2017, label %2018, label %2073

2018:                                             ; preds = %2000
  %2019 = add nuw nsw i32 %1997, 192
  %2020 = shl nuw nsw i32 %1997, 3
  %2021 = add nuw nsw i32 %2019, %2020
  %2022 = trunc i32 %2021 to i16
  %2023 = shl i16 %2022, 8
  %2024 = or i16 %2023, 51
  %2025 = bitcast i8* %2014 to i16*
  store i16 %2024, i16* %2025, align 2
  %2026 = getelementptr i8, i8* %1999, i32 9
  br label %2073

2027:                                             ; preds = %1995
  store i8 15, i8* %1999, align 1
  %2028 = getelementptr i8, i8* %1999, i32 1
  %2029 = trunc i32 %1998 to i8
  %2030 = add i8 %2029, -56
  store i8 %2030, i8* %2028, align 1
  %2031 = getelementptr i8, i8* %1999, i32 2
  %2032 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %1975, i32 0, i32 13
  %2033 = load i8, i8* %2032, align 8, !range !6
  %2034 = icmp eq i8 %2033, 0
  br i1 %2034, label %2035, label %2073

2035:                                             ; preds = %2027
  %2036 = add nuw nsw i32 %1997, 192
  %2037 = shl nuw nsw i32 %1997, 3
  %2038 = add nuw nsw i32 %2036, %2037
  %2039 = trunc i32 %2038 to i16
  %2040 = shl i16 %2039, 8
  %2041 = or i16 %2040, 51
  %2042 = bitcast i8* %2031 to i16*
  store i16 %2041, i16* %2042, align 2
  %2043 = getelementptr i8, i8* %1999, i32 4
  br label %2073

2044:                                             ; preds = %1995
  store i8 15, i8* %1999, align 1
  %2045 = getelementptr i8, i8* %1999, i32 1
  %2046 = trunc i32 %1998 to i8
  %2047 = add i8 %2046, -56
  store i8 %2047, i8* %2045, align 1
  %2048 = getelementptr i8, i8* %1999, i32 2
  store i8 15, i8* %2048, align 1
  %2049 = getelementptr i8, i8* %1999, i32 3
  %2050 = trunc i32 %1997 to i8
  %2051 = add i8 %2050, -56
  store i8 %2051, i8* %2049, align 1
  %2052 = getelementptr i8, i8* %1999, i32 4
  %2053 = trunc i32 %1997 to i16
  %2054 = shl i16 %2053, 11
  %2055 = add i16 %2054, -16128
  %2056 = or i16 %2055, 137
  %2057 = bitcast i8* %2052 to i16*
  store i16 %2056, i16* %2057, align 2
  %2058 = getelementptr i8, i8* %1999, i32 6
  %2059 = add nuw nsw i32 %1997, 192
  %2060 = shl nuw nsw i32 %1998, 3
  %2061 = add nuw nsw i32 %2059, %2060
  %2062 = trunc i32 %2061 to i16
  %2063 = shl i16 %2062, 8
  %2064 = or i16 %2063, 137
  %2065 = bitcast i8* %2058 to i16*
  store i16 %2064, i16* %2065, align 2
  %2066 = getelementptr i8, i8* %1999, i32 8
  %2067 = trunc i32 %1998 to i16
  %2068 = shl nuw i16 %2067, 8
  %2069 = add i16 %2068, -14336
  %2070 = or i16 %2069, 137
  %2071 = bitcast i8* %2066 to i16*
  store i16 %2070, i16* %2071, align 2
  %2072 = getelementptr i8, i8* %1999, i32 10
  br label %2073

2073:                                             ; preds = %2044, %2035, %2027, %2018, %2000, %1995
  %2074 = phi i8* [ %1999, %1995 ], [ %2072, %2044 ], [ %2031, %2027 ], [ %2043, %2035 ], [ %2014, %2000 ], [ %2026, %2018 ]
  br i1 %109, label %2075, label %2093

2075:                                             ; preds = %2073
  %2076 = shl nuw nsw i32 %1998, 11
  %2077 = add nuw nsw i32 %2076, 17664
  %2078 = and i32 %2077, 64768
  %2079 = shl nuw nsw i32 %1978, 16
  %2080 = or i32 %2079, %2078
  %2081 = or i32 %2080, 137
  %2082 = bitcast i8* %2074 to i32*
  store i32 %2081, i32* %2082, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2083 = getelementptr i8, i8* %2074, i32 3
  %2084 = shl nuw nsw i32 %1997, 11
  %2085 = add nuw nsw i32 %2084, 17664
  %2086 = and i32 %2085, 64768
  %2087 = zext i8 %1996 to i32
  %2088 = shl nuw nsw i32 %2087, 16
  %2089 = or i32 %2088, %2086
  %2090 = or i32 %2089, 137
  %2091 = bitcast i8* %2083 to i32*
  store i32 %2090, i32* %2091, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2092 = getelementptr i8, i8* %2074, i32 6
  br label %2093

2093:                                             ; preds = %2075, %2073
  %2094 = phi i8* [ %2092, %2075 ], [ %2074, %2073 ]
  %2095 = ptrtoint i8* %2094 to i32
  br label %3149

2096:                                             ; preds = %90
  %2097 = getelementptr %struct.bpf_insn, %struct.bpf_insn* %93, i32 1
  %2098 = getelementptr %struct.bpf_insn, %struct.bpf_insn* %93, i32 1, i32 3
  %2099 = load i32, i32* %2098, align 4
  %2100 = load i8, i8* %113, align 1
  %2101 = inttoptr i32 %97 to i8*
  %2102 = icmp eq i32 %99, 0
  br i1 %109, label %2103, label %2118

2103:                                             ; preds = %2096
  br i1 %2102, label %2104, label %2111

2104:                                             ; preds = %2103
  %2105 = inttoptr i32 %97 to i16*
  store i16 -16333, i16* %2105, align 2
  %2106 = getelementptr i8, i8* %2101, i32 2
  %2107 = zext i8 %2100 to i32
  %2108 = shl nuw nsw i32 %2107, 16
  %2109 = or i32 %2108, 17801
  %2110 = bitcast i8* %2106 to i32*
  store i32 %2109, i32* %2110, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2134

2111:                                             ; preds = %2103
  %2112 = zext i8 %2100 to i32
  %2113 = shl nuw nsw i32 %2112, 16
  %2114 = or i32 %2113, 17863
  %2115 = inttoptr i32 %97 to i32*
  store i32 %2114, i32* %2115, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2116 = getelementptr i8, i8* %2101, i32 3
  %2117 = bitcast i8* %2116 to i32*
  store i32 %99, i32* %2117, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2134

2118:                                             ; preds = %2096
  %2119 = add i8 %2100, -64
  br i1 %2102, label %2120, label %2127

2120:                                             ; preds = %2118
  %2121 = shl i8 %2100, 3
  %2122 = add i8 %2119, %2121
  %2123 = zext i8 %2122 to i16
  %2124 = shl nuw i16 %2123, 8
  %2125 = or i16 %2124, 51
  %2126 = inttoptr i32 %97 to i16*
  store i16 %2125, i16* %2126, align 2
  br label %2156

2127:                                             ; preds = %2118
  %2128 = zext i8 %2119 to i16
  %2129 = shl nuw i16 %2128, 8
  %2130 = or i16 %2129, 199
  %2131 = inttoptr i32 %97 to i16*
  store i16 %2130, i16* %2131, align 2
  %2132 = getelementptr i8, i8* %2101, i32 2
  %2133 = bitcast i8* %2132 to i32*
  store i32 %99, i32* %2133, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2156

2134:                                             ; preds = %2111, %2104
  %2135 = phi i32 [ 7, %2111 ], [ 5, %2104 ]
  %2136 = getelementptr i8, i8* %2101, i32 %2135
  %2137 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2138 = load i8, i8* %2137, align 1
  %2139 = icmp eq i32 %2099, 0
  br i1 %2139, label %2140, label %2148

2140:                                             ; preds = %2134
  %2141 = bitcast i8* %2136 to i16*
  store i16 -16333, i16* %2141, align 2
  %2142 = getelementptr i8, i8* %2136, i32 2
  %2143 = zext i8 %2138 to i32
  %2144 = shl nuw nsw i32 %2143, 16
  %2145 = or i32 %2144, 17801
  %2146 = bitcast i8* %2142 to i32*
  store i32 %2145, i32* %2146, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2147 = getelementptr i8, i8* %2136, i32 5
  br label %2179

2148:                                             ; preds = %2134
  %2149 = zext i8 %2138 to i32
  %2150 = shl nuw nsw i32 %2149, 16
  %2151 = or i32 %2150, 17863
  %2152 = bitcast i8* %2136 to i32*
  store i32 %2151, i32* %2152, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2153 = getelementptr i8, i8* %2136, i32 3
  %2154 = bitcast i8* %2153 to i32*
  store i32 %2099, i32* %2154, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2155 = getelementptr i8, i8* %2136, i32 7
  br label %2179

2156:                                             ; preds = %2127, %2120
  %2157 = phi i32 [ 6, %2127 ], [ 2, %2120 ]
  %2158 = getelementptr i8, i8* %2101, i32 %2157
  %2159 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2160 = load i8, i8* %2159, align 1
  %2161 = icmp eq i32 %2099, 0
  %2162 = add i8 %2160, -64
  br i1 %2161, label %2163, label %2171

2163:                                             ; preds = %2156
  %2164 = shl i8 %2160, 3
  %2165 = add i8 %2162, %2164
  %2166 = zext i8 %2165 to i16
  %2167 = shl nuw i16 %2166, 8
  %2168 = or i16 %2167, 51
  %2169 = bitcast i8* %2158 to i16*
  store i16 %2168, i16* %2169, align 2
  %2170 = getelementptr i8, i8* %2158, i32 2
  br label %2179

2171:                                             ; preds = %2156
  %2172 = zext i8 %2162 to i16
  %2173 = shl nuw i16 %2172, 8
  %2174 = or i16 %2173, 199
  %2175 = bitcast i8* %2158 to i16*
  store i16 %2174, i16* %2175, align 2
  %2176 = getelementptr i8, i8* %2158, i32 2
  %2177 = bitcast i8* %2176 to i32*
  store i32 %2099, i32* %2177, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2178 = getelementptr i8, i8* %2158, i32 6
  br label %2179

2179:                                             ; preds = %2171, %2163, %2148, %2140
  %2180 = phi i8* [ %2147, %2140 ], [ %2155, %2148 ], [ %2170, %2163 ], [ %2178, %2171 ]
  %2181 = ptrtoint i8* %2180 to i32
  %2182 = add nsw i32 %96, 1
  br label %3149

2183:                                             ; preds = %90, %90, %90, %90
  %2184 = inttoptr i32 %97 to i8*
  %2185 = load i8, i8* %113, align 1
  br i1 %109, label %2186, label %2191

2186:                                             ; preds = %2183
  %2187 = zext i8 %2185 to i32
  %2188 = shl nuw nsw i32 %2187, 16
  %2189 = or i32 %2188, 17803
  %2190 = inttoptr i32 %97 to i32*
  store i32 %2189, i32* %2190, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2197

2191:                                             ; preds = %2183
  %2192 = add i8 %2185, -64
  %2193 = zext i8 %2192 to i16
  %2194 = shl nuw i16 %2193, 8
  %2195 = or i16 %2194, 139
  %2196 = inttoptr i32 %97 to i16*
  store i16 %2195, i16* %2196, align 2
  br label %2197

2197:                                             ; preds = %2191, %2186
  %2198 = phi i32 [ 2, %2191 ], [ 3, %2186 ]
  %2199 = getelementptr i8, i8* %2184, i32 %2198
  %2200 = and i32 %102, 24
  %2201 = lshr exact i32 %2200, 3
  switch i32 %2201, label %2206 [
    i32 2, label %2202
    i32 1, label %2203
    i32 0, label %2205
    i32 3, label %2205
  ]

2202:                                             ; preds = %2197
  store i8 -58, i8* %2199, align 1
  br label %2207

2203:                                             ; preds = %2197
  %2204 = bitcast i8* %2199 to i16*
  store i16 -14490, i16* %2204, align 2
  br label %2207

2205:                                             ; preds = %2197, %2197
  store i8 -57, i8* %2199, align 1
  br label %2207

2206:                                             ; preds = %2197
  unreachable

2207:                                             ; preds = %2205, %2203, %2202
  %2208 = phi i32 [ 1, %2205 ], [ 2, %2203 ], [ 1, %2202 ]
  %2209 = getelementptr i8, i8* %2199, i32 %2208
  %2210 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 2
  %2211 = load i16, i16* %2210, align 2
  %2212 = sext i16 %2211 to i32
  %2213 = add nsw i32 %2212, 128
  %2214 = icmp ult i32 %2213, 256
  br i1 %2214, label %2215, label %2219

2215:                                             ; preds = %2207
  %2216 = shl i16 %2211, 8
  %2217 = or i16 %2216, 64
  %2218 = bitcast i8* %2209 to i16*
  store i16 %2217, i16* %2218, align 2
  br label %2224

2219:                                             ; preds = %2207
  store i8 -128, i8* %2209, align 1
  %2220 = getelementptr i8, i8* %2209, i32 1
  %2221 = load i16, i16* %2210, align 2
  %2222 = sext i16 %2221 to i32
  %2223 = bitcast i8* %2220 to i32*
  store i32 %2222, i32* %2223, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2224

2224:                                             ; preds = %2219, %2215
  %2225 = phi i32 [ 5, %2219 ], [ 2, %2215 ]
  %2226 = getelementptr i8, i8* %2209, i32 %2225
  switch i32 %2201, label %2227 [
    i32 0, label %2233
    i32 1, label %2230
    i32 2, label %2228
    i32 3, label %2233
  ]

2227:                                             ; preds = %2224
  unreachable

2228:                                             ; preds = %2224
  %2229 = trunc i32 %99 to i8
  store i8 %2229, i8* %2226, align 1
  br label %2235

2230:                                             ; preds = %2224
  %2231 = trunc i32 %99 to i16
  %2232 = bitcast i8* %2226 to i16*
  store i16 %2231, i16* %2232, align 2
  br label %2235

2233:                                             ; preds = %2224, %2224
  %2234 = bitcast i8* %2226 to i32*
  store i32 %99, i32* %2234, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2235

2235:                                             ; preds = %2233, %2230, %2228
  %2236 = phi i32 [ 4, %2233 ], [ 2, %2230 ], [ 1, %2228 ]
  %2237 = getelementptr i8, i8* %2226, i32 %2236
  %2238 = ptrtoint i8* %2237 to i32
  %2239 = icmp eq i32 %2200, 24
  br i1 %2239, label %2240, label %3149

2240:                                             ; preds = %2235
  %2241 = ashr i32 %99, 31
  %2242 = bitcast i8* %2237 to i16*
  store i16 -32569, i16* %2242, align 2
  %2243 = getelementptr i8, i8* %2237, i32 2
  %2244 = load i16, i16* %2210, align 2
  %2245 = sext i16 %2244 to i32
  %2246 = add nsw i32 %2245, 4
  %2247 = bitcast i8* %2243 to i32*
  store i32 %2246, i32* %2247, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2248 = getelementptr i8, i8* %2237, i32 6
  %2249 = bitcast i8* %2248 to i32*
  store i32 %2241, i32* %2249, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2250 = getelementptr i8, i8* %2237, i32 10
  %2251 = ptrtoint i8* %2250 to i32
  br label %3149

2252:                                             ; preds = %90, %90, %90, %90
  %2253 = inttoptr i32 %97 to i8*
  %2254 = load i8, i8* %113, align 1
  br i1 %109, label %2255, label %2260

2255:                                             ; preds = %2252
  %2256 = zext i8 %2254 to i32
  %2257 = shl nuw nsw i32 %2256, 16
  %2258 = or i32 %2257, 17803
  %2259 = inttoptr i32 %97 to i32*
  store i32 %2258, i32* %2259, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2266

2260:                                             ; preds = %2252
  %2261 = add i8 %2254, -64
  %2262 = zext i8 %2261 to i16
  %2263 = shl nuw i16 %2262, 8
  %2264 = or i16 %2263, 139
  %2265 = inttoptr i32 %97 to i16*
  store i16 %2264, i16* %2265, align 2
  br label %2266

2266:                                             ; preds = %2260, %2255
  %2267 = phi i32 [ 2, %2260 ], [ 3, %2255 ]
  %2268 = getelementptr i8, i8* %2253, i32 %2267
  %2269 = load i8, i8* %114, align 1
  br i1 %112, label %2270, label %2275

2270:                                             ; preds = %2266
  %2271 = zext i8 %2269 to i32
  %2272 = shl nuw nsw i32 %2271, 16
  %2273 = or i32 %2272, 21899
  %2274 = bitcast i8* %2268 to i32*
  store i32 %2273, i32* %2274, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2281

2275:                                             ; preds = %2266
  %2276 = add i8 %2269, -48
  %2277 = zext i8 %2276 to i16
  %2278 = shl nuw i16 %2277, 8
  %2279 = or i16 %2278, 139
  %2280 = bitcast i8* %2268 to i16*
  store i16 %2279, i16* %2280, align 2
  br label %2281

2281:                                             ; preds = %2275, %2270
  %2282 = phi i32 [ 2, %2275 ], [ 3, %2270 ]
  %2283 = getelementptr i8, i8* %2268, i32 %2282
  %2284 = and i32 %102, 24
  %2285 = lshr exact i32 %2284, 3
  switch i32 %2285, label %2290 [
    i32 2, label %2286
    i32 1, label %2287
    i32 0, label %2289
    i32 3, label %2289
  ]

2286:                                             ; preds = %2281
  store i8 -120, i8* %2283, align 1
  br label %2291

2287:                                             ; preds = %2281
  %2288 = bitcast i8* %2283 to i16*
  store i16 -30362, i16* %2288, align 2
  br label %2291

2289:                                             ; preds = %2281, %2281
  store i8 -119, i8* %2283, align 1
  br label %2291

2290:                                             ; preds = %2281
  unreachable

2291:                                             ; preds = %2289, %2287, %2286
  %2292 = phi i32 [ 1, %2289 ], [ 2, %2287 ], [ 1, %2286 ]
  %2293 = getelementptr i8, i8* %2283, i32 %2292
  %2294 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 2
  %2295 = load i16, i16* %2294, align 2
  %2296 = sext i16 %2295 to i32
  %2297 = add nsw i32 %2296, 128
  %2298 = icmp ult i32 %2297, 256
  br i1 %2298, label %2299, label %2303

2299:                                             ; preds = %2291
  %2300 = shl i16 %2295, 8
  %2301 = or i16 %2300, 80
  %2302 = bitcast i8* %2293 to i16*
  store i16 %2301, i16* %2302, align 2
  br label %2308

2303:                                             ; preds = %2291
  store i8 -112, i8* %2293, align 1
  %2304 = getelementptr i8, i8* %2293, i32 1
  %2305 = load i16, i16* %2294, align 2
  %2306 = sext i16 %2305 to i32
  %2307 = bitcast i8* %2304 to i32*
  store i32 %2306, i32* %2307, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2308

2308:                                             ; preds = %2303, %2299
  %2309 = phi i32 [ 5, %2303 ], [ 2, %2299 ]
  %2310 = getelementptr i8, i8* %2293, i32 %2309
  %2311 = ptrtoint i8* %2310 to i32
  %2312 = icmp eq i32 %2284, 24
  br i1 %2312, label %2313, label %3149

2313:                                             ; preds = %2308
  %2314 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2315 = load i8, i8* %2314, align 1
  br i1 %112, label %2316, label %2321

2316:                                             ; preds = %2313
  %2317 = zext i8 %2315 to i32
  %2318 = shl nuw nsw i32 %2317, 16
  %2319 = or i32 %2318, 21899
  %2320 = bitcast i8* %2310 to i32*
  store i32 %2319, i32* %2320, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2327

2321:                                             ; preds = %2313
  %2322 = add i8 %2315, -48
  %2323 = zext i8 %2322 to i16
  %2324 = shl nuw i16 %2323, 8
  %2325 = or i16 %2324, 139
  %2326 = bitcast i8* %2310 to i16*
  store i16 %2325, i16* %2326, align 2
  br label %2327

2327:                                             ; preds = %2321, %2316
  %2328 = phi i32 [ 2, %2321 ], [ 3, %2316 ]
  %2329 = getelementptr i8, i8* %2310, i32 %2328
  store i8 -119, i8* %2329, align 1
  %2330 = getelementptr i8, i8* %2329, i32 1
  %2331 = load i16, i16* %2294, align 2
  %2332 = sext i16 %2331 to i32
  %2333 = add nsw i32 %2332, 132
  %2334 = icmp ult i32 %2333, 256
  br i1 %2334, label %2335, label %2342

2335:                                             ; preds = %2327
  %2336 = shl i16 %2331, 8
  %2337 = add i16 %2336, 1024
  %2338 = or i16 %2337, 80
  %2339 = bitcast i8* %2330 to i16*
  store i16 %2338, i16* %2339, align 2
  %2340 = getelementptr i8, i8* %2329, i32 3
  %2341 = ptrtoint i8* %2340 to i32
  br label %3149

2342:                                             ; preds = %2327
  store i8 -112, i8* %2330, align 1
  %2343 = getelementptr i8, i8* %2329, i32 2
  %2344 = load i16, i16* %2294, align 2
  %2345 = sext i16 %2344 to i32
  %2346 = add nsw i32 %2345, 4
  %2347 = bitcast i8* %2343 to i32*
  store i32 %2346, i32* %2347, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2348 = getelementptr i8, i8* %2329, i32 6
  %2349 = ptrtoint i8* %2348 to i32
  br label %3149

2350:                                             ; preds = %90, %90, %90, %90
  %2351 = inttoptr i32 %97 to i8*
  %2352 = load i8, i8* %114, align 1
  br i1 %112, label %2353, label %2358

2353:                                             ; preds = %2350
  %2354 = zext i8 %2352 to i32
  %2355 = shl nuw nsw i32 %2354, 16
  %2356 = or i32 %2355, 17803
  %2357 = inttoptr i32 %97 to i32*
  store i32 %2356, i32* %2357, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2364

2358:                                             ; preds = %2350
  %2359 = add i8 %2352, -64
  %2360 = zext i8 %2359 to i16
  %2361 = shl nuw i16 %2360, 8
  %2362 = or i16 %2361, 139
  %2363 = inttoptr i32 %97 to i16*
  store i16 %2362, i16* %2363, align 2
  br label %2364

2364:                                             ; preds = %2358, %2353
  %2365 = phi i32 [ 2, %2358 ], [ 3, %2353 ]
  %2366 = getelementptr i8, i8* %2351, i32 %2365
  %2367 = and i32 %102, 24
  %2368 = lshr exact i32 %2367, 3
  switch i32 %2368, label %2374 [
    i32 2, label %2369
    i32 1, label %2371
    i32 0, label %2373
    i32 3, label %2373
  ]

2369:                                             ; preds = %2364
  %2370 = bitcast i8* %2366 to i16*
  store i16 -18929, i16* %2370, align 2
  br label %2375

2371:                                             ; preds = %2364
  %2372 = bitcast i8* %2366 to i16*
  store i16 -18673, i16* %2372, align 2
  br label %2375

2373:                                             ; preds = %2364, %2364
  store i8 -117, i8* %2366, align 1
  br label %2375

2374:                                             ; preds = %2364
  unreachable

2375:                                             ; preds = %2373, %2371, %2369
  %2376 = phi i32 [ 1, %2373 ], [ 2, %2371 ], [ 2, %2369 ]
  %2377 = getelementptr i8, i8* %2366, i32 %2376
  %2378 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 2
  %2379 = load i16, i16* %2378, align 2
  %2380 = sext i16 %2379 to i32
  %2381 = add nsw i32 %2380, 128
  %2382 = icmp ult i32 %2381, 256
  br i1 %2382, label %2383, label %2387

2383:                                             ; preds = %2375
  %2384 = shl i16 %2379, 8
  %2385 = or i16 %2384, 80
  %2386 = bitcast i8* %2377 to i16*
  store i16 %2385, i16* %2386, align 2
  br label %2392

2387:                                             ; preds = %2375
  store i8 -112, i8* %2377, align 1
  %2388 = getelementptr i8, i8* %2377, i32 1
  %2389 = load i16, i16* %2378, align 2
  %2390 = sext i16 %2389 to i32
  %2391 = bitcast i8* %2388 to i32*
  store i32 %2390, i32* %2391, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2392

2392:                                             ; preds = %2387, %2383
  %2393 = phi i32 [ 5, %2387 ], [ 2, %2383 ]
  %2394 = getelementptr i8, i8* %2377, i32 %2393
  %2395 = load i8, i8* %113, align 1
  br i1 %109, label %2396, label %2401

2396:                                             ; preds = %2392
  %2397 = zext i8 %2395 to i32
  %2398 = shl nuw nsw i32 %2397, 16
  %2399 = or i32 %2398, 21897
  %2400 = bitcast i8* %2394 to i32*
  store i32 %2399, i32* %2400, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  br label %2407

2401:                                             ; preds = %2392
  %2402 = add i8 %2395, -48
  %2403 = zext i8 %2402 to i16
  %2404 = shl nuw i16 %2403, 8
  %2405 = or i16 %2404, 137
  %2406 = bitcast i8* %2394 to i16*
  store i16 %2405, i16* %2406, align 2
  br label %2407

2407:                                             ; preds = %2401, %2396
  %2408 = phi i32 [ 2, %2401 ], [ 3, %2396 ]
  %2409 = getelementptr i8, i8* %2394, i32 %2408
  %2410 = icmp eq i32 %2367, 24
  br i1 %2410, label %2439, label %2411

2411:                                             ; preds = %2407
  %2412 = ptrtoint i8* %2409 to i32
  %2413 = load %struct.bpf_prog_aux*, %struct.bpf_prog_aux** %37, align 4
  %2414 = getelementptr inbounds %struct.bpf_prog_aux, %struct.bpf_prog_aux* %2413, i32 0, i32 13
  %2415 = load i8, i8* %2414, align 8, !range !6
  %2416 = icmp eq i8 %2415, 0
  br i1 %2416, label %2417, label %3149

2417:                                             ; preds = %2411
  %2418 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2419 = load i8, i8* %2418, align 1
  br i1 %109, label %2420, label %2429

2420:                                             ; preds = %2417
  %2421 = zext i8 %2419 to i32
  %2422 = shl nuw nsw i32 %2421, 16
  %2423 = or i32 %2422, 17863
  %2424 = bitcast i8* %2409 to i32*
  store i32 %2423, i32* %2424, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2425 = getelementptr i8, i8* %2409, i32 3
  %2426 = bitcast i8* %2425 to i32*
  store i32 0, i32* %2426, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2427 = getelementptr i8, i8* %2409, i32 7
  %2428 = ptrtoint i8* %2427 to i32
  br label %3149

2429:                                             ; preds = %2417
  %2430 = add i8 %2419, -64
  %2431 = shl i8 %2419, 3
  %2432 = add i8 %2430, %2431
  %2433 = zext i8 %2432 to i16
  %2434 = shl nuw i16 %2433, 8
  %2435 = or i16 %2434, 51
  %2436 = bitcast i8* %2409 to i16*
  store i16 %2435, i16* %2436, align 2
  %2437 = getelementptr i8, i8* %2409, i32 2
  %2438 = ptrtoint i8* %2437 to i32
  br label %3149

2439:                                             ; preds = %2407
  %2440 = bitcast i8* %2409 to i16*
  store i16 -28533, i16* %2440, align 2
  %2441 = getelementptr i8, i8* %2409, i32 2
  %2442 = load i16, i16* %2378, align 2
  %2443 = sext i16 %2442 to i32
  %2444 = add nsw i32 %2443, 4
  %2445 = bitcast i8* %2441 to i32*
  store i32 %2444, i32* %2445, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2446 = getelementptr i8, i8* %2409, i32 6
  %2447 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2448 = load i8, i8* %2447, align 1
  br i1 %109, label %2449, label %2456

2449:                                             ; preds = %2439
  %2450 = zext i8 %2448 to i32
  %2451 = shl nuw nsw i32 %2450, 16
  %2452 = or i32 %2451, 21897
  %2453 = bitcast i8* %2446 to i32*
  store i32 %2452, i32* %2453, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2454 = getelementptr i8, i8* %2409, i32 9
  %2455 = ptrtoint i8* %2454 to i32
  br label %3149

2456:                                             ; preds = %2439
  %2457 = add i8 %2448, -48
  %2458 = zext i8 %2457 to i16
  %2459 = shl nuw i16 %2458, 8
  %2460 = or i16 %2459, 137
  %2461 = bitcast i8* %2446 to i16*
  store i16 %2460, i16* %2461, align 2
  %2462 = getelementptr i8, i8* %2409, i32 8
  %2463 = ptrtoint i8* %2462 to i32
  br label %3149

2464:                                             ; preds = %90
  %2465 = icmp eq i8 %110, 1
  br i1 %2465, label %3141, label %2466

2466:                                             ; preds = %2464
  %2467 = getelementptr i8, i8* bitcast (i64 (i64, i64, i64, i64, i64)* @__bpf_call_base to i8*), i32 %99
  %2468 = getelementptr i32, i32* %25, i32 %96
  %2469 = load i32, i32* %2468, align 4
  %2470 = getelementptr i8, i8* %77, i32 %2469
  %2471 = ptrtoint i8* %2467 to i32
  %2472 = ptrtoint i8* %2470 to i32
  %2473 = sub i32 %2471, %2472
  %2474 = icmp eq i32 %99, 0
  br i1 %2474, label %2479, label %2475

2475:                                             ; preds = %2466
  %2476 = sext i32 %2473 to i64
  %2477 = add nsw i64 %2476, 2147483648
  %2478 = icmp ult i64 %2477, 4294967296
  br i1 %2478, label %2481, label %2479

2479:                                             ; preds = %2475, %2466
  %2480 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.3, i32 0, i32 0), i32 %99, i8* %2467, i8* %77) #10
  br label %3173

2481:                                             ; preds = %2475
  %2482 = inttoptr i32 %97 to i8*
  %2483 = inttoptr i32 %97 to i32*
  store i32 542091, i32* %2483, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2484 = getelementptr i8, i8* %2482, i32 3
  %2485 = bitcast i8* %2484 to i32*
  store i32 808331, i32* %2485, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2486 = getelementptr i8, i8* %2482, i32 6
  %2487 = bitcast i8* %2486 to i32*
  store i32 2903435, i32* %2487, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2488 = getelementptr i8, i8* %2482, i32 9
  store i8 81, i8* %2488, align 1
  %2489 = getelementptr i8, i8* %2482, i32 10
  %2490 = bitcast i8* %2489 to i32*
  store i32 2641291, i32* %2490, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2491 = getelementptr i8, i8* %2482, i32 13
  store i8 81, i8* %2491, align 1
  %2492 = getelementptr i8, i8* %2482, i32 14
  %2493 = bitcast i8* %2492 to i32*
  store i32 2379147, i32* %2493, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2494 = getelementptr i8, i8* %2482, i32 17
  store i8 81, i8* %2494, align 1
  %2495 = getelementptr i8, i8* %2482, i32 18
  %2496 = bitcast i8* %2495 to i32*
  store i32 2117003, i32* %2496, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2497 = getelementptr i8, i8* %2482, i32 21
  store i8 81, i8* %2497, align 1
  %2498 = getelementptr i8, i8* %2482, i32 22
  %2499 = bitcast i8* %2498 to i32*
  store i32 1854859, i32* %2499, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2500 = getelementptr i8, i8* %2482, i32 25
  store i8 81, i8* %2500, align 1
  %2501 = getelementptr i8, i8* %2482, i32 26
  %2502 = bitcast i8* %2501 to i32*
  store i32 1592715, i32* %2502, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2503 = getelementptr i8, i8* %2482, i32 29
  store i8 81, i8* %2503, align 1
  %2504 = getelementptr i8, i8* %2482, i32 30
  %2505 = bitcast i8* %2504 to i32*
  store i32 1330571, i32* %2505, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2506 = getelementptr i8, i8* %2482, i32 33
  store i8 81, i8* %2506, align 1
  %2507 = getelementptr i8, i8* %2482, i32 34
  %2508 = bitcast i8* %2507 to i32*
  store i32 1068427, i32* %2508, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2509 = getelementptr i8, i8* %2482, i32 37
  store i8 81, i8* %2509, align 1
  %2510 = getelementptr i8, i8* %2482, i32 38
  store i8 -24, i8* %2510, align 1
  %2511 = getelementptr i8, i8* %2482, i32 39
  %2512 = add i32 %2473, 9
  %2513 = bitcast i8* %2511 to i32*
  store i32 %2512, i32* %2513, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2514 = getelementptr i8, i8* %2482, i32 43
  %2515 = bitcast i8* %2514 to i32*
  store i32 17801, i32* %2515, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2516 = getelementptr i8, i8* %2482, i32 46
  %2517 = bitcast i8* %2516 to i32*
  store i32 284041, i32* %2517, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2518 = getelementptr i8, i8* %2482, i32 49
  %2519 = bitcast i8* %2518 to i32*
  store i32 2147459, i32* %2519, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2520 = getelementptr i8, i8* %2482, i32 52
  %2521 = ptrtoint i8* %2520 to i32
  br label %3149

2522:                                             ; preds = %90
  %2523 = inttoptr i32 %97 to i8*
  %2524 = inttoptr i32 %97 to i32*
  store i32 1066379, i32* %2524, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2525 = getelementptr i8, i8* %2523, i32 3
  %2526 = bitcast i8* %2525 to i32*
  store i32 1594763, i32* %2526, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2527 = getelementptr i8, i8* %2523, i32 6
  %2528 = bitcast i8* %2527 to i32*
  store i32 1593401, i32* %2528, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2529 = getelementptr i8, i8* %2523, i32 9
  %2530 = load i1, i1* @emit_bpf_tail_call.jmp_label1, align 4
  %2531 = select i1 %2530, i16 16502, i16 -2954
  %2532 = bitcast i8* %2529 to i16*
  store i16 %2531, i16* %2532, align 2
  %2533 = getelementptr i8, i8* %2523, i32 11
  %2534 = bitcast i8* %2533 to i32*
  store i32 5787019, i32* %2534, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2535 = getelementptr i8, i8* %2523, i32 14
  %2536 = bitcast i8* %2535 to i32*
  store i32 6053259, i32* %2536, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2537 = getelementptr i8, i8* %2523, i32 17
  %2538 = bitcast i8* %2537 to i32*
  store i32 64387, i32* %2538, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2539 = getelementptr i8, i8* %2523, i32 20
  %2540 = bitcast i8* %2539 to i16*
  store i16 885, i16* %2540, align 2
  %2541 = getelementptr i8, i8* %2523, i32 22
  %2542 = bitcast i8* %2541 to i32*
  store i32 2161027, i32* %2542, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2543 = getelementptr i8, i8* %2523, i32 25
  %2544 = load i1, i1* @emit_bpf_tail_call.jmp_label1, align 4
  %2545 = select i1 %2544, i16 12403, i16 -7053
  %2546 = bitcast i8* %2543 to i16*
  store i16 %2545, i16* %2546, align 2
  %2547 = getelementptr i8, i8* %2523, i32 27
  %2548 = bitcast i8* %2547 to i32*
  store i32 115075, i32* %2548, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2549 = getelementptr i8, i8* %2523, i32 30
  %2550 = bitcast i8* %2549 to i32*
  store i32 54147, i32* %2550, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2551 = getelementptr i8, i8* %2523, i32 33
  %2552 = bitcast i8* %2551 to i32*
  store i32 5787017, i32* %2552, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2553 = getelementptr i8, i8* %2523, i32 36
  %2554 = bitcast i8* %2553 to i32*
  store i32 6053257, i32* %2554, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2555 = getelementptr i8, i8* %2523, i32 39
  %2556 = bitcast i8* %2555 to i32*
  store i32 9475211, i32* %2556, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2557 = getelementptr i8, i8* %2523, i32 42
  %2558 = bitcast i8* %2557 to i32*
  store i32 336, i32* %2558, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2559 = getelementptr i8, i8* %2523, i32 46
  %2560 = bitcast i8* %2559 to i16*
  store i16 -11643, i16* %2560, align 2
  %2561 = getelementptr i8, i8* %2523, i32 48
  %2562 = load i1, i1* @emit_bpf_tail_call.jmp_label1, align 4
  %2563 = select i1 %2562, i16 6516, i16 -12940
  %2564 = bitcast i8* %2561 to i16*
  store i16 %2563, i16* %2564, align 2
  %2565 = getelementptr i8, i8* %2523, i32 50
  %2566 = bitcast i8* %2565 to i32*
  store i32 2380427, i32* %2566, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2567 = getelementptr i8, i8* %2523, i32 53
  %2568 = bitcast i8* %2567 to i32*
  store i32 2343555, i32* %2568, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2569 = getelementptr i8, i8* %2523, i32 56
  %2570 = bitcast i8* %2569 to i32*
  store i32 542091, i32* %2570, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2571 = getelementptr i8, i8* %2523, i32 59
  store i8 -24, i8* %2571, align 1
  %2572 = getelementptr i8, i8* %2523, i32 60
  %2573 = bitcast i8* %2572 to i32*
  store i32 7, i32* %2573, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2574 = getelementptr i8, i8* %2523, i32 64
  %2575 = bitcast i8* %2574 to i16*
  store i16 -28429, i16* %2575, align 2
  %2576 = getelementptr i8, i8* %2523, i32 66
  %2577 = bitcast i8* %2576 to i32*
  store i32 15248911, i32* %2577, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2578 = getelementptr i8, i8* %2523, i32 69
  %2579 = bitcast i8* %2578 to i16*
  store i16 -1557, i16* %2579, align 2
  %2580 = getelementptr i8, i8* %2523, i32 71
  %2581 = bitcast i8* %2580 to i32*
  store i32 2364553, i32* %2581, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2582 = getelementptr i8, i8* %2523, i32 74
  store i8 -61, i8* %2582, align 1
  %2583 = getelementptr i8, i8* %2523, i32 75
  %2584 = load i1, i1* @emit_bpf_tail_call.jmp_label1, align 4
  br i1 %2584, label %2586, label %2585

2585:                                             ; preds = %2522
  store i1 true, i1* @emit_bpf_tail_call.jmp_label1, align 4
  br label %2586

2586:                                             ; preds = %2585, %2522
  %2587 = ptrtoint i8* %2583 to i32
  br label %3149

2588:                                             ; preds = %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90
  %2589 = and i8 %101, 7
  %2590 = icmp eq i8 %2589, 5
  br i1 %109, label %2595, label %2591

2591:                                             ; preds = %2588
  %2592 = load i8, i8* %113, align 1
  %2593 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2594 = load i8, i8* %2593, align 1
  br label %2595

2595:                                             ; preds = %2591, %2588
  %2596 = phi i8 [ %2592, %2591 ], [ 0, %2588 ]
  %2597 = phi i8 [ %2594, %2591 ], [ 2, %2588 ]
  br i1 %112, label %2602, label %2598

2598:                                             ; preds = %2595
  %2599 = load i8, i8* %114, align 1
  %2600 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2601 = load i8, i8* %2600, align 1
  br label %2602

2602:                                             ; preds = %2598, %2595
  %2603 = phi i8 [ %2599, %2598 ], [ 1, %2595 ]
  %2604 = phi i8 [ %2601, %2598 ], [ 3, %2595 ]
  br i1 %109, label %2605, label %2623

2605:                                             ; preds = %2602
  %2606 = inttoptr i32 %97 to i8*
  %2607 = load i8, i8* %113, align 1
  %2608 = zext i8 %2607 to i32
  %2609 = shl nuw nsw i32 %2608, 16
  %2610 = or i32 %2609, 17803
  %2611 = inttoptr i32 %97 to i32*
  store i32 %2610, i32* %2611, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2612 = getelementptr i8, i8* %2606, i32 3
  %2613 = ptrtoint i8* %2612 to i32
  br i1 %2590, label %2614, label %2623

2614:                                             ; preds = %2605
  %2615 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2616 = load i8, i8* %2615, align 1
  %2617 = zext i8 %2616 to i32
  %2618 = shl nuw nsw i32 %2617, 16
  %2619 = or i32 %2618, 21899
  %2620 = bitcast i8* %2612 to i32*
  store i32 %2619, i32* %2620, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2621 = getelementptr i8, i8* %2606, i32 6
  %2622 = ptrtoint i8* %2621 to i32
  br label %2623

2623:                                             ; preds = %2614, %2605, %2602
  %2624 = phi i32 [ %2622, %2614 ], [ %2613, %2605 ], [ %97, %2602 ]
  %2625 = inttoptr i32 %2624 to i8*
  br i1 %112, label %2626, label %2641

2626:                                             ; preds = %2623
  %2627 = load i8, i8* %114, align 1
  %2628 = zext i8 %2627 to i32
  %2629 = shl nuw nsw i32 %2628, 16
  %2630 = or i32 %2629, 19851
  %2631 = inttoptr i32 %2624 to i32*
  store i32 %2630, i32* %2631, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2632 = getelementptr i8, i8* %2625, i32 3
  br i1 %2590, label %2633, label %2654

2633:                                             ; preds = %2626
  %2634 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2635 = load i8, i8* %2634, align 1
  %2636 = zext i8 %2635 to i32
  %2637 = shl nuw nsw i32 %2636, 16
  %2638 = or i32 %2637, 23947
  %2639 = bitcast i8* %2632 to i32*
  store i32 %2638, i32* %2639, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2640 = getelementptr i8, i8* %2625, i32 6
  br label %2642

2641:                                             ; preds = %2623
  br i1 %2590, label %2642, label %2654

2642:                                             ; preds = %2641, %2633
  %2643 = phi i8* [ %2640, %2633 ], [ %2625, %2641 ]
  %2644 = add i8 %2597, -64
  %2645 = shl i8 %2604, 3
  %2646 = add i8 %2644, %2645
  %2647 = zext i8 %2646 to i16
  %2648 = shl nuw i16 %2647, 8
  %2649 = or i16 %2648, 57
  %2650 = bitcast i8* %2643 to i16*
  store i16 %2649, i16* %2650, align 2
  %2651 = getelementptr i8, i8* %2643, i32 2
  %2652 = bitcast i8* %2651 to i16*
  store i16 629, i16* %2652, align 2
  %2653 = getelementptr i8, i8* %2643, i32 4
  br label %2654

2654:                                             ; preds = %2642, %2641, %2626
  %2655 = phi i8* [ %2653, %2642 ], [ %2625, %2641 ], [ %2632, %2626 ]
  %2656 = add i8 %2596, -64
  %2657 = shl i8 %2603, 3
  %2658 = add i8 %2656, %2657
  %2659 = zext i8 %2658 to i16
  %2660 = shl nuw i16 %2659, 8
  %2661 = or i16 %2660, 57
  %2662 = bitcast i8* %2655 to i16*
  store i16 %2661, i16* %2662, align 2
  %2663 = getelementptr i8, i8* %2655, i32 2
  br label %2932

2664:                                             ; preds = %90, %90, %90, %90
  br i1 %109, label %2669, label %2665

2665:                                             ; preds = %2664
  %2666 = load i8, i8* %113, align 1
  %2667 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2668 = load i8, i8* %2667, align 1
  br label %2669

2669:                                             ; preds = %2665, %2664
  %2670 = phi i8 [ %2666, %2665 ], [ 0, %2664 ]
  %2671 = phi i8 [ %2668, %2665 ], [ 2, %2664 ]
  br i1 %112, label %2676, label %2672

2672:                                             ; preds = %2669
  %2673 = load i8, i8* %114, align 1
  %2674 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2675 = load i8, i8* %2674, align 1
  br label %2676

2676:                                             ; preds = %2672, %2669
  %2677 = phi i8 [ %2673, %2672 ], [ 1, %2669 ]
  %2678 = phi i8 [ %2675, %2672 ], [ 3, %2669 ]
  br i1 %109, label %2679, label %2695

2679:                                             ; preds = %2676
  %2680 = inttoptr i32 %97 to i8*
  %2681 = load i8, i8* %113, align 1
  %2682 = zext i8 %2681 to i32
  %2683 = shl nuw nsw i32 %2682, 16
  %2684 = or i32 %2683, 17803
  %2685 = inttoptr i32 %97 to i32*
  store i32 %2684, i32* %2685, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2686 = getelementptr i8, i8* %2680, i32 3
  %2687 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2688 = load i8, i8* %2687, align 1
  %2689 = zext i8 %2688 to i32
  %2690 = shl nuw nsw i32 %2689, 16
  %2691 = or i32 %2690, 21899
  %2692 = bitcast i8* %2686 to i32*
  store i32 %2691, i32* %2692, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2693 = getelementptr i8, i8* %2680, i32 6
  %2694 = ptrtoint i8* %2693 to i32
  br label %2695

2695:                                             ; preds = %2679, %2676
  %2696 = phi i32 [ %2694, %2679 ], [ %97, %2676 ]
  %2697 = inttoptr i32 %2696 to i8*
  br i1 %112, label %2698, label %2712

2698:                                             ; preds = %2695
  %2699 = load i8, i8* %114, align 1
  %2700 = zext i8 %2699 to i32
  %2701 = shl nuw nsw i32 %2700, 16
  %2702 = or i32 %2701, 19851
  %2703 = inttoptr i32 %2696 to i32*
  store i32 %2702, i32* %2703, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2704 = getelementptr i8, i8* %2697, i32 3
  %2705 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2706 = load i8, i8* %2705, align 1
  %2707 = zext i8 %2706 to i32
  %2708 = shl nuw nsw i32 %2707, 16
  %2709 = or i32 %2708, 23947
  %2710 = bitcast i8* %2704 to i32*
  store i32 %2709, i32* %2710, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2711 = getelementptr i8, i8* %2697, i32 6
  br label %2712

2712:                                             ; preds = %2698, %2695
  %2713 = phi i8* [ %2711, %2698 ], [ %2697, %2695 ]
  %2714 = add i8 %2671, -64
  %2715 = shl i8 %2678, 3
  %2716 = add i8 %2714, %2715
  %2717 = zext i8 %2716 to i16
  %2718 = shl nuw i16 %2717, 8
  %2719 = or i16 %2718, 57
  %2720 = bitcast i8* %2713 to i16*
  store i16 %2719, i16* %2720, align 2
  %2721 = getelementptr i8, i8* %2713, i32 2
  %2722 = bitcast i8* %2721 to i16*
  store i16 2677, i16* %2722, align 2
  %2723 = getelementptr i8, i8* %2713, i32 4
  %2724 = add i8 %2670, -64
  %2725 = shl i8 %2677, 3
  %2726 = add i8 %2724, %2725
  %2727 = zext i8 %2726 to i16
  %2728 = shl nuw i16 %2727, 8
  %2729 = or i16 %2728, 57
  %2730 = bitcast i8* %2723 to i16*
  store i16 %2729, i16* %2730, align 2
  %2731 = getelementptr i8, i8* %2713, i32 6
  br label %3021

2732:                                             ; preds = %90, %90
  %2733 = and i8 %101, 7
  %2734 = icmp eq i8 %2733, 5
  br i1 %112, label %2739, label %2735

2735:                                             ; preds = %2732
  %2736 = load i8, i8* %114, align 1
  %2737 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2738 = load i8, i8* %2737, align 1
  br label %2739

2739:                                             ; preds = %2735, %2732
  %2740 = phi i8 [ %2736, %2735 ], [ 1, %2732 ]
  %2741 = phi i8 [ %2738, %2735 ], [ 3, %2732 ]
  %2742 = inttoptr i32 %97 to i8*
  %2743 = load i8, i8* %113, align 1
  br i1 %109, label %2744, label %2758

2744:                                             ; preds = %2739
  %2745 = zext i8 %2743 to i32
  %2746 = shl nuw nsw i32 %2745, 16
  %2747 = or i32 %2746, 17803
  %2748 = inttoptr i32 %97 to i32*
  store i32 %2747, i32* %2748, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2749 = getelementptr i8, i8* %2742, i32 3
  br i1 %2734, label %2750, label %2776

2750:                                             ; preds = %2744
  %2751 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2752 = load i8, i8* %2751, align 1
  %2753 = zext i8 %2752 to i32
  %2754 = shl nuw nsw i32 %2753, 16
  %2755 = or i32 %2754, 21899
  %2756 = bitcast i8* %2749 to i32*
  store i32 %2755, i32* %2756, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2757 = getelementptr i8, i8* %2742, i32 6
  br label %2776

2758:                                             ; preds = %2739
  %2759 = shl i8 %2743, 3
  %2760 = add i8 %2759, -64
  %2761 = zext i8 %2760 to i16
  %2762 = shl nuw i16 %2761, 8
  %2763 = or i16 %2762, 137
  %2764 = inttoptr i32 %97 to i16*
  store i16 %2763, i16* %2764, align 2
  %2765 = getelementptr i8, i8* %2742, i32 2
  br i1 %2734, label %2766, label %2776

2766:                                             ; preds = %2758
  %2767 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2768 = load i8, i8* %2767, align 1
  %2769 = shl i8 %2768, 3
  %2770 = add i8 %2769, -62
  %2771 = zext i8 %2770 to i16
  %2772 = shl nuw i16 %2771, 8
  %2773 = or i16 %2772, 137
  %2774 = bitcast i8* %2765 to i16*
  store i16 %2773, i16* %2774, align 2
  %2775 = getelementptr i8, i8* %2742, i32 4
  br label %2776

2776:                                             ; preds = %2766, %2758, %2750, %2744
  %2777 = phi i8* [ %2757, %2750 ], [ %2749, %2744 ], [ %2775, %2766 ], [ %2765, %2758 ]
  br i1 %112, label %2778, label %2806

2778:                                             ; preds = %2776
  %2779 = load i8, i8* %114, align 1
  %2780 = zext i8 %2779 to i32
  %2781 = shl nuw nsw i32 %2780, 16
  %2782 = or i32 %2781, 19851
  %2783 = bitcast i8* %2777 to i32*
  store i32 %2782, i32* %2783, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2784 = getelementptr i8, i8* %2777, i32 3
  br i1 %2734, label %2792, label %2785

2785:                                             ; preds = %2778
  %2786 = add i8 %2740, -64
  %2787 = zext i8 %2786 to i16
  %2788 = shl nuw i16 %2787, 8
  %2789 = or i16 %2788, 35
  %2790 = bitcast i8* %2784 to i16*
  store i16 %2789, i16* %2790, align 2
  %2791 = getelementptr i8, i8* %2777, i32 5
  br label %2932

2792:                                             ; preds = %2778
  %2793 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %111, i32 1
  %2794 = load i8, i8* %2793, align 1
  %2795 = zext i8 %2794 to i32
  %2796 = shl nuw nsw i32 %2795, 16
  %2797 = or i32 %2796, 23947
  %2798 = bitcast i8* %2784 to i32*
  store i32 %2797, i32* %2798, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2799 = getelementptr i8, i8* %2777, i32 6
  %2800 = add i8 %2740, -64
  %2801 = zext i8 %2800 to i16
  %2802 = shl nuw i16 %2801, 8
  %2803 = or i16 %2802, 35
  %2804 = bitcast i8* %2799 to i16*
  store i16 %2803, i16* %2804, align 2
  %2805 = getelementptr i8, i8* %2777, i32 8
  br label %2813

2806:                                             ; preds = %2776
  %2807 = add i8 %2740, -64
  %2808 = zext i8 %2807 to i16
  %2809 = shl nuw i16 %2808, 8
  %2810 = or i16 %2809, 35
  %2811 = bitcast i8* %2777 to i16*
  store i16 %2810, i16* %2811, align 2
  %2812 = getelementptr i8, i8* %2777, i32 2
  br i1 %2734, label %2813, label %2932

2813:                                             ; preds = %2806, %2792
  %2814 = phi i8* [ %2805, %2792 ], [ %2812, %2806 ]
  %2815 = phi i8* [ %2799, %2792 ], [ %2777, %2806 ]
  %2816 = add i8 %2741, -48
  %2817 = zext i8 %2816 to i16
  %2818 = shl nuw i16 %2817, 8
  %2819 = or i16 %2818, 35
  %2820 = bitcast i8* %2814 to i16*
  store i16 %2819, i16* %2820, align 2
  %2821 = getelementptr i8, i8* %2815, i32 4
  %2822 = bitcast i8* %2821 to i16*
  store i16 -12279, i16* %2822, align 2
  %2823 = getelementptr i8, i8* %2815, i32 6
  br label %2932

2824:                                             ; preds = %90, %90
  %2825 = and i8 %101, 7
  %2826 = icmp eq i8 %2825, 5
  %2827 = inttoptr i32 %97 to i8*
  %2828 = load i8, i8* %113, align 1
  br i1 %109, label %2829, label %2843

2829:                                             ; preds = %2824
  %2830 = zext i8 %2828 to i32
  %2831 = shl nuw nsw i32 %2830, 16
  %2832 = or i32 %2831, 17803
  %2833 = inttoptr i32 %97 to i32*
  store i32 %2832, i32* %2833, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2834 = getelementptr i8, i8* %2827, i32 3
  br i1 %2826, label %2835, label %2861

2835:                                             ; preds = %2829
  %2836 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2837 = load i8, i8* %2836, align 1
  %2838 = zext i8 %2837 to i32
  %2839 = shl nuw nsw i32 %2838, 16
  %2840 = or i32 %2839, 21899
  %2841 = bitcast i8* %2834 to i32*
  store i32 %2840, i32* %2841, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2842 = getelementptr i8, i8* %2827, i32 6
  br label %2861

2843:                                             ; preds = %2824
  %2844 = shl i8 %2828, 3
  %2845 = add i8 %2844, -64
  %2846 = zext i8 %2845 to i16
  %2847 = shl nuw i16 %2846, 8
  %2848 = or i16 %2847, 137
  %2849 = inttoptr i32 %97 to i16*
  store i16 %2848, i16* %2849, align 2
  %2850 = getelementptr i8, i8* %2827, i32 2
  br i1 %2826, label %2851, label %2861

2851:                                             ; preds = %2843
  %2852 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2853 = load i8, i8* %2852, align 1
  %2854 = shl i8 %2853, 3
  %2855 = add i8 %2854, -62
  %2856 = zext i8 %2855 to i16
  %2857 = shl nuw i16 %2856, 8
  %2858 = or i16 %2857, 137
  %2859 = bitcast i8* %2850 to i16*
  store i16 %2858, i16* %2859, align 2
  %2860 = getelementptr i8, i8* %2827, i32 4
  br label %2861

2861:                                             ; preds = %2851, %2843, %2835, %2829
  %2862 = phi i8* [ %2842, %2835 ], [ %2834, %2829 ], [ %2860, %2851 ], [ %2850, %2843 ]
  %2863 = bitcast i8* %2862 to i16*
  store i16 -15929, i16* %2863, align 2
  %2864 = getelementptr i8, i8* %2862, i32 2
  %2865 = bitcast i8* %2864 to i32*
  store i32 %99, i32* %2865, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2866 = getelementptr i8, i8* %2862, i32 6
  %2867 = bitcast i8* %2866 to i16*
  store i16 -16093, i16* %2867, align 2
  %2868 = getelementptr i8, i8* %2862, i32 8
  br i1 %2826, label %2869, label %2932

2869:                                             ; preds = %2861
  %2870 = ashr i32 %99, 31
  %2871 = bitcast i8* %2868 to i16*
  store i16 -15417, i16* %2871, align 2
  %2872 = getelementptr i8, i8* %2862, i32 10
  %2873 = bitcast i8* %2872 to i32*
  store i32 %2870, i32* %2873, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2874 = getelementptr i8, i8* %2862, i32 14
  %2875 = bitcast i8* %2874 to i16*
  store i16 -11485, i16* %2875, align 2
  %2876 = getelementptr i8, i8* %2862, i32 16
  %2877 = bitcast i8* %2876 to i16*
  store i16 -12279, i16* %2877, align 2
  %2878 = getelementptr i8, i8* %2862, i32 18
  br label %2932

2879:                                             ; preds = %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90, %90
  %2880 = and i8 %101, 7
  %2881 = icmp eq i8 %2880, 5
  br i1 %109, label %2886, label %2882

2882:                                             ; preds = %2879
  %2883 = load i8, i8* %113, align 1
  %2884 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2885 = load i8, i8* %2884, align 1
  br label %2902

2886:                                             ; preds = %2879
  %2887 = inttoptr i32 %97 to i8*
  %2888 = load i8, i8* %113, align 1
  %2889 = zext i8 %2888 to i32
  %2890 = shl nuw nsw i32 %2889, 16
  %2891 = or i32 %2890, 17803
  %2892 = inttoptr i32 %97 to i32*
  store i32 %2891, i32* %2892, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2893 = getelementptr i8, i8* %2887, i32 3
  br i1 %2881, label %2894, label %2902

2894:                                             ; preds = %2886
  %2895 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2896 = load i8, i8* %2895, align 1
  %2897 = zext i8 %2896 to i32
  %2898 = shl nuw nsw i32 %2897, 16
  %2899 = or i32 %2898, 21899
  %2900 = bitcast i8* %2893 to i32*
  store i32 %2899, i32* %2900, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2901 = getelementptr i8, i8* %2887, i32 6
  br label %2902

2902:                                             ; preds = %2894, %2886, %2882
  %2903 = phi i8 [ 2, %2894 ], [ 2, %2886 ], [ %2885, %2882 ]
  %2904 = phi i8 [ 0, %2894 ], [ 0, %2886 ], [ %2883, %2882 ]
  %2905 = phi i8* [ %2901, %2894 ], [ %2893, %2886 ], [ %92, %2882 ]
  %2906 = bitcast i8* %2905 to i16*
  store i16 -15929, i16* %2906, align 2
  %2907 = getelementptr i8, i8* %2905, i32 2
  %2908 = bitcast i8* %2907 to i32*
  store i32 %99, i32* %2908, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2909 = getelementptr i8, i8* %2905, i32 6
  br i1 %2881, label %2910, label %2924

2910:                                             ; preds = %2902
  %2911 = ashr i32 %99, 31
  %2912 = bitcast i8* %2909 to i16*
  store i16 -15417, i16* %2912, align 2
  %2913 = getelementptr i8, i8* %2905, i32 8
  %2914 = bitcast i8* %2913 to i32*
  store i32 %2911, i32* %2914, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2915 = getelementptr i8, i8* %2905, i32 12
  %2916 = add i8 %2903, -40
  %2917 = zext i8 %2916 to i16
  %2918 = shl nuw i16 %2917, 8
  %2919 = or i16 %2918, 57
  %2920 = bitcast i8* %2915 to i16*
  store i16 %2919, i16* %2920, align 2
  %2921 = getelementptr i8, i8* %2905, i32 14
  %2922 = bitcast i8* %2921 to i16*
  store i16 629, i16* %2922, align 2
  %2923 = getelementptr i8, i8* %2905, i32 16
  br label %2924

2924:                                             ; preds = %2910, %2902
  %2925 = phi i8* [ %2923, %2910 ], [ %2909, %2902 ]
  %2926 = add i8 %2904, -56
  %2927 = zext i8 %2926 to i16
  %2928 = shl nuw i16 %2927, 8
  %2929 = or i16 %2928, 57
  %2930 = bitcast i8* %2925 to i16*
  store i16 %2929, i16* %2930, align 2
  %2931 = getelementptr i8, i8* %2925, i32 2
  br label %2932

2932:                                             ; preds = %2924, %2869, %2861, %2813, %2806, %2785, %2654
  %2933 = phi i8* [ %2931, %2924 ], [ %2878, %2869 ], [ %2868, %2861 ], [ %2823, %2813 ], [ %2812, %2806 ], [ %2663, %2654 ], [ %2791, %2785 ]
  %2934 = and i8 %101, -16
  %2935 = zext i8 %2934 to i32
  %2936 = add nsw i32 %2935, -16
  %2937 = lshr exact i32 %2936, 4
  %2938 = icmp ult i32 %2936, 208
  br i1 %2938, label %2939, label %3173

2939:                                             ; preds = %2932
  %2940 = trunc i32 %2937 to i16
  %2941 = lshr i16 7807, %2940
  %2942 = and i16 %2941, 1
  %2943 = icmp eq i16 %2942, 0
  br i1 %2943, label %3173, label %2944

2944:                                             ; preds = %2939
  %2945 = getelementptr inbounds [13 x i32], [13 x i32]* @switch.table.bpf_int_jit_compile, i32 0, i32 %2937
  %2946 = load i32, i32* %2945, align 4
  %2947 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 2
  %2948 = load i16, i16* %2947, align 2
  %2949 = sext i16 %2948 to i32
  %2950 = add i32 %96, %2949
  %2951 = getelementptr i32, i32* %25, i32 %2950
  %2952 = load i32, i32* %2951, align 4
  %2953 = getelementptr i32, i32* %25, i32 %96
  %2954 = load i32, i32* %2953, align 4
  %2955 = sub i32 %2952, %2954
  %2956 = add i32 %2955, 128
  %2957 = icmp ult i32 %2956, 256
  br i1 %2957, label %2958, label %2965

2958:                                             ; preds = %2944
  %2959 = shl nsw i32 %2955, 8
  %2960 = or i32 %2959, %2946
  %2961 = trunc i32 %2960 to i16
  %2962 = bitcast i8* %2933 to i16*
  store i16 %2961, i16* %2962, align 2
  %2963 = getelementptr i8, i8* %2933, i32 2
  %2964 = ptrtoint i8* %2963 to i32
  br label %3149

2965:                                             ; preds = %2944
  %2966 = trunc i32 %2946 to i16
  %2967 = shl nuw nsw i16 %2966, 8
  %2968 = add nuw i16 %2967, 4111
  %2969 = bitcast i8* %2933 to i16*
  store i16 %2968, i16* %2969, align 2
  %2970 = getelementptr i8, i8* %2933, i32 2
  %2971 = bitcast i8* %2970 to i32*
  store i32 %2955, i32* %2971, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2972 = getelementptr i8, i8* %2933, i32 6
  %2973 = ptrtoint i8* %2972 to i32
  br label %3149

2974:                                             ; preds = %90, %90, %90, %90
  br i1 %109, label %2979, label %2975

2975:                                             ; preds = %2974
  %2976 = load i8, i8* %113, align 1
  %2977 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2978 = load i8, i8* %2977, align 1
  br label %2994

2979:                                             ; preds = %2974
  %2980 = inttoptr i32 %97 to i8*
  %2981 = load i8, i8* %113, align 1
  %2982 = zext i8 %2981 to i32
  %2983 = shl nuw nsw i32 %2982, 16
  %2984 = or i32 %2983, 17803
  %2985 = inttoptr i32 %97 to i32*
  store i32 %2984, i32* %2985, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2986 = getelementptr i8, i8* %2980, i32 3
  %2987 = getelementptr [13 x [2 x i8]], [13 x [2 x i8]]* @bpf2ia32, i32 0, i32 %108, i32 1
  %2988 = load i8, i8* %2987, align 1
  %2989 = zext i8 %2988 to i32
  %2990 = shl nuw nsw i32 %2989, 16
  %2991 = or i32 %2990, 21899
  %2992 = bitcast i8* %2986 to i32*
  store i32 %2991, i32* %2992, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %2993 = getelementptr i8, i8* %2980, i32 6
  br label %2994

2994:                                             ; preds = %2979, %2975
  %2995 = phi i8 [ 2, %2979 ], [ %2978, %2975 ]
  %2996 = phi i8 [ 0, %2979 ], [ %2976, %2975 ]
  %2997 = phi i8* [ %2993, %2979 ], [ %92, %2975 ]
  %2998 = bitcast i8* %2997 to i16*
  store i16 -15929, i16* %2998, align 2
  %2999 = getelementptr i8, i8* %2997, i32 2
  %3000 = bitcast i8* %2999 to i32*
  store i32 %99, i32* %3000, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3001 = getelementptr i8, i8* %2997, i32 6
  %3002 = ashr i32 %99, 31
  %3003 = bitcast i8* %3001 to i16*
  store i16 -15417, i16* %3003, align 2
  %3004 = getelementptr i8, i8* %2997, i32 8
  %3005 = bitcast i8* %3004 to i32*
  store i32 %3002, i32* %3005, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3006 = getelementptr i8, i8* %2997, i32 12
  %3007 = add i8 %2995, -40
  %3008 = zext i8 %3007 to i16
  %3009 = shl nuw i16 %3008, 8
  %3010 = or i16 %3009, 57
  %3011 = bitcast i8* %3006 to i16*
  store i16 %3010, i16* %3011, align 2
  %3012 = getelementptr i8, i8* %2997, i32 14
  %3013 = bitcast i8* %3012 to i16*
  store i16 2677, i16* %3013, align 2
  %3014 = getelementptr i8, i8* %2997, i32 16
  %3015 = add i8 %2996, -56
  %3016 = zext i8 %3015 to i16
  %3017 = shl nuw i16 %3016, 8
  %3018 = or i16 %3017, 57
  %3019 = bitcast i8* %3014 to i16*
  store i16 %3018, i16* %3019, align 2
  %3020 = getelementptr i8, i8* %2997, i32 18
  br label %3021

3021:                                             ; preds = %2994, %2712
  %3022 = phi i8* [ %3020, %2994 ], [ %2731, %2712 ]
  %3023 = and i8 %101, -16
  %3024 = zext i8 %3023 to i32
  %3025 = add nsw i32 %3024, -16
  %3026 = lshr exact i32 %3025, 4
  %3027 = icmp ult i32 %3025, 208
  br i1 %3027, label %3028, label %3173

3028:                                             ; preds = %3021
  %3029 = trunc i32 %3026 to i16
  %3030 = lshr i16 7807, %3029
  %3031 = and i16 %3030, 1
  %3032 = icmp eq i16 %3031, 0
  br i1 %3032, label %3173, label %3033

3033:                                             ; preds = %3028
  %3034 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 2
  %3035 = load i16, i16* %3034, align 2
  %3036 = sext i16 %3035 to i32
  %3037 = add i32 %96, %3036
  %3038 = getelementptr i32, i32* %25, i32 %3037
  %3039 = load i32, i32* %3038, align 4
  %3040 = getelementptr i32, i32* %25, i32 %96
  %3041 = load i32, i32* %3040, align 4
  %3042 = sub i32 %3039, %3041
  %3043 = add i32 %3042, 8
  %3044 = sext i32 %3043 to i64
  %3045 = add nsw i64 %3044, 2147483648
  %3046 = icmp ult i64 %3045, 4294967296
  br i1 %3046, label %3047, label %3057

3047:                                             ; preds = %3033
  %3048 = getelementptr inbounds [13 x i16], [13 x i16]* @switch.table.bpf_int_jit_compile.13, i32 0, i32 %3026
  %3049 = load i16, i16* %3048, align 2
  %3050 = bitcast i8* %3022 to i16*
  store i16 %3049, i16* %3050, align 2
  %3051 = getelementptr i8, i8* %3022, i32 2
  %3052 = bitcast i8* %3051 to i32*
  store i32 %3043, i32* %3052, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3053 = getelementptr i8, i8* %3022, i32 6
  %3054 = bitcast i8* %3053 to i16*
  store i16 1771, i16* %3054, align 2
  %3055 = getelementptr i8, i8* %3022, i32 8
  %3056 = icmp ult i32 %3025, 208
  br i1 %3056, label %3059, label %3173

3057:                                             ; preds = %3033
  %3058 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0), i64 %3044) #10
  br label %3173

3059:                                             ; preds = %3047
  %3060 = trunc i32 %3026 to i16
  %3061 = lshr i16 7807, %3060
  %3062 = and i16 %3061, 1
  %3063 = icmp eq i16 %3062, 0
  br i1 %3063, label %3173, label %3064

3064:                                             ; preds = %3059
  %3065 = load i16, i16* %3034, align 2
  %3066 = sext i16 %3065 to i32
  %3067 = add i32 %96, %3066
  %3068 = getelementptr i32, i32* %25, i32 %3067
  %3069 = load i32, i32* %3068, align 4
  %3070 = load i32, i32* %3040, align 4
  %3071 = sub i32 %3069, %3070
  %3072 = sext i32 %3071 to i64
  %3073 = add nsw i64 %3072, 2147483648
  %3074 = icmp ult i64 %3073, 4294967296
  br i1 %3074, label %3075, label %3083

3075:                                             ; preds = %3064
  %3076 = getelementptr inbounds [13 x i16], [13 x i16]* @switch.table.bpf_int_jit_compile.14, i32 0, i32 %3026
  %3077 = load i16, i16* %3076, align 2
  %3078 = bitcast i8* %3055 to i16*
  store i16 %3077, i16* %3078, align 2
  %3079 = getelementptr i8, i8* %3022, i32 10
  %3080 = bitcast i8* %3079 to i32*
  store i32 %3071, i32* %3080, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3081 = getelementptr i8, i8* %3022, i32 14
  %3082 = ptrtoint i8* %3081 to i32
  br label %3149

3083:                                             ; preds = %3064
  %3084 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0), i64 %3072) #10
  br label %3173

3085:                                             ; preds = %90
  %3086 = getelementptr inbounds %struct.bpf_insn, %struct.bpf_insn* %93, i32 0, i32 2
  %3087 = load i16, i16* %3086, align 2
  %3088 = icmp eq i16 %3087, -1
  br i1 %3088, label %3102, label %3089

3089:                                             ; preds = %3085
  %3090 = sext i16 %3087 to i32
  %3091 = add i32 %96, %3090
  %3092 = getelementptr i32, i32* %25, i32 %3091
  %3093 = load i32, i32* %3092, align 4
  %3094 = getelementptr i32, i32* %25, i32 %96
  %3095 = load i32, i32* %3094, align 4
  %3096 = sub i32 %3093, %3095
  %3097 = icmp eq i32 %3096, 0
  br i1 %3097, label %3149, label %3098

3098:                                             ; preds = %3120, %3089
  %3099 = phi i32 [ %3123, %3120 ], [ %3096, %3089 ]
  %3100 = add i32 %3099, 128
  %3101 = icmp ult i32 %3100, 256
  br i1 %3101, label %3102, label %3111

3102:                                             ; preds = %3098, %3085
  %3103 = phi i32 [ %3099, %3098 ], [ -2, %3085 ]
  %3104 = inttoptr i32 %97 to i8*
  %3105 = trunc i32 %3103 to i16
  %3106 = shl nsw i16 %3105, 8
  %3107 = or i16 %3106, 235
  %3108 = inttoptr i32 %97 to i16*
  store i16 %3107, i16* %3108, align 2
  %3109 = getelementptr i8, i8* %3104, i32 2
  %3110 = ptrtoint i8* %3109 to i32
  br label %3149

3111:                                             ; preds = %3098
  %3112 = inttoptr i32 %97 to i8*
  store i8 -23, i8* %3112, align 1
  %3113 = getelementptr i8, i8* %3112, i32 1
  %3114 = bitcast i8* %3113 to i32*
  store i32 %3099, i32* %3114, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3115 = getelementptr i8, i8* %3112, i32 5
  %3116 = ptrtoint i8* %3115 to i32
  br label %3149

3117:                                             ; preds = %90
  %3118 = and i8 %94, 1
  %3119 = icmp eq i8 %3118, 0
  br i1 %3119, label %3124, label %3120

3120:                                             ; preds = %3117
  %3121 = getelementptr i32, i32* %25, i32 %96
  %3122 = load i32, i32* %3121, align 4
  %3123 = sub i32 %91, %3122
  br label %3098

3124:                                             ; preds = %3117
  %3125 = inttoptr i32 %97 to i8*
  %3126 = inttoptr i32 %97 to i32*
  store i32 17803, i32* %3126, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3127 = getelementptr i8, i8* %3125, i32 3
  %3128 = bitcast i8* %3127 to i32*
  store i32 284043, i32* %3128, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3129 = getelementptr i8, i8* %3125, i32 6
  %3130 = bitcast i8* %3129 to i32*
  store i32 7128451, i32* %3130, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3131 = getelementptr i8, i8* %3125, i32 9
  %3132 = bitcast i8* %3131 to i32*
  store i32 -762485, i32* %3132, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3133 = getelementptr i8, i8* %3125, i32 12
  %3134 = bitcast i8* %3133 to i32*
  store i32 -494197, i32* %3134, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3135 = getelementptr i8, i8* %3125, i32 15
  %3136 = bitcast i8* %3135 to i32*
  store i32 -230005, i32* %3136, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %3137 = getelementptr i8, i8* %3125, i32 18
  store i8 -55, i8* %3137, align 1
  %3138 = getelementptr i8, i8* %3125, i32 19
  store i8 -61, i8* %3138, align 1
  %3139 = getelementptr i8, i8* %3125, i32 20
  %3140 = ptrtoint i8* %3139 to i32
  br label %3149

3141:                                             ; preds = %2464, %90, %90, %90, %90, %90, %90
  %3142 = load i1, i1* @do_jit.__print_once, align 1
  br i1 %3142, label %3173, label %3143

3143:                                             ; preds = %3141
  %3144 = zext i8 %101 to i32
  store i1 true, i1* @do_jit.__print_once, align 1
  %3145 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i32 0, i32 0), i32 %3144) #10
  br label %3173

3146:                                             ; preds = %90
  %3147 = zext i8 %101 to i32
  %3148 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i32 0, i32 0), i32 %3147) #10
  br label %3173

3149:                                             ; preds = %3124, %3111, %3102, %3089, %3075, %2965, %2958, %2586, %2481, %2456, %2449, %2429, %2420, %2411, %2342, %2335, %2308, %2240, %2235, %2179, %2093, %1971, %1880, %1792, %1666, %1601, %1575, %1543, %1440, %1353, %1263, %1173, %1061, %948, %923, %881, %856, %726, %701, %602, %577, %496, %461, %322, %237, %214, %210, %139
  %3150 = phi i32 [ %95, %3124 ], [ %91, %3102 ], [ %91, %3111 ], [ %91, %3089 ], [ %91, %3075 ], [ %91, %2958 ], [ %91, %2965 ], [ %91, %2586 ], [ %91, %2481 ], [ %91, %2449 ], [ %91, %2456 ], [ %91, %2420 ], [ %91, %2429 ], [ %91, %2411 ], [ %91, %2335 ], [ %91, %2342 ], [ %91, %2308 ], [ %91, %2240 ], [ %91, %2235 ], [ %91, %2179 ], [ %91, %2093 ], [ %91, %1971 ], [ %91, %1880 ], [ %91, %1792 ], [ %91, %1666 ], [ %91, %1601 ], [ %91, %1575 ], [ %91, %1543 ], [ %91, %1440 ], [ %91, %1353 ], [ %91, %1263 ], [ %91, %1173 ], [ %91, %1061 ], [ %91, %948 ], [ %91, %923 ], [ %91, %881 ], [ %91, %856 ], [ %91, %726 ], [ %91, %701 ], [ %91, %602 ], [ %91, %577 ], [ %91, %496 ], [ %91, %461 ], [ %91, %322 ], [ %91, %139 ], [ %91, %210 ], [ %91, %237 ], [ %91, %214 ]
  %3151 = phi i32 [ %3140, %3124 ], [ %3110, %3102 ], [ %3116, %3111 ], [ %97, %3089 ], [ %3082, %3075 ], [ %2964, %2958 ], [ %2973, %2965 ], [ %2587, %2586 ], [ %2521, %2481 ], [ %2455, %2449 ], [ %2463, %2456 ], [ %2428, %2420 ], [ %2438, %2429 ], [ %2412, %2411 ], [ %2341, %2335 ], [ %2349, %2342 ], [ %2311, %2308 ], [ %2251, %2240 ], [ %2238, %2235 ], [ %2181, %2179 ], [ %2095, %2093 ], [ %1973, %1971 ], [ %1883, %1880 ], [ %1795, %1792 ], [ %1668, %1666 ], [ %1604, %1601 ], [ %1578, %1575 ], [ %1545, %1543 ], [ %1442, %1440 ], [ %1355, %1353 ], [ %1265, %1263 ], [ %1175, %1173 ], [ %1063, %1061 ], [ %951, %948 ], [ %925, %923 ], [ %884, %881 ], [ %858, %856 ], [ %729, %726 ], [ %702, %701 ], [ %605, %602 ], [ %579, %577 ], [ %497, %496 ], [ %463, %461 ], [ %324, %322 ], [ %142, %139 ], [ %213, %210 ], [ %240, %237 ], [ %215, %214 ]
  %3152 = phi i32 [ %96, %3124 ], [ %96, %3102 ], [ %96, %3111 ], [ %96, %3089 ], [ %96, %3075 ], [ %96, %2958 ], [ %96, %2965 ], [ %96, %2586 ], [ %96, %2481 ], [ %96, %2449 ], [ %96, %2456 ], [ %96, %2420 ], [ %96, %2429 ], [ %96, %2411 ], [ %96, %2335 ], [ %96, %2342 ], [ %96, %2308 ], [ %96, %2240 ], [ %96, %2235 ], [ %2182, %2179 ], [ %96, %2093 ], [ %96, %1971 ], [ %96, %1880 ], [ %96, %1792 ], [ %96, %1666 ], [ %96, %1601 ], [ %96, %1575 ], [ %96, %1543 ], [ %96, %1440 ], [ %96, %1353 ], [ %96, %1263 ], [ %96, %1173 ], [ %96, %1061 ], [ %96, %948 ], [ %96, %923 ], [ %96, %881 ], [ %96, %856 ], [ %96, %726 ], [ %96, %701 ], [ %96, %602 ], [ %96, %577 ], [ %96, %496 ], [ %96, %461 ], [ %96, %322 ], [ %96, %139 ], [ %96, %210 ], [ %96, %237 ], [ %96, %214 ]
  %3153 = phi i8 [ 1, %3124 ], [ %94, %3102 ], [ %94, %3111 ], [ %94, %3089 ], [ %94, %3075 ], [ %94, %2958 ], [ %94, %2965 ], [ %94, %2586 ], [ %94, %2481 ], [ %94, %2449 ], [ %94, %2456 ], [ %94, %2420 ], [ %94, %2429 ], [ %94, %2411 ], [ %94, %2335 ], [ %94, %2342 ], [ %94, %2308 ], [ %94, %2240 ], [ %94, %2235 ], [ %94, %2179 ], [ %94, %2093 ], [ %94, %1971 ], [ %94, %1880 ], [ %94, %1792 ], [ %94, %1666 ], [ %94, %1601 ], [ %94, %1575 ], [ %94, %1543 ], [ %94, %1440 ], [ %94, %1353 ], [ %94, %1263 ], [ %94, %1173 ], [ %94, %1061 ], [ %94, %948 ], [ %94, %923 ], [ %94, %881 ], [ %94, %856 ], [ %94, %726 ], [ %94, %701 ], [ %94, %602 ], [ %94, %577 ], [ %94, %496 ], [ %94, %461 ], [ %94, %322 ], [ %94, %139 ], [ %94, %210 ], [ %94, %237 ], [ %94, %214 ]
  %3154 = phi %struct.bpf_insn* [ %93, %3124 ], [ %93, %3102 ], [ %93, %3111 ], [ %93, %3089 ], [ %93, %3075 ], [ %93, %2958 ], [ %93, %2965 ], [ %93, %2586 ], [ %93, %2481 ], [ %93, %2449 ], [ %93, %2456 ], [ %93, %2420 ], [ %93, %2429 ], [ %93, %2411 ], [ %93, %2335 ], [ %93, %2342 ], [ %93, %2308 ], [ %93, %2240 ], [ %93, %2235 ], [ %2097, %2179 ], [ %93, %2093 ], [ %93, %1971 ], [ %93, %1880 ], [ %93, %1792 ], [ %93, %1666 ], [ %93, %1601 ], [ %93, %1575 ], [ %93, %1543 ], [ %93, %1440 ], [ %93, %1353 ], [ %93, %1263 ], [ %93, %1173 ], [ %93, %1061 ], [ %93, %948 ], [ %93, %923 ], [ %93, %881 ], [ %93, %856 ], [ %93, %726 ], [ %93, %701 ], [ %93, %602 ], [ %93, %577 ], [ %93, %496 ], [ %93, %461 ], [ %93, %322 ], [ %93, %139 ], [ %93, %210 ], [ %93, %237 ], [ %93, %214 ]
  %3155 = sub i32 %3151, %36
  %3156 = icmp sgt i32 %3155, 128
  br i1 %3156, label %3157, label %3159

3157:                                             ; preds = %3149
  %3158 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.8, i32 0, i32 0)) #10
  br label %3173

3159:                                             ; preds = %3149
  %3160 = add i32 %3155, %95
  br i1 %89, label %3168, label %3161

3161:                                             ; preds = %3159
  %3162 = icmp sgt i32 %3160, %79
  br i1 %3162, label %3163, label %3165, !prof !3, !misexpect !4

3163:                                             ; preds = %3161
  %3164 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.9, i32 0, i32 0)) #10
  br label %3173

3165:                                             ; preds = %3161
  %3166 = getelementptr i8, i8* %77, i32 %95
  %3167 = call i8* @memcpy(i8* inreg %3166, i8* inreg nonnull %34, i32 inreg %3155) #9
  br label %3168

3168:                                             ; preds = %3165, %3159
  %3169 = getelementptr i32, i32* %25, i32 %3152
  store i32 %3160, i32* %3169, align 4
  %3170 = add i32 %3152, 1
  %3171 = getelementptr %struct.bpf_insn, %struct.bpf_insn* %3154, i32 1
  %3172 = icmp slt i32 %3170, %76
  br i1 %3172, label %90, label %3174

3173:                                             ; preds = %75, %2939, %3059, %3028, %885, %952, %1064, %1443, %2932, %3021, %3047, %2479, %3141, %3143, %3057, %3083, %3163, %3157, %3146
  call void @llvm.lifetime.end.p0i8(i64 192, i8* nonnull %34) #8
  br label %3176

3174:                                             ; preds = %3168
  call void @llvm.lifetime.end.p0i8(i64 192, i8* nonnull %34) #8
  %3175 = icmp slt i32 %3160, 1
  br i1 %3175, label %3176, label %3179

3176:                                             ; preds = %3174, %3173, %3184
  store i8* null, i8** %4, align 4
  %3177 = icmp eq %struct.bpf_binary_header* %80, null
  br i1 %3177, label %3242, label %3178

3178:                                             ; preds = %3176
  call void @bpf_jit_binary_free(%struct.bpf_binary_header* inreg nonnull %80) #9
  br label %3242

3179:                                             ; preds = %3174
  %3180 = load i8*, i8** %4, align 4
  %3181 = icmp eq i8* %3180, null
  %3182 = icmp eq i32 %3160, %79
  br i1 %3181, label %3186, label %3183

3183:                                             ; preds = %3179
  br i1 %3182, label %3200, label %3184

3184:                                             ; preds = %3183
  %3185 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i32 0, i32 0), i32 %3160, i32 %79) #10
  br label %3176

3186:                                             ; preds = %3179
  br i1 %3182, label %3187, label %3190

3187:                                             ; preds = %3186
  %3188 = call %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32 inreg %79, i8** inreg nonnull %4, i32 inreg 1, void (i8*, i32)* nonnull @jit_fill_hole) #9
  %3189 = icmp eq %struct.bpf_binary_header* %3188, null
  br i1 %3189, label %3242, label %3190

3190:                                             ; preds = %3187, %3186
  %3191 = phi %struct.bpf_binary_header* [ %3188, %3187 ], [ %80, %3186 ]
  call void @___might_sleep(i8* inreg getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0), i32 inreg 2375, i32 inreg 0) #9
  %3192 = call i32 @_cond_resched() #9
  %3193 = add i32 %78, 1
  %3194 = icmp slt i32 %3193, 20
  %3195 = load i8*, i8** %4, align 4
  %3196 = icmp ne i8* %3195, null
  %3197 = or i1 %3194, %3196
  br i1 %3197, label %3198, label %3200

3198:                                             ; preds = %3190
  %3199 = load i32, i32* %15, align 4
  br label %75

3200:                                             ; preds = %3190, %3183
  %3201 = phi i32 [ %79, %3183 ], [ %3160, %3190 ]
  %3202 = phi %struct.bpf_binary_header* [ %80, %3183 ], [ %3191, %3190 ]
  %3203 = phi i32 [ %78, %3183 ], [ %3193, %3190 ]
  %3204 = load i32, i32* @bpf_jit_enable, align 4
  %3205 = icmp sgt i32 %3204, 1
  br i1 %3205, label %3206, label %3216

3206:                                             ; preds = %3200
  %3207 = load i32, i32* %15, align 4
  %3208 = add i32 %3203, 1
  %3209 = call %struct.task_struct* asm "movl %fs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** nonnull @current_task) #11, !srcloc !7
  %3210 = getelementptr inbounds %struct.task_struct, %struct.task_struct* %3209, i32 0, i32 95, i32 0
  %3211 = getelementptr inbounds %struct.task_struct, %struct.task_struct* %3209, i32 0, i32 63
  %3212 = load i32, i32* %3211, align 8
  %3213 = call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.10, i32 0, i32 0), i32 %3207, i32 %3201, i32 %3208, i8* %3180, i8* %3210, i32 %3212) #10
  %3214 = icmp eq i8* %3180, null
  br i1 %3214, label %3216, label %3215

3215:                                             ; preds = %3206
  call void @print_hex_dump(i8* inreg getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* inreg getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 inreg 2, i32 16, i32 1, i8* nonnull %3180, i32 %3201, i1 zeroext false) #9
  br label %3216

3216:                                             ; preds = %3215, %3206, %3200
  %3217 = load i8*, i8** %4, align 4
  %3218 = icmp eq i8* %3217, null
  br i1 %3218, label %3242, label %3219

3219:                                             ; preds = %3216
  %3220 = bitcast %struct.bpf_binary_header* %3202 to i8*
  %3221 = call %struct.vm_struct* @find_vm_area(i8* inreg %3220) #9
  %3222 = icmp eq %struct.vm_struct* %3221, null
  br i1 %3222, label %3227, label %3223

3223:                                             ; preds = %3219
  %3224 = getelementptr inbounds %struct.vm_struct, %struct.vm_struct* %3221, i32 0, i32 3
  %3225 = load i32, i32* %3224, align 4
  %3226 = or i32 %3225, 256
  store i32 %3226, i32* %3224, align 4
  br label %3227

3227:                                             ; preds = %3219, %3223
  %3228 = ptrtoint %struct.bpf_binary_header* %3202 to i32
  %3229 = getelementptr inbounds %struct.bpf_binary_header, %struct.bpf_binary_header* %3202, i32 0, i32 0
  %3230 = load i32, i32* %3229, align 8
  %3231 = call i32 @set_memory_ro(i32 inreg %3228, i32 inreg %3230) #9
  %3232 = load i32, i32* %3229, align 8
  %3233 = call i32 @set_memory_x(i32 inreg %3228, i32 inreg %3232) #9
  %3234 = bitcast i8** %4 to i32*
  %3235 = load i32, i32* %3234, align 4
  %3236 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %11, i32 0, i32 9
  %3237 = bitcast i32 (i8*, %struct.bpf_insn*)** %3236 to i32*
  store i32 %3235, i32* %3237, align 4
  %3238 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %11, i32 0, i32 1
  %3239 = load i16, i16* %3238, align 2
  %3240 = or i16 %3239, 1
  store i16 %3240, i16* %3238, align 2
  %3241 = getelementptr inbounds %struct.bpf_prog, %struct.bpf_prog* %11, i32 0, i32 5
  store i32 %3201, i32* %3241, align 4
  br label %3242

3242:                                             ; preds = %3187, %3216, %3178, %3176, %3227
  %3243 = phi %struct.bpf_prog* [ %11, %3227 ], [ %0, %3176 ], [ %0, %3178 ], [ %0, %3216 ], [ %0, %3187 ]
  call void @kfree(i8* inreg nonnull %21) #9
  br label %3244

3244:                                             ; preds = %13, %19, %3242
  %3245 = phi %struct.bpf_prog* [ %3243, %3242 ], [ %0, %19 ], [ %0, %13 ]
  br i1 %14, label %3249, label %3246

3246:                                             ; preds = %3244
  %3247 = icmp eq %struct.bpf_prog* %3245, %0
  %3248 = select i1 %3247, %struct.bpf_prog* %11, %struct.bpf_prog* %0
  call void @bpf_jit_prog_release_other(%struct.bpf_prog* inreg %3245, %struct.bpf_prog* inreg %3248) #9
  br label %3249

3249:                                             ; preds = %3244, %3246, %10, %1
  %3250 = phi %struct.bpf_prog* [ %0, %1 ], [ %0, %10 ], [ %3245, %3246 ], [ %3245, %3244 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #8
  ret %struct.bpf_prog* %3250
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #2

; Function Attrs: noimplicitfloat
declare dso_local %struct.bpf_prog* @bpf_jit_blind_constants(%struct.bpf_prog* inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local void @bpf_jit_binary_free(%struct.bpf_binary_header* inreg) local_unnamed_addr #3

; Function Attrs: cold noimplicitfloat
declare dso_local i32 @printk(i8*, ...) local_unnamed_addr #4

; Function Attrs: noimplicitfloat
declare dso_local %struct.bpf_binary_header* @bpf_jit_binary_alloc(i32 inreg, i8** inreg, i32 inreg, void (i8*, i32)*) local_unnamed_addr #3

; Function Attrs: noimplicitfloat nounwind sspstrong
define internal void @jit_fill_hole(i8* inreg %0, i32 inreg %1) #1 {
  %3 = call i8* @memset(i8* inreg %0, i32 inreg 204, i32 inreg %1) #9
  ret void
}

; Function Attrs: noimplicitfloat
declare dso_local void @___might_sleep(i8* inreg, i32 inreg, i32 inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local i32 @_cond_resched() local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local void @kfree(i8* inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local void @bpf_jit_prog_release_other(%struct.bpf_prog* inreg, %struct.bpf_prog* inreg) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #5

; Function Attrs: noimplicitfloat
declare dso_local noalias i8* @__kmalloc(i32 inreg, i32 inreg) local_unnamed_addr #3

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #6

; Function Attrs: inlinehint noimplicitfloat nounwind sspstrong
define internal fastcc void @emit_ia32_alu_i(i1 inreg zeroext %0, i1 inreg zeroext %1, i8 inreg zeroext %2, i8 zeroext %3, i32 %4, i1 zeroext %5, i8** nocapture %6) unnamed_addr #7 {
  %8 = load i8*, i8** %6, align 4
  %9 = zext i8 %3 to i32
  %10 = select i1 %5, i8 0, i8 %3
  br i1 %5, label %11, label %16

11:                                               ; preds = %7
  %12 = shl nuw nsw i32 %9, 16
  %13 = or i32 %12, 17803
  %14 = bitcast i8* %8 to i32*
  store i32 %13, i32* %14, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %15 = getelementptr i8, i8* %8, i32 3
  br label %16

16:                                               ; preds = %11, %7
  %17 = phi i8* [ %15, %11 ], [ %8, %7 ]
  %18 = add i32 %4, 128
  %19 = icmp ult i32 %18, 256
  br i1 %19, label %25, label %20

20:                                               ; preds = %16
  %21 = bitcast i8* %17 to i16*
  store i16 -15673, i16* %21, align 2
  %22 = getelementptr i8, i8* %17, i32 2
  %23 = bitcast i8* %22 to i32*
  store i32 %4, i32* %23, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %24 = getelementptr i8, i8* %17, i32 6
  br label %25

25:                                               ; preds = %20, %16
  %26 = phi i8* [ %17, %16 ], [ %24, %20 ]
  %27 = zext i8 %2 to i32
  %28 = lshr i32 %27, 4
  %29 = shl i32 %27, 28
  %30 = or i32 %28, %29
  switch i32 %30, label %160 [
    i32 0, label %31
    i32 1, label %66
    i32 4, label %102
    i32 5, label %119
    i32 10, label %136
    i32 8, label %153
  ]

31:                                               ; preds = %25
  %32 = and i1 %0, %1
  br i1 %32, label %33, label %49

33:                                               ; preds = %31
  %34 = add i8 %10, -48
  br i1 %19, label %35, label %43

35:                                               ; preds = %33
  %36 = zext i8 %34 to i32
  %37 = shl nuw nsw i32 %36, 8
  %38 = shl nsw i32 %4, 16
  %39 = or i32 %38, %37
  %40 = or i32 %39, 131
  %41 = bitcast i8* %26 to i32*
  store i32 %40, i32* %41, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %42 = getelementptr i8, i8* %26, i32 3
  br label %160

43:                                               ; preds = %33
  %44 = zext i8 %34 to i16
  %45 = shl nuw i16 %44, 8
  %46 = or i16 %45, 17
  %47 = bitcast i8* %26 to i16*
  store i16 %46, i16* %47, align 2
  %48 = getelementptr i8, i8* %26, i32 2
  br label %160

49:                                               ; preds = %31
  br i1 %19, label %50, label %59

50:                                               ; preds = %49
  %51 = add i8 %10, -64
  %52 = zext i8 %51 to i32
  %53 = shl nuw nsw i32 %52, 8
  %54 = shl nsw i32 %4, 16
  %55 = or i32 %54, %53
  %56 = or i32 %55, 131
  %57 = bitcast i8* %26 to i32*
  store i32 %56, i32* %57, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %58 = getelementptr i8, i8* %26, i32 3
  br label %160

59:                                               ; preds = %49
  %60 = add i8 %10, -48
  %61 = zext i8 %60 to i16
  %62 = shl nuw i16 %61, 8
  %63 = or i16 %62, 1
  %64 = bitcast i8* %26 to i16*
  store i16 %63, i16* %64, align 2
  %65 = getelementptr i8, i8* %26, i32 2
  br label %160

66:                                               ; preds = %25
  %67 = and i1 %0, %1
  br i1 %67, label %68, label %85

68:                                               ; preds = %66
  br i1 %19, label %69, label %78

69:                                               ; preds = %68
  %70 = add i8 %10, -40
  %71 = zext i8 %70 to i32
  %72 = shl nuw nsw i32 %71, 8
  %73 = shl nsw i32 %4, 16
  %74 = or i32 %73, %72
  %75 = or i32 %74, 131
  %76 = bitcast i8* %26 to i32*
  store i32 %75, i32* %76, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %77 = getelementptr i8, i8* %26, i32 3
  br label %160

78:                                               ; preds = %68
  %79 = add i8 %10, -48
  %80 = zext i8 %79 to i16
  %81 = shl nuw i16 %80, 8
  %82 = or i16 %81, 25
  %83 = bitcast i8* %26 to i16*
  store i16 %82, i16* %83, align 2
  %84 = getelementptr i8, i8* %26, i32 2
  br label %160

85:                                               ; preds = %66
  br i1 %19, label %86, label %95

86:                                               ; preds = %85
  %87 = add i8 %10, -24
  %88 = zext i8 %87 to i32
  %89 = shl nuw nsw i32 %88, 8
  %90 = shl nsw i32 %4, 16
  %91 = or i32 %90, %89
  %92 = or i32 %91, 131
  %93 = bitcast i8* %26 to i32*
  store i32 %92, i32* %93, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %94 = getelementptr i8, i8* %26, i32 3
  br label %160

95:                                               ; preds = %85
  %96 = add i8 %10, -48
  %97 = zext i8 %96 to i16
  %98 = shl nuw i16 %97, 8
  %99 = or i16 %98, 41
  %100 = bitcast i8* %26 to i16*
  store i16 %99, i16* %100, align 2
  %101 = getelementptr i8, i8* %26, i32 2
  br label %160

102:                                              ; preds = %25
  br i1 %19, label %103, label %112

103:                                              ; preds = %102
  %104 = add i8 %10, -56
  %105 = zext i8 %104 to i32
  %106 = shl nuw nsw i32 %105, 8
  %107 = shl nsw i32 %4, 16
  %108 = or i32 %107, %106
  %109 = or i32 %108, 131
  %110 = bitcast i8* %26 to i32*
  store i32 %109, i32* %110, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %111 = getelementptr i8, i8* %26, i32 3
  br label %160

112:                                              ; preds = %102
  %113 = add i8 %10, -48
  %114 = zext i8 %113 to i16
  %115 = shl nuw i16 %114, 8
  %116 = or i16 %115, 9
  %117 = bitcast i8* %26 to i16*
  store i16 %116, i16* %117, align 2
  %118 = getelementptr i8, i8* %26, i32 2
  br label %160

119:                                              ; preds = %25
  br i1 %19, label %120, label %129

120:                                              ; preds = %119
  %121 = add i8 %10, -32
  %122 = zext i8 %121 to i32
  %123 = shl nuw nsw i32 %122, 8
  %124 = shl nsw i32 %4, 16
  %125 = or i32 %124, %123
  %126 = or i32 %125, 131
  %127 = bitcast i8* %26 to i32*
  store i32 %126, i32* %127, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %128 = getelementptr i8, i8* %26, i32 3
  br label %160

129:                                              ; preds = %119
  %130 = add i8 %10, -48
  %131 = zext i8 %130 to i16
  %132 = shl nuw i16 %131, 8
  %133 = or i16 %132, 33
  %134 = bitcast i8* %26 to i16*
  store i16 %133, i16* %134, align 2
  %135 = getelementptr i8, i8* %26, i32 2
  br label %160

136:                                              ; preds = %25
  br i1 %19, label %137, label %146

137:                                              ; preds = %136
  %138 = add i8 %10, -16
  %139 = zext i8 %138 to i32
  %140 = shl nuw nsw i32 %139, 8
  %141 = shl nsw i32 %4, 16
  %142 = or i32 %141, %140
  %143 = or i32 %142, 131
  %144 = bitcast i8* %26 to i32*
  store i32 %143, i32* %144, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %145 = getelementptr i8, i8* %26, i32 3
  br label %160

146:                                              ; preds = %136
  %147 = add i8 %10, -48
  %148 = zext i8 %147 to i16
  %149 = shl nuw i16 %148, 8
  %150 = or i16 %149, 49
  %151 = bitcast i8* %26 to i16*
  store i16 %150, i16* %151, align 2
  %152 = getelementptr i8, i8* %26, i32 2
  br label %160

153:                                              ; preds = %25
  %154 = add i8 %10, -40
  %155 = zext i8 %154 to i16
  %156 = shl nuw i16 %155, 8
  %157 = or i16 %156, 247
  %158 = bitcast i8* %26 to i16*
  store i16 %157, i16* %158, align 2
  %159 = getelementptr i8, i8* %26, i32 2
  br label %160

160:                                              ; preds = %137, %146, %120, %129, %103, %112, %78, %69, %95, %86, %43, %35, %59, %50, %25, %153
  %161 = phi i8* [ %26, %25 ], [ %159, %153 ], [ %145, %137 ], [ %152, %146 ], [ %128, %120 ], [ %135, %129 ], [ %111, %103 ], [ %118, %112 ], [ %77, %69 ], [ %84, %78 ], [ %94, %86 ], [ %101, %95 ], [ %42, %35 ], [ %48, %43 ], [ %58, %50 ], [ %65, %59 ]
  br i1 %5, label %162, label %172

162:                                              ; preds = %160
  %163 = shl i8 %10, 3
  %164 = add i8 %163, 69
  %165 = zext i8 %164 to i32
  %166 = shl nuw nsw i32 %165, 8
  %167 = shl nuw nsw i32 %9, 16
  %168 = or i32 %167, %166
  %169 = or i32 %168, 137
  %170 = bitcast i8* %161 to i32*
  store i32 %169, i32* %170, align 4
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !5
  %171 = getelementptr i8, i8* %161, i32 3
  br label %172

172:                                              ; preds = %162, %160
  %173 = phi i8* [ %171, %162 ], [ %161, %160 ]
  store i8* %173, i8** %6, align 4
  ret void
}

; Function Attrs: noimplicitfloat
declare dso_local i64 @__bpf_call_base(i64 inreg, i64, i64, i64, i64) #3

; Function Attrs: noimplicitfloat
declare dso_local i8* @memcpy(i8* inreg, i8* inreg, i32 inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local i8* @memset(i8* inreg, i32 inreg, i32 inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local void @print_hex_dump(i8* inreg, i8* inreg, i32 inreg, i32, i32, i8*, i32, i1 zeroext) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local i32 @set_memory_ro(i32 inreg, i32 inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local i32 @set_memory_x(i32 inreg, i32 inreg) local_unnamed_addr #3

; Function Attrs: noimplicitfloat
declare dso_local %struct.vm_struct* @find_vm_area(i8* inreg) local_unnamed_addr #3

attributes #0 = { noimplicitfloat norecurse nounwind readnone sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "fentry-call"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noimplicitfloat nounwind sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "fentry-call"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noimplicitfloat "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { cold noimplicitfloat "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind willreturn }
attributes #7 = { inlinehint noimplicitfloat nounwind sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "null-pointer-is-valid"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-xop,-xsave,-xsaveopt" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nobuiltin noimplicitfloat nounwind "no-builtins" }
attributes #10 = { cold nobuiltin noimplicitfloat nounwind "no-builtins" }
attributes #11 = { nounwind readnone }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 3}
!1 = !{i32 1, !"wchar_size", i32 2}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!"branch_weights", i32 1, i32 2000}
!4 = !{!"misexpect", i64 1, i64 2000, i64 1}
!5 = !{i32 -2138635344}
!6 = !{i8 0, i8 2}
!7 = !{i32 -2146205046}
