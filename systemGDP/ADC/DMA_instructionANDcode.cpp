SETTING UP

Default ADC clock = 64MHz

12 bit resolution:

(2.5 cycles to sample) 

12.5 cycles for conversion


Enable continuos conversion mode 

Cant enable DMA continuous requests mode yet

Go to "system core" section and add a DMA request and choose ADC option, choose circular mode in the mode section in bottom. Increment memory address but not peripheral because we only have one register address that we obtain ADC values from. Data width is set to half word, which is half of 12 bits, which is 6 bits, depends of data size.

We can now enable the DMA request in the analog -> ADC1 section

IN CODE

/*user code begin PD*/
#define ADC_BUF_LED 4096 //define ADC buffer length

/*user code end PD*/

/*user code begin PV*/

uint_16_t adc_buf[ADC_BUF_LEN];
/*user code ends PV*/

delete previous non-CCM code

/*user code begin 2*/
HAL_ADC_Start_DMA(&hadc1, (uint32_t*)adc_buf, ADC_BUF_LEN);

/*user code end 2*/

/*user code begin 4*/

// buffer is half filled, when that happens, led lights up, 
// the reason why we need to determien when the buffer is half filled or full filled is because we can assign our CPU to do something to half 
// of our buffer
// we can make use the debug option and check the adc_buf array[] while adding a breakpoint before the callback function below
// we will notice that the adc_buf_array will keep running even the program is "paused", demonstrating the importance of DMA
// if we connect probe across GND and the LD2 pin, we can observe a square wave like signal whereby the distance between two rising edge will be the time for the 
// ADC to fill half of the buffle, which is basically 2048 sample
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc){
  HAL_GPIO_WritePin(LD2_GPIO_Port,LD2_Pin,GPIO_PIN_SET);
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc){
  HAL_GPIO_WritePin(LD2_GPIO_Port,LD2_Pin,GPIO_PIN_RESET);
}
/*user code ends 4*/


now we can run the program, we can pause the debug 

