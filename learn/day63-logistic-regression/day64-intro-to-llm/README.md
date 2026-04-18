### **What is an LLM?**
At its simplest, an LLM is just **two files**:
1.  **Parameters File:** A massive list of numbers (weights) that define the neural network. For a model like Llama 2 (70 billion parameters), this is about 140 GB.
2.  **Run Code:** A small file (roughly 500 lines of C or Python) that defines the architecture and runs the math to perform inference.


### **How are LLMs Trained?**
Training is a massive, expensive "lossy compression" of the internet:
* **Pre-training:** You take ~10 terabytes of internet text and run it through thousands of GPUs for weeks. This costs millions of dollars and creates a **Base Model** that predicts the next word in a sequence.
* **Fine-tuning:** This transforms the Base Model (which just mimics internet text) into an **Assistant Model**. Humans write Q&A sets (about 100,000 documents) to teach the model how to be helpful.
* **RLHF (Reinforcement Learning from Human Feedback):** A third optional stage where humans rank different model responses to further refine performance.


### **Emerging Capabilities**
* **Scaling Laws:** Performance is a predictable function of two variables: number of parameters and amount of data. There is high confidence that bigger models on more data will continue to get smarter.
* **Tool Use:** LLMs are increasingly being taught to use calculators, browse the web, and run Python code to solve problems they can't handle with just text generation.
* **Multimodality:** Modern models can see images, hear audio, and speak, allowing for speech-to-speech interaction [[33:40](http://www.youtube.com/watch?v=zjkBMFhNj_g&t=2020)].
* **LLM as an Operating System:** Karpathy suggests viewing LLMs not just as chatbots, but as the **kernel** of a new operating system that orchestrates various resources (RAM/Context Window, Disk/Internet, and CPU/Tool Use).

### **Security Challenges**
The talk highlights several unique security risks in this new paradigm:
1.  **Jailbreaking:** Using creative roleplay (e.g., "grandmother" persona) or encoded text (Base64) to bypass safety guardrails.
2.  **Prompt Injection:** Hijacking a model by hiding instructions in data it processes (e.g., invisible text on a webpage or in a Google Doc).
3.  **Data Poisoning:** Attaching "trigger words" to training data to make the model behave in specific ways when that word is encountered later.

### **Future Directions**
Karpathy notes that LLMs currently lack **"System 2" thinking**—the ability to slow down and reason through a problem deliberately. Future research aims to convert "computation time into accuracy," allowing models to think for minutes before answering.
