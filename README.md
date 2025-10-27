# Prediction in Data-Driven System
*Prediction in Data-Driven Systems* focuses on scenarios where only log data is available and the system model is unknown. The goal is to predict whether an execution trace will fail and identify the task responsible.

### Installation
- Requirements
  - [SWI-Prolog](https://www.swi-prolog.org) (version 8.4.2 or above)
  - [Clingo](https://potassco.org/clingo/) (version 5.5.0 or above)
- Environment Setup
    ```bash
    conda env create -f environment.yaml
    ```

### running
To run experiments with your own data, create a new folder `my-floder´ in the `my-experiments` directory containing your `bias.pl` file and your `script.py` (you can start from my one). Then you must execute the commands below.
```bash
conda activate numsynth
./numsynth.sh <my-folder>
```

### Documentation
- My experiments are in [my-experiments](https://github.com/edoardosarri24/prediction-in-data-driven-system/tree/main/my-experiments) directory.
- The datail of my studies are in my [report.pdf](https://github.com/edoardosarri24/prediction-in-data-driven-system/blob/main/report.pdf) file.