<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import qrcode from 'qrcode-generator'

const props = defineProps<{
  url: string
  size?: number
  caption?: string
  options?: Record<string, any>
}>()

const qrSvg = ref<string>('')
const error = ref<string>('')
const size = props.size ?? 200

const generateQRCode = () => {
  try {
    const typeNumber = 0 // Auto detect
    const errorCorrectionLevel = 'M'
    const qr = qrcode(typeNumber, errorCorrectionLevel)
    qr.addData(props.url)
    qr.make()
    
    const cellSize = Math.floor(size / qr.getModuleCount())
    const margin = 4 // Increased margin
    const totalSize = qr.getModuleCount() * cellSize + margin * 2
    
    let svg = `<svg width="${totalSize}" height="${totalSize}" xmlns="http://www.w3.org/2000/svg">`
    
    // Transparent background for SVG itself
    // svg += `<rect width="${totalSize}" height="${totalSize}" fill="transparent"/>`
    
    for (let row = 0; row < qr.getModuleCount(); row++) {
      for (let col = 0; col < qr.getModuleCount(); col++) {
        if (qr.isDark(row, col)) {
          // Use currentColor to inherit text color
          svg += `<rect x="${col * cellSize + margin}" y="${row * cellSize + margin}" width="${cellSize}" height="${cellSize}" fill="currentColor"/>`
        }
      }
    }
    
    svg += '</svg>'
    qrSvg.value = svg
    error.value = ''
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'Failed to generate QR code'
    console.error('QR Code generation error:', err)
  }
}

onMounted(() => {
  generateQRCode()
})

watch(() => props.url, () => {
  generateQRCode()
})

watch(() => props.size, () => {
  generateQRCode()
})
</script>

<template>
  <div class="flex flex-col items-center">
    <div v-if="error" class="text-red-500 text-sm p-4 border border-red-200 rounded-md bg-red-50">
      {{ error }}
    </div>
    <div
      v-else-if="qrSvg"
      class="p-4 bg-white rounded-md shadow-sm border border-gray-200 dark:border-gray-700 dark:bg-white transition-all"
    >
      <!-- Force black fill for QR code contrast even in dark mode (since background is white) -->
      <div v-html="qrSvg" class="text-black" />
    </div>
    <div v-else class="flex items-center justify-center p-8 border border-gray-200 rounded-md bg-gray-50 text-gray-400 text-sm">
      Generating...
    </div>
    <p v-if="caption" class="mt-3 text-sm text-gray-500 font-medium font-sans">
      {{ caption }}
    </p>
  </div>
</template>
