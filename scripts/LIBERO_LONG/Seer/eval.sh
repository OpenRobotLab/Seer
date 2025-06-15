pthlist=("30" "31" "32" "33" "34" "35" "36" "37" "38" "39")
for ckpt_id in "${pthlist[@]}"; do
    resume_from_checkpoint="/home/tianyang/Checkpoints/libero_scratch"
    vit_checkpoint_path="checkpoints/vit_mae/mae_pretrain_vit_base.pth"
    this_resume_from_checkpoint="${resume_from_checkpoint}/${ckpt_id}.pth"
    save_checkpoint_path="checkpoints/"
    dirname=$(basename "$resume_from_checkpoint")
    LOG_DIR="/home/tianyang/Code/Eval/${dirname}"
    mkdir -p ${LOG_DIR}
    test_id="${ckpt_id}"
    logfile="${LOG_DIR}/${test_id}.log"

    node=1
    node_num=8

    python -m torch.distributed.run  --nnodes=${node} --nproc_per_node=${node_num} --master_port=10133 eval_libero.py \
        --traj_cons \
        --rgb_pad 10 \
        --gripper_pad 4 \
        --gradient_accumulation_steps 1 \
        --bf16_module "vision_encoder" \
        --vit_checkpoint_path ${vit_checkpoint_path} \
        --calvin_dataset "" \
        --workers 16 \
        --lr_scheduler cosine \
        --save_every_iter 50000 \
        --num_epochs 20 \
        --seed 42 \
        --batch_size 64 \
        --precision fp32 \
        --weight_decay 1e-4 \
        --num_resampler_query 6 \
        --run_name test \
        --transformer_layers 24 \
        --phase "evaluate" \
        --finetune_type "libero_10" \
        --save_checkpoint_path ${save_checkpoint_path} \
        --action_pred_steps 3 \
        --future_steps 3 \
        --sequence_length 7 \
        --obs_pred \
        --gripper_width \
        --eval_libero_ensembling \
        --resume_from_checkpoint ${this_resume_from_checkpoint} | tee ${logfile}
done