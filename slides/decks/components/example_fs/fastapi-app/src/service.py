import asyncio

async def process_data(item_id: int) -> str:
    # Simulate async processing
    await asyncio.sleep(0.1)
    return f"Processed item {item_id}"

