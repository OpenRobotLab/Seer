#!/bin/bash
export GIT_PYTHON_REFRESH=quiet
### NEED TO CHANGE ###
calvin_dataset_path="xxx/task_ABC_D"
calvin_conf_path="calvin/calvin_models/conf"
checkpoint_path="xxx/checkpoints"
resume_from_checkpoint="xxx/xxx.pth"
vit_ckpt_path="xxx/mae_pretrain_vit_base.pth" # downloaded from https://drive.google.com/file/d/1bSsvRI4mDM3Gg51C6xO0l9CbojYw3OEt/view?usp=sharing
### NEED TO CHANGE ###

IFS='/' read -ra path_parts <<< "$resume_from_checkpoint"
run_name="${path_parts[-2]}"
log_name="${path_parts[-1]}"
log_folder="eval_logs/$run_name"
mkdir -p "$log_folder"
log_file="eval_logs/$run_name/evaluate_$log_name.log"

node=1
node_num=1

torchrun --nnodes=${node} --nproc_per_node=${node_num} --master_port=10012 eval_calvin.py \
    --traj_cons \
    --rgb_pad 10 \
    --gripper_pad 4 \
    --gradient_accumulation_steps 1 \
    --bf16_module "vision_encoder" \
    --vit_ckpt_path ${vit_ckpt_path} \
    --calvin_dataset ${calvin_dataset_path} \
    --calvin_conf_path ${calvin_conf_path} \
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
    --checkpoint_path ${checkpoint_path} \
    --transformer_layers 24 \
    --phase "evaluate" \
    --finetune_type "calvin" \
    --action_pred_steps 3 \
    --sequence_length 10 \
    --future_steps 3 \
    --window_size 13 \
    --obs_pred \
    --resume_from_checkpoint ${resume_from_checkpoint} | tee ${log_file} \