<div align="center">   
  
# Predictive Inverse Dynamics Models are Scalable Learners for Robotic Manipulation
</div>

<h3 align="center">
  <a href="https://arxiv.org/pdf/2412.15109">Arxiv</a> |
  <a href="https://nimolty.github.io/Seer/">Webpage</a>
</h3>


https://github.com/user-attachments/assets/49036e84-c397-4589-9024-efb05b14efa0


<br><br>

## :books: Table of Contents:
1. [Highlights](#high)
2. [Getting Started](#start)
    - [Simulation](#simulation)
    - [Real-World](#real-world)
3. [Checkpoints](#checkpoints)
4. [TODO List](#todos)
5. [License](#license)
6. [Citation](#citation).
7. [Acknowledgment](#acknowledgment)

## :fire: Highlights <a name="high"></a>
<img width="1000" alt="seer" src="assets/seer_method.jpg">

- :trophy: **SOTA simulation performance** Seer achieves state-of-the-art performance on simulation benchmarks CALVIN ABC-D and LIBERO-LONG. 
- :muscle: **Impressive Real-World performance** Seer demonstrates strong effectiveness and generalization across diverse real-world downstream tasks.

## :door: Getting Started <a name="start"></a>
We provide step-by-step guidance for running Seer in simulations and real-world experiments.
Follow the specific instructions for a seamless setup.

### Simulation <a name="simulation"></a>
#### CALVIN ABC-D <a name="calvin abc-d"></a>
- [Installation](docs/CALVIN_ABC-D_INSTALL.md)
- [Running Code](docs/CALVIN_ABC-D_RUN.md)
### Real-World<a name="real-world"></a>
#### Real-World (Quick Training w & w/o pre-training)<a name="real-world-qs"></a>
For users aiming to train Seer from scratch or fine-tune it, we provide comprehensive instructions for environment setup, downstream task data preparation, training, and deployment.
- [Installation](docs/REAL-WORLD_INSTALL.md)
- [Post-processing](docs/REAL-WORLD_POSTPROCESS.md)
- [Fine-tuning & Scratch](docs/REAL-WORLD_FT_SC.md)
- [Inference](docs/REAL-WORLD_INFERENCE.md)

#### Real-World (Pre-training)<a name="real-world-fv"></a>
This section details the pre-training process of Seer in real-world experiments, including environment setup, dataset preparation, and training procedures. Downstream task processing and fine-tuning are covered in [Real-World (Quick Training w & w/o pre-training)](#real-world-qs).
- [Installation](docs/REAL-WORLD_INSTALL.md)
- [Pre-processing](docs/REAL-WORLD_PREPROCESS.md)
- [Pre-training](docs/REAL-WORLD_PRETRAIN.md)


## :pencil2: Checkpoints <a name="checkpoints"></a>
Relevant checkpoints are available on the [website](https://drive.google.com/drive/folders/1F3IE95z2THAQ_lt3DKUFdRGc86Thsnc7?usp=sharing).
|Model|Checkpoint|
|:------:|:------:|
|CALVIN ABC-D|[Seer](https://drive.google.com/drive/folders/17Gv9snGCkViuhHmzN3eTWlI0tMfGSGT3?usp=sharing) (Avg.Len. : 3.98) / [Seer Large](https://drive.google.com/drive/folders/1AFabqfDEi69oMo0FTGhEiH2QSRLYBR9r?usp=drive_link)  (Avg.Len. : 4.30)|
|Real-World|[Seer (Droid Pre-trained)](https://drive.google.com/drive/folders/1rT8JKLhJGIo97jfYUm2JiFUrogOq-dgJ?usp=drive_link)|

## 📆 TODO <a name="todos"></a>
- [x] Release real-world experiment code. 
- [x] Release CALVIN ABC-D experiment code (Seer).
- [x] Release the evaluation code of Seer-Large on CALVIN ABC-D experiment.
- [ ] Release the training code of Seer-Large on CALVIN ABC-D experiment (Reviewing the code).
- [ ] Release LIBERO-LONG experiment code.

## License <a name="license"></a>

All assets and code are under the [Apache 2.0 license](./LICENSE) unless specified otherwise.

## Citation <a name="citation"></a>
If you find the project helpful for your research, please consider citing our paper:
```bibtex
@article{tian2024seer,
  title={Predictive Inverse Dynamics Models are Scalable Learners for Robotic Manipulation},
  author={Tian, Yang and Yang, Sizhe and Zeng, Jia and Wang, Ping and Lin, Dahua and Dong, Hao and Pang, Jiangmiao},
  journal={https://arxiv.org/abs/2412.15109},
  year={2024}
}
```

## Acknowledgment <a name="acknowledgment"></a>
This project builds upon [GR-1](https://github.com/bytedance/GR-1) and [Roboflamingo](https://github.com/RoboFlamingo/RoboFlamingo). We thank these teams for their open-source contributions.
